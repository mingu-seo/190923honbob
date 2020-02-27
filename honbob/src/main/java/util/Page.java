package util;

import util.PageInfo;
import vo.RestaurantVO;

public class Page {
	
	public PageInfo page(String page, int listCount) {
		
		RestaurantVO vo = new RestaurantVO();
		
		if(page != null) {
			vo.setPage(Integer.parseInt(page));
		}
		int p = vo.getPage();		
		
		int limit = vo.getLimit();
		
		//최대페이지 번호
		int maxPage = listCount/limit;
		//시작페이지 번호 (p-1)/limit는 int이므로 p=1~10 > 0, p=11~20 > 1, ...
		int startPage = (p-1)/limit*limit+1;
		//끝페이지 번호
		int endPage = startPage+10-1;
		
		//1단위의 값이 남을시 추가 페이지 설정을 위함
		if(listCount % limit != 0) {
			maxPage += 1;
		}
		
		if(endPage>maxPage) endPage=maxPage;
		
		PageInfo pageInfo = new PageInfo();
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(p);
		pageInfo.setStartPage(startPage);		
		
		return pageInfo;
	}

	
}
