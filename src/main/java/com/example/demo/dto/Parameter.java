package com.example.demo.dto;



public class Parameter {
    int id;
    String webname;//网站名
    String regtiaoyue;//注册条款
    String notice;//公告
    String address;//地址
    String postcode;//邮编
    String tel;//电话号码
    String copyright;//版权
    String weblogo;//网站logo
    String website;//网站地址
    String affordmethod;//支付方式
    String shopstream;//购物流程
    String postmethod;//送货方式
    String postdescp;//运输说明
    String worktime;//工作时间
    String service;//售后服务
    String law;//法律
    String commques;//常见问题
    String dealrule;//交易条款

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getWebname() {
        return webname;
    }

    public void setWebname(String webname) {
        this.webname = webname;
    }

    public String getRegtiaoyue() {
        return regtiaoyue;
    }

    public void setRegtiaoyue(String regtiaoyue) {
        this.regtiaoyue = regtiaoyue;
    }

    public String getNotice() {
        return notice;
    }

    public void setNotice(String notice) {
        this.notice = notice;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getCopyright() {
        return copyright;
    }

    public void setCopyright(String copyright) {
        this.copyright = copyright;
    }

    public String getWeblogo() {
        return weblogo;
    }

    public void setWeblogo(String weblogo) {
        this.weblogo = weblogo;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getAffordmethod() {
        return affordmethod;
    }

    public void setAffordmethod(String affordmethod) {
        this.affordmethod = affordmethod;
    }

    public String getShopstream() {
        return shopstream;
    }

    public void setShopstream(String shopstream) {
        this.shopstream = shopstream;
    }

    public String getPostmethod() {
        return postmethod;
    }

    public void setPostmethod(String postmethod) {
        this.postmethod = postmethod;
    }

    public String getPostdescp() {
        return postdescp;
    }

    public void setPostdescp(String postdescp) {
        this.postdescp = postdescp;
    }

    public String getWorktime() {
        return worktime;
    }

    public void setWorktime(String worktime) {
        this.worktime = worktime;
    }

    public String getService() {
        return service;
    }

    public void setService(String service) {
        this.service = service;
    }

    public String getLaw() {
        return law;
    }

    public void setLaw(String law) {
        this.law = law;
    }

    public String getCommques() {
        return commques;
    }

    public void setCommques(String commques) {
        this.commques = commques;
    }

    public String getDealrule() {
        return dealrule;
    }

    public void setDealrule(String dealrule) {
        this.dealrule = dealrule;
    }

    @Override
    public String toString() {
        return "Parameter{" +
                "id=" + id +
                ", webname='" + webname + '\'' +
                ", regtiaoyue='" + regtiaoyue + '\'' +
                ", notice='" + notice + '\'' +
                ", address='" + address + '\'' +
                ", postcode='" + postcode + '\'' +
                ", tel='" + tel + '\'' +
                ", copyright='" + copyright + '\'' +
                ", weblogo='" + weblogo + '\'' +
                ", website='" + website + '\'' +
                ", affordmethod='" + affordmethod + '\'' +
                ", shopstream='" + shopstream + '\'' +
                ", postmethod='" + postmethod + '\'' +
                ", postdescp='" + postdescp + '\'' +
                ", worktime=" + worktime +
                ", service='" + service + '\'' +
                ", law='" + law + '\'' +
                ", commques='" + commques + '\'' +
                ", dealrule='" + dealrule + '\'' +
                '}';
    }
}
