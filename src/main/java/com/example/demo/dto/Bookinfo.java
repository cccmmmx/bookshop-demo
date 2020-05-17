package com.example.demo.dto;

import java.math.BigDecimal;
import java.util.Date;

public class Bookinfo {
    String id;//图书编号 not null
    String label;//图书标签
    String bookName;//书名 not null
    String bookPress;//出版日期
    Date bookPubDate;//图书编号
    String bookVersion;//版次
    String bookAuthor;//图书作者 not null
    String bookTanslor;//图书译者
    String bookisbn;//图书ISBN
    double bookPrice;//图书定价 not null
    int bookPages;//图书页码
    String bookOutline;//图书简介 not null
    String state;//'0'表示推荐，‘1’表示热门
    String bookCatalog;//图书目录
    double bookMprice;//市场价
    double bookPrprice;//会员价
    int bookDealmount;//购买量
    int bookLookmount;//浏览次数
    BigDecimal bookDiscount;//折扣
    String bookPic;//图书封面图 not null
    int bookStoremount;//图书库存量 not null
    Date bookStoretime;//上架时间 系统自动生成 not null
    Category category;//关联到分类 not null
    Seller seller;//关联到商家 not null

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
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

    public double getBookPrice() {
        return bookPrice;
    }

    public void setBookPrice(double bookPrice) {
        this.bookPrice = bookPrice;
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

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getBookCatalog() {
        return bookCatalog;
    }

    public void setBookCatalog(String bookCatalog) {
        this.bookCatalog = bookCatalog;
    }

    public double getBookMprice() {
        return bookMprice;
    }

    public void setBookMprice(double bookMprice) {
        this.bookMprice = bookMprice;
    }

    public double getBookPrprice() {
        return bookPrprice;
    }

    public void setBookPrprice(double bookPrprice) {
        this.bookPrprice = bookPrprice;
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

    public BigDecimal getBookDiscount() {
        return bookDiscount;
    }

    public void setBookDiscount(BigDecimal bookDiscount) {
        this.bookDiscount = bookDiscount;
    }

    public String getBookPic() {
        return bookPic;
    }

    public void setBookPic(String bookPic) {
        this.bookPic = bookPic;
    }

    public int getBookStoremount() {
        return bookStoremount;
    }

    public void setBookStoremount(int bookStoremount) {
        this.bookStoremount = bookStoremount;
    }

    public Date getBookStoretime() {
        return bookStoretime;
    }

    public void setBookStoretime(Date bookStoretime) {
        this.bookStoretime = bookStoretime;
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

    @Override
    public String toString() {
        return "Bookinfo{" +
                "id='" + id + '\'' +
                ", label='" + label + '\'' +
                ", bookName='" + bookName + '\'' +
                ", bookPress='" + bookPress + '\'' +
                ", bookPubDate=" + bookPubDate +
                ", bookVersion='" + bookVersion + '\'' +
                ", bookAuthor='" + bookAuthor + '\'' +
                ", bookTanslor='" + bookTanslor + '\'' +
                ", bookisbn='" + bookisbn + '\'' +
                ", bookPrice=" + bookPrice +
                ", bookPages=" + bookPages +
                ", bookOutline='" + bookOutline + '\'' +
                ", state='" + state + '\'' +
                ", bookCatalog='" + bookCatalog + '\'' +
                ", bookMprice=" + bookMprice +
                ", bookPrprice=" + bookPrprice +
                ", bookDealmount=" + bookDealmount +
                ", bookLookmount=" + bookLookmount +
                ", bookDiscount=" + bookDiscount +
                ", bookPic='" + bookPic + '\'' +
                ", bookStoremount=" + bookStoremount +
                ", bookStoretime=" + bookStoretime +
                ", category=" + category +
                ", seller=" + seller +
                '}';
    }
}
