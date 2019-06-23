package com.rent.mapper;

import java.util.List;

import com.rent.pojo.Page;
import com.rent.pojo.Record;

public interface RecordDao {

	void updatePersonalMoney(Record record);

	List<Record> queryPage(Page<Record> page);

	Integer queryTotalCount(Page<Record> page);
	
	Integer queryAllTotalCount(Page<Record> page);

	List<Record> queryAllPage(Page<Record> page);

}
