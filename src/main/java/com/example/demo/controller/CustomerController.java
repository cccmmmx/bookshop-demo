package com.example.demo.controller;

import com.example.demo.Utils.ResultMapUtils;
import com.example.demo.Utils.utils;
import com.example.demo.annotation.UserLoginToken;
import com.example.demo.dto.Customer;
import com.example.demo.dto.OrderItem;
import com.example.demo.service.impl.CustomerServiceImpl;
import com.example.demo.service.impl.GoodsServiceImpl;
import com.example.demo.service.impl.OrderItemServiceImpl;
import com.example.demo.service.impl.TokenService;
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
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/customer")
//@CrossOrigin
public class CustomerController {
    @Autowired
    CustomerServiceImpl csi;
    @Autowired
    GoodsServiceImpl gsi;
    @Autowired
    TokenService tokenService;
    @Autowired
    OrderItemServiceImpl oItemtext;

    @Value("${web.upload-path}")
    private String path;
    PageInfo pageInfo;
    @RequestMapping("/index")
    public String manage(Model model,@RequestParam (required =false) String page,
                         @RequestParam(required =false) String id,
                         @RequestParam (required =false) String realname,
                         @RequestParam (required =false) String username,
                         @RequestParam(required = false) String address,
                         @RequestParam(required = false) String gender,
                         @RequestParam(required = false) String email,
                         @RequestParam(required = false) String idcard,
                         @RequestParam(required = false) String phone,
                         @RequestParam(required = false) String dateBegin,
                         @RequestParam(required = false) String dateEnd


    ){
        Map q=new HashMap();
        q.put("id",id);
        q.put("realname",realname);
        q.put("username",username);
        q.put("address",address);
        q.put("gender",gender);
        q.put("username",email);
        q.put("idcard",idcard);
        q.put("phone",phone);
        q.put("dateBegin",dateBegin);
        q.put("dateEnd",dateEnd);

        int intPage=page !=null ? Integer.parseInt(page):1;
        PageHelper.startPage(intPage,10);
        List<Customer> list=csi.findByProp(q);
        pageInfo=new PageInfo(list);
        model.addAttribute("pageinfo",pageInfo);
        model.addAttribute("customer",list);
        return "customer/index";
    }

    @RequestMapping("/add")
    public String add (Model model) {
        model.addAttribute("customer",new Customer());
        return "customer/edit";
    }


//    @RequestMapping(value = "/save", method = RequestMethod.POST)
//    public String save (@ModelAttribute Customer customer,BindingResult bindingResult,
//                        @RequestParam("upfile") MultipartFile file,
//                        @RequestParam(required = false) String password) throws UnsupportedEncodingException, NoSuchAlgorithmException {
//        System.out.println(customer);
//        if (!file.isEmpty()) {
//            // 获取文件名
//            String fileName = file.getOriginalFilename();//11.jpg
//            // 新文件名
////            String newFileName = UUID.randomUUID() + fileName;
//            // 获取文件的后缀名，可用做其它判断
//            String suffixName = fileName.substring(fileName.lastIndexOf("."));
//            // 解决中文问题，liunx下中文路径，图片显示问题
////            fileName = UUID.randomUUID().toString().replace("-", "") + suffixName;
//            // 返回客户端 文件地址 URL
//            String url = "http://120.25.232.119/image/" + fileName;
//
//            // 文件上传路径，如果没有，则创建
//            File f = new File("http://120.25.232.119/image/");//构建存储路径d:/image
//            if (!f.exists())
//                f.mkdirs();
//            //利用配置文件中的path
//            File dest = new File("http://120.25.232.119/image/" + fileName);//d:/image/11.jpg
////            File dest = new File(fileName);
//            //判断是否有同名文件，可能这里标记
//            try {
//                file.transferTo(dest);//
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//            //手工处理其图片信息
//            customer.setImage(url);//11.jpg
//        }
//        if (customer.getId().equals("")) {
//            customer.setPassword(password);
//            csi.add(customer);
//        }else
//        {
//            csi.update(customer);
//        }
//        return "redirect:/customer/index";
//    }


    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save (@ModelAttribute Customer customer,BindingResult bindingResult,
                        @RequestParam("upfile") MultipartFile file,
                        @RequestParam(required = false) String password) throws UnsupportedEncodingException, NoSuchAlgorithmException {
System.out.println(customer);
        if (!file.isEmpty()) {
            // 获取文件名
            String fileName = file.getOriginalFilename();//11.jpg
            // 新文件名
//            String newFileName = UUID.randomUUID() + fileName;
            // 获取文件的后缀名
//            String suffixName = fileName.substring(fileName.lastIndexOf("."));
//            List<String> extList = Arrays.asList(".jpg", ".png", ".jpeg", ".gif");
//            if (!extList.contains(suffixName)) {
//                return "图片格式非法";
//            }
            // 解决中文问题，liunx下中文路径，图片显示问题
//            fileName = UUID.randomUUID().toString().replace("-", "") + suffixName;
            // 文件上传路径，如果没有，则创建
//            File f = new File(path);//构建存储路径d:/image
//            if (!f.exists())
//                f.mkdirs();
            // 返回客户端 文件地址 URL
//            http://120.25.232.119/image/s2393243.jpg
            String url = "http://120.25.232.119"+"/image/" + fileName;
            //利用配置文件中的path
            File dest = new File(path + fileName);//d:/image/11.jpg
            // 检测是否存在目录
            if (!dest.getParentFile().exists()) {
                dest.getParentFile().mkdirs();
            }
//            File dest = new File(fileName);
            //判断是否有同名文件，可能这里标记
            try {
                file.transferTo(dest);//
            } catch (IOException e) {
                e.printStackTrace();
            }
            //手工处理其图片信息
            customer.setImage(url);//11.jpg
        }
        if (customer.getId().equals("")) {
            customer.setPassword(password);
            csi.add(customer);
        }else
        {
            csi.update(customer);
        }
        return "redirect:/customer/index";
    }



