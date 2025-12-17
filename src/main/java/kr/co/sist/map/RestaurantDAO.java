package kr.co.sist.map;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.board.BoardDTO;
import kr.co.sist.dao.DbConn;

public class RestaurantDAO {
	
	private static RestaurantDAO rDAO;
	
	private RestaurantDAO() {
		
	}
	public static RestaurantDAO getInstance() {
		if( rDAO==null) {
			rDAO=new RestaurantDAO();
			
		}//end if
		return rDAO;
	}//getinstance
	
	public List<RastaurantDTO> selectAllRestaurant(String id)throws SQLException{
		List<RastaurantDTO> list=new ArrayList<RastaurantDTO>();
		
		DbConn dbCon = DbConn.getInstance("jdbc/dbcp");

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 1. JNDI사용객체 생성
			// 2. DataSource 얻기
			// 3. Connection 얻기
			con = dbCon.getConn();
			// 4. 쿼리문생성객체 얻기
			StringBuilder selectRestaurant = new StringBuilder();
			selectRestaurant.append("	select rest_num,rest_name,munu,lat,lng,input_date   ")
						.append("   from restaurant ")
						.append("   where id=?  ");
			
		
			pstmt = con.prepareStatement(selectRestaurant.toString());
			// 5. 바인드변수 값 설정
			
			pstmt.setString(1,id);
			// 6. 조회결과 얻기
			RastaurantDTO rDTO = null;
			rs = pstmt.executeQuery();

			while (rs.next()) {
				rDTO=new RastaurantDTO();
				rDTO.setRest_num(rs.getInt("rest_num"));
				
			}
			// empno, ename, job, sal, hiredate
		} finally {
			// 7. 연결 귾기
			dbCon.dbClose(rs, pstmt, con);
		}
		
		
		
		
		return list;
	}
	public void insertRestaurant(RastaurantDTO rDTO)throws SQLException{
		
	}
}
//class
