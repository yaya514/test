package com.tensquare.web.filter;

import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;
import com.netflix.zuul.exception.ZuulException;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

/**
 * @ClassName WebFilter
 * Description TODO
 * @Author 雅雅5146
 * @Date 2019/4/27 13:08
 * @Version 1.0
 **/
@Component
public class WebFilter extends ZuulFilter {

    @Override
    public String filterType() {
        return "pre";
    }

    @Override
    public int filterOrder() {
        return 0;
    }

    @Override
    public boolean shouldFilter() {
        return true;
    }

    @Override
    public Object run() throws ZuulException {
        System.out.println("经过了前台过滤器");
        //向header中添加权限令牌
        RequestContext context = RequestContext.getCurrentContext();
        //获取header
        HttpServletRequest request = context.getRequest();
        String authorization = (String) request.getAttribute("Authorization");
        if(authorization != null){
            context.addZuulRequestHeader("Authorization",authorization);
        }
        return null;
    }
}
