package com.example.demo.controller;

import com.example.demo.Utils.ResultMapUtils;
import com.example.demo.dto.Parameter;
import com.example.demo.service.impl.ParameterServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/parameter")
//@CrossOrigin
public class ParameterController {
    @Autowired
    ParameterServiceImpl parameterService;
    @Value("${web.upload-path}")
    private String path;
    @RequestMapping("/index")
    public String index(Model model,
                        @RequestParam(required =false) String text){
        Map q=new HashMap();
        model.addAttribute("parameter",parameterService.findOneByProp(q));
        return "parameter/index";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save (@ModelAttribute Parameter parameter, BindingResult bindingResult,
                        @RequestParam("upfile") MultipartFile file) throws UnsupportedEncodingException, NoSuchAlgorithmException {
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
            parameter.setWeblogo(url);
        }
        parameterService.update(parameter);
        return "redirect:/parameter/index";
    }


    //前端接口
    //数据字典接口
    @RequestMapping(value = "/getParameter",method = RequestMethod.GET)
    @ResponseBody
    public Map getParameter() {
        Map<String,Object> mapResult = new HashMap<>();
        Map map=new HashMap();
        Parameter parameter= parameterService.findOneByProp(map);
        ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"获取成功","data",parameter);
        return mapResult;
    }
}
