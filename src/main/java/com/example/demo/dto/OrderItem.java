package com.example.demo.dto;

public class OrderItem {
    String id;//订单项ID
    String image;//商品的图片
    String name;//被购买商品的名称
    double price;//购买时的商品价格
    int count;//购买数量
    Goods goodsID;//关联到商品类
    TOrder orderID;//订单项1:1订单
    String status;//订单状态 '0'表示未付款 '1'表示未发货 '2'表示已发货
    String sellerID;//表示该订单的书籍商品所属商家
String customerID;//订单所属买家
    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }


    public Goods getGoodsID() {
        return goodsID;
    }

    public void setGoodsID(Goods goodsID) {
        this.goodsID = goodsID;
    }

    public TOrder getOrderID() {
        return orderID;
    }

    public void setOrderID(TOrder orderID) {
        this.orderID = orderID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getSellerID() {
        return sellerID;
    }

    public void setSellerID(String sellerID) {
        this.sellerID = sellerID;
    }

    public String getCustomerID() {
        return customerID;
    }

    public void setCustomerID(String customerID) {
        this.customerID = customerID;
    }

    @Override
    public String toString() {
        return "OrderItem{" +
                "id='" + id + '\'' +
                ", image='" + image + '\'' +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", count=" + count +
                ", goodsID=" + goodsID +
                ", orderID=" + orderID +
                ", status='" + status + '\'' +
                ", sellerID='" + sellerID + '\'' +
                ", customerID='" + customerID + '\'' +
                '}';
    }
}
