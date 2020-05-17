package com.example.demo.controller;

import com.example.demo.Utils.ResultMapUtils;
import com.example.demo.Utils.utils;
import com.example.demo.annotation.SellerLoginToKen;
import com.example.demo.annotation.UserLoginToken;
import com.example.demo.dto.BookAddress;
import com.example.demo.dto.Category;
import com.example.demo.dto.Goods;
import com.example.demo.dto.Seller;
import com.example.demo.service.impl.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/Cms")
//@CrossOrigin
public class OverallController {
    @Autowired
    CategoryServiceImpl csi;
    @Autowired
    private AdministratorServiceImpl adminSerI;
    @Autowired
    private SellerServiceImpl sellerSI;
    @Autowired
    private CustomerServiceImpl custSI;
    @Autowired
    GoodsServiceImpl goodsService;
    @Autowired
    BookaddressServiceImpl addressService;

    @Value("${web.upload-path}")
    private String path;
    @RequestMapping(value = "/Upload",method = RequestMethod.POST)
    @ResponseBody
    public Map upload(@RequestParam("file") MultipartFile file) throws IOException {
        Map<String,Object> mapResult = new HashMap<>();
        Map map=new HashMap();
        // 获取文件名
        String fileName = file.getOriginalFilename();
        // 获取文件的后缀名
        String suffixName = fileName.substring(fileName.lastIndexOf("."));
        // 解决中文问题，liunx下中文路径，图片显示问题
        fileName = UUID.randomUUID().toString().replace("-", "") + suffixName;
        // 返回客户端 文件地址 URL
        String url = "http://120.25.232.119"+"/image/" + fileName;
        File dest = new File(path + fileName);
        // 检测是否存在相同图片
        if (!dest.getParentFile().exists()) {
            dest.getParentFile().mkdirs();
        }
        try {
            file.transferTo(dest);//将文件写入服务器磁盘并抛出异常
        } catch (IOException e) {
            e.printStackTrace();
        }
        map.put("url",url);
        ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"成功","data",map);
        // return new ResultBuilder<>().setData(MapUtil.returnMap("url",url)).build();
        return mapResult;
    }

    @SellerLoginToKen
    @RequestMapping(value = "/uploadGoods",method = RequestMethod.POST)
    @ResponseBody
    public Map save (
                     @RequestParam(required =false) String name,
                     @RequestParam(required =false) String image, //图片地址
                     @RequestParam(required =false) double originalprice, //原价
                     @RequestParam(required =false) double rate, //折扣
                     @RequestParam(required =false) double discountprice, //折扣价
                     @RequestParam(required =false) int stock, //库存
                     @RequestParam(required =false) String booklabel, //标签
                     @RequestParam(required =false) int bookPages, //页码
                     @RequestParam(required =false) String bookPress, //出版社
                     @RequestParam(required =false) String categoryDate,
                     @RequestParam(required =false) Date bookPubDates, //出版日期
                     @RequestParam(required =false) String bookVersion, //版次
                     @RequestParam(required =false) String bookAuthor, //作者
                     @RequestParam(required =false) String bookTanslor, //译者
                     @RequestParam(required =false) String bookisbn, //isbn
                     @RequestParam(required =false) String bookCatalog, //图书目录
                     @RequestParam(required =false) String bookOutline,//图书简介
                     HttpServletRequest httpServletRequest
                         ) {
        String sellerDate= utils.GetTokenid(httpServletRequest);
        Map<String,Object> mapResult = new HashMap<>();
        Goods goods=new Goods();
        goods.setName(name);
        goods.setImage(image);
        goods.setOriginalprice(originalprice);
        goods.setRate(rate);
        goods.setDiscountprice(discountprice);
        goods.setStock(stock);
        goods.setBooklabel(booklabel);
        goods.setBookPages(bookPages);
        goods.setBookPress(bookPress);
        goods.setBookPubDate(bookPubDates);
        goods.setBookVersion(bookVersion);
        goods.setBookAuthor(bookAuthor);
        goods.setBookTanslor(bookTanslor);
        goods.setBookisbn(bookisbn);
        goods.setBookCatalog(bookCatalog);
        goods.setBookOutline(bookOutline);
            Map cm=new HashMap();
            cm.put("id",categoryDate);
            Map sm=new HashMap();
            sm.put("id",sellerDate);
            Category category= csi.findOneByProp(cm);
            if(category==null&&"".equals(category)){
                ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.ERROR,"分类出错，请重新上传","data","");
                return mapResult;
            }else {
                Seller seller= sellerSI.findOneByProp(sm);
                System.out.println(seller);
                goods.setCategory(category);
                goods.setSeller(seller);
                goodsService.add(goods);
                ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"上传成功","data",goods);
                return mapResult;
            }
    }
    @InitBinder
    public void initBinder(WebDataBinder binder, WebRequest request) {
        //转换日期 注意这里的转化要和传进来的字符串的格式一直 如2015-9-9 就应该为yyyy-MM-dd
        DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));// CustomDateEditor为自定义日期编辑器
    }

    //添加收货地址
    @UserLoginToken
    @RequestMapping(value = "/addAddress",method = RequestMethod.POST)
    @ResponseBody
    public Map addAddress(HttpServletRequest httpServletRequest,
                          @RequestParam (required =false) String realname,
                          @RequestParam (required =false) String province,
                          @RequestParam (required =false) String city,
                          @RequestParam (required =false) String area,
                          @RequestParam (required =false) String detail,
                          @RequestParam (required =false) String phone ){
        String customerid= utils.GetTokenid(httpServletRequest);
        Map<String,Object> mapResult = new HashMap<>();
        Map map=new HashMap();
        map.put("userID",customerid);
        List<BookAddress> list=addressService.findByProp(map);
        if(list.size()<10){
            BookAddress c = new BookAddress();
            if(list.size()==0){
                c.setIsdefault("2");
            }else {
                c.setIsdefault("1");
            }
            c.setUserID(customerid);
            c.setRealname(realname);
            c.setProvince(province);
            c.setCity(city);
            c.setArea(area);
            c.setDetail(detail);
            c.setPhone(phone);
            if(addressService.add(c)){
                ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"获取成功","data","");
            }else {
                ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.FAIL,"添加失败","data","");
            }
        }else {
            ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.FAIL,"添加失败，收货地址条数已达极限","data","");
        }

        return mapResult;
    }
