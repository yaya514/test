package com.tensquare.service;

import com.tensquare.dao.SpitDao;
import com.tensquare.pojo.Spit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import util.IdWorker;

import java.util.Date;
import java.util.List;

@Service
@Transactional
public class SpitService {
    @Autowired
    private SpitDao spitDao;
    @Autowired
    private IdWorker idWorker;
    @Autowired
    private MongoTemplate mongoTemplate;

    //实现点赞数加一

    public void updateThumbup(String spitId) {
        //方式一：效率低，两次操作数据库
//        Spit spit = spitDao.findById(spitId).get();
//        Integer thumbup = spit.getThumbup();
//        spit.setThumbup(thumbup == null ? 1 : thumbup + 1);
//        spitDao.save(spit);

        //方式二：使用原生mongo命令操作：db.spit.update({"_id":"1"},{$inc:{thumbup:NumberInt(1)}})
        Query query = new Query();
        query.addCriteria(Criteria.where("_id").is("1"));
        Update update = new Update();
        update.inc("thumbup",1);


        mongoTemplate.updateFirst(query,update,"split");

    }

    public Page<Spit> findByParentId(String parentid, int size, int page) {
        Pageable pageable = PageRequest.of(page - 1, size);
        return spitDao.findByParentid(parentid, pageable);
    }

    public List<Spit> findAll() {
        return spitDao.findAll();
    }

    public Spit findById(String id) {
        Spit spit = spitDao.findById(id).get();
        return spit;
    }

    public void add(Spit spit) {
        spit.set_id(idWorker.nextId() + "");
        spit.setPublishtime(new Date());//发布日期
        spit.setVisits(0);//浏览量
        spit.setShare(0);//分享数
        spit.setThumbup(0);//点赞数
        spit.setComment(0);//回复数
        spit.setState("1");//状态

        if (spit.getParentid() != null && !"".equals(spit.getParentid())) {
            //如果父节点id存在，则评论数加一
            Query query = new Query();
            query.addCriteria(Criteria.where("_id").is(spit.getParentid()));
            Update update = new Update();
            update.inc("comment" ,1);

            mongoTemplate.updateFirst(query,update,"spit");
        }
        spitDao.save(spit);
    }

    public void update(Spit spit) {
        spitDao.save(spit);
    }

    public void delete(String id) {
        spitDao.deleteById(id);
    }

}
