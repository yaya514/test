package com.rent.controller;

import com.rent.pojo.Page;
import com.rent.pojo.Personal;
import com.rent.pojo.Record;
import com.rent.pojo.RentItem;
import com.rent.service.PersonalService;
import com.rent.service.RecordService;
import com.rent.service.RentItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class RentItemController {

    @Autowired
    private RentItemService rentItemService;

    @Autowired
    private PersonalService personalService;

    @Autowired
    private RecordService recordService;


    //连表查询所有租房订单,包括：用户（phone,name,money）,房源（name,price,is_rent,image）
    @RequestMapping("/rentItem_list.html")
    public String rentItemList(Integer currentPage, Model model, String searchName) throws Exception {
        if (searchName != null) {
            searchName = new String(searchName.getBytes("ISO-8859-1"), "UTF-8");
        }

        Page<RentItem> page = new Page<>();
        if (currentPage == null) {
            currentPage = 1;
        }

        page.setCurrentPage(currentPage);
        page.setCurrentCount(5);
        page.getParams().put("searchName", searchName);

        // 起始索引
        page.setIndex((currentPage - 1) * page.getCurrentCount());

        page = rentItemService.queryPage(page);

        model.addAttribute("page", page);

        return "rentItem_list";
    }

    //根据id删除租房订单
    @RequestMapping("/deleteRentItem.html")
    public String deleteRentItem(String hid) {
        Integer id2 = Integer.valueOf(hid);
        rentItemService.deleteRentItemById(id2);

        return "redirect:/rentItem_list.html";
    }

    //管理员收取用户租金
    @RequestMapping("/collectMoney.action")
    @ResponseBody
    public boolean collectMoney(String phone, String money, String price) {
        //获取用户余额、房源价格，用余额减去价格
        double money_2 = (Double.parseDouble(money) / 1.00) - (Double.parseDouble(price) / 1.00);
        double changeMoney = Double.parseDouble(price);

        //根据phone，查询返回收取房租的用户信息
        Personal personal = personalService.getPersonalByPhone(phone);

        //将收取房租之后的余额存入数据库中
        personal.setMoney(money_2);
        personalService.updatePersonalMoney(personal);

        //增加一条交易记录
        Record record = new Record();
        record.setPname(personal.getPname());
        record.setPhone(phone);
        record.setMoney(money_2);
        record.setChangeMoney(-changeMoney);

        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        record.setDate(format.format(date));

        recordService.updatePersonalMoney(record);

        return true;
    }
}