//获取收货地址
    @UserLoginToken
    @RequestMapping(value = "/editAddress",method = RequestMethod.POST)
    @ResponseBody
    public Map editAddress(HttpServletRequest httpServletRequest,
                           @RequestParam (required =false) int id,
                          @RequestParam (required =false) String realname,
                          @RequestParam (required =false) String province,
                          @RequestParam (required =false) String city,
                          @RequestParam (required =false) String area,
                          @RequestParam (required =false) String detail,
                          @RequestParam (required =false) String phone ){
        Map<String,Object> mapResult = new HashMap<>();
        Map map=new HashMap();
        BookAddress c =addressService.findOneByPropID(id);
        c.setRealname(realname);
        c.setProvince(province);
        c.setCity(city);
        c.setArea(area);
        c.setDetail(detail);
        c.setPhone(phone);
        if(addressService.update(c)){
            ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"修改成功","data",c);
        }else {
            ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.FAIL,"修改失败","data","");
        }

        return mapResult;
    }

    //获取收货地址
    @UserLoginToken
    @GetMapping("/getAddress")
    @ResponseBody
    public Map getAddress(HttpServletRequest httpServletRequest){
        String customerid= utils.GetTokenid(httpServletRequest);
        Map<String,Object> mapResult = new HashMap<>();
        Map map=new HashMap();
        map.put("userID",customerid);
        List<BookAddress> list=addressService.findByProp(map);
//        BookAddress bookAddress=addressService.findOneByPropID(addressid);
        ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"获取成功","data",list);
        return mapResult;
    }

    //修改默认地址
    @UserLoginToken
    @RequestMapping(value = "/setDefaultReceiver",method = RequestMethod.POST)
    @ResponseBody
    public Map setDefaultReceiver(HttpServletRequest httpServletRequest,@RequestParam (required =false) int id){
        String userID= utils.GetTokenid(httpServletRequest);
        Map<String,Object> mapResult = new HashMap<>();
        BookAddress c =addressService.findOneByPropID(id);
        Map map=new HashMap();
        map.put("userID",userID);
        List<BookAddress> list=addressService.findByProp(map);
        for (BookAddress bookAddress : list) {
            bookAddress.setIsdefault("1");
            addressService.update(bookAddress);
        }
        c.setIsdefault("2");
        addressService.update(c);
        ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"设置成功","data","");
        return mapResult;
    }

    @UserLoginToken
    @RequestMapping(value = "/deleteAddress",method = RequestMethod.POST)
    @ResponseBody
    public Map deleteAddress(@RequestParam (required =false) int id) {
        Map<String,Object> mapResult = new HashMap<>();
        if(addressService.delete(id)){
            ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.SUCCESS,"删除成功","data","");
        }else {
            ResultMapUtils.makeResultNoPageMap(mapResult,ResultMapUtils.FAIL,"删除失败","data","");
        }
        return mapResult;
    }
}

