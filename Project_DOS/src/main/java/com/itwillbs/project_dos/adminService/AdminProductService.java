package com.itwillbs.project_dos.adminService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_dos.adminMapper.AdminProductMapper;
import com.itwillbs.project_dos.vo.ProductVO;

@Service
public class AdminProductService {
	
	@Autowired
	private AdminProductMapper productMapper;

	public int registProduct(ProductVO product) {
		return productMapper.insertProduct(product);
	}

	public List<ProductVO> getDollList() {
		return productMapper.selectDollList();
	}

	public List<ProductVO> getTumblerList() {
		return productMapper.getTumblerList();
	}

	public List<ProductVO> getDishList() {
		return productMapper.getDishList();
	}

	public String getproductImg(String product_name) {
		return productMapper.selectProductImg(product_name);
	}

	public int removeProduct(String product_name) {
		return productMapper.deleteProduct(product_name);
	}

}
