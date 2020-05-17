package com.example.demo.dto;


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class TOrder {
    int id;//订单17位编号
    Date orderTime;//下单时间
    Customer customerID;//订单所属会员客户
    String realname;//会员真实名
    String phone;//手机号码
    String remark;//配送信息

    double total;//订单总金额
    int goodsCount;//购买的总数

    String postcode;//邮编
    String address;//住址/默认收货地址
    String memo;//备注
    String message;//留言
    String state;//订单状态 1-未支付 2-未派送 3-已派送
    //订单1:N订单项
    Set<OrderItem> orderItems;


    public TOrder() {

    }
    public TOrder(HashSet<OrderItem> orderItems) {
       this.orderItems=orderItems;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public Customer getCustomerID() {
        return customerID;
    }

    public void setCustomerID(Customer customerID) {
        this.customerID = customerID;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public int getGoodsCount() {
        return goodsCount;
    }

    public void setGoodsCount(int goodsCount) {
        this.goodsCount = goodsCount;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Set<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(Set<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public String toString() {
        return "TOrder{" +
                "id='" + id + '\'' +
                ", orderTime=" + orderTime +
                ", customerID=" + customerID +
                ", state='" + state + '\'' +
                ", realname='" + realname + '\'' +
                ", goodsCount='" + goodsCount + '\'' +
                ", phone='" + phone + '\'' +
                ", remark='" + remark + '\'' +
                ", postcode='" + postcode + '\'' +
                ", total=" + total +
                ", address='" + address + '\'' +
                ", memo='" + memo + '\'' +
                ", message='" + message + '\'' +
                ", orderItems=" + orderItems +
                '}';
    }
}
