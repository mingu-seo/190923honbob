package service;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.HonmukListDAO;
import vo.RestaurantVO;

@Service
public class HonmukListService {

	@Autowired
	HonmukListDAO HonmukDao;
	
	public List<RestaurantVO> searchList(RestaurantVO resVO){		
		
		List<RestaurantVO> addressCut = HonmukDao.searchList(resVO);
		
		//식당리스트 식당정보의 카테고리 표시 문자 셋팅
		for(int i=0; i<addressCut.size(); i++) {
			String address[] = addressCut.get(i).getAddress().split(" ");
			addressCut.get(i).setAddressCut(address[1]);
			
			String category = "";
			if(addressCut.get(i).getKoreafood()==1) category = category+"한식";
			if(addressCut.get(i).getJapanfood()==1) category = category+"일식";
			if(addressCut.get(i).getChinafood()==1) category = category+"중식";
			if(addressCut.get(i).getWesternfood()==1) category = category+"양식";
			if(addressCut.get(i).getEtcfood()==1) category = category+"기타";
			
			String option = "";
			if(addressCut.get(i).getPark()==1) option = option+" / 주차가능";
			if(addressCut.get(i).getPartition2()==1) option = option+" / 칸막이";
			if(addressCut.get(i).getDrink()==1) option = option+" / 혼술";
			if(addressCut.get(i).getTable2()==1) option = option+" / 2인테이블";
			if(addressCut.get(i).getCalculator()==1) option = option+" / 무인계산기";
			
			addressCut.get(i).setCategory(category);
			addressCut.get(i).setOption(option);
				
			
		}		
		return addressCut;
	}
	
	public int count(RestaurantVO resVO) {
		return HonmukDao.count(resVO);
	}		
	
	//최근방문 맛집 내 주소표시를 위한 글자세팅
	public List<RestaurantVO> visitList(List<String> visit_num) {
		List<RestaurantVO> visitlist = HonmukDao.visitList(visit_num);
		
		//지역코드를 뷰페이지에서 사용하기 위해 문자 세팅.
		for(int i=0; i<visitlist.size(); i++) {
			if(visitlist.get(i).getGu()==1)visitlist.get(i).setAddressCut("강남구");
			if(visitlist.get(i).getGu()==2)visitlist.get(i).setAddressCut("강동구");
			if(visitlist.get(i).getGu()==3)visitlist.get(i).setAddressCut("강북구");
			if(visitlist.get(i).getGu()==4)visitlist.get(i).setAddressCut("강서구");
			if(visitlist.get(i).getGu()==5)visitlist.get(i).setAddressCut("관악구");
			if(visitlist.get(i).getGu()==6)visitlist.get(i).setAddressCut("광진구");
			if(visitlist.get(i).getGu()==7)visitlist.get(i).setAddressCut("구로구");
			if(visitlist.get(i).getGu()==8)visitlist.get(i).setAddressCut("금천구");
			if(visitlist.get(i).getGu()==9)visitlist.get(i).setAddressCut("노원구");
		}
		return visitlist;
	}		


}
