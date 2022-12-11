package utils;

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
}
