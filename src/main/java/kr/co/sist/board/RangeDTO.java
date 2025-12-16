package kr.co.sist.board;

public class RangeDTO {
	private int startNum,endNum;
	private String field,keyword;
	private String fieldStr;//검색필드 값에 대응되는 컬럼명의 문자열
	private String url;
	private int currentPage=1;//이동할 url,현제페이지
	int totalPage=0;
	

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getField() {
		return field;
	}

	public String getKeyword() {
		return keyword;
	}

	

	public String getFieldStr() {
		String[] fieldTitle= {"title","content","id"};
		int tempField=Integer.parseInt(field);
		if(!(tempField>0 && tempField<4)) {//1~3사이가 아닌경우
			tempField=1;
		}
		fieldStr=fieldTitle[Integer.parseInt(field)-1];
		return fieldStr;
	}

	public void setField(String field) {
		this.field = field;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getStartNum() {
		return startNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getEndNum() {
		return endNum;
	}

	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}

	@Override
	public String toString() {
		return "RangeDTO [startNum=" + startNum + ", endNum=" + endNum + ", field=" + field + ", keyword=" + keyword
				+ ", fieldStr=" + fieldStr + ", url=" + url + ", currentPage=" + currentPage + "]";
	}



	
	
}
//class
