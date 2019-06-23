package com.rent.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rent.mapper.HouseDao;
import com.rent.pojo.House;
import com.rent.pojo.Page;

@Service
public class HouseService {
	@Autowired
	private HouseDao houseDao;

	public List<House> getHouseList() {
		List<House> houseList = houseDao.getHouseList();
		return houseList;
	}

	public House getHouseById(Integer id) {
		House house = houseDao.getHouseById(id);
		return house;
	}

	public void updateHouseById(House house) {
		houseDao.updateHouseById(house);
	}

	public void deleteHouseById(Integer id) {
		houseDao.deleteHouseById(id);
	}

	public void addHouse(House house) {
		houseDao.addHouse(house);
		
	}

	public Page<House> queryPage(Page<House> page) {
		List<House> houseList = houseDao.queryPage(page);

		Integer totalCount = houseDao.queryTotalCount(page);

		// 总记录数
		page.setTotalCount(totalCount);
		// 总页数
		page.setTotalPage((int) Math.ceil(totalCount / (page.getCurrentCount()*1.0)));
		// personal对象集合
		page.setList(houseList);

		return page;
	}

	public List<House> houseListCustomer() {
		List<House> houseList = houseDao.houseListCustomer();
		return houseList;
	}

	public Page<House> queryPageCustomer(Page<House> page) {
		List<House> houseList = houseDao.queryPageCustomer(page);

		Integer totalCount = houseDao.queryTotalCountCustomer(page);

		// 总记录数
		page.setTotalCount(totalCount);
		// 总页数
		page.setTotalPage((int) Math.ceil(totalCount / (page.getCurrentCount()*1.0)));
		// personal对象集合
		page.setList(houseList);

		return page;
	}

	public void houseOrder(Integer id, Integer hid) {
		houseDao.houseOrder(id,hid);
	}

	public List<House> getPersonalHouseById(int id) {
		List<House> houseList = houseDao.getPersonalHouseById(id);
		return houseList;
	}

	public void houseUnsubscribe(Integer id) {
		houseDao.houseUnsubscribe(id);
		
	}
	
}
