package com.example.demo;

import com.example.demo.dto.Goods;
import com.example.demo.service.impl.CategoryServiceImpl;
import com.example.demo.service.impl.GoodsServiceImpl;
import com.example.demo.service.impl.SellerServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.HashMap;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TestGoodsServiceImpl {
    @Autowired
    private CategoryServiceImpl csi;
    @Autowired
    private SellerServiceImpl ssi;
    @Autowired
   private GoodsServiceImpl gis;
    @Test
    public void testFindByProp() {
        Map c = new HashMap();
//        c.put("category", "20200404153938056");
//        Map map = new HashMap();
//        map.put("sellerID","20200322203524097");
////        map.put("grade","2");
//        List<Goods> list=gis.findByProp(map);
        Goods goods=gis.findOneByPropID("20200322204025095");
//        System.out.println(goods);
//        goods.setGrade("3");

        System.out.println(goods);
    }

    @Test
    public void testFindOneByProp() {
        Map c = new HashMap();
        c.put("id", "20171018095509025");
        Goods ca = gis.findOneByProp(c);
        if (ca != null) {
            System.out.println(ca.toString());
        } else {
            System.out.println("not found");
        }
    }

    @Test
    public void testAdd() {
        Map cm=new HashMap();
        cm.put("id","20200322203449019");
        Map sm=new HashMap();
        sm.put("id","20200322203524097");
        Goods goods=new Goods();
        goods.setSeller(ssi.findOneByProp(sm));
        goods.setCategory(csi.findOneByProp(cm));
        goods.setName("人类的旅程");
        goods.setDiscountprice(56.0);
        goods.setRate(8.0);
        goods.setOriginalprice(45.0);
        goods.setBooklabel("科学");
        goods.setBookAuthor("〔美〕斯宾塞·韦尔斯");
        goods.setBookOutline("“我们从何处来？”这个问题，曾让牙牙学语的孩子好奇，也让人类的祖先创造了无数神话试图解释：女娲造人，上帝创造亚当、夏娃……我们的身份，我们和世间万物的关系，都从这个问题出发。对这个问题的好奇，促使人们掘地三尺，寻找考古证据；或是仔细剖析语音，寻找语言传递的蛛丝马迹。而DNA密码中，似乎藏着这个问题的答案。在这本书中，遗传学家韦尔斯将带领我们追根溯源，从西伯利亚的荒野，到澳大利亚的海滩，寻找我们现今地球上每个人的共同祖先。通过遗传标记物，我们将会与被他视为“亚当”“夏娃”的共同先祖在数万年前的非洲相遇，并追随人类一路离开非洲的漫漫征途。");
        goods.setBookCatalog("前言\n" +
                "第一章 形形色色的猿类\n" +
                "同一物种……\n" +
                "……还是多个物种？\n" +
                "象牙塔之外\n" +
                "第二章 合众为一\n" +
                "驱动力\n" +
                "意大利人的进展\n" +
                "“奥卡姆剃刀”\n" +
                "字母乱码\n" +
                "拥挤的伊甸园\n" +
                "酒后之勇\n" +
                "一切只关乎时间");
        System.out.println(gis.add(goods));
    }

    @Test
    public void testUpdate() {
        Map q = new HashMap();
        q.put("id", "20180610212140032");
        Goods c = gis.findOneByProp(q);
        if (c==null){
            System.out.println("没有这个id");
        }else {
            System.out.println(c);
            c.setName("肥快乐");
            gis.update(c);
            System.out.println(c);
        }
    }


}
