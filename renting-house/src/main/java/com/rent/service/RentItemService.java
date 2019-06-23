package com.rent.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rent.mapper.RentItemDao;
import com.rent.pojo.Page;
import com.rent.pojo.Personal;
import com.rent.pojo.RentItem;

@Service
public class RentItemService {
	
	@Autowired
	private RentItemDao rentItemDao;

	public void deleteRentItemById(Integer id2) {
		rentItemDao.deleteRentItemById(id2);
	}

	public Page<RentItem> queryPage(Page<RentItem> page) {
		List<RentItem> rentItemList = rentItemDao.queryPage(page);

		Integer totalCount = rentItemDao.queryTotalCount(page);

		// 总记录数
		page.setTotalCount(totalCount);
		// 总页数
		page.setTotalPage((int) Math.ceil(totalCount / (page.getCurrentCount()*1.0)));
		// personal对象集合
		page.setList(rentItemList);

		return page;
	} 
	
	
}
