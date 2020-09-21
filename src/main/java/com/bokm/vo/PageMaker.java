package com.bokm.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	private int totalCount;
    private int startPage;
    private int endPage;
    private boolean prev;
    private boolean next;

    private int displayPageNum = 10;  //하단의 페이지 번호 갯수

    private Criteria criteria;

    public void setCriteria(Criteria criteria) {
        this.criteria = criteria;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        System.out.println("eeeeeeeeeee"+totalCount);
        calcData();
    }
    
    
    public String makeQuery(int page) {
        UriComponents uriComponents = UriComponentsBuilder.newInstance()
                .queryParam("page", page)
                .queryParam("perPageNum", criteria.getPerPageNum())
                .queryParam("bb_bnum", criteria.getBb_bnum())
                .build();

        return uriComponents.toUriString();
    }
    public String makeQuery1(int page) {
    	UriComponents uriComponents = UriComponentsBuilder.newInstance()
    			.queryParam("page", page)
    			.queryParam("perPageNum", criteria.getPerPageNum())
    			.build();
    	
    	return uriComponents.toUriString();
    }
    
    public String makeSearch(int page) {

        UriComponents uriComponents = UriComponentsBuilder.newInstance()
                .queryParam("page", page)
                .queryParam("perPageNum", criteria.getPerPageNum())
                .queryParam("searchType", criteria.getSearchType())
                .queryParam("keyword", encoding(criteria.getKeyword()))
                .build();

        return uriComponents.toUriString();
    }

    private String encoding(String keyword) {
        if (keyword == null || keyword.trim().length() == 0) {
            return "";
        }

        try {
            return URLEncoder.encode(keyword, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            return "";
        }
    }

    private void calcData() { //게시글의 전체 갯수가 설정되는 시점에 calcData()메서드를 호출하여 필요한 데이터들를 계산한다.

//    	끝 페이지번호 = Math.ceil(현재페이지 / 페이지 번호의 갯수) * 페이지 번호의 갯수
        endPage = (int) (Math.ceil(criteria.getPage() / (double) displayPageNum) * displayPageNum);

//      시작 페이지 번호 = (끝 페이지 번호 - 페이지 번호의 갯수) + 1
        startPage = (endPage - displayPageNum) + 1;

        int tempEndPage = (int) (Math.ceil(totalCount / (double) criteria.getPerPageNum()));

        if (endPage > tempEndPage) {
            endPage = tempEndPage;
        }

//      이전 링크의 경우 시작 페이지 번호가 1인지 아닌지 검사하는 것으로 충분하다. 삼항 연산자를 통해 1이면 false값을 아니면 true값을 가지도록 하면 된다.
//      다음 링크의 경우는 예를 들어 설명해보겠다. 만약 페이지 당 출력할 페이지 번호의 갯수가 10이고, 
//      끝 페이지 번호가 10인 상황에서 전체 게시글의 숫자가 101이라면 다음 링크는 true가 되어야 한다. 이 것을 삼항 연산자로 표현하면 다음과 같다.
        prev = startPage == 1 ? false : true;

        next = endPage * criteria.getPerPageNum() >= totalCount ? false : true;

    }

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}                        

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public Criteria getCriteria() {
		return criteria;
	}

	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", criteria=" + criteria + "]";
	}
    
    
}
