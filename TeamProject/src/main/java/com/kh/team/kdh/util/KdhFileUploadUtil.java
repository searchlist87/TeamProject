package com.kh.team.kdh.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.Calendar;
import java.util.UUID;

import javax.annotation.Resource;
import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;


public class KdhFileUploadUtil {
	@Resource
	private static String uploadPath;// servlet-context.xml (id="uploadPath");
	
	// 파일 업로드
	public static String uploadFile(String KdhUploadPath, String originalName, byte[] fileData) throws Exception {
		UUID uuid = UUID.randomUUID();
		String datePath = calcPath(KdhUploadPath);
		String dirPath = datePath + File.separator + uuid + "-" + originalName;
		String filePath = KdhUploadPath + File.separator + dirPath;
		File target = new File(filePath);
		FileCopyUtils.copy(fileData, target);
		makeThumbnail(filePath);
		return dirPath;
	}
	
	// 썸네일 만들기
	private static void makeThumbnail(String filePath) throws Exception {
		int lastSlashIndex = filePath.lastIndexOf("\\");
		String front = filePath.substring(0, lastSlashIndex + 1);
		String rear = filePath.substring(lastSlashIndex + 1);
		String thumbnailName = front + "sm_" + rear;
		
		BufferedImage srcImage = ImageIO.read(new File(filePath));
		
		BufferedImage destImage = Scalr.resize(srcImage, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 150);
		
		File thumbFile = new File(thumbnailName);
		ImageIO.write(destImage, getFormatName(thumbnailName), thumbFile);
	}
	
	// 디렉토리 경로 지정
	private static String calcPath(String KdhUploadPath) {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int date = cal.get(Calendar.DATE);
		String dateString = + year + File.separator + month + File.separator + date;
		String datePath = KdhUploadPath + File.separator + dateString;
		File f = new File(datePath);
		if (!f.exists()) {
			f.mkdirs();
		}
		return dateString;
	}
	
	// 이름찾기
	private static String getFormatName(String thumbnailName) {
		int dotIndex = thumbnailName.lastIndexOf(".");
		String extName = thumbnailName.substring(dotIndex + 1);
		return extName.toUpperCase();
	}
	
	// 이미지체크
	public static boolean isImage(String filename) throws Exception {
		// smile.jpg
		String extName = filename.substring(filename.lastIndexOf(".") + 1).toUpperCase(); // jpg -> JPG
		if (extName.equals("JPG") || extName.equals("GIF") || extName.equals("PNG")) {
			return true;
		}
		return false;
	}
	
	// 파일 지우기
	public static String deleteFile(String fileName) throws Exception {
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

