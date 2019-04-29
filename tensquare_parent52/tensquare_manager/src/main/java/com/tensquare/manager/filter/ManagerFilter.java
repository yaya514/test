package com.tensquare.manager.filter;

import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;
import com.netflix.zuul.exception.ZuulException;
import io.jsonwebtoken.Claims;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import util.JwtUtil;

import javax.servlet.http.HttpServletRequest;

/**
 * @ClassName ManagerFilter
 * Description TODO
 * @Author 雅雅5146
 * @Date 2019/4/27 11:37
 * @Version 1.0
 **/
@Component
public class ManagerFilter extends ZuulFilter {

    @Autowired
    private JwtUtil jwtUtil;

    //在请求前pre或请求后post执行
    @Override
    public String filterType() {
        return "pre";
    }

    //多个过滤器执行顺序，数字越小，表示越先执行
    @Override
    public int filterOrder() {
        return 0;
    }

    //表示该过滤器是否生效
    @Override
    public boolean shouldFilter() {
        return true;
    }

    //表示 过滤器内部执行的操作，任何object值都表示继续执行
    //setsendzullResponse(false)表示不再继续执行
    @Override
    public Object run() throws ZuulException {
        System.out.println("经过后台过滤器了！");
        RequestContext context = RequestContext.getCurrentContext();
        HttpServletRequest request = context.getRequest();

        if(request.getMethod().equals("OPTIONS")){
            return null;
        }

        if(request.getRequestURI().indexOf("login")>0){
            return null;
        }

        String header = (String) request.getAttribute("Authorization");
        if(header != null && !"".equals(header)){
            if (header.startsWith("Bearer ")){
                String token = header.substring(7);

                try {
                    Claims claims = jwtUtil.parseJWT(token);
                    String roles = (String) claims.get("roles");
                    if(roles.equals("admin")){
                        //把头信息转发下去，并且放行
                        context.addZuulRequestHeader("Authorization",header);
                        return null;
                    }
                }catch (Exception e){
                    e.printStackTrace();
                    context.setSendZuulResponse(false);//终止运行
                }
            }
        }
        context.setSendZuulResponse(false);//终止运行
        context.setResponseStatusCode(403);
        context.setResponseBody("权限不足");
        context.getResponse().setContentType("text/html;charset=UTF-8");
        return null;
    }
}
