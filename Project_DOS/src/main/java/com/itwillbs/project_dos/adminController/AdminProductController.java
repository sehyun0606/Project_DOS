package com.itwillbs.project_dos.adminController;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.project_dos.adminService.AdminProductService;
import com.itwillbs.project_dos.vo.ProductVO;

@Controller
public class AdminProductController {
	
	@Autowired
	private AdminProductService productService;
	
	private String virtualPath = "/resources/upload";
	
	
	@GetMapping("AdminMerch")
	public String adminMerch(Model model) {
		
		List<ProductVO> dollList = productService.getDollList();
		
		model.addAttribute("dollList", dollList);
		
		List<ProductVO> tumblerList = productService.getTumblerList();
		
		model.addAttribute("tumblerList", tumblerList);
		
		List<ProductVO> dishList = productService.getDishList();
		
		model.addAttribute("dishList", dishList);
		
		return "admin/admin_merch/admin_merch";
	}
	
	
	@GetMapping("MerchAdd")
	public String merchAddform() {
		return "admin/admin_merch/merch_add";
	}
	
	@PostMapping("MerchAdd")
	public String merchAdd(ProductVO product, HttpSession session, Model model) {
		String realPath = getRealPath(session, virtualPath);
		String subDir = product.getCategory();
		
		realPath += "/" + subDir;
		
		MultipartFile productImg = product.getProductImg();
		
		
		product.setProduct_img("");
		
		String imgName = "";
		
		if(!productImg.getOriginalFilename().equals("")) {
			imgName = UUID.randomUUID().toString() + "_" + productImg.getOriginalFilename();
			product.setProduct_img(subDir + "/" + imgName);
		}
		
		int insertCount = productService.registProduct(product);
		
		if (insertCount > 0) {
			try {
				if(!productImg.getOriginalFilename().equals("")) {
					productImg.transferTo(new File(realPath, imgName));
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "redirect:AdminMerch";
		} else {
			model.addAttribute("msg","상품 등록 실패");
			return "result/result";
		}
	}
	
	
	
	@GetMapping("AdminMealkit")
	public String adminMealkit() {
		return "admin/admin_merch/admin_mealkit";
	}
	
	
	@GetMapping("MealkitAdd")
	public String mealkitEdit() {
		return "admin/admin_merch/mealkit_add";
	}
	
	@GetMapping("MerchDelete")
	public String merchDelete(String product_name, HttpSession session, Model model) {
		
		String fileName = productService.getproductImg(product_name);
		
		int deleteCount = productService.removeProduct(product_name);
		
		if(deleteCount > 0) {
			String realPath = getRealPath(session, virtualPath);
			
			if(!fileName.equals("")) {
				Path path = Paths.get(realPath,fileName);
				
				try {
					Files.deleteIfExists(path);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			return "redirect:/AdminMerch";
		}else {
			model.addAttribute("msg","제품 삭제 실패!");
			return "result/result";
		}
		
	}
	
	
	//파일 업로드를 위한 실제 경로 추가
	private String getRealPath(HttpSession session, String virturalPath) {
		return session.getServletContext().getRealPath(virturalPath);
	}
}
