package com.example.demo.controller;

import com.example.demo.Utils.ResultMapUtils;
import com.example.demo.Utils.utils;
import com.example.demo.annotation.UserLoginToken;
import com.example.demo.dto.Collection;
import com.example.demo.dto.Goods;
import com.example.demo.service.impl.CollectionServiceImpl;
import com.example.demo.service.impl.GoodsServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/collection")
//@CrossOrigin
public class CollectionController {

    @Autowired
    CollectionServiceImpl cService;
    @Autowired
    GoodsServiceImpl goodsService;
    PageInfo pageInfo;
    @RequestMapping("/index")
    public String index(@RequestParam(required =false) String page,
                        Model model,
                        @RequestParam (required =false) String name,
                        @RequestParam (required =false) String customerID){
        Map q=new HashMap();
        if (name!=null&& name!=""){
            q.put("name",name);
        }
        if (customerID!=null&& customerID!=""){
            q.put("customerID",customerID);
        }
        int intPage=page !=null ? Integer.parseInt(page):1;
        PageHelper.startPage(intPage,8);
        List<Collection> list=cService.findByProp(q);
        pageInfo=new PageInfo(list);
        model.addAttribute("pageinfo",pageInfo);
        model.addAttribute("cotionsval",list);
        return "collection/index";
    }
    @RequestMapping("/deletemore")
    @ResponseBody
    public String deletemore(@RequestBody Map<String,Object> map) {
        List<String> checkArray = (List<String>) map.get("checkArray");
        cService.deleteAll(checkArray);
        return "true";
    }

    //前端接口
    //书籍收藏
    @UserLoginToken
    @RequestMapping(value = "/collectionBook",method = {RequestMethod.POST})
    @ResponseBody
    public Map collectionBook(@RequestParam (required =true) String goodsID,
                              HttpServletRequest httpServletRequest) {
        Map<String,Object> mapResult = new HashMap<>();
        String customerID= utils.GetTokenid(httpServletRequest);
           Goods goods=goodsService.findOneByPropID(goodsID);
           Collection collection=new Collection();
           collection.setGoodsID(goodsID);
           collection.setCustomerID(customerID);
           collection.setImage(goods.getImage());
           collection.setName(goods.getName());
           collection.setAuthor(goods.getBookAuthor());
           if( cService.add(collection)){
               ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"收藏成功","data","");
               return mapResult;
           }else {
               ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.ERROR,"收藏失败","data","");
               return mapResult;
           }
    }
    //取消收藏
    @UserLoginToken
    @RequestMapping(value = "/CancelFavorite",method = {RequestMethod.POST})
    @ResponseBody
    public Map CancelFavorite(@RequestParam (required =true) String goodsID,
                              HttpServletRequest httpServletRequest) {
             Map<String,Object> mapResult = new HashMap<>();
             String customerID= utils.GetTokenid(httpServletRequest);
             Map map=new HashMap();
             map.put("customerID",customerID);
             map.put("goodsID",goodsID);
             Collection collection=cService.findOneByProp(map);
             if(collection!=null){
                 cService.delete(collection.getId());
                 ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"取消成功","data","");
                 return mapResult;
             }else {
                 ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.ERROR,"取消失败","data","");
                 return mapResult;
             }
    }
    //个人收藏
    @UserLoginToken
    @RequestMapping(value = "/userFavorite",method = {RequestMethod.GET})
    @ResponseBody
    public Map userFavorite(@RequestParam (required =false) String pageNumber,
                            @RequestParam (required =false) Integer pageSize,
                            HttpServletRequest httpServletRequest) {
        Map<String,Object> mapResult = new HashMap<>();
        String customerID= utils.GetTokenid(httpServletRequest);
        Map map=new HashMap();
        map.put("customerID",customerID);
        int intPage=pageNumber !=null ? Integer.parseInt(pageNumber):1;
        PageHelper.startPage(intPage,pageSize);
        List<Collection> collection=cService.findByProp(map);
        pageInfo=new PageInfo(collection);
        ResultMapUtils.makeResultMap(mapResult,ResultMapUtils.SUCCESS,"获取成功","data",collection,pageInfo);
         return mapResult;
    }
}