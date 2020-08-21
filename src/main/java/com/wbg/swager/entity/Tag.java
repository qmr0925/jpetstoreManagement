package com.wbg.swager.entity;

public class Tag {
    private String id;
    private String name;

    public String getCategory() {
        return cat;
    }

    public void setCategory(String category) {
        this.cat = category;
    }

    public String getDescn() {
        return descn;
    }

    public void setDescn(String descn) {
        this.descn = descn;
    }

    private String cat;
    private String descn;


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
        this.name = name == null ? null : name.trim();
    }
}