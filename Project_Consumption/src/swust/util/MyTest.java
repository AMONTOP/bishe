package swust.util;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

public class MyTest {

	public static void main(String[] args) throws NoSuchAlgorithmException,
			UnsupportedEncodingException {
		Md5 md5 = new Md5();
		String str = "admin123";
		try {
			String newString = md5.EncoderByMd5(str);
			System.out.println(newString);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println(md5.EncoderByMd5("admin123").equals(
				"4QrcOUm6Wau+VuBX8g+IPg=="));

	}
}
