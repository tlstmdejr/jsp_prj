package kr.co.sist.user.member;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import day1128.ParamDTO;
import kr.co.sist.board.BoardDTO;
import kr.co.sist.dao.DbConn;

public class WebMemberDAO {
	private static WebMemberDAO wmDAO;

	private WebMemberDAO() {
	}

	public static WebMemberDAO getInstance() {
		if (wmDAO == null) {
			wmDAO = new WebMemberDAO();

		}
		return wmDAO;
	}

	public boolean selectId(String id) throws SQLException {
		boolean resultFlag = false;

		DbConn dbCon = DbConn.getInstance("jdbc/dbcp");

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// 1.JNDI사용객체 생성
			// 2.DataSource 얻기
			// 3.DataSource에서 Connection얻기
			con = dbCon.getConn();
			// 4.쿼리문생성객체 얻기
			String selectId = "select id from web_member where id=?";
			pstmt = con.prepareStatement(selectId);
			// 5.바인드변수 값 설정
			pstmt.setString(1, id);
			// 6.뭐리문 수행후 결과 얻기
			rs = pstmt.executeQuery();
			resultFlag = rs.next();// 아이디가 존재하면 true, 없으면 false
		} finally {
			// 7.연결끊기
			dbCon.dbClose(rs, pstmt, con);
		}
		return resultFlag;
	}

	/**
	 * 회원정보를추가
	 * 
	 * @param pDTO
	 * @throws SQLException
	 */
	public void insertMember(ParamDTO pDTO) throws SQLException {
		DbConn db = DbConn.getInstance("jdbc/dbcp");

		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			// 1.JNDI사용객체 생성
			// 2.DataSource 얻기
			// 3.DataSource에서 Connection얻기
			con = db.getConn();
			// 4.쿼리문생성객체 얻기
			String insertMember = "insert into web_member(id,password,birth,name,email,loc,ip)values(?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(insertMember);

			// 5.바인드변수 값 설정
			pstmt.setString(1, pDTO.getId());
			pstmt.setString(2, pDTO.getPass());
			pstmt.setString(3, pDTO.getBirth());
			pstmt.setString(4, pDTO.getName());
			pstmt.setString(5, pDTO.getEmail());
			pstmt.setString(6, pDTO.getLoc());
			pstmt.setString(7, pDTO.getIp());
			// 6.뭐리문 수행후 결과 얻기
			pstmt.executeUpdate();
		} finally {
			db.dbClose(null, pstmt, con);
		}
		// 7.연결끊기
	}

	/**
	 * 회원이 선택한 언어 추가
	 * 
	 * @param lang
	 * @param id
	 * @throws SQLException
	 */
	public void insertMemberLang(String id, String lang) throws SQLException {
		DbConn db = DbConn.getInstance("jdbc/dbcp");

		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			// 1.JNDI사용객체 생성

			// 2.DataSource 얻기
			// 3.DataSource에서 Connection얻기
			con = db.getConn();
			// 4.쿼리문생성객체 얻기
			String insertMemberLang = "insert into web_member_lang(id,lang)values(?,?)";
			pstmt = con.prepareStatement(insertMemberLang);
			// 5.바인드변수 값 설정

			pstmt.setString(1, id);
			pstmt.setString(2, lang);

			// 6.뭐리문 수행후 결과 얻기
			pstmt.executeUpdate();
		} finally {
			db.dbClose(null, pstmt, con);
		} // 7.연결끊기
	}
	public ParamDTO selectMember(String id)throws SQLException{
		ParamDTO pDTO = null; // 리턴할 객체 선언

		DbConn dbCon = DbConn.getInstance("jdbc/dbcp");

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dbCon.getConn();
			StringBuilder selectMember = new StringBuilder();
			selectMember.append(" select name, email, birth, input_date, ip, intro, loc, profile ")
					    .append(" FROM web_member ")
					    .append(" WHERE id = ? ");

			pstmt = con.prepareStatement(selectMember.toString());
			// [수정됨] 매개변수로 받은 num 바인딩
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				pDTO = new ParamDTO();
				pDTO.setName(rs.getString("name"));
				pDTO.setEmail(rs.getString("email"));
				pDTO.setBirth(rs.getString("birth"));
				pDTO.setInputDate(rs.getDate("input_date"));
				pDTO.setIp(rs.getString("ip"));
				pDTO.setIntro(rs.getString("intro"));
				pDTO.setLoc(rs.getString("loc"));
				pDTO.setProfile(rs.getString("profile"));
				
				
			} // end if
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		}
		
		return pDTO; // [수정됨] 조회된 객체 반환
	}
	public int updateMember(ParamDTO pDTO) throws SQLException {
		int cnt=0;
		DbConn db = DbConn.getInstance("jdbc/dbcp");

		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			// 1.JNDI사용객체 생성
			// 2.DataSource 얻기
			// 3.DataSource에서 Connection얻기
			con = db.getConn();
			// 4.쿼리문생성객체 얻기
			StringBuilder updateMember=new StringBuilder();
			updateMember
			. append (" update web_member")
			. append("	set email=? , birth=? , loc=? , intro=? , profile=? ")
			. append(" where id=?");
			pstmt = con.prepareStatement(updateMember.toString());

			// 5.바인드변수 값 설정
			pstmt.setString(1, pDTO.getEmail());
			pstmt.setString(2, pDTO.getBirth());
			pstmt.setString(3, pDTO.getLoc());
			pstmt.setString(4, pDTO.getIntro());
			pstmt.setString(5, pDTO.getProfile());
			// 6.뭐리문 수행후 결과 얻기
			pstmt.setString(6, pDTO.getId());
			cnt=pstmt.executeUpdate();
		} finally {
			db.dbClose(null, pstmt, con);
		}
		// 7.연결끊기
		return cnt;
	}
}
// class
