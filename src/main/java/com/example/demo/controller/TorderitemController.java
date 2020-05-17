package com.example.demo.controller;


import com.example.demo.Utils.ResultMapUtils;
import com.example.demo.Utils.utils;
import com.example.demo.annotation.UserLoginToken;
import com.example.demo.dto.*;
import com.example.demo.service.impl.*;
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
@RequestMapping("/orderitem")
//@CrossOrigin
public class TorderitemController {
    @Autowired
    OrderItemServiceImpl coti;
    @Autowired
    TOrderServiceImpl tOrdertext;
    @Autowired
    CustomerServiceImpl customertext;
    @Autowired
    SellerServiceImpl sellertext;
    @Autowired
    BookaddressServiceImpl baddresstext;
    @Autowired
            GoodsServiceImpl goodstext;
    @Autowired
    CartServiceImpl textcart;
    PageInfo pageInfo;
    @RequestMapping("/index")
    public String manage(Model model,
                         @RequestParam(required =false) String page,
                         @RequestParam (required =false) String name,
                                     @RequestParam (required =false) String status
                          ){
        Map q=new HashMap();
        if (name!=null&& name!=""){
            q.put("name",name);
        }
        if (status!=null&& status!=""){
            q.put("status",status);
        }
        int intPage=page !=null ? Integer.parseInt(page):1;
        PageHelper.startPage(intPage,8);
        List<OrderItem> list=coti.findByProp(q);
        pageInfo=new PageInfo(list);
        model.addAttribute("pageinfo",pageInfo);
        model.addAttribute("toerders",list);
        return "orderitem/index";
    }
    @RequestMapping("/save")//保存功能
    public String save(@ModelAttribute OrderItem tOrder) {
        Map map=new HashMap();
//        System.out.println(tOrder.getId());
        map.put("id",tOrder.getId());
        OrderItem tOrder1=coti.findOneByProp(map);
        tOrder1.setStatus(tOrder.getStatus());
        coti.update(tOrder1);
        return "redirect:/orderitem/index";
    }

    @RequestMapping("/update/{id}")
    public String update(Model model,@PathVariable String id){
        Map q=new HashMap();
        q.put("id",id);
        OrderItem order=coti.findOneByProp(q);
        model.addAttribute("orderitems",order);
        return "/orderitem/edit";
    }
    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable String id) {
        coti.delete(id);
        return "redirect:/orderitem/index";
    }

    @RequestMapping("/deletemore")
    @ResponseBody
    public String deletemore(@RequestBody Map<String,Object> map) {
        List<String> checkArray = (List<String>) map.get("checkArray");
        coti.deleteAll(checkArray);
        return "true";
    }


    //前端接口
    //总订单生成
    @UserLoginToken
    @RequestMapping(value = "/createOrder",method = RequestMethod.POST)
    @ResponseBody
    public Map createOrder(HttpServletRequest httpServletRequest,
                           @RequestParam (required =false) List<String> goodsID,
//                           @RequestParam (required =false) String goodsID,
                           @RequestParam (required =false) int addressID,
                           @RequestParam (required =false) String remark,
                           @RequestParam (required =false) String message,
                           @RequestParam (required =false) double total,
                           @RequestParam (required =false) int goodsCount){
        String customerid= utils.GetTokenid(httpServletRequest);
        int count=0;
        Map<String,Object> mapResult = new HashMap<>();
        TOrder tOrder=new TOrder();
        Customer customer=customertext.findOneByPropID(customerid);
        BookAddress bookAddress=baddresstext.findOneByPropID(addressID);
        tOrder.setCustomerID(customer);
        tOrder.setRealname(customer.getRealname());
        tOrder.setPhone(bookAddress.getPhone());
        tOrder.setRemark(remark);
        tOrder.setTotal(total);
        tOrder.setGoodsCount(goodsCount);
        tOrder.setAddress(bookAddress.getDetail());
        tOrder.setMessage(message);
        tOrder.setState("1");
        tOrdertext.add(tOrder);
        int torderID=tOrder.getId();
        TOrder tOrder1=tOrdertext.findOneByPropID(torderID);
        for(String goodsid:goodsID){
            Map map=new HashMap();
            map.put("customerID",customerid);
            map.put("goodsID",goodsid);
            Cart cart= textcart.findOneByProp(map);
            if(cart==null){
                count=1;
            }else {
                count=cart.getCount();
            }
            Goods goods=goodstext.findOneByPropID(goodsid);
            coti.createItemOrder(tOrder1,goods,customerid,count);
        }
//        boolean isadd=;
//        if(isadd){
//        textcart.deleteAll(goodsID);
            ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"下单成功","data",tOrder1);
            return mapResult;
//        }else {
//            ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"下单失败","data",tOrder1);
//            return mapResult;
//        }
    }
//支付页面
    @UserLoginToken
    @RequestMapping(value = "/pay",method = RequestMethod.POST)
    @ResponseBody
    public Map pay(HttpServletRequest httpServletRequest,@RequestParam (required =false) int orderid){
        Map<String,Object> mapResult = new HashMap<>();
        Map map=new HashMap();
        map.put("orderID",orderid);
        List<OrderItem> list=coti.findByProp(map);
        for (OrderItem orderItem : list) {
            orderItem.getGoodsID().setStock(orderItem.getGoodsID().getStock()-1);
            orderItem.getGoodsID().setBookDealmount(orderItem.getGoodsID().getBookDealmount()+1);
            goodstext.update(orderItem.getGoodsID());
                orderItem.setStatus("1");
                 coti.update(orderItem);
        }
        ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"支付成功","user","");
        return mapResult;
    }

    //子订单支付
    @UserLoginToken
    @RequestMapping(value = "/orderPay",method = RequestMethod.POST)
    @ResponseBody
    public Map orderPay(HttpServletRequest httpServletRequest,@RequestParam (required =false) String id){
        Map<String,Object> mapResult = new HashMap<>();
        OrderItem orderItem=coti.findOneByPropID(id);
        orderItem.getGoodsID().setStock(orderItem.getGoodsID().getStock()-1);
        orderItem.getGoodsID().setBookDealmount(orderItem.getGoodsID().getBookDealmount()+1);
        goodstext.update(orderItem.getGoodsID());
        orderItem.setStatus("1");
        coti.update(orderItem);
        ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"支付成功","user","");
        return mapResult;
    }
}
