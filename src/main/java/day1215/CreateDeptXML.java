package day1215;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspWriter;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

import kr.co.sist.emp.DeptDTO;

public class CreateDeptXML {

	public void createXml( List<DeptDTO> list, JspWriter out)throws IOException {

		Document doc=new Document();
		//2.최상위부모노드생성
		Element deptsNode=new Element("depts");
		//3.최상위 부모노드 문서객체에 추가
		doc.addContent(deptsNode);
		
		//4.자식노드중 부모노드 선언
		Element deptNode=null;
		//5.자식노드선언
		Element deptnoNode=null;
		Element	dnameNode=null;

		for(DeptDTO dDTO : list) {
			deptNode=new Element("dept");
			deptnoNode=new Element("deptno");
			dnameNode=new Element("dname");
			
			//생성된자식노드를 자식노드중 부모노드에 배치
			deptNode.addContent(deptnoNode);//<dept><deptno/></dept>
			deptNode.addContent(dnameNode);//<dept><deptno/><dname/></dept>
			//자식을 가진부모노드를 최상위 부모노드에 배치
			deptnoNode.setText(String.valueOf(dDTO.getDeptno()));
			dnameNode.setText(dDTO.getDname());
			
			
			deptsNode.addContent(deptNode);
			
		}
		
		
		XMLOutputter xOut=new XMLOutputter(Format.getPrettyFormat());
		xOut.output(doc, System.out);
		FileOutputStream fos=
				new FileOutputStream("C:/dev/workspace/jsp_prj/src/main/webapp/xml1215/deptInfo.xml");
		xOut.output(doc, fos);//파일출력
		xOut.output(doc, out);//웹브라우저 출력 out=jspWriter
	}//createXml
}
//class
