package com.spring.shop.gallery;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class GalleryController {
	

	
	@Autowired
	GalleryDAO gDAO;
	
	@RequestMapping(value = "/gallery", method = RequestMethod.GET)
	public String gallery(HttpServletRequest req) {
		req.setAttribute("content", "gallery/gallery.jsp");
		req.setAttribute("gallerycontent", "gallery");
		return "home";
	}
	@RequestMapping(value = "/gallery/list", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> galleryPOST(HttpServletRequest req) {
		
		Map<String, Object> mapList = gDAO.galleryList(req);
		req.setAttribute("gallerycontent", "gallery");
		
		return mapList;
	}
	
	
	
	
	@RequestMapping(value = "/galleryForm", method = RequestMethod.GET)
	public String galleryForm(HttpServletRequest req) {
		String flag = req.getParameter("Flag");	
		
		if(flag.equals("Update")) {
			req.setAttribute("gallery", gDAO.updateGalleryForm(req));
			
			return "gallery/galleryUpdate";
			
		}else if(flag.equals("ADD")){
			return "gallery/galleryForm";
		}else {
			return "gallery/galleryForm";
		}
	}
	
	@RequestMapping(value = "/galleryUpdate", method = RequestMethod.POST)
	public String galleryUpdate(HttpServletRequest req) {
		int rst = gDAO.galleryUpdate(req);
		
		if(rst >= 1) {
			req.setAttribute("Flag", "updateY");
		}else {
			req.setAttribute("Flag", "updateN");
		}
			req.setAttribute("content", "gallery/gallery.jsp");
			req.setAttribute("gallerycontent", "gallery");
		return "home";
		
	}
	
	
//	@RequestMapping(value = "/insertGallery", method = RequestMethod.POST)
//	public String insertGallery(HttpServletRequest req,MultipartFile file,RedirectAttributes rttr) throws IOException {
//		String filename = file.getOriginalFilename();
//	    UUID uuid = UUID.randomUUID();
//	    String fakename = uuid + "_" + file.getOriginalFilename();
//	    File saveFile = new File(UPLOAD_PATH,fakename);
//	 
//	    try {
//            FileCopyUtils.copy(file.getBytes(), saveFile);
//            gDAO.insertGallery(req,filename,fakename);
//    		req.setAttribute("content", "gallery/gallery.jsp");
//    		rttr.addFlashAttribute("Flag","insertGallery");
//        } catch(Exception e) {
//            e.printStackTrace();
//            System.out.println("에러");
//        }
//		
//		return "redirect:/gallery";
//	}
	@RequestMapping(value = "/insertGallery", method = RequestMethod.POST)
	public String insertGallery(HttpServletRequest req, RedirectAttributes rttr){
		int rst = gDAO.insertG(req);
		if(rst >= 1) {
			rttr.addFlashAttribute("Flag", "insertY");
		}else {
			rttr.addFlashAttribute("Flag", "insertN");
		}
		return "redirect:/gallery";
	}
	@RequestMapping(value = "/deleteGallery", method = RequestMethod.POST)
	@ResponseBody
	public int deleteGallery(HttpServletRequest req) {
			
			
		
		return gDAO.deleteGallery(req);
	}
	
	

}
