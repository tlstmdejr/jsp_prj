package day1204;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import kr.co.sist.chipher.DataDecryption;
import kr.co.sist.chipher.DataEncryption;

public class UseSHA {
public static void main(String[] args) throws Exception {
	String plainText="1234";
	//일방양 해시(복호호되지 않는다)
	//1.해쉬 알고리즘을 만들수있는 객ㄱ체를 생성
	try {
		MessageDigest md=MessageDigest.getInstance("MD5");
		MessageDigest md2=MessageDigest.getInstance("SHA-1");
		MessageDigest md3=MessageDigest.getInstance("SHA-512");
		//2.평문을 배열로 만들어서 일방향 해시수행(사람이알알볼수없는 문자열로생성)
		md.digest(plainText.getBytes());
		md2.digest(plainText.getBytes());
		md3.digest(plainText.getBytes());
		//3.일방향 해시 알고리즘을 적용받은 byte[]얻기
		byte[] shaArr=md.digest();
		byte[] shaArr2=md2.digest();
		byte[] shaArr3=md3.digest();
		//4. 문자열로생성(사람이 알아 볼 수 없다.
		//String sha=new String(shaArr);
		//4.문자열생성(사람이알아볼수없다>사람이알아볼수있는 문자열로)
		String sha=new String(Base64.getEncoder().encode(shaArr));
		String sha2=new String(Base64.getEncoder().encode(shaArr2));
		String sha3=new String(Base64.getEncoder().encode(shaArr3));
		System.out.println("md5 : " +sha);
		System.out.println("sha-1 : " +sha2);
		System.out.println("sha-512 : " +sha3);
		
		String sha4=DataEncryption.messageDigest("SHA-512",plainText);
		System.out.println("sha-512 : " +sha4);
		//암호화
		String name="1234";
		//16자키
		String key="a123456789012345";
		DataEncryption de=new DataEncryption(key);
		
		String chipherText=de.encrypt(name);
		System.out.println(chipherText);
	//	92T9sQVTPgngZVouAfgzCQ==
		//복호화
		DataDecryption dd=new DataDecryption(key);
		System.out.println(dd.decrypt(chipherText));
	} catch (NoSuchAlgorithmException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
}
//class
