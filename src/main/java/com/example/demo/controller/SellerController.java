package com.example.demo.controller;

import com.example.demo.Utils.ResultMapUtils;
import com.example.demo.Utils.utils;
import com.example.demo.annotation.SellerLoginToKen;
import com.example.demo.dto.Cart;
import com.example.demo.dto.Goods;
import com.example.demo.dto.OrderItem;
import com.example.demo.dto.Seller;
import com.example.demo.service.impl.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/seller")
//@CrossOrigin
public class SellerController  {
    @Autowired
    SellerServiceImpl csi;
    @Autowired
    CategoryServiceImpl csd;
    @Autowired
    GoodsServiceImpl gsi;
    @Autowired
    TokenService tokenService;
    @Autowired
    OrderItemServiceImpl oItemtext;
    @Autowired
    CartServiceImpl textcart;
    String id;

    @Value("${web.upload-path}")
    private String path;
    PageInfo pageInfo;
    @RequestMapping("/index")
    public String index(Model model,
                        @RequestParam (required =false) String page,
                        @RequestParam (required =false) String realname,
                        @RequestParam (required =false) String phone
                        ){
        Map q=new HashMap();
        if (realname!=null&& realname!="") {
            q.put("realname",realname);
        }
        if (phone!=null&& phone!="") {
            q.put("phone",phone);
        }
        int intPage=page !=null ? Integer.parseInt(page):1;
        PageHelper.startPage(intPage,10);
        List<Seller> list=csi.findByProp(q);
        pageInfo=new PageInfo(list);
        model.addAttribute("pageinfo",pageInfo);
        model.addAttribute("selleres",list);
        return "seller/index";
    }
    @RequestMapping("/login")
    public String login(Model model){
//     model.addAttribute("seller",new Seller());
        return "/seller/login";
    }
    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable String id) {
        csi.delete(id);
        return "redirect:/seller/index";
    }
    @RequestMapping("/deletemore")
    @ResponseBody
    public String deletemore(@RequestBody Map<String,Object> map) {
        List<String> checkArray = (List<String>) map.get("checkArray");
        csi.deleteAll(checkArray);
        return "true";
    }
    @RequestMapping("/doLogin")
    public String doLogin(Model model,
                          @RequestParam(required = false) String username,
                          @RequestParam(required = false) String password)
    {
//    2 然后调用服务层的登录服务
        Map q = new HashMap();
        q.put("username", username);
        q.put("password", password);
        Seller s = csi.login(q);
        //    3 根据登录情况进行跳转
        if (s != null) {
            model.addAttribute("seller", s);
            Map maps = new HashMap();
            maps.put("sellerID", s.getId());
            model.addAttribute("goodes", gsi.findByProp(maps));
            return "/goods/loginmanage";
        } else {
            return "/seller/login";
        }
    }
    @RequestMapping("/add")
    public String add (Model model) {
        model.addAttribute("seller",new Seller());
        return "seller/edit";
    }
    @RequestMapping(value = "/save",method = RequestMethod.POST)
    public String save (@ModelAttribute Seller seller,BindingResult bindingResult,
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
            seller.setLogo(url);//11.jpg
        }

        if (seller.getId().equals("")){
            seller.setPassword(password);
            csi.add(seller);
        }else {
            csi.update(seller);
        }
        return "redirect:/seller/index";
    }
    @RequestMapping("/isExist")
    @ResponseBody
    public String isExist(@RequestParam(required = false) String valUsername) {
        String flag = "no";
        Map m = new HashMap();
        m.put("username", valUsername);
        if (csi.isExist(m)) {
            flag = "yes";
        }
        return flag;
    }
    @RequestMapping("/update/{id}")
    public String update(Model model,@PathVariable String id){
        Map q=new HashMap();
        q.put("id",id);
        Seller seller=csi.findOneByProp(q);
        model.addAttribute("seller",seller);
        return "/seller/edit";
    }

//   @SellerLoginToKen
//    @ResponseBody
//    @RequestMapping(value = "/getMessage",method = {RequestMethod.POST,RequestMethod.GET})
//    public String getMessage(){
//        return "你已通过验证";
//    }



    //前端接口
