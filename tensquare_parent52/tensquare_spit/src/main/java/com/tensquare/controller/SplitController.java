package com.tensquare.controller;

import com.tensquare.pojo.Spit;
import com.tensquare.service.SpitService;
import entity.PageResult;
import entity.Result;
import entity.StatusCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@RestController
@CrossOrigin
@RequestMapping("/spit")
public class SplitController {

    @Autowired
    private SpitService spitService;

    @Autowired
    private RedisTemplate redisTemplate;

    @RequestMapping(value = "/thumbup/{spitId}", method = RequestMethod.PUT)
    public Result updateThumbup(@PathVariable String spitId) {
        //判断用户是否点过赞
        String userid = "111";
        if (redisTemplate.opsForValue().get("thumbup_" + userid + "_" + spitId) != null) {
            return new Result(false, StatusCode.REPERROR, "您已经点过赞了");
        }

        spitService.updateThumbup(spitId);
        redisTemplate.opsForValue().set("thumbup_" + userid + "_" + spitId, "1");
        return new Result(true, StatusCode.OK, "点赞成功");
    }

    @RequestMapping(value = "/comment/{parentid}/{page}/{size}", method = RequestMethod.GET)
    public Result findByParentId(@PathVariable String parentid, @PathVariable int page, @PathVariable int size) {
        Page<Spit> pageData = spitService.findByParentId(parentid, page, size);
        return new Result(true, StatusCode.OK, "查询成功", new PageResult<Spit>(pageData.getTotalElements(), pageData.getContent()));
    }

    @RequestMapping(method = RequestMethod.GET)
    public Result findAll() {
        List<Spit> list = spitService.findAll();
        return new Result(true, StatusCode.OK, "查询成功", list);
    }

    @RequestMapping(value = "/{spitId}", method = RequestMethod.GET)
    public Result findById(@PathVariable String spitId) {
        return new Result(true, StatusCode.OK, "查询成功", spitService.findById(spitId));
    }

    @RequestMapping(method = RequestMethod.POST)
    public Result save(@RequestBody Spit spit) {
        spitService.add(spit);
        return new Result(true, StatusCode.OK, "添加成功");
    }

    @RequestMapping(value = "/{spitId}", method = RequestMethod.PUT)
    public Result update(@PathVariable String spitId, @RequestBody Spit spit) {
        spit.set_id(spitId);
        spitService.update(spit);
        return new Result(true, StatusCode.OK, "修改成功");
    }

    @RequestMapping(value = "/{spitId}", method = RequestMethod.DELETE)
    public Result delete(@PathVariable String spitId) {
        spitService.delete(spitId);
        return new Result(true, StatusCode.OK, "删除成功");
    }
}
