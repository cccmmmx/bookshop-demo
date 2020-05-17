package com.example.demo.dto;

import java.util.Date;

public class Cart {
    String id;    //编号id
    int  count; //数量
    double  price ;  //价格
    String  goodsID ; //商品id
    String  customerID;  //客户id
    String  name;   //商品名称
    String  image ;  //商品封面
    Date regdate;//添加时间;
    int stock;  //库存

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getGoodsID() {
        return goodsID;
    }

    public void setGoodsID(String goodsID) {
        this.goodsID = goodsID;
    }

    public String getCustomerID() {
        return customerID;
    }

    public void setCustomerID(String customerID) {
        this.customerID = customerID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Date getRegdate() {
        return regdate;
    }

    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "id='" + id + '\'' +
                ", count=" + count +
                ", price=" + price +
                ", goodsID='" + goodsID + '\'' +
                ", customerID='" + customerID + '\'' +
                ", name='" + name + '\'' +
                ", image='" + image + '\'' +
                ", regdate=" + regdate +
                ", stock=" + stock +
                '}';
    }
}
