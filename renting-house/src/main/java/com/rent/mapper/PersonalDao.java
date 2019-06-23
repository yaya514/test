package com.rent.mapper;

import java.util.List;

import com.rent.pojo.Page;
import com.rent.pojo.Personal;

public interface PersonalDao {

	Personal getPersonalByPhone(String phone);

	void register(Personal personal);

	Personal checkPhone(String phone);

	void editPersonalInfo(Personal personal);

	void editPersonalPasswordByPhone(Personal personal);

	List<Personal> getPersonalList();

	Personal getPersonalById(Integer id);

	void updatePersonal(Personal personal);

	void deletePersonal(Integer id);

	List<Personal> queryPage(Page<Personal> page);

	Integer queryTotalCount();

	void personalAdd(Personal personal);

	void updatePersonalMoney(Personal personal);

	Integer queryTotalCount(Page<Personal> page);

}
