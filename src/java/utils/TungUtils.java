package utils;

import javax.servlet.http.Part;
import java.io.File;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class TungUtils {
	public static int getTotalPage(int size) {
		int totalPage;
		if (size % TungConstant.LIMIT_PAGE != 0) {
			totalPage = size / TungConstant.LIMIT_PAGE + 1;
		} else {
			totalPage = size / TungConstant.LIMIT_PAGE;
		}
		return totalPage;
	}

	public static int calculateAge(Date dob) {
		try {
			SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
			LocalDate birth = LocalDate.parse(formater.format(dob), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			LocalDate curDate = LocalDate.now();
			return Period.between(birth, curDate).getYears();
		} catch (Exception e) {
			return 0;
		}
	}

	/**
	 * Extracts file name from HTTP header content-disposition
	 */
	public static String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return "";
	}

	public static File getFolderUpload() {
		File folderUpload = new File(TungConstant.PATH_IMAGE_DOCTOR);
		return folderUpload;
	}

	public static File getFolderUploadPatient() {
		File folderUpload = new File(TungConstant.PATH_IMAGE_PATIENT);
		return folderUpload;
	}
}
