package com.tensquare.friend.client;

import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @ClassName UserClient
 * Description TODO
 * @Author 雅雅5146
 * @Date 2019/4/26 15:27
 * @Version 1.0
 **/

@FeignClient("tensquare-user")
public interface UserClient {

    @RequestMapping(value = "/user/{userid}/{friendid}/{x}",method = RequestMethod.PUT)
    public void updateFanscountAndFollowcount(@PathVariable("userid") String userid, @PathVariable("friendid") String friendid, @PathVariable("x") int x);
}