//会员注册
@RequestMapping(value = "/sellerRegister",method = RequestMethod.POST)
@ResponseBody
public Map sellerRegister(@RequestParam (required =false) String realname,
                          @RequestParam (required =false) String username,
                          @RequestParam (required =false) String password,
                          @RequestParam (required =false) String phone,
                          @RequestParam (required =false) String email,
                          @RequestParam (required =false) String address){
    Map<String,Object> mapResult = new HashMap<>();
    Seller seller=new Seller();
    Map m = new HashMap();
    m.put("username", username);
    if (!csi.isExist(m)) {
        try {
            seller.setRealname(realname);
            seller.setUsername(username);
            seller.setPassword(password);
            seller.setPhone(phone);
            seller.setEmail(email);
            seller.setAddress(address);
            seller.setLogo("http://120.25.232.119/image/userhead.png");
            csi.add(seller);
        }catch (Exception e){
            System.out.println(e);
        }
        ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"注册成功，请尽快到个人中心完善信息","data","");
        return mapResult;
    }else {
        ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.FAIL,"该商家账号已被注册,请重新输入","data","");
        return mapResult;
    }
}
    //前端登录接口
    @RequestMapping(value="/sellerlogins",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public Map sellerlogins(@RequestParam(required = false) String username,@RequestParam(required = false) String password){
        Map<String,Object> mapResult = new HashMap<>();
        Map map2=new HashMap();
        Map map=new HashMap();
        map.put("username",username);
        Seller userForBase=csi.findOneByProp(map);
        if(userForBase==null){
//            map2.put("message","登录失败,用户不存在");
            ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.FAIL,"登录失败,商家不存在","data","");
            return mapResult;
        }else {
            if (!userForBase.getPassword().equals(password)){
//                map2.put("message","登录失败,密码错误");
                ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.FAIL,"登录失败,密码错误","data","");
                return mapResult;
            }else {
                String token = tokenService.getSellerToken(userForBase);
                map2.put("token", token);
                map2.put("user", userForBase);
                ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"登录成功","data",map2);
                return mapResult;
            }
        }
    }
