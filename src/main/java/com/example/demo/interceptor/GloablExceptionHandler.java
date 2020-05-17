package com.example.demo.interceptor;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * @author maixin
 * @date 2020-03-28 20:38
 */
@ControllerAdvice
public class GloablExceptionHandler {
    @ResponseBody
    @ExceptionHandler(Exception.class)
    public Object handleException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Exception e) {
                httpServletResponse.setHeader("Access-Control-Allow-Origin", httpServletRequest.getHeader("Origin"));
        httpServletResponse.setHeader("Access-Control-Allow-Credentials", "true");
        httpServletResponse.setHeader("P3P", "CP=CAO PSA OUR");
        if (httpServletRequest.getHeader("Access-Control-Request-Method") != null && "OPTIONS".equals(httpServletRequest.getMethod())) {
            httpServletResponse.addHeader("Access-Control-Allow-Methods", "POST,GET,TRACE,OPTIONS");
            httpServletResponse.addHeader("Access-Control-Allow-Headers", "Content-Type,Origin,Accept");
            httpServletResponse.addHeader("Access-Control-Max-Age", "120");
        }
        String msg = e.getMessage();
        if (msg == null || msg.equals("")) {
            msg = "服务器出错";
        }
        Map map=new HashMap();
        map.put("message", msg);
        return map;
    }
}
