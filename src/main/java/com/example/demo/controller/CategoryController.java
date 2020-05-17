package com.example.demo.controller;

import com.example.demo.Utils.ResultMapUtils;
import com.example.demo.dto.Category;
import com.example.demo.service.impl.CategoryServiceImpl;
import com.example.demo.service.impl.GoodsServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Controller
@RequestMapping("/category")
//@CrossOrigin
public class CategoryController {
    @Autowired
    CategoryServiceImpl csi;
    @Autowired
    GoodsServiceImpl goods;
   PageInfo pageInfo;
@RequestMapping("/index")
public String index(@RequestParam (required =false) String page,
                    Model model,
                    @RequestParam (required =false) String parent,
                    @RequestParam (required =false) String text){
    Map q=new HashMap();
    q.put("parent",parent);
    q.put("text",text);
    int intPage=page !=null ? Integer.parseInt(page):1;
    PageHelper.startPage(intPage,8);
    List<Category> list=csi.findByProp(q);
    pageInfo=new PageInfo(list);
    model.addAttribute("pageinfo",pageInfo);
    model.addAttribute("categories",list);
        return "category/index";
}
    @GetMapping("/findAll")
    @ResponseBody
    public PageInfo findAll(){
         Map map = new HashMap();
        Map<String,Object> mapResult = new HashMap<>();
         Map c = new HashMap();
         c.put("parent", "0");
         PageHelper.startPage(1,2);
         List<Category> list=csi.findByProp(c);
         pageInfo=new PageInfo(list);
//         map.put("pageNamer",pageInfo.getPageNum());
//         map.put("pageSize",pageInfo.getPageSize());
//         map.put("total",pageInfo.getTotal());
//        map.put("size",pageInfo.getSize());
//        map.put("resultList",list);
        ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"获取所有用户信息成功","data",list);
//
           return pageInfo;
    }

    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable String id) {
        csi.delete(id);
        return "redirect:/category/index";
    }

    @RequestMapping("/deletemore")
    @ResponseBody
    public String deletemore(@RequestBody Map<String,Object> map) {
        List<String> checkArray = (List<String>) map.get("checkArray");
            csi.deleteAll(checkArray);
        return "true";
    }

    @RequestMapping("/add")
    public String add (Model model) {
        model.addAttribute("category",new Category());
        return "category/edit";
    }

    @RequestMapping("/save")//保存功能
    public String save (@ModelAttribute Category category) {
       if (category.getId() .equals("")){
            csi.add(category);
       }else {
          csi.update(category);
      }
       return "redirect:/category/index";
    }

    @RequestMapping("/update/{id}")
    public String update(Model model,@PathVariable String id){
        Map q=new HashMap();
        q.put("id",id);
        Category category=csi.findOneByProp(q);
        model.addAttribute("category",category);
        return "/category/edit";
    }


    //前端接口
    //获取所有分类
    @GetMapping("/getCategoryAll")
    @ResponseBody
    public Map getCategoryAll(){
        Map map = new HashMap();
        Map<String,Object> mapResult = new HashMap<>();
        List<Category> list=csi.findByProp(map);
        ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"获取成功","data",list);
        return mapResult;
    }
    @RequestMapping("/getCategoryText")
    @ResponseBody
    public Map getCategoryText(@RequestParam (required =true) String parent) {
        Map<String,Object> mapResult = new HashMap<>();
        Map cateparent=new HashMap();
        if (parent!=null&& parent!=""){
            cateparent.put("parent",parent);
        }
        List<Category> parca=csi.findByProp(cateparent);
        ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"获取成功","data",parca);
        return mapResult;
    }
}



