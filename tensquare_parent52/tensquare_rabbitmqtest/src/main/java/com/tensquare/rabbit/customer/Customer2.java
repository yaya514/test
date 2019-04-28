package com.tensquare.rabbit.customer;

import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

@Component
@RabbitListener(queues = "zzh233")
public class Customer2 {

    @RabbitHandler
    public void showMessage(String message){
        System.out.println("zzh233接收到消息:"+message);
    }
}
