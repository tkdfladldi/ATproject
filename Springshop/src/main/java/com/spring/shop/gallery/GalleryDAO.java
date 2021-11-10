package com.spring.shop.gallery;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.spring.shop.Paging;
import com.spring.shop.member.MemberVo;

@Service
public class GalleryDAO {
	@Autowired
	SqlSession ss;

	@Autowired
	Paging paging;

	public void insertGallery(HttpServletRequest req, String filename, String fakename) {
		MemberVo Membervo = new MemberVo();
		GalleryVo galleryVo = new GalleryVo();
		Membervo = (MemberVo) req.getSession().getAttribute("member");

		galleryVo.setTitle(req.getParameter("title"));
		galleryVo.setContent(req.getParameter("content"));
		galleryVo.setFileName(filename);
		galleryVo.setFakeName(fakename);
		galleryVo.setReg_id(Membervo.getUserId());

		ss.getMapper(GalleryMapper.class).insertGallery(galleryVo);
	}

	public int insertG(HttpServletRequest req) {
		String path = req.getSession().getServletContext().getRealPath("resources/file");
		System.out.println(path);
		File f = new File(path);
		if (!f.exists()) {
			f.mkdirs();
		}
		MultipartRequest mr = null;

		try {
			mr = new MultipartRequest(req, path, 10 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
		}
		try {
			MemberVo Membervo = (MemberVo) req.getSession().getAttribute("member");
			GalleryVo galleryVo = new GalleryVo();
			String savename = "F_" + getRandomSaveFileName();
			galleryVo.setTitle(mr.getParameter("title"));
			galleryVo.setContent(mr.getParameter("content"));
			galleryVo.setFileName(mr.getFilesystemName("file"));
			galleryVo.setFakeName(savename + "_" + galleryVo.getFileName());

			galleryVo.setReg_id(Membervo.getUserId());
			int rst = ss.getMapper(GalleryMapper.class).insertGallery(galleryVo);
			return rst;
		} catch (Exception e) {
			File f2 = new File(path + "/" + mr.getFilesystemName("file"));
			f2.delete();
			return 0;
		}
	}

	public Map<String, Object> galleryList(HttpServletRequest req) {
		int pagePerCnt = Integer.parseInt(req.getParameter("pagePerCnt"));
		int curPage = Integer.parseInt(req.getParameter("curPage"));
		int totalCnt = ss.getMapper(GalleryMapper.class).selGalleryCount();

		Map<String, Object> p = paging.generatePagingParam(totalCnt, pagePerCnt, curPage);
		Map<String, Object> mapList = new HashMap<String, Object>();
		List<GalleryVo> galleryVo = ss.getMapper(GalleryMapper.class).galleryList(p);
		mapList.put("paging", p);
		mapList.put("mapList", galleryVo);

		return mapList;

	}

	public int deleteGallery(HttpServletRequest req) {
		int gid = Integer.parseInt(req.getParameter("gid"));
		String path = req.getSession().getServletContext().getRealPath("resources/file");
		File f2 = new File(path + "/" + req.getParameter("fileName"));
		f2.delete();
		return ss.getMapper(GalleryMapper.class).deleteGallery(gid);
	}

	public GalleryVo updateGalleryForm(HttpServletRequest req) {
		int gid = Integer.parseInt(req.getParameter("gid"));
		return ss.getMapper(GalleryMapper.class).selGallery(gid);

	}

	public int galleryUpdate(HttpServletRequest req) {
		String path = req.getSession().getServletContext().getRealPath("resources/file");
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(req, path, 10 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
		} catch (IOException e) {
			e.printStackTrace();
		}
		try {
			String fileChk = mr.getFilesystemName("file");
			GalleryVo galleryVo = new GalleryVo();
			galleryVo.setGid(Integer.parseInt(mr.getParameter("gid")));
			galleryVo.setTitle(mr.getParameter("title"));
			galleryVo.setContent(mr.getParameter("content"));

			if (fileChk != null) {
				File deleteF = new File(path + "/" + mr.getParameter("fileName"));
				deleteF.delete();
				galleryVo.setFileName(mr.getFilesystemName("file"));
				String savename = "F_" + getRandomSaveFileName();
				galleryVo.setFakeName(savename + "_" + galleryVo.getFileName());
			}

			return ss.getMapper(GalleryMapper.class).updateGallery(galleryVo);

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}

	}

	public int getRandomSaveFileName() {
		Random rand = new Random();
		String rst = Integer.toString(rand.nextInt(8) + 1);
		for (int i = 0; i < 7; i++) {
			rst += Integer.toString(rand.nextInt(9));
		}
		return Integer.parseInt(rst);
	}
}
