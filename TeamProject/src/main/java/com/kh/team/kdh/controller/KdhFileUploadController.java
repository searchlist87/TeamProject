package com.kh.team.kdh.controller;

import java.io.File;
import java.io.FileInputStream;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.team.kdh.util.KdhFileUploadUtil;

@RequestMapping("/kdh/upload")
@Controller
public class KdhFileUploadController {

	@Resource
	private String uploadPath;
	
	// 파일 올리기
	@ResponseBody
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.POST, produces = {"text/plain;charset=UTF-8"})
	public String fileUpload(MultipartFile file) throws Exception {
		String KdhUploadPath = uploadPath + "/kong_upload";
		String oFileName = file.getOriginalFilename();
		String dirPath = KdhFileUploadUtil.uploadFile(KdhUploadPath, oFileName, file.getBytes());
		return dirPath.replace("\\","/");
	}
	
	// 파일 미리보기
	@RequestMapping(value = "/displayFile", method = RequestMethod.GET)
	@ResponseBody
	public byte[] displayFile(@RequestParam("fileName") String fileName) throws Exception {
		String KdhUploadPath = uploadPath + "/kong_upload";
		System.out.println("fileName:" + fileName);
		String filePath = KdhUploadPath + File.separator + fileName;
		String rFilePath = filePath.replace("/", "\\");
		System.out.println("rFilePath:" + rFilePath);
		FileInputStream fis = new FileInputStream(rFilePath);
		byte[] bytes = IOUtils.toByteArray(fis);
		fis.close();
		return bytes;
	}
	
	// 파일 지우기
	@ResponseBody
	@RequestMapping(value="/deleteFile", method = RequestMethod.GET)
	public String deleteFile(String fileName) throws Exception {
		String KdhUploadPath = uploadPath + "/kong_upload";
		String filePath = KdhUploadPath + File.separator + fileName;
		
		String file2Front = fileName.substring(0, fileName.lastIndexOf("/") + 1);
		String file2Rear = fileName.substring(fileName.lastIndexOf("/") + 1);
		String smFilePath = KdhUploadPath + File.separator + file2Front + "sm_" + file2Rear;
		
		File file = new File(filePath);
		file.delete();
		
		boolean result = KdhFileUploadUtil.isImage(fileName);
		if (result == true) {
			File file2 = new File(smFilePath);
			file2.delete();
		}
		return "success";
		}
	
}
