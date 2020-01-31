package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.HonmukDetailDAO;
import vo.RestaurantImageVO;
import vo.RestaurantVO;

@Service
public class HonmukDetailService {

	@Autowired
	HonmukDetailDAO HonmukDao;
	
	public List<RestaurantVO> searchList(RestaurantVO resVO){		
		
		List<RestaurantVO> addressCut = HonmukDao.searchList(resVO);
		
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
	
	public int count() {
		return HonmukDao.count();
	}
	//리스트 가져오기
	public List<RestaurantVO> getList() {
		return HonmukDao.getList();
		
	}
	//이미지DB 등록
	public int registImageVO(RestaurantImageVO resImageVo) {
		return HonmukDao.registImageVO(resImageVo);
	}
	//식당 정보 가져오기
	public RestaurantVO getRestaurantById(int res_num) {
		return HonmukDao.getRestaurantById(res_num);
	}
	//식당 사진 가져오기
	public List<RestaurantImageVO> getRestaurantImageById(int res_num) {
		return HonmukDao.getImageList(res_num);
	}
	//추천 식당 정보가져오기

	//조회수 올리기
	public int upViewCount(int res_num) {
		return HonmukDao.upViewCount(res_num);
	}
	
	//리뷰 가져오기
}
