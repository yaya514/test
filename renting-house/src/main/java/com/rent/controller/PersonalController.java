package com.rent.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rent.pojo.Page;
import com.rent.pojo.Personal;
import com.rent.service.PersonalService;
import com.rent.utils.MD5Utils;

@Controller
public class PersonalController {

	@Autowired
	private PersonalService personalService;

	@RequestMapping("/login_1.html")
	private String login() {

		return "login";
	}

	// 登录页面传过来账号，密码，校验是否正确
	@RequestMapping("/login.html")
	private String login(Personal personal, Model model, HttpSession session) {
		String phone = personal.getPhone();
		Personal p = personalService.getPersonalByPhone(phone);
		if (p == null) {
			model.addAttribute("error", "用户不存在！");
			return "login";
		} else {
			if (!p.getPassword().equals(MD5Utils.md5(personal.getPassword()))) {
				model.addAttribute("error", "用户名或密码错误！");
				return "login";
			} else {
				session.setAttribute("personal", p);
				model.addAttribute("personal", p);
			}
		}
		return "redirect:/admin/index/index.jsp";

	}

	// 用户注册,注册页面传过来账号，密码，存入到数据库
	@RequestMapping("/register.html")
	private String register(Personal personal) {
		String password = personal.getPassword();
		// 使用MD5加密算法，对用户的密码进行加密
		password = MD5Utils.md5(password);

		personal.setPassword(password);
		personalService.register(personal);

		return "login";
	}

	// ajax异步校验phone是否存在
	@RequestMapping("/admin/index/checkPhone.action")
	@ResponseBody
	private Boolean checkPhone(String phone) {

		Personal personal = personalService.checkPhone(phone);

		Boolean isExist = false;
		// 如果不为空，则该手机号不能注册
		if (personal != null) {
			isExist = true;
		}

		return isExist;
	}

	// 修改用户个人信息,修改完之后，跳转到主页面
	@RequestMapping("/editPersonalInfo.html")
	private String editPersonalInfo(Personal personal, Model model) {
		personalService.editPersonalInfo(personal);

		String phone = personal.getPhone();
		// 将更新后的信息，再从数据库中查询出来
		Personal p = personalService.getPersonalByPhone(phone);
		// 将更新之间旧的personal覆盖
		model.addAttribute("personal", p);

		return "redirect:/admin/index/index.jsp";
	}

	// 根据phone查询返回个人peronsal信息
	@RequestMapping("/admin-info.html")
	public String admin_info(HttpSession session, Model model) {
		Personal personal = (Personal) session.getAttribute("personal");

		String phone = personal.getPhone();
		Personal p = personalService.getPersonalByPhone(phone);

		model.addAttribute("personal", p);

		return "admin-info";
	}

	// 修改用户密码
	@RequestMapping("/editPersonalPassword.html")
	public String editPersonalPassword(Personal personal) {
		String password = personal.getPassword();
		password = MD5Utils.md5(password);

		personal.setPassword(password);

		personalService.editPersonalPasswordByPhone(personal);

		return "login";
	}

	// 查询所有租户
	@RequestMapping("/personal_list.html")
	public String personalList(Integer currentPage, Model model, String searchName) throws Exception {

		if (searchName != null) {
			searchName = new String(searchName.getBytes("ISO-8859-1"), "UTF-8");
		}

		Page<Personal> page = new Page<>();
		if (currentPage == null) {
			currentPage = 1;
		}

		page.setCurrentPage(currentPage);
		page.setCurrentCount(5);
		page.getParams().put("searchName", searchName);

		// 起始索引
		page.setIndex((currentPage - 1) * page.getCurrentCount());

		page = personalService.queryPage(page);

		model.addAttribute("page", page);

		return "personal_list";
	}

	// 根据id查询回显个人信息
	@RequestMapping("/personal_show.html")
	public String personalShow(Integer id, Model model) {
		Personal personal = personalService.getPersonalById(id);
		model.addAttribute("personal", personal);

		return "personal_edit";
	}

	// 根据id修改对应的personal信息
	@RequestMapping("/personal_edit.html")
	public String personalEdit(Personal personal) {
		personalService.updatePersonal(personal);

		return "redirect:/admin/index/index.jsp";
	}

	// 根据id删除对应的personal信息
	@RequestMapping("/deletePersonal.html")
	public String deletePersonal(Integer id) {
		personalService.deletePersonal(id);

		return "redirect:/personal_list.html";
	}

	// 管理员添加一个personal
	@RequestMapping("/personal_add.html")
	public String personalAdd(Personal personal, Model model) {
		String phone = personal.getPhone();

		// 判断一下账号phone是否存在
		Personal p = personalService.checkPhone(phone);

		// 如果不为空，则该手机号不能注册
		if (p != null) {
			String error = "该账号已经存在！";
			model.addAttribute("error", error);
			return "personal_add";
		}
		// 为空的话，则该账号可以注册
		// 设置管理员添加的初始用户的 密码为123
		personal.setPassword(MD5Utils.md5("123"));
		personal.setPower(1);

		personalService.personalAdd(personal);
		return "redirect:/personal_list.html";

	}

	// 查询回显用户余额信息
	@RequestMapping("/personal_money.html")
	public String personalMoney(HttpSession session) {
		Personal personal = (Personal) session.getAttribute("personal");
		String phone = personal.getPhone();
		Personal personalByPhone = personalService.getPersonalByPhone(phone);

		session.setAttribute("personal", personalByPhone);

		return "personal_money";
	}
}
