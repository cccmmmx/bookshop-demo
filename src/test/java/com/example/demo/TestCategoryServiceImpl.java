package com.example.demo;


        import com.example.demo.dto.Category;
        import com.example.demo.service.impl.CategoryServiceImpl;
        import org.junit.Test;
        import org.junit.runner.RunWith;
        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.boot.test.context.SpringBootTest;
        import org.springframework.test.context.junit4.SpringRunner;

        import java.util.ArrayList;
        import java.util.HashMap;
        import java.util.List;
        import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TestCategoryServiceImpl {
    @Autowired
    CategoryServiceImpl ci;
    @Test
    public void testFindByProp() {
        Map c = new HashMap();
        c.put("id", "");
        System.out.println(ci.findByProp(c).size());
    }
    @Test
    public void testAdd() {
        Category c = new Category();
        c.setText("历史");
        c.setParent("2");
        System.out.println(ci.add(c));
    }

    @Test
    public void deteleAll(){
        List<String> list = new ArrayList<>();
        list.add("20200324211409070");
        list.add("20200324211454066");
        System.out.println(ci.deleteAll(list));
    }

}