    @RequestMapping("/isExist")
    @ResponseBody
    public String isExist(@RequestParam String username) {
        String flag = "no";
        Map m = new HashMap();
        m.put("username", username);
        if (csi.isExist(m)) {
            flag = "yes";
        }
        return flag;
    }
    @RequestMapping(value = "/logout",method = {RequestMethod.POST,RequestMethod.GET})
    public String logout(HttpServletRequest request) {
        request.getSession().removeAttribute("customer");
        return "home/home";
    }



    @RequestMapping(value = "/doLogin" ,method = {RequestMethod.POST,RequestMethod.GET})
    public String doLogin(
                          @RequestParam(required = false) String username,
                          @RequestParam(required = false) String password,
                          HttpSession  session) {

        Map p = new HashMap();
        p.put("username", username);
        p.put("password", password);
        Customer s = csi.login(p);

      p.clear();
        if (s != null) {
//            model.addAttribute("customer", s);
        Map maps = new HashMap();
        maps.put("realname",s.getRealname());
//            maps.put("sellerID", s.getId());
//            model.addAttribute("goodes", gsi.findByProp(maps));
            Map queryValue = new HashMap();
            session.setAttribute("goodses", gsi.findByProp(queryValue));
            session.setAttribute("customer", s);
            return "/home/home";
        } else {
            return "/customer/login";
        }
    }

//    @UserLoginToken
//    @ResponseBody
//    @RequestMapping(value = "/getMessage",method = {RequestMethod.POST,RequestMethod.GET})
//    public String getMessage(){
//        return "你已通过验证";
//    }

    @RequestMapping(value = "/loginUI")
    public String login() {
        return "/customer/login";
    }


    @RequestMapping("/deletemore")
    @ResponseBody
    public String deletemore(@RequestBody Map<String,Object> map) {
        List<String> checkArray = (List<String>) map.get("checkArray");
        csi.deleteAll(checkArray);
        return "true";
    }

    @RequestMapping(value = "/login")
    @ResponseBody
    public String login(@RequestParam(required = false) String password,
                        @RequestParam(required = false) String username,
                        HttpServletRequest request) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        String flag = "no";
        Map map = new HashMap();
        map.put("username", username);
        map.put("password", password);
        Customer customer = csi.findOneByProp(map);
        if (customer != null) {
//            将对象写进session

            HttpSession session = request.getSession();
            session.setAttribute("customer", customer);
            flag = "yes";
        }
        return flag;
    }


    @RequestMapping("/update/{id}")
    public String update(Model model,@PathVariable String id){
        Map q=new HashMap();
        q.put("id",id);
        Customer customer=csi.findOneByProp(q);
        model.addAttribute("customer",customer);
        return "/customer/edit";
    }

//前端接口
    //会员注册
