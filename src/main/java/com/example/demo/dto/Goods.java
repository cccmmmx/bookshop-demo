package com.example.demo.dto;

import java.util.Date;

public class Goods {
    String id;//id
    String name;//图书名称
    String image;//图书封面图
    Date indate;//上架日期
    double originalprice;//原始价
    double rate;//折扣
    double discountprice;//会员折扣价
    Category category;//关联到分类
    Seller seller;//关联到商家
    String state;//图书状态 0无 1推荐 2 热卖
    int stock;//库存
    String booklabel;//图书标签
    String bookPress;//出版社
    Date bookPubDate;//出版日期
    String bookVersion;//版次
    String bookAuthor;//作者
    String bookTanslor;//图书译者
    String bookisbn;//图书ISBN
    int bookPages;//图书页码
    String bookOutline;//图书简介
    String bookCatalog;//图书目录
    int bookDealmount;//购买数量
    int bookLookmount;//浏览次数
    String isCollection; //是否被收藏 0 未收藏 1 收藏
   String grade;//是否上架 0未审核 1审核不通过 2上架 3下架

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public Date getIndate() {
        return indate;
    }

    public void setIndate(Date indate) {
        this.indate = indate;
    }

    public double getOriginalprice() {
        return originalprice;
    }

    public void setOriginalprice(double originalprice) {
        this.originalprice = originalprice;
    }

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }

    public double getDiscountprice() {
        return discountprice;
    }

    public void setDiscountprice(double discountprice) {
        this.discountprice = discountprice;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Seller getSeller() {
        return seller;
    }

    public void setSeller(Seller seller) {
        this.seller = seller;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getBooklabel() {
        return booklabel;
    }

    public void setBooklabel(String booklabel) {
        this.booklabel = booklabel;
    }

    public String getBookPress() {
        return bookPress;
    }

    public void setBookPress(String bookPress) {
        this.bookPress = bookPress;
    }

    public Date getBookPubDate() {
        return bookPubDate;
    }

    public void setBookPubDate(Date bookPubDate) {
        this.bookPubDate = bookPubDate;
    }

    public String getBookVersion() {
        return bookVersion;
    }

    public void setBookVersion(String bookVersion) {
        this.bookVersion = bookVersion;
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor;
    }

    public String getBookTanslor() {
        return bookTanslor;
    }

    public void setBookTanslor(String bookTanslor) {
        this.bookTanslor = bookTanslor;
    }

    public String getBookisbn() {
        return bookisbn;
    }

    public void setBookisbn(String bookisbn) {
        this.bookisbn = bookisbn;
    }

    public int getBookPages() {
        return bookPages;
    }

    public void setBookPages(int bookPages) {
        this.bookPages = bookPages;
    }

    public String getBookOutline() {
        return bookOutline;
    }

    public void setBookOutline(String bookOutline) {
        this.bookOutline = bookOutline;
    }

    public String getBookCatalog() {
        return bookCatalog;
    }

    public void setBookCatalog(String bookCatalog) {
        this.bookCatalog = bookCatalog;
    }

    public int getBookDealmount() {
        return bookDealmount;
    }

    public void setBookDealmount(int bookDealmount) {
        this.bookDealmount = bookDealmount;
    }

    public int getBookLookmount() {
        return bookLookmount;
    }

    public void setBookLookmount(int bookLookmount) {
        this.bookLookmount = bookLookmount;
    }

    public String getIsCollection() {
        return isCollection;
    }

    public void setIsCollection(String isCollection) {
        this.isCollection = isCollection;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", image='" + image + '\'' +
                ", indate=" + indate +
                ", originalprice=" + originalprice +
                ", rate=" + rate +
                ", discountprice=" + discountprice +
                ", category=" + category +
                ", seller=" + seller +
                ", state='" + state + '\'' +
                ", stock=" + stock +
                ", booklabel='" + booklabel + '\'' +
                ", bookPress='" + bookPress + '\'' +
                ", bookPubDate=" + bookPubDate +
                ", bookVersion='" + bookVersion + '\'' +
                ", bookAuthor='" + bookAuthor + '\'' +
                ", bookTanslor='" + bookTanslor + '\'' +
                ", bookisbn='" + bookisbn + '\'' +
                ", bookPages=" + bookPages +
                ", bookOutline='" + bookOutline + '\'' +
                ", bookCatalog='" + bookCatalog + '\'' +
                ", bookDealmount='" + bookDealmount + '\'' +
                ", bookLookmount='" + bookLookmount + '\'' +
                ", isCollection='" + isCollection + '\'' +
                ", grade='" + grade + '\'' +
                '}';
    }
}
