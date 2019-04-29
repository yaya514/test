package com.tensquare.qa.client.impl;

import com.tensquare.qa.client.LabelClient;
import entity.Result;
import entity.StatusCode;
import org.springframework.stereotype.Component;

/**
 * @ClassName LabelClientImpl
 * Description TODO
 * @Author 雅雅5146
 * @Date 2019/4/27 10:37
 * @Version 1.0
 **/
@Component
public class LabelClientImpl implements LabelClient {
    @Override
    public Result findById(String labelId) {
        return new Result(false, StatusCode.ERROR,"熔断器启动了！");
    }
}