@RequestMapping(value = "/customerRegister",method = RequestMethod.POST)
@ResponseBody
public Map customerRegister(@RequestParam (required =false) String realname,
                          @RequestParam (required =false) String username,
                          @RequestParam (required =false) String password,
                          @RequestParam (required =false) String phone,
                          @RequestParam (required =false) String email){
                        Map<String,Object> mapResult = new HashMap<>();
                           Customer customer=new Customer();
                            Map m = new HashMap();
                            m.put("username", username);
                            if (!csi.isExist(m)) {
                                try {
                                    customer.setRealname(realname);
                                    customer.setUsername(username);
                                    customer.setPassword(password);
                                    customer.setPhone(phone);
                                    customer.setEmail(email);
                                    customer.setImage("http://120.25.232.119/image/userhead.png");
                                    csi.add(customer);
                                }catch (Exception e){
                                      System.out.println(e);
                                }
             ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"注册成功，请尽快到个人中心完善信息","data","");
                                return mapResult;
                            }else {
              ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.FAIL,"该用户已被注册,请重新输入账号","data","");
                                return mapResult;
                            }
                    }




    //会员登录
    @RequestMapping(value="/logins",method = {RequestMethod.GET})
    @ResponseBody
    public Map login(@RequestParam(required = false) String username,@RequestParam(required = false) String password){
        Map<String,Object> mapResult = new HashMap<>();
        Map map2=new HashMap();
        Map map=new HashMap();
        map.put("username",username);
        Customer userForBase=csi.findOneByProp(map);
        if(userForBase==null){
//            map2.put("message","登录失败,用户不存在");
            ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.FAIL,"登录失败,用户不存在","data","");
            return mapResult;
        }else {
            if (!userForBase.getPassword().equals(password)){
//                map2.put("message","登录失败,密码错误");
                ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.FAIL,"登录失败,密码错误","data","");
                return mapResult;
            }else {
                String token = tokenService.getToken(userForBase);
                map2.put("token", token);
                map2.put("user", userForBase);
                ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"登录成功","data",map2);
                return mapResult;
            }
        }
    }

    //用户信息修改
    @UserLoginToken
    @RequestMapping(value = "/customerUpdate",method = RequestMethod.POST)
    @ResponseBody
    public Map customerUpdate(@RequestParam (required =false) String image,
                                @RequestParam (required =false) String realname,
                                @RequestParam (required =false) String phone,
                                @RequestParam (required =false) String email,
                              @RequestParam (required =false) String gender,
                              @RequestParam (required =false) String address,
                              HttpServletRequest httpServletRequest){
                        String customerid= utils.GetTokenid(httpServletRequest);
                        Map<String,Object> mapResult = new HashMap<>();
                        Customer customer=csi.findOneByPropID(customerid);
                        try {
                            customer.setRealname(realname);
                            customer.setPhone(phone);
                            customer.setEmail(email);
                            customer.setImage(image);
                            customer.setGender(gender);
                            customer.setAddress(address);
                            csi.update(customer);
                        }catch (Exception e){
                            System.out.println(e);
                        }
                        ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"修改成功","data","");
                        return mapResult;
                        }
//获取用户信息修改
@UserLoginToken
@GetMapping("/getMember")
@ResponseBody
public Map getMember(HttpServletRequest httpServletRequest){
    String customerid= utils.GetTokenid(httpServletRequest);
    Map<String,Object> mapResult = new HashMap<>();
    Customer customer=csi.findOneByPropID(customerid);
    ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"获取成功","user",customer);
    return mapResult;
}

//获取个人订单
@UserLoginToken
@GetMapping("/getUserOrder")
@ResponseBody
public Map getUserOrder(HttpServletRequest httpServletRequest,
                        @RequestParam (required =false) String status){
    String customerid= utils.GetTokenid(httpServletRequest);
    Map<String,Object> mapResult = new HashMap<>();
    Map map=new HashMap();
    map.put("customerID",customerid);
    if(!status.equals("3")){
        map.put("status",status);
    }
   List<OrderItem> list=oItemtext.findByProp(map);
    ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"获取成功","data",list);
    return mapResult;
}

//删除个人未支付订单
@UserLoginToken
@RequestMapping(value = "/deleteUserOrder",method = RequestMethod.POST)
@ResponseBody
public Map deleteUserOrder(HttpServletRequest httpServletRequest,@RequestParam (required =false) String id){
    Map<String,Object> mapResult = new HashMap<>();
    if(oItemtext.delete(id)){
        ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"删除成功","data","");
        return mapResult;
    }else {
        ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"删除失败","data","");
        return mapResult;
    }
}


}