//商家信息修改
    @SellerLoginToKen
    @RequestMapping(value = "/sellerUpdate",method = RequestMethod.POST)
    @ResponseBody
    public Map sellerUpdate(@RequestParam (required =false) String logo,
                              @RequestParam (required =false) String realname,
                              @RequestParam (required =false) String phone,
                              @RequestParam (required =false) String email,
                              @RequestParam (required =false) String address,
                              @RequestParam (required =false) String postcode,
                              HttpServletRequest httpServletRequest){
        String sellerid= utils.GetTokenid(httpServletRequest);
        Map<String,Object> mapResult = new HashMap<>();
        Seller seller=csi.findOneByPropID(sellerid);
            seller.setRealname(realname);
            seller.setPhone(phone);
            seller.setEmail(email);
            seller.setLogo(logo);
            seller.setAddress(address);
        seller.setPostcode(postcode);
            if(csi.update(seller)){
                ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"修改成功","data","");
                return mapResult;
            }else {
                ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.FAIL,"修改失败","data","");
                return mapResult;
            }
    }
    //获取用户信息修改
    @SellerLoginToKen
    @GetMapping("/getSellerMember")
    @ResponseBody
    public Map getSellerMember(HttpServletRequest httpServletRequest){
        String sellerid= utils.GetTokenid(httpServletRequest);
        Map<String,Object> mapResult = new HashMap<>();
        Seller seller=csi.findOneByPropID(sellerid);
        ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"获取成功","user",seller);
        return mapResult;
    }


    //获取商家的商品
    @SellerLoginToKen
    @GetMapping("/getsSellerBook")
    @ResponseBody
    public Map getsSellerBook(HttpServletRequest httpServletRequest,
                              @RequestParam (required =false) String pageNumber,
                              @RequestParam (required =false) Integer pageSize,
                              @RequestParam (required =false) Integer grade){
        String sellerid= utils.GetTokenid(httpServletRequest);
        Map<String,Object> mapResult = new HashMap<>();
        Map map=new HashMap();
        map.put("sellerID",sellerid);
        map.put("grade",grade);
        int intPage=pageNumber !=null ? Integer.parseInt(pageNumber):1;
        PageHelper.startPage(intPage,pageSize);
        List<Goods> list=gsi.findByProp(map);
        pageInfo=new PageInfo(list);
        ResultMapUtils.makeResultMap(mapResult,ResultMapUtils.SUCCESS,"获取成功","data",list,pageInfo);
        return mapResult;
    }

    //商家商品上架
    @SellerLoginToKen
    @RequestMapping(value = "/bookChangeState",method = RequestMethod.POST)
    @ResponseBody
    public Map bookChangeState(HttpServletRequest httpServletRequest,
                              @RequestParam (required =false) String grade,
                              @RequestParam (required =false) String goodsID
                              ){
        Map<String,Object> mapResult = new HashMap<>();
        Goods goods=gsi.findOneByPropID(goodsID);
        if("2".equals(grade)){
            goods.setGrade("3");
        }else {
            goods.setGrade("2");
        }
        if(gsi.update(goods)){
            ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"修改成功","user","");
            return mapResult;
        }else {
            ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.FAIL,"操作失败","user","");
            return mapResult;
        }
    }


    //商家商品删除
    @SellerLoginToKen
    @RequestMapping(value = "/sellerBookDelete",method = RequestMethod.POST)
    @ResponseBody
    public Map sellerBookDelete(@RequestParam (required =false) String goodsID) {
        Map<String,Object> mapResult = new HashMap<>();
            gsi.delete(goodsID);
            ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"删除成功","user","");
            return mapResult;
    }

    //商家商品信息更新
    @SellerLoginToKen
    @RequestMapping(value = "/sellerBookUpdate",method = RequestMethod.POST)
    @ResponseBody
    public Map sellerBookUpdate(@RequestParam (required =false) String goodsID,
                                 @RequestParam (required =false) String name,
                                @RequestParam (required =false) double discountprice,
                                @RequestParam (required =false) int stock,
                                @RequestParam (required =false) String booklabel,
                                @RequestParam (required =false) String bookCatalog,
                                @RequestParam (required =false) String bookOutline
                                ) {
        Map<String,Object> mapResult = new HashMap<>();
        Map map=new HashMap();
        map.put("goodsID",goodsID);
        List<Cart> list=textcart.findByProp(map);
        for (Cart cart:list){
            cart.setStock(stock);
            textcart.update(cart);
        }
        Goods goods=gsi.findOneByPropID(goodsID);
        goods.setName(name);
        goods.setDiscountprice(discountprice);
        goods.setStock(stock);
        goods.setBooklabel(booklabel);
        goods.setBookCatalog(bookCatalog);
        goods.setBookOutline(bookOutline);
        if(gsi.update(goods)){
            ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"更新成功","user","");
            return mapResult;
        }else {
            ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.FAIL,"更新失败","user","");
            return mapResult;
        }
    }


    //商家获取个人订单
    @SellerLoginToKen
    @GetMapping("/getSellerOrder")
    @ResponseBody
    public Map getSellerOrder(HttpServletRequest httpServletRequest,
                            @RequestParam (required =false) String status){
        String sellerid= utils.GetTokenid(httpServletRequest);
        Map<String,Object> mapResult = new HashMap<>();
        Map map=new HashMap();
        map.put("sellerID",sellerid);
        if(!status.equals("3")){
            map.put("status",status);
        }
        List<OrderItem> list=oItemtext.findByProp(map);
        List<OrderItem> list1=new ArrayList<OrderItem>();
      for(OrderItem orderItem:list){
          if(!orderItem.getStatus().equals("0")){
              list1.add(orderItem);
          }
      }
        ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"获取成功","data",list1);
        return mapResult;
    }

    //商家订单发货处理
    @SellerLoginToKen
    @RequestMapping(value = "/sellerDeliverOrder",method = RequestMethod.POST)
    @ResponseBody
    public Map sellerDeliverOrder(HttpServletRequest httpServletRequest,
                              @RequestParam (required =false) String id){
        String sellerid= utils.GetTokenid(httpServletRequest);
        Map<String,Object> mapResult = new HashMap<>();
      OrderItem orderItem= oItemtext.findOneByPropID(id);
        orderItem.setStatus("2");
        if(oItemtext.update(orderItem)){
            ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"发货成功","data","");
            return mapResult;
        }else {
            ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.FAIL,"返回失败","data","");
            return mapResult;
        }
    }
}
