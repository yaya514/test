package com.rent.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rent.mapper.RecordDao;
import com.rent.pojo.Page;
import com.rent.pojo.Personal;
import com.rent.pojo.Record;

@Service
public class RecordService {
	
	@Autowired
	private RecordDao recordDao;

	public Page<Record> queryPage(Page<Record> page) {
		List<Record> recordList = recordDao.queryPage(page);

		Integer totalCount = recordDao.queryTotalCount(page);

		// 总记录数
		page.setTotalCount(totalCount);
		// 总页数
		page.setTotalPage((int) Math.ceil(totalCount / (page.getCurrentCount()*1.0)));
		// personal对象集合
		page.setList(recordList);

		return page;
	}
	

	public void updatePersonalMoney(Record record) {
		recordDao.updatePersonalMoney(record);
	}


	public Page<Record> queryAllPage(Page<Record> page) {
		List<Record> recordList = recordDao.queryAllPage(page);

		Integer totalCount = recordDao.queryAllTotalCount(page);

		// 总记录数
		page.setTotalCount(totalCount);
		// 总页数
		page.setTotalPage((int) Math.ceil(totalCount / (page.getCurrentCount()*1.0)));
		// personal对象集合
		page.setList(recordList);

		return page;
	}

}
