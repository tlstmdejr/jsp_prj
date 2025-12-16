package kr.co.sist.emp;

import java.util.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class EmployeeService {
	
	private static EmployeeService es;
	private EmployeeService() {
		
	}
	public static EmployeeService getInstance() {
		if(es==null) {
			es=new EmployeeService();
		}
		return es;
	}
	public List<DeptDTO> searchAllDept(){
		List<DeptDTO> list=new ArrayList<DeptDTO>();
		
		EmployeeDAO eDAO=EmployeeDAO.getInstance();
		
		try {
			list=eDAO.selectAllDept();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	public String searchEmp(int deptno) {
		JSONObject jsonObj=new JSONObject();
		
		EmployeeDAO eDAO=EmployeeDAO.getInstance();
		List<EmpDTO> list=null;
		try {
			list=eDAO.selectEmp(deptno);
			//데이터를 jsonobject추가
			JSONArray jsonArr=new JSONArray();
			JSONObject jsonTemp=null;
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			for(EmpDTO eDTO : list) {
				jsonTemp=new JSONObject();//조회된 레코드 하나를 저장하기위한JSONObject
				jsonTemp.put("empno", eDTO.getEmpno());
				jsonTemp.put("ename", eDTO.getEname());
				jsonTemp.put("job", eDTO.getJob());
				jsonTemp.put("sal", eDTO.getSal());
				//날짜를 jsonobject으로 직접넣으면 error발생 > 문자열로 만들어서 넣으면 된다
				jsonTemp.put("hiredate", sdf.format(eDTO.getHiredate()));
				jsonTemp.put("hiredateStr", eDTO.getHiredateStr());
				
				//jsonobject를 jsonarray추가
				jsonArr.add(jsonTemp);
			}//end for
			//조회된 레코드를 모두가지고있는 jsonArray를 josnobject에추가
			jsonObj.put("empData",jsonArr);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(list==null) {
			list=new ArrayList<EmpDTO>();
		}
		//부가적인 정보를 jsonObject에 추가
		jsonObj.put("pubDate", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		jsonObj.put("dataLength",list.size());
		jsonObj.put("resultFlag",list.isEmpty());
		return jsonObj.toJSONString();
	}
}
//class
