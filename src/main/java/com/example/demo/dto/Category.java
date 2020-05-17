package com.example.demo.dto;

public class Category {
    String id;
    String text;
    String parent;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getParent() {
        return parent;
    }

    public void setParent(String parent) {
        this.parent = parent;
    }

    @Override
    public String toString() {
        return "Category{" +
                "id='" + id + '\'' +
                ", text='" + text + '\'' +
                ", parent='" + parent + '\'' +
                '}';
    }
}
