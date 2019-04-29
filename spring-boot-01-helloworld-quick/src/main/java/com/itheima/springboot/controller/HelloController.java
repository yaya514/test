package com.itheima.springboot.controller;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/*@Controller
@ResponseBody*/
@RestController //可以替换Controller，ResponseBody
public class HelloController {

    @RequestMapping("/hello")
    public String hello(){
        return "偶是渣渣辉！！！！！！";
    }
}
