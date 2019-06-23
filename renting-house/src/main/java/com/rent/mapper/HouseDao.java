package com.rent.mapper;

import java.util.List;

import com.rent.pojo.House;
import com.rent.pojo.Page;

public interface HouseDao {

	List<House> getHouseList();

	House getHouseById(Integer id);

	void updateHouseById(House house);

	void deleteHouseById(Integer id);

	void addHouse(House house);

	List<House> queryPage(Page<House> page);

	Integer queryTotalCount(Page<House> page);

	List<House> houseListCustomer();

	List<House> queryPageCustomer(Page<House> page);

	Integer queryTotalCountCustomer(Page<House> page);

	void houseOrder(Integer id, Integer hid);

	List<House> getPersonalHouseById(int id);

	void houseUnsubscribe(Integer id);
	
}
