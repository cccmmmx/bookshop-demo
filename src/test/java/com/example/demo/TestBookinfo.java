package com.example.demo;

import com.example.demo.dto.Bookinfo;
import com.example.demo.service.impl.BookinfoServiceImpl;
import com.example.demo.service.impl.CategoryServiceImpl;
import com.example.demo.service.impl.SellerServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TestBookinfo  {
    @Autowired
    private BookinfoServiceImpl ibs;
    @Autowired
    private CategoryServiceImpl csi;
    @Autowired
    private SellerServiceImpl ssi;
    @Test
    public void testFindByProp() {
        System.out.println(ibs.findOneByPropID("20200322122852010"));
    }
    @Test
    public void testFindOneByProp() {
        Map c = new HashMap();
        c.put("label", "");
        List<Bookinfo> ca =  ibs.findByProp(c);
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
        Bookinfo bookinfo=new Bookinfo();
     bookinfo.setCategory(csi.findOneByProp(cm));
     bookinfo.setSeller(ssi.findOneByProp(sm));
        System.out.println(csi.findOneByProp(cm));
        System.out.println(ssi.findOneByProp(sm));
        bookinfo.setBookName("好学校");
        bookinfo.setBookAuthor("理查德耶茨");
        bookinfo.setBookOutline("美国寄宿男校的一段伤心往事 耶茨最温柔的一部小说书名中的好学校是一所虚构的康涅狄格州预备中学。故事发生在上个世纪四十年代初期，“好学校”中的男孩毕业后就要立刻参军作战，老师们对于自身职业和所在学校的情感五味杂陈。尽管这是一所学校，可正如书中一名老师所说，这里“蕴藏了巨大的潜在能量”，学生如此，老师亦如此。从某种程度上，本书延续了《革命之路》中探讨的主题，书名中的“好学校”无疑是对整本书最大的讽刺，读罢不禁令人唏嘘。本书是理查德·耶茨为数不多的笔触温柔、充满怜悯的一部作品，小说中主人公的成长背景与经历与耶茨本人也有重合之处，其中哀伤而克制的情绪很吸引人。");
        bookinfo.setBookPrice(50.00);

        System.out.println(ibs.add(bookinfo));
    }
}
