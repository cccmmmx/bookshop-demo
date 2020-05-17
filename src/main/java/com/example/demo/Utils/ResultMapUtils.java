package com.example.demo.Utils;


import com.github.pagehelper.PageInfo;

import java.util.HashMap;
import java.util.Map;

public class ResultMapUtils {
    //常量，代表后台调用的结果：成功、失败和异常
    public static final String SUCCESS = "success";
    public static final String FAIL = "fail";
    public static final String ERROR = "error";
    /**
     * @param map 返回给前端的需要构造的map对象，required
     * @param result 调用接口的结果，sucess、fail和error，required
     * @param message 调用接口失败或异常的反馈信息
     * @param tag 给要返回的对象添加便签，key值
     * @param data 要返回给前端的数据,value值
     * @Description message,tag,data视情况而定，可以传null
     */
    public static void makeResultMap(Map<String,Object> map, String result, String message, String tag, Object data, PageInfo pageInfo){
        Map<String,Object> output=new HashMap<>();
        map.put("result",result);
        if(!isNullOrEmpty(message)){
            map.put("message",message);
        }
        if(!isNullOrEmpty(tag)){
            output.put(tag,data);
        }
            output.put("pageNumber",pageInfo.getPageNum());
            output.put("pageSize",pageInfo.getPageSize());
            output.put("total",pageInfo.getTotal());
            output.put("size",pageInfo.getSize());
            map.put("output",output);
    }
    public static void makeResultNoPageMap(Map<String,Object> map,String result,String message,String tag,Object data){
        map.put("result",result);
        if(!isNullOrEmpty(message)){
            map.put("message",message);
        }
        if(!isNullOrEmpty(tag)){
            map.put(tag,data);
        }
    }

    private static boolean isNullOrEmpty(String str){
        return (null == str || "".equals(str));
    }


}
