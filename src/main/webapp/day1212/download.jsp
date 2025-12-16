<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="application/octet-stream" 
    pageEncoding="UTF-8"%>
    
<%
//응답 헤더를변경(download.jsp에서사용자가 선택한 파일명이 응답되도록 변경)
String fileName=request.getParameter("fileName");
String downFileName=fileName;
//한글은 url형식으로 encoding 필요 //%ED%9A%8C%EC%9B%90%EA%B4%80%EB%A6%ACui-%EC%8B%A0%EC%8A%B9%EB%8D%95.pptx

if (downFileName !=null){
	downFileName=URLEncoder.encode(downFileName,"UTF-8");
	System.out.println(fileName);
}
response.setHeader("Content-Disposition", "attachment;fileName="+downFileName);
//다운로드할 파일의 정보를 얻기위해 객체생성
File file=new File("C:/dev/workspace/jsp_prj/src/main/webapp/upload/"+fileName);
//다운로드할 파일에 읽기 스트림을 연결
FileInputStream fis=new FileInputStream(file);
//연결된 파일을 접속자에게보내기 위해서,접속자와 연결된 출력스트림을 얻는드ㅏ
OutputStream os= response.getOutputStream();
//읽어들인 파일을 저장할 배열을 생성.파일에서 ㅇ릭어들여 출력스트림으로 추력
byte[] readData=new byte[512];

int readSize=0;

while((readSize=fis.read(readData))!= -1){//파일의 끝 eof까지 읽어들임
	os.write(readData,0,readSize);//읽어들인 데이터를 출력스트림에 기록
}//end while
	//출력스트림 초기화
	out.clear();
	//응답헤더를 html를 출력할수있게 초기화
	out=pageContext.pushBody();
	
%>
