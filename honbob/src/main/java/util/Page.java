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

		int maxPage = listCount/limit;
		int startPage = (p-1)/limit*limit+1;		
		int endPage = startPage+10-1;
		
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
