package day1215;

import java.io.FileOutputStream;
import java.io.IOException;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;


public class createDOMXML {
	
	public static void main(String[] args) {
		
		Document doc=new Document();
		
		Element rootNode=new Element("root");
		
		doc.addContent(rootNode);
		
		Element msgNode=new Element("msg");
		Element nameNode=new Element("name");
		//자식노드에 문자열 (|
		
		msgNode.setText("오늘으 월요일입니다");
		nameNode.setText("민병조");
		
		
		//5.자식노드를 부모노드에 추가
		rootNode.addContent(msgNode);
		rootNode.addContent(nameNode);
		
		// •6생성된 객체를 출력
		//XMLOutputter xout=new XMLOutputter( Format.getCompactFormat());
		XMLOutputter xout=new XMLOutputter( Format.getRawFormat());
		//XMLOutputter xout=new XMLOutputter( Format.getPrettyFormat());
		try {
			xout.output(doc, System.out);
			FileOutputStream fos=
					new FileOutputStream("C:/dev/workspace/jsp_prj/src/main/webapp/xml1215/msg.xml");
			xout.output(doc, fos);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}//main
	
}
//class
