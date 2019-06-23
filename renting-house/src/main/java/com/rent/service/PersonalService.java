package com.rent.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rent.mapper.PersonalDao;
import com.rent.pojo.Page;
import com.rent.pojo.Personal;

@Service
public class PersonalService {

	@Autowired
	private PersonalDao personalDao;
	
	public Personal getPersonalByPhone(String phone) {
		Personal personal = personalDao.getPersonalByPhone(phone);
		return personal;
	}

	public void register(Personal personal) {
		personalDao.register(personal);
		
	}

	public Personal checkPhone(String phone) {
		Personal personal = personalDao.checkPhone(phone);
		return personal;
	}

	public void editPersonalInfo(Personal personal) {
		personalDao.editPersonalInfo(personal);
	}

	public void editPersonalPasswordByPhone(Personal personal) {
		personalDao.editPersonalPasswordByPhone(personal);
	}

	public List<Personal> getPersonalList() {
		List<Personal> personalList = personalDao.getPersonalList();
		return personalList;
	}

	public Personal getPersonalById(Integer id) {
		Personal personal = personalDao.getPersonalById(id);
		return personal;
	}

	public void updatePersonal(Personal personal) {
		personalDao.updatePersonal(personal);
	}

	public void deletePersonal(Integer id) {
		personalDao.deletePersonal(id);
	}

	public Page<Personal> queryPage(Page<Personal> page) {
		List<Personal> personalList = personalDao.queryPage(page);

		Integer totalCount = personalDao.queryTotalCount(page);

		// 总记录数
		page.setTotalCount(totalCount);
		// 总页数
		page.setTotalPage((int) Math.ceil(totalCount / (page.getCurrentCount()*1.0)));
		// personal对象集合
		page.setList(personalList);

		return page;
	}

	public void personalAdd(Personal personal) {
		personalDao.personalAdd(personal);
	}

	public void updatePersonalMoney(Personal personal) {
		
		personalDao.updatePersonalMoney(personal);
	}

}
