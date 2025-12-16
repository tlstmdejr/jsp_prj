package kr.co.sist.user.member;

import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import day1128.ParamDTO;
import kr.co.sist.chipher.DataDecryption;
import kr.co.sist.chipher.DataEncryption;
import siteProperty.SiteProperty;
import siteProperty.SitePropertyVO;

public class WebMemberService {
	
	private static WebMemberService wmService;
	
	private WebMemberService() {
		
	}
	
	public static WebMemberService getInstance() {
		if(wmService==null) {
			wmService=new WebMemberService();
			
		}
		return wmService;
	}
	public boolean searchId(String id) {
		boolean flag=false;
		
		WebMemberDAO wmDAO=WebMemberDAO.getInstance();
		try {
			flag=wmDAO.selectId(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}		
				
		
		return flag;
	}
	public boolean addMember(ParamDTO pDTO, String key) throws Exception {

		boolean flag=false;
		WebMemberDAO wmDAO=WebMemberDAO.getInstance();
		
		//저장될 데이터의 중요도에 따라 일방향 헤시 암호화 처리
		//null이나 empty는 일방향 해시나 암호화를 하게되면 에러가 발생
		if(pDTO.getPass()!=null && !"".equals(pDTO.getPass())) {
			try {
				pDTO.setPass(DataEncryption.messageDigest("SHA-1", pDTO.getPass()));
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
		}
		//String key="a123456789012345";
		
		DataEncryption de=new DataEncryption(key);
		if(pDTO.getName()!=null && !"".equals(pDTO.getName())) {
			try {
				pDTO.setName(de.encrypt(pDTO.getName()));
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
		}
		if(pDTO.getEmail()!=null && !"".equals(pDTO.getEmail())) {
			try {
				pDTO.setEmail(de.encrypt(pDTO.getEmail()));
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
		}
		
		try {
		//회원 정보 1개
		wmDAO.insertMember(pDTO);
		flag=true;
		//회원 언어정보 n개
		String[] lang=pDTO.getLang();
		if(lang !=null) {//선택한 언어가 있다면
			for(String tempLang : lang) {//언어의 개수대로 반복을 수행추가
				wmDAO.insertMemberLang(pDTO.getId(),tempLang);
			}
		}
		} catch (SQLException e) {
		e.printStackTrace();

		

		}//addMember
		return flag;
	}
	public ParamDTO searchMember(String id) {
		ParamDTO pDTO=null;
		WebMemberDAO wmDAO=WebMemberDAO.getInstance();
		String key=SiteProperty.spVO.getKey();
		System.out.println("00000"+key);
		try {
			pDTO=wmDAO.selectMember(id);
			if(pDTO!=null) {
				//복호화필요 이름과이메일 암호화때문에
				DataDecryption dd=new DataDecryption(key);
				pDTO.setName(dd.decrypt(pDTO.getName()));
				pDTO.setEmail(dd.decrypt(pDTO.getEmail()));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pDTO;
	}
	public boolean modifyMember(ParamDTO pDTO) throws Exception {

		boolean flag=false;
		WebMemberDAO wmDAO=WebMemberDAO.getInstance();
	
		String key=SiteProperty.spVO.getKey()	;
		
		DataEncryption de=new DataEncryption(key);
		if(pDTO.getEmail()!=null && !"".equals(pDTO.getEmail())) {
			try {
				pDTO.setEmail(de.encrypt(pDTO.getEmail()));
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
		}
		try {
		//회원 정보 1개
		flag=wmDAO.updateMember(pDTO)==1;
		System.out.println(flag);
		//회원 언어정보 n개
		} catch (SQLException e) {
		e.printStackTrace();
		}//addMember
		return flag;
	}
}
//class
