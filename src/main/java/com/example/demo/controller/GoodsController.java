package com.example.demo.controller;


import com.example.demo.Utils.ResultMapUtils;
import com.example.demo.Utils.utils;
import com.example.demo.annotation.UserLoginToken;
import com.example.demo.dto.*;
import com.example.demo.service.impl.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;




@Controller
@RequestMapping("/goods")
//@CrossOrigin
public class GoodsController {
    @Autowired
    GoodsServiceImpl gis;
    @Autowired
    private CategoryServiceImpl ics;
    @Autowired
    private SellerServiceImpl iss;
    @Autowired
    private CollectionServiceImpl collectionService;
    @Autowired
    private TOrderServiceImpl tOrderService;
    @Value("${web.upload-path}")
    private String path;


   private PageInfo<Goods> pageInfo;
    private PageInfo<Goods> pageInfo2;
    @RequestMapping(value = "/index")
    public String manage( Model model,

                          @RequestParam(required =false) String page,
                          @RequestParam (required =false) String name,
                          @RequestParam (required =false) String originalprice,
                          @RequestParam (required =false) String rate,
                          @RequestParam (required =false) String grade,
                          @RequestParam (required =false) String stock,
                          @RequestParam(required = false) String state

    ){
        Map q=new HashMap();
        if (name!=null&& name!=""){
            q.put("name",name);
        }
        if (originalprice!=null&& originalprice!=""){
            q.put("originalprice",originalprice);
        }
        if (rate!=null&&rate!=""){
            q.put("rate",rate);
        }
        if (grade!=null&&grade!=""){
            q.put("grade",grade);
        }
        if (stock!=null&&stock!=""){
            q.put("stock",stock);
        }
        if (state!=null&&state!=""){
            q.put("state",state);
        }
        int intPage=page !=null ? Integer.parseInt(page):1;
        PageHelper.startPage(intPage,10);
        List<Goods> list=gis.findByProp(q);
        pageInfo=new PageInfo(list);
        model.addAttribute("pageinfo",pageInfo);
        model.addAttribute("goodes",list);
        return "goods/index";
    }

