package com.example.demo.dto;

import java.util.Date;

public class OrderMounts {
    Date orderTime;
    double total;//订单总金额
    int goodsCount;//购买的总数

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getGoodsCount() {
        return goodsCount;
    }

    public void setGoodsCount(int goodsCount) {
        this.goodsCount = goodsCount;
    }

    @Override
    public String toString() {
        return "OrderMounts{" +
                "orderTime=" + orderTime +
                ", total=" + total +
                ", goodsCount=" + goodsCount +
                '}';
    }
}
