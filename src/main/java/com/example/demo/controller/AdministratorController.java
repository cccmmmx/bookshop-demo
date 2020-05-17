package com.example.demo.controller;


import com.example.demo.dto.Administrator;
import com.example.demo.service.impl.AdministratorServiceImpl;
import com.example.demo.service.impl.CustomerServiceImpl;
import com.example.demo.service.impl.SellerServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/administrator")

public class AdministratorController {
    @Autowired
    private AdministratorServiceImpl adminSerI;

    @Autowired
    private SellerServiceImpl sellerSI;

    @Autowired
    private CustomerServiceImpl custSI;
    @Value("${web.upload-path}")
    private String path;
    @RequestMapping("/index")
    public String adminManage(Model model, @RequestParam (required =false) String parent){
        Map ad=new HashMap();
        model.addAttribute("admins",adminSerI.findByProp(ad));
        return "/administrator/index";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save (@ModelAttribute Administrator administrator,BindingResult bindingResult,
                        @RequestParam("upfile") MultipartFile file,
                        @RequestParam(required = false) String password) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        if (!file.isEmpty()) {
            // 获取文件名
            String fileName = file.getOriginalFilename();//11.jpg
            //封装图片访问地址
            String url = "http://120.25.232.119"+"/image/" + fileName;
            //利用配置文件中的path
            File dest = new File(path + fileName);//d:/image/11.jpg
            // 检测是否存在目录
            if (!dest.getParentFile().exists()) {
                dest.getParentFile().mkdirs();
            }
            try {
                //把内存图片写入磁盘中
                file.transferTo(dest);//
            } catch (IOException e) {
                e.printStackTrace();
            }
            //手工处理其图片信息
            administrator.setImg(url);//11.jpg
        }


        adminSerI.update(administrator);
        return "redirect:/administrator/index";
    }

    @RequestMapping("/update/{id}")
    public String update(Model model,@PathVariable String id){
        Map q=new HashMap();
        q.put("id",id);
        Administrator customer=adminSerI.findOneByProp(q);
        model.addAttribute("admins",customer);
        return "/administrator/edit";
    }


    @RequestMapping("/login")
    public String login(Model model) {
        return "/administrator/login";
    }

    @RequestMapping(value = "/doLogin" ,method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public Map doLogin(
            @RequestParam(required = false) String username,
            @RequestParam(required = false) String password,
            HttpSession session) {
        Map map2=new HashMap();
        Map map=new HashMap();
        map.put("username",username);
        Administrator userForBase=adminSerI.findOneByProp(map);
        if(userForBase==null){
            map2.put("message","none");
            return map2;
        }else {
            if (!userForBase.getPassword().equals(password)){
                map2.put("message","password");
                return map2;
            }else {
                session.setAttribute("user", userForBase);
                map2.put("message","yes");
                return map2;
            }
        }
    }
    @RequestMapping(value = "/logout",method = {RequestMethod.POST,RequestMethod.GET})
    public String logout(HttpServletRequest request) {
        request.getSession().removeAttribute("user");
        return "/administrator/login";
    }


    @RequestMapping("/delete/{id}")
    public String delete(Model model, @PathVariable(value = "id") String id){
        Map map = new HashMap();
        map.put("id",id);
        Administrator administrator = adminSerI.findOneByProp(map);
        model.addAttribute("admins", adminSerI.delete(administrator));
        return "redirect:/administrator/index";
    }


}

