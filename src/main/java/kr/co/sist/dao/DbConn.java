package kr.co.sist.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DbConn {
	private static DbConn dbCon;
	private String jndiName;
	
	private DbConn() {
	}
	public static DbConn getInstance(String jndiName) {
		if(dbCon==null) {
			dbCon=new DbConn();
			dbCon.jndiName=jndiName;
		}
		return dbCon;
	}
	//dbcp에서 connection얻기
	public Connection getConn() throws SQLException {
		Connection con=null;
		try {
			//1.JNDI사용 객체 생성
		Context ctx=new InitialContext();
		//2.DBCP에 DataSource얻기
		DataSource ds=(DataSource)ctx.lookup("java:comp/env/"+jndiName);
		//3.DAtaSource에서 Connection얻기
		con=ds.getConnection();
		}catch(NamingException ne) {
			ne.printStackTrace();
		}
		return con;
	}
	public void dbClose(ResultSet rs,Statement stmt,Connection con) throws SQLException {
		try {
			if(rs!=null){rs.close();}
			if(stmt!=null){stmt.close();}
		}finally {
			if(con!=null){con.close();}
			
		}
	}
}
//class
