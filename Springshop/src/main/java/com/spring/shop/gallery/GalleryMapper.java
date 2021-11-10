package com.spring.shop.gallery;

import java.util.List;
import java.util.Map;

public interface GalleryMapper {
	
	public abstract int insertGallery(GalleryVo galleryVo);
	
	public abstract List<GalleryVo> galleryList(Map<String, Object> param);
	
	public abstract int selGalleryCount();
	
	public abstract int deleteGallery(int gid);
	
	public abstract GalleryVo selGallery(int gid);
	
	public abstract int updateGallery(GalleryVo galleryVo);
}
