package com.itwillbs.project_dos.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class MenuVO {
   private String menu_name;
   private String menu_description;
   private int menu_price;
   private Date update_date;
   private String new_menu;
   private String populer_menu;
   private String menu_category;
   private String origin_info;
   private String allergy_info;
   private String menu_img;
}
