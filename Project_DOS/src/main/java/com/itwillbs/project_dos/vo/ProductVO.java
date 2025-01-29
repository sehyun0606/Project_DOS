package com.itwillbs.project_dos.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductVO {
	private String product_name;
	private int product_price;
	private String category;
	private Date add_date;
	private String product_img;
	private MultipartFile productImg;
}