    @RequestMapping(value = "/dataindex")
    public String dataindex(Model model
    ){
        PageHelper.startPage(1,10);
        List<Goods> list=gis.finddataByProp();
        new PageInfo(list);
        model.addAttribute("lookdata",list);

        PageHelper.startPage(1,10);
        List<Goods> list1=gis.findDealmount();
        new PageInfo(list1);
        model.addAttribute("mount",list1);
        return "datastatis/index";
    }
    @GetMapping(value = "/getmount")
    @ResponseBody
    public Map getmount(
    ){
        Map<String,Object> mapResult = new HashMap<>();
        PageHelper.startPage(1,10);
        List<Goods> list=gis.findDealmount();
        pageInfo=new PageInfo(list);
        ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"获取成功","data",list);
        return mapResult;
    }
    @GetMapping(value = "/selectGoodsCount")
    @ResponseBody
    public Map selectGoodsCount(
    ){
        Map<String,Object> mapResult = new HashMap<>();
       List<TOrder> list=tOrderService.selectGoodsCount();
        ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"获取成功","data",list);
        return mapResult;
    }

    @GetMapping(value = "/selectGoodsPrice")
    @ResponseBody
    public Map selectGoodsPrice(
    ){
        Map<String,Object> mapResult = new HashMap<>();
        List<TOrder> list=tOrderService.selectGoodsPrice();
        ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"获取成功","data",list);
        return mapResult;
    }

    @GetMapping(value = "/getLookdata")
    @ResponseBody
    public Map getLookdata(
    ){
        Map<String,Object> mapResult = new HashMap<>();
        PageHelper.startPage(1,10);
        List<Goods> list=gis.finddataByProp();
        pageInfo=new PageInfo(list);
        ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"获取成功","data",list);
        return mapResult;
    }

    @RequestMapping(value = "/getRecomd" ,method = RequestMethod.POST)
    @ResponseBody
    public Map getRecomd(@RequestParam (required =false) String  state,@RequestParam (required =false) String  id
    ){
        Map<String,Object> mapResult = new HashMap<>();

        Goods goods=gis.findOneByPropID(id);
        goods.setState(state);
        if(gis.update(goods)){
            ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"修改成功","data",goods);
            return mapResult;
        }else {
            ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.FAIL,"修改失败","data",goods);
            return mapResult;
        }
    }
    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable String id) {
        gis.delete(id);
        return "redirect:/goods/index";
    }
    @RequestMapping("/getCategoryText")
    @ResponseBody
    public List<Category> getCategoryText(@RequestParam (required =true) String parent,Model model) {
        Map cateparent=new HashMap();
        if (parent!=null&& parent!=""){
            cateparent.put("parent",parent);
        }
        return ics.findByProp(cateparent);
    }

    @RequestMapping("/deletemore")
    @ResponseBody
    public String deletemore(@RequestBody Map<String,Object> map) {
        List<String> checkArray = (List<String>) map.get("checkArray");
        gis.deleteAll(checkArray);
        return "true";
    }

    @RequestMapping("/add")
    public String add (Model model) {
      ca_se_data_init(model);
      model.addAttribute("goods",new Goods());
        return "goods/edit";
    }

    @RequestMapping("/save")//保存功能
    public String save (@ModelAttribute Goods goods,BindingResult bindingResult,
    @RequestParam("upfile") MultipartFile file,
    @RequestParam(required =false) String categoryDate,
                        @RequestParam(required =false) String sellerDate,
                        @RequestParam(required =false) Date bookPubDates,
    HttpSession session) {
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
            goods.setImage(url);//11.jpg
        }

        goods.setBookPubDate(bookPubDates);
        if (goods.getId().equals("")){
            Map cm=new HashMap();
            cm.put("id",categoryDate);
            Map sm=new HashMap();
            sm.put("id",sellerDate);

          Category category= ics.findOneByProp(cm);
         Seller seller= iss.findOneByProp(sm);
         System.out.println(seller);
         goods.setCategory(category);
         goods.setSeller(seller);

            gis.add(goods);
        }else {
            Map cm=new HashMap();
            cm.put("id",categoryDate);
            Map sm=new HashMap();
            Goods goods1=gis.findOneByPropID(goods.getId());
            sm.put("id",sellerDate);
            Category category= ics.findOneByProp(cm);
            Seller seller= iss.findOneByProp(sm);
            goods.setCategory(category);
            goods.setSeller(seller);
            goods.setBookLookmount(goods1.getBookLookmount());
            goods.setBookDealmount(goods1.getBookDealmount());
            gis.update(goods);
        }
        return "redirect:/goods/index";
    }
    @InitBinder
    public void initBinder(WebDataBinder binder, WebRequest request) {
        //转换日期 注意这里的转化要和传进来的字符串的格式一直 如2015-9-9 就应该为yyyy-MM-dd
        DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));// CustomDateEditor为自定义日期编辑器
    }
    @RequestMapping("/update/{id}")
    public String update(Model model,@PathVariable String id){
        Map q=new HashMap();
        q.put("id",id);
       ca_se_data_init(model);
        Goods goods=gis.findOneByProp(q);
        model.addAttribute("goods",goods);

        return "/goods/edit";
    }


    private void ca_se_data_init(Model model) {
        // 添加分类信息
        Map queryCategory = new HashMap();
        model.addAttribute("category", ics.findByProp(queryCategory));
        // 添加商家信息
        Map querySeller = new HashMap();
        model.addAttribute("seller", iss.findByProp(querySeller));
    }

    //前端接口
    //获取所有通过分类获取书籍商品
    @GetMapping("/getGoodsPage")
    @ResponseBody
    public Map getGoodsPage(@RequestParam (required =false) String pageNumber,
                            @RequestParam (required =false) Integer pageSize,
                            @RequestParam (required =false) String categoryID,
                            @RequestParam (required =false) String state,
                            @RequestParam (required =false) String name
                            ){
        Map<String,Object> mapResult = new HashMap<>();
        Map map = new HashMap();
        if (state!=null&& state!=""){
            map.put("state",state);
        }
        if (categoryID!=null&& categoryID!=""){
            map.put("categoryID",categoryID);
        }
        if (name!=null&& name!=""){
            map.put("name",name);
        }
        map.put("grade","2");
        int intPage=pageNumber !=null ? Integer.parseInt(pageNumber):1;
        PageHelper.startPage(intPage,pageSize);
        List<Goods> list=gis.findByProp(map);
        pageInfo=new PageInfo(list);
        ResultMapUtils.makeResultMap(mapResult,ResultMapUtils.SUCCESS,"获取成功","data",list,pageInfo);
        return mapResult;
    }
//    //通过状态获取推荐书籍商品
//    @GetMapping("/getRecommendGood")
//    @ResponseBody
//    public Map getRecommendGood(
//                            @RequestParam (required =false) String state){
//        Map<String,Object> mapResult = new HashMap<>();
//        Map map = new HashMap();
//        map.put("state",state);
//        PageHelper.startPage(1,10);
//        List<Goods> list=gis.findByProp(map);
//        pageInfo=new PageInfo(list);
//        ResultMapUtils.makeResultMap(mapResult,ResultMapUtils.SUCCESS,"获取成功","data",list,pageInfo);
//        return mapResult;
//    }
    //通过id获取书籍详情
    @UserLoginToken
    @GetMapping("/getGoodsDetail")
    @ResponseBody
    public Map getGoodsDetail(@RequestParam (required =false) String id,
                              HttpServletRequest httpServletRequest){
        String customerid= utils.GetTokenid(httpServletRequest);
        Map<String,Object> mapResult = new HashMap<>();
      Goods goods=gis.findOneByPropID(id);
      goods.setBookLookmount(goods.getBookLookmount()+1);
      gis.update(goods);
      Map collen=new HashMap();
      collen.put("customerID",customerid);
      collen.put("goodsID",goods.getId());
       Collection collection= collectionService.findOneByProp(collen);
       if(collection!=null){
           goods.setIsCollection("1");
       }else {
           goods.setIsCollection("0");
       }
        ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"获取成功","data",goods);
        return mapResult;
    }

    @RequestMapping(value = "/changeGrade" ,method = RequestMethod.POST)
    @ResponseBody
    public Map changeGrade(@RequestParam (required =false) String id,
                           @RequestParam (required =false) String grade
                              ){
        Map<String,Object> mapResult = new HashMap<>();
        Goods goods=gis.findOneByPropID(id);
        goods.setGrade(grade);
        if(gis.update(goods)){
            ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"修改成功","data",goods);
            return mapResult;
        }else {
            ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.FAIL,"修改失败","data",goods);
            return mapResult;
        }
    }
}
