package com.rent.controller;

import com.rent.pojo.Page;
import com.rent.pojo.Personal;
import com.rent.pojo.Record;
import com.rent.service.PersonalService;
import com.rent.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class RecordController {

    @Autowired
    private RecordService recordService;

    @Autowired
    private PersonalService personalService;

    //管理员查询所有用户的所有交易订单
    @RequestMapping("/record_list.html")
    public String recordAllList(Model model, Integer currentPage, String searchName) throws Exception {

        if (searchName != null) {
            searchName = new String(searchName.getBytes("ISO-8859-1"), "UTF-8");
        }

        Page<Record> page = new Page<>();
        if (currentPage == null) {
            currentPage = 1;
        }

        page.setCurrentPage(currentPage);
        page.setCurrentCount(9);
        page.getParams().put("searchName", searchName);

        // 起始索引
        page.setIndex((currentPage - 1) * page.getCurrentCount());
        page = recordService.queryAllPage(page);

        model.addAttribute("page", page);

        return "record_list";
    }

    //查询个人用户所有交易记录
    @RequestMapping("/record_listCustomer.html")
    public String recordList(Model model, HttpSession session, Integer currentPage) {
        Personal personal = (Personal) session.getAttribute("personal");
        String phone = personal.getPhone();

        Page<Record> page = new Page<>();
        if (currentPage == null) {
            currentPage = 1;
        }

        page.setCurrentPage(currentPage);
        page.setCurrentCount(5);
        page.getParams().put("phone", phone);

        // 起始索引
        page.setIndex((currentPage - 1) * page.getCurrentCount());
        page = recordService.queryPage(page);

        model.addAttribute("page", page);

        return "record_listCustomer";
    }

    //用户充值余额
    @RequestMapping("/record_moneyAdd.html")
    public String recordMoneyAdd(Personal personal, HttpSession session, String inputMoney) {
        // 将用户的余额与充值的金额相加
        double money = personal.getMoney();
        if (inputMoney != null) {
            money = money + Double.valueOf(inputMoney);
        }

        personal.setMoney(money);

        //1.先将personal表中用户余额更新
        personalService.updatePersonalMoney(personal);

        //2.再将充值的记录 封装好一个record对象，存入数据库
        Record record = new Record();
        record.setPname(personal.getPname());
        record.setPhone(personal.getPhone());
        record.setMoney(money);
        record.setChangeMoney(Double.valueOf(inputMoney));
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        record.setDate(format.format(date));

        recordService.updatePersonalMoney(record);

        // 从数据库中查询更新之后的personal信息，存入到session域中
        String phone = personal.getPhone();
        Personal personalByPhone = personalService.getPersonalByPhone(phone);
        session.setAttribute("personal", personalByPhone);

        return "redirect:/admin/index/index.jsp";
    }
}
