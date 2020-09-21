package com.bokm.vo;

public class Criteria {

	private int page;  //현재 페이지 번호
    private int perPageNum;  //페이지당 출력되는 게시글의 갯수
    private int pageStart;  //list 쿼리문에 limit a,b 값 중 a값에 들어가는 변수 ,, 현재페이지의 시작 게시글 번호
    private String bb_bnum;
    
    private String searchType;
	private String keyword;
    
    
    public String getBb_bnum() {
		return bb_bnum;
	}
	public void setBb_bnum(String bb_bnum) {
		this.bb_bnum = bb_bnum;
	}

	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	//  현재 페이지를 1, 게시글의 갯수를10으로 초기화
    public Criteria() {
    	this.page = 1;
    	this.perPageNum = 10;
    }
    


    public void setPageStart(int pageStart) {
    	this.pageStart = pageStart;
    }
    
//  ex) 첫번째 페이지 확인시 1부터 10번 게시글까지 확인 가능 -> page=1,perPageNum=10 이고 계산결과 pageStart값은 0이나옴
//  mapper selectlist 구문을 보면 limit 의 값이 limit #{pageStart},#{perpageNum} 즉, limit 0,10 이되며
//  db 쿼리문법에 limit 는 limit a,b 에서 a값이 0이면 1부터 시작한다라는 정의. 즉, 0, 10 이면 게시글 1~10까지 조회 출력.
//  같은 방법으로 2페이지를 클릭할 시 11번부터 20번 까지의 게시글이 나와야함. 위 문장대로 계산을 진행하면 limit 10,10 값이 나오며 
//  그 결과는 11번부터 10개의 게시글을 보여준다는 말이 됨으로 페이징 처리 완료.
    public int getPageStart() {  
    	return ((this.page - 1) * perPageNum);
    }
    

    public void setPage(int page) {
        if (page <= 0) {
            this.page = 1;
            return;
        }
        this.page = page;
    }

    public int getPage() {
        return page;
    }

    public void setPerPageNum(int perPageNum) {

        if (perPageNum <= 0 || perPageNum > 100) {
            this.perPageNum = 10;
            return;
        }

        this.perPageNum = perPageNum;
    }

    public int getPerPageNum() {
        return this.perPageNum;
    }
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", pageStart=" + pageStart + ", bb_bnum="
				+ bb_bnum + ", searchType=" + searchType + ", keyword=" + keyword + "]";
	}



	 
}
