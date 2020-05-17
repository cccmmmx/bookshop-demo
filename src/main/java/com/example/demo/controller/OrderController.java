package com.example.demo.controller;


import com.example.demo.dto.OrderItem;
import com.example.demo.dto.TOrder;
import com.example.demo.service.IGoodsService;
import com.example.demo.service.IOrderItemService;
import com.example.demo.service.ITorderService;
import com.example.demo.service.impl.CustomerServiceImpl;
import com.example.demo.service.impl.TOrderServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/order")
//@CrossOrigin
public class OrderController {
    @Autowired
    CustomerServiceImpl cus;
    @Autowired
    protected IOrderItemService iOrderItemService;
    @Autowired
    protected ITorderService iTorderService;
    @Autowired
    protected IGoodsService goodsService;
    @Autowired
    TOrderServiceImpl orders;


    PageInfo pageInfo;
    @RequestMapping("/index")
    public String index(Model model,
                       @RequestParam(required =false) String page,
                       @RequestParam (required =false) String realname,
                       @RequestParam (required =false) String address) {
        Map q=new HashMap();
        if(realname!=null&&realname!=""){
            q.put("realname",realname);
        }
        if(address!=null&&address!=""){
            q.put("address",address);
        }
        int intPage=page !=null ? Integer.parseInt(page):1;
        PageHelper.startPage(intPage,8);
        List<TOrder> list=orders.findByProp(q);
        pageInfo=new PageInfo(list);
        model.addAttribute("pageinfo",pageInfo);
          model.addAttribute("order",list);
            return "order/index";
    }
    @RequestMapping("/deletemore")
    @ResponseBody
    public String deletemore(@RequestBody Map<String,Object> map) {
        List<String> checkArray = (List<String>) map.get("checkArray");
        orders.deleteAll(checkArray);
        return "true";
    }

    @RequestMapping("/save")//保存功能
    public String save (@ModelAttribute TOrder tOrder, BindingResult bindingResult, @RequestParam (required =false) String customerData) {
        Map map=new HashMap();
        map.put("id",tOrder.getId());
        TOrder tOrder1=orders.findOneByProp(map);
        tOrder1.setRemark(tOrder.getRemark());
        tOrder1.setMemo(tOrder.getMemo());
            orders.update(tOrder1);
        return "redirect:/order/index";
    }
    @RequestMapping("/update/{id}")
    public String update(Model model,@PathVariable String id){
        Map q=new HashMap();
        q.put("id",id);
        TOrder order=orders.findOneByProp(q);
        model.addAttribute("order",order);
        return "/order/edit";
    }

    @RequestMapping("/detail/{id}")
    public String detail(Model model,@PathVariable String id) {
        Map map=new HashMap();
        map.put("orderID",id);
        List<OrderItem> list= iOrderItemService.findByProp(map);
        model.addAttribute("toerders",list);
        return "/order/detail";
    }

//    @RequestMapping("/addToCart")
//    @ResponseBody
//    public String addOrderDetail(HttpServletRequest request, @RequestParam String id) {
//        //1. goods.id获取相应的商品数据
////        以后改成异步方式从后台读取传来的goodsID
//        Goods goods = goodsService.get(id);
//        //2. 判断当前session是否有购物车，如果没有则创建
//        HttpSession session = request.getSession();
//        if (session.getAttribute("tOrder") == null) {
//            //创建新的购物车，存储到session中
//            session.setAttribute("tOrder", new TOrder(new HashSet<OrderItem>()));
//        }
//        //3. 把商品信息转化为orderDetail,并且添加到购物车中（判断购物项是否重复）
//        TOrder tOrder = (TOrder) session.getAttribute("tOrder");
//        //将商品转存订单详细
//        tOrder = iOrderItemService.addOrderItemToTorder(tOrder, goods);
//        //4. 计算购物的总价格
//        tOrder.setTotal(iTorderService.cluTotal(tOrder));
//        //5. 把新的购物车存储到session中
//        session.setAttribute("tOrder", tOrder);
////        return "home/showCart";
//     return "success";
//    }
//    @UserLoginToken
//    @GetMapping("/getMember")
//    @ResponseBody
//    public Map getMember(HttpServletRequest httpServletRequest,@RequestParam (required =false) String goodsID){
//        String customerid= utils.GetTokenid(httpServletRequest);
//        Map<String,Object> mapResult = new HashMap<>();
//        Customer customer=cus.findOneByPropID(customerid);
//        ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"获取成功","user",customer);
//        return mapResult;
//    }

}




