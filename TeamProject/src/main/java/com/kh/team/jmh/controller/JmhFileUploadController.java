package com.kh.team.jmh.controller;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLDecoder;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.kh.team.util.JmhFileUploadUtil;

@RestController
@RequestMapping("/upload")
public class JmhFileUploadController {
	
	@Resource
	private String uploadPath;// servlet-context.xml (id="uploadPath");

	// 파일 올리기
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.POST, produces = {"text/plain;charset=UTF-8"})
	public String fileUpload(MultipartFile file) throws Exception {
		String JmhUploadPath = uploadPath + "/jeon_upload";
		String oFileName = file.getOriginalFilename();
		String dirPath = JmhFileUploadUtil.uploadFile(JmhUploadPath, oFileName, file.getBytes());
		return dirPath.replace("\\","/");
	}
	
	// 파일 미리보기
	@RequestMapping(value = "/displayFile", method = RequestMethod.GET)
	public byte[] displayFile(@RequestParam("fileName") String fileName) throws Exception {
		
		String JmhUploadPath = uploadPath + "/jeon_upload";
		String filePath = JmhUploadPath + File.separator + fileName;
		String rFilePath = filePath.replace("/", "\\");
		FileInputStream fis = new FileInputStream(rFilePath);
		byte[] bytes = IOUtils.toByteArray(fis);
		fis.close();
		return bytes;
	}
	
	// 파일 지우기
	@RequestMapping(value="/deleteFile", method = RequestMethod.GET)
	public String deleteFile(String fileName) throws Exception {
		String JmhUploadPath = uploadPath + "/jeon_upload";
		String filePath = JmhUploadPath + File.separator + fileName;
		
		String file2Front = fileName.substring(0, fileName.lastIndexOf("/") + 1);
		String file2Rear = fileName.substring(fileName.lastIndexOf("/") + 1);
		String smFilePath = JmhUploadPath + File.separator + file2Front + "sm_" + file2Rear;
		
		File file = new File(filePath);
		file.delete();
		
		boolean result = JmhFileUploadUtil.isImage(fileName);
		if (result == true) {
			File file2 = new File(smFilePath);
			file2.delete();
		}
		return "success";
	}
	
	// 동영상 올리기
	@RequestMapping(value = "/previewUploadAjax", method = RequestMethod.POST, produces = {"text/plain;charset=UTF-8"})
	public String previewUpload(MultipartFile file) throws Exception {
		String JmhUploadPath = uploadPath + "/jeon_upload";
		String oFileName = file.getOriginalFilename();
		String dirPath = JmhFileUploadUtil.uploadPreviewFile(JmhUploadPath, oFileName, file.getBytes());
		return dirPath.replace("\\","/");
	}
	
	
}
