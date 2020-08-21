package com.wbg.swager.entity;

public class Pet {
    private String id;

    //    private Category category;
//    public Category getCategory() {
//        return category;
//    }
//
//    public void setCategory(Category category) {
//        this.category = category;
//    }
//
//    public Tag getTag() {
//        return tag;
//    }
//
//    public void setTag(Tag tag) {
//        this.tag = tag;
//    }
//
//    private Tag tag;
    private String productid;
    private int listprice;
    private int unitcost;
    private String status;
    private String attr1;

    public String getProductid() {
        return productid;
    }

    public void setProductid(String productid) {
        this.productid = productid;
    }

    public int getListprice() {
        return listprice;
    }

    public void setListprice(int listprice) {
        this.listprice = listprice;
    }

    public int getUnitcost() {
        return unitcost;
    }

    public void setUnitcost(int unitcost) {
        this.unitcost = unitcost;
    }

    public String getAttr1() {
        return attr1;
    }

    public void setAttr1(String attr1) {
        this.attr1 = attr1;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }
}