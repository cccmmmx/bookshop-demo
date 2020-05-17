package com.example.demo.controller;


import com.example.demo.dto.Customer;
import com.example.demo.service.impl.GoodsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2017/10/16.
 */
@Controller

@RequestMapping(value = "/home",method = {RequestMethod.POST,RequestMethod.GET})
public class HomeController {
    @Autowired
    private GoodsServiceImpl service;
    private   Customer user=new Customer();

    @RequestMapping("/firstlogin")
    public String firstlogin(Model model) {
        return "/home/firstlogin";
    }

//    @RequestMapping("/home")
//    public String home(Model model,HttpSession httpSession) {
//        Map queryValue = new HashMap();
//        httpSession.getAttribute("userLogin");
//        model.addAttribute("goodses", service.findByProp(queryValue));
//        return "home/home";
//    }

    @RequestMapping("/home")
public String home(Model model, HttpServletRequest request) {
    Map queryValue = new HashMap();
    model.addAttribute("goodses", service.findByProp(queryValue));
    return "home/home";
}


//    @RequestMapping("/index")
//    public String index(HttpSession httpSession) {
//        httpSession.getAttribute("userLogin");
//        return "index";
//    }
//
//    @RequestMapping("/loginres")
//    public String loginres() {
//        String str="";
//        String username=user.getUsername();
//        if(username!=null) {
//            str="index"; }
//        else {
//            str="loginres";
//        }
//        return str;
//    }

}
