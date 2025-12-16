package kr.co.sist.user.member;

import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import kr.co.sist.chipher.DataDecryption;
import kr.co.sist.chipher.DataEncryption;
// ParamDTO, LoginDTO, WebMemberLoginDAO가 있는 패키지를 import 해야 합니다.
import day1128.ParamDTO;
// import kr.co.sist.user.member.LoginDTO; // 같은 패키지라면 생략 가능

public class WebMemberLoginService {

    private static WebMemberLoginService wmlService;

    private WebMemberLoginService() {
    }

    public static WebMemberLoginService getInstance() {
        if (wmlService == null) {
            wmlService = new WebMemberLoginService();
        }
        return wmlService;
    }

    /**
     * 로그인 로직을 처리하는 메소드
     * 
     * @param lDTO 로그인 정보를 담은 DTO (비밀번호는 평문 상태로 전달)
     * @param key  복호화 키
     * @return 로그인 성공 시 회원 정보(ParamDTO), 실패 시 null
     */
    public ParamDTO searchLogin(LoginDTO lDTO, String key) {
        ParamDTO pDTO = null;
        WebMemberLoginDAO wmlDAO = WebMemberLoginDAO.getInstance("jdbc/dbcp");

        try {
            // 0. 입력받은 비밀번호를 SHA-1로 해시 (회원가입 시 저장된 방식과 동일하게 처리)
            String hashedPassword = DataEncryption.messageDigest("SHA-1", lDTO.getpassword());
            lDTO.setpassword(hashedPassword);

            // 1. DB에서 로그인 조회 (암호화된 비밀번호로 비교)
            pDTO = wmlDAO.selectLogin(lDTO);

            // 2. 로그인 성공 시(데이터가 있을 시) 이름 복호화
            if (pDTO != null) {
                DataDecryption dd = new DataDecryption(key);
                // 복호화 수행 (Exception 발생 가능성이 있으므로 try-catch 처리)
                String decryptedName = dd.decrypt(pDTO.getName());
                pDTO.setName(decryptedName);
            }

        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return pDTO;
    }
}