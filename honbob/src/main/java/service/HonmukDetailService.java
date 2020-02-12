package service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.HonmukDetailDAO;
import vo.GradeVO;
import vo.RestaurantImageVO;
import vo.RestaurantVO;
import vo.review.ReviewVO;

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
	//별점 구해서 리턴
	public Double getGrade(int res_num) {
		//별점 합
		int gradeSum = 0;
		//별점 한사람수
		int gradeCnt = HonmukDao.getGradeCnt(res_num);
		if(gradeCnt == 0) {
			gradeCnt = 1;
		}else {
			gradeSum = HonmukDao.getGradeSum(res_num);
		}
		
		//별점 계산
		return (double)gradeSum/(double)gradeCnt;
	}
	//추천 식당
	public List<RestaurantVO> getRecommandRestuarant(RestaurantVO restDetail) {
		//주변식당 리스트 n개를 추출하고 그중에 가장 리뷰수혹은 조회수가 높은 식당을 가지고 오는 sql을 사용할 것.
		return HonmukDao.getRecommnadRestaurant(restDetail);
	}
	//식당 리뷰 가져오기
	public List<ReviewVO> getReviewList(int res_num) {
		return HonmukDao.getReviewList(res_num);
	}
	//현재있는 별점 찾아오기
	public int getUserGrade(GradeVO gradevo) {
		int userGrade = HonmukDao.getUserGrade(gradevo);
		System.out.println(userGrade);
		return userGrade;
	}
	//insertGrade
	public int insertGrade(GradeVO gradevo) {
		return HonmukDao.insertGrade(gradevo);
	}
	//updateGrade
	public int updateGrade(GradeVO gradevo) {
		return HonmukDao.updateGrade(gradevo);
	}
	//deleteGrade
	public int deleteGrade(GradeVO gradevo) {
		return HonmukDao.deleteGrade(gradevo);
	}

	public List<RestaurantImageVO> getRecommandImage(List<RestaurantVO> recomRest) {
		//들어있는 3개의 식당에서 식당번호를 뽑아서 대표이미지를 가져와서 저장하면된다.
		List<RestaurantImageVO> recomImageList = new ArrayList<RestaurantImageVO>();
		
		for(int i=0;i<recomRest.size();i++) {
			
			recomImageList.add(HonmukDao.getBestImage(recomRest.get(i).getRes_num()));
		}
		
		return recomImageList;
	}
	
	//리뷰 가져오기
}
