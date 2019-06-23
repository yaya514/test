package com.rent.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.rent.mapper.HouseDao;
import com.rent.pojo.House;
import com.rent.pojo.Page;
import com.rent.pojo.Personal;
import com.rent.service.HouseService;

@Controller
public class HouseController {
	
	@Autowired
	private HouseService houseService;
	
	@Value("${UPLOAD_URL}")
	private String UPLOAD_URL;
	
	//显示所有房源信息
	@RequestMapping("/house_list.html")
	public String houseList(Integer currentPage, Model model, String searchPrice){
		Page<House> page = new Page<>();
		if (currentPage == null) {
			currentPage = 1;
		}

		page.setCurrentPage(currentPage);
		page.setCurrentCount(6);
		page.getParams().put("searchPrice", searchPrice);

		// 起始索引
		page.setIndex((currentPage - 1) * page.getCurrentCount());

		page = houseService.queryPage(page);

		model.addAttribute("page", page);
		return "house_list";
	}
	
	
	//回显房源信息，传到房源修改页面
	@RequestMapping("/house_show.html")
	public String houseShow(Integer hid, Model model){
		
		House house = houseService.getHouseById(hid);
		
		model.addAttribute("house", house);
		
		return 	"house_edit";
	}
	
	//接受页面传过来的参数，修改房源信息(将图片上传到服务器)
	@RequestMapping("/house_edit.html")
	public String houseEdit(MultipartFile file,HttpServletRequest request, House house) throws Exception{
		
		//如果选中修改图片，执行下面代码
		if(file.getSize() > 0){
			//服务器保存图片的绝对路径
			String path_service = "E:/JavaEECode/renting_house/WebContent/static/image/";
			//数据库中保存访问服务器上图片的路径
			String path_mysql = "http://localhost:8080/renting_house/static/image/";
			
			// 获取上传文件的路径
		    String uploadFilePath = file.getOriginalFilename();
		    // 截取上传文件的后缀
		    String uploadFileSuffix = uploadFilePath.substring(
		            uploadFilePath.lastIndexOf("."));
		    // 使用UUID生成文件名称
		    String filename = UUID.randomUUID().toString() + uploadFileSuffix;// 构建文件名称
		    FileOutputStream fos = null;
		    FileInputStream fis = null;
		    try {
		    	//创建读取文件的流对象
		        fis = (FileInputStream) file.getInputStream();
		        //创建写出文件的流对象
		        fos = new FileOutputStream(new File(path_service + filename));
		        
		        byte[] temp = new byte[1024];
		        int i = fis.read(temp);
		        while (i != -1) {
		            fos.write(temp, 0, temp.length);
		            fos.flush();
		            i = fis.read(temp);
		        }
		    } catch (IOException e) {
		        e.printStackTrace();
		    } finally {
		        if (fis != null) {
		            try {
		                fis.close();
		            } catch (IOException e) {
		                e.printStackTrace();
		            }
		        }
		        if (fos != null) {
		            try {
		                fos.close();
		            } catch (IOException e) {
		                e.printStackTrace();
		            }
		        }
		    }
		    
		    //将服务器上图片的路径，用house对象封装，修改数据库信息
		    house.setImage(path_mysql + filename);
		}
		
		//如果没有选中修改图片，则保持原来image中的值不变即可
	   
		houseService.updateHouseById(house);
		
		return "redirect:/admin/index/index.jsp";
	}
	
	//管理员根据id删除房源
	@RequestMapping("/deleteHouse.html")
	public String deleteHouse(String hid){
		Integer id2 = Integer.parseInt(hid);
		
		houseService.deleteHouseById(id2);
		
		return "redirect:/house_list.html";
	}
	
	//管理员添加一个房源
	@RequestMapping("/house_add.html")
	public String addHouse(MultipartFile file,HttpServletRequest request,House house)throws Exception{
		
		if(file.getSize() > 0){
			//服务器保存图片的绝对路径
			String path_service = "E:/JavaEECode/renting_house/WebContent/static/image/";
			//数据库中保存访问服务器上图片的路径
			String path_mysql = "http://localhost:8080/renting_house/static/image/";
			
			// 获取上传文件的路径
		    String uploadFilePath = file.getOriginalFilename();
		    // 截取上传文件的后缀
		    String uploadFileSuffix = uploadFilePath.substring(
		            uploadFilePath.lastIndexOf("."));
		    // 使用UUID生成文件名称
		    String filename = UUID.randomUUID().toString() + uploadFileSuffix;// 构建文件名称
		    FileOutputStream fos = null;
		    FileInputStream fis = null;
		    try {
		    	//创建读取文件的流对象
		        fis = (FileInputStream) file.getInputStream();
		        //创建写出文件的流对象
		        fos = new FileOutputStream(new File(path_service + filename));
		        
		        byte[] temp = new byte[1024];
		        int i = fis.read(temp);
		        while (i != -1) {
		            fos.write(temp, 0, temp.length);
		            fos.flush();
		            i = fis.read(temp);
		        }
		    } catch (IOException e) {
		        e.printStackTrace();
		    } finally {
		        if (fis != null) {
		            try {
		                fis.close();
		            } catch (IOException e) {
		                e.printStackTrace();
		            }
		        }
		        if (fos != null) {
		            try {
		                fos.close();
		            } catch (IOException e) {
		                e.printStackTrace();
		            }
		        }
		    }
		    //将服务器上图片的路径，用house对象封装，修改数据库信息
		    house.setImage(path_mysql + filename);
		}
		
		
		houseService.addHouse(house);
		
		return "redirect:/admin/index/index.jsp";
	}
	
	//查询所有未被出租的房源，返回到houseList到页面，给用户查看
	@RequestMapping("/house_listCustomer.html")
	public String houseListCustomer(Integer currentPage,Model model, Integer searchPrice){
		Page<House> page = new Page<>();
		if (currentPage == null) {
			currentPage = 1;
		}

		page.setCurrentPage(currentPage);
		page.setCurrentCount(5);
		page.getParams().put("searchPrice", searchPrice);

		// 起始索引
		page.setIndex((currentPage - 1) * page.getCurrentCount());

		page = houseService.queryPageCustomer(page);

		model.addAttribute("page", page);
		
		return "house_listCustomer";
	}
	
	//用户预定一个房源
	@RequestMapping("/house_order.html")
	public String houseOrder(Integer hid,HttpSession session){
		Personal personal = (Personal) session.getAttribute("personal");
		int id = personal.getId();
		
		//原理：接受页面传过来的hid,通过hid将对应的house对象的is_rent，pid字段修改
		houseService.houseOrder(id,hid);
		
		return "redirect:/admin/index/index.jsp";
	}
	
	//查询该用户所租的房子
	@RequestMapping("/personalHouse_list.html")
	public String personalHouseList(HttpSession session, Model model){
		Personal personal = (Personal) session.getAttribute("personal");
		int id = personal.getId();
		
		//根据id查询该用户所有租借的房源
		List<House> houseList = houseService.getPersonalHouseById(id);
		model.addAttribute("houseList",houseList);
		
		return "personalHoust_list";
	}
	
	//用户退订房源，根据id将house对应的is_rent改为0,pid改为null
	@RequestMapping("/house_unsubscribe.html")
	public String houseUnsubscribe(Integer hid){
		houseService.houseUnsubscribe(hid);
		
		return "redirect:/admin/index/index.jsp";
	}
	
}
