package com.itwillbs.project_dos.vo;

public class MenuVO {
    private int menuId;       // 메뉴 ID
    private String menuName;  // 메뉴 이름
    private int price;        // 가격

    // Getter & Setter
    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}
