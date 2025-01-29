package com.itwillbs.project_dos.adminMapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.project_dos.vo.ProductVO;

@Mapper
public interface AdminProductMapper {

	int insertProduct(ProductVO product);

	List<ProductVO> selectDollList();

	List<ProductVO> getTumblerList();

	List<ProductVO> getDishList();

	String selectProductImg(String product_name);

	int deleteProduct(String product_name);

}
