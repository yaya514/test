package com.rent.mapper;

import java.util.List;

import com.rent.pojo.Page;
import com.rent.pojo.RentItem;

public interface RentItemDao {

	void deleteRentItemById(Integer id2);

	List<RentItem> queryPage(Page<RentItem> page);

	Integer queryTotalCount(Page<RentItem> page);
	
}
