package com.example.demo.controller;

import com.example.demo.Utils.ResultMapUtils;
import com.example.demo.Utils.utils;
import com.example.demo.annotation.UserLoginToken;
import com.example.demo.dto.Cart;
import com.example.demo.dto.Collection;
import com.example.demo.dto.Goods;
import com.example.demo.service.impl.CartServiceImpl;
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
@RequestMapping("/cart")
//@CrossOrigin
public class CartController {
    @Autowired
    CartServiceImpl textcart;
    @Autowired
    GoodsServiceImpl goodsService;
    @Autowired
    CollectionServiceImpl cService;
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
        List<Cart> list=textcart.findByProp(q);
        pageInfo=new PageInfo(list);
        model.addAttribute("pageinfo",pageInfo);
        model.addAttribute("carts",list);
        return "cart/index";
    }
    @RequestMapping("/deletemore")
    @ResponseBody
    public String deletemore(@RequestBody Map<String,Object> map) {
        List<String> checkArray = (List<String>) map.get("checkArray");
        textcart.deleteAll(checkArray);
        return "true";
    }
    //加入购物车
    @UserLoginToken
    @RequestMapping(value = "/addCart",method = {RequestMethod.POST})
    @ResponseBody
    public Map addCart(@RequestParam (required =false) String goodsID,
                              HttpServletRequest httpServletRequest) {
        Map<String,Object> mapResult = new HashMap<>();
        Map map=new HashMap();
        String customerID= utils.GetTokenid(httpServletRequest);
        map.put("goodsID",goodsID);
        map.put("customerID",customerID);
        Cart carts=textcart.findOneByProp(map);
        Goods goods=goodsService.findOneByPropID(goodsID);
        if(carts==null){
            Cart cart=new Cart();
            cart.setCustomerID(customerID);
            cart.setPrice(goods.getOriginalprice());
            cart.setGoodsID(goodsID);
            cart.setCount(1);
            cart.setName(goods.getName());
            cart.setImage(goods.getImage());
            cart.setStock(goods.getStock());
            textcart.add(cart);
        }else {
            carts.setCount(carts.getCount()+1);
            textcart.update(carts);
        }
            ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"加入购物车成功","data","");
            return mapResult;
    }
//购物车商品添加
    @UserLoginToken
    @RequestMapping(value = "/addCount",method = {RequestMethod.POST})
    @ResponseBody
    public Map addCount(@RequestParam (required =false) String goodsID,HttpServletRequest httpServletRequest){
        String customerID= utils.GetTokenid(httpServletRequest);
        Map<String,Object> mapResult = new HashMap<>();
        Map map=new HashMap();
        map.put("goodsID",goodsID);
        map.put("customerID",customerID);
        Cart carts=textcart.findOneByProp(map);
            carts.setCount(carts.getCount()+1);
            Boolean isadd=textcart.update(carts);
            if(isadd){
                ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"添加成功","data","");
                return mapResult;
            }else {
                ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"添加失败","data","");
                return mapResult;
            }
    }
    //购物车商品减
    @UserLoginToken
    @RequestMapping(value = "/reduceCount",method = {RequestMethod.POST})
    @ResponseBody
    public Map reduceCount(@RequestParam (required =false) String goodsID,HttpServletRequest httpServletRequest){
        String customerID= utils.GetTokenid(httpServletRequest);
        Map<String,Object> mapResult = new HashMap<>();
        Map map=new HashMap();
        map.put("goodsID",goodsID);
        map.put("customerID",customerID);
        Cart carts=textcart.findOneByProp(map);
        carts.setCount(carts.getCount()-1);
        Boolean isadd=textcart.update(carts);
        if(isadd){
            ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"添加成功","data","");
            return mapResult;
        }else {
            ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"添加失败","data","");
            return mapResult;
        }
    }
    //购物车的删除
//    @UserLoginToken
//    @RequestMapping(value = "/cartDelete",method = {RequestMethod.POST})
//    @ResponseBody
//    public Map cartDelete(@RequestBody Map<String,Object> arrayId,HttpServletRequest httpServletRequest){
//        Map<String,Object> mapResult = new HashMap<>();
//        List<String> checkArray = (List<String>) arrayId.get("arrayId");
//        if(textcart.deleteAll(checkArray)){
//            ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"删除成功","data","");
//            return mapResult;
//        }else {
//            ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.ERROR,"删除失败","data","");
//            return mapResult;
//        }
//    }
    @UserLoginToken
    @RequestMapping(value = "/cartDelete",method = {RequestMethod.POST})
    @ResponseBody
    public Map cartDelete(@RequestParam (required =false) List<String> arrayId,HttpServletRequest httpServletRequest){
//        String customerID= utils.GetTokenid(httpServletRequest);
        Map<String,Object> mapResult = new HashMap<>();
//        List<String> checkArray = (List<String>) map.get("checkArray");
        if(textcart.deleteAll(arrayId)){
            ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"删除成功","data","");
            return mapResult;
        }else {
            ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.ERROR,"删除失败","data","");
            return mapResult;
        }
    }

    //获取购物车
    @UserLoginToken
    @RequestMapping(value = "/getCartItem",method = {RequestMethod.GET})
    @ResponseBody
    public Map getCartItem(HttpServletRequest httpServletRequest) {
        Map<String,Object> mapResult = new HashMap<>();
        String customerID= utils.GetTokenid(httpServletRequest);
        Map map=new HashMap();
        map.put("customerID",customerID);
        List<Cart> cart=textcart.findByProp(map);
        ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"获取成功","data",cart);
        return mapResult;
    }
    //购物车商品数量添加
    @UserLoginToken
    @RequestMapping(value = "/setCartGoodsCount",method = {RequestMethod.POST})
    @ResponseBody
    public Map addCartGoodsCount(@RequestParam (required =false) String id,@RequestParam (required =false) Integer count,HttpServletRequest httpServletRequest){
        String customerID= utils.GetTokenid(httpServletRequest);
        Map<String,Object> mapResult = new HashMap<>();
        Map map=new HashMap();
        map.put("id",id);
        Cart carts=textcart.findOneByProp(map);
        carts.setCount(count);
        Boolean isadd=textcart.update(carts);
        if(isadd){
            ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"","data","");
            return mapResult;
        }else {
            ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.FAIL,"","data","");
            return mapResult;
        }
    }

    @UserLoginToken
    @RequestMapping(value = "/toGoodCollection",method = {RequestMethod.POST})
    @ResponseBody
    public Map toGoodCollection(@RequestParam (required =false) String goodsID,HttpServletRequest httpServletRequest){
        String customerID= utils.GetTokenid(httpServletRequest);
        Map<String,Object> mapResult = new HashMap<>();
        Map map=new HashMap();
        map.put("customerID",customerID);
        map.put("goodsID",goodsID);
        Cart cart=textcart.findOneByProp(map);
        Collection collection=cService.findOneByProp(map);
        if(collection==null){
            Goods goods=goodsService.findOneByPropID(goodsID);
            Collection collection1=new Collection();
            collection1.setGoodsID(goodsID);
            collection1.setCustomerID(customerID);
            collection1.setImage(goods.getImage());
            collection1.setName(goods.getName());
            collection1.setAuthor(goods.getBookAuthor());
            cService.add(collection1);
            textcart.delete(cart.getId());
            ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"移入成功","data","");
        }else {
            textcart.delete(cart.getId());
            ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"移入成功","data","");
        }
            return mapResult;
    }
}
