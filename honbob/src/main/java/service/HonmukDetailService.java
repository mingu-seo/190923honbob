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
		//이용하여 4개의 리스트를 가져와서 중복을 제거하고 3개만을 줄것임
		//탑4 리스트를 가지고 온다.
		List<RestaurantVO> RecommandList = HonmukDao.getRecommnadRestaurant(restDetail);
		//중복을 검사한다.
		boolean dupl_res = false;
		int count_dupl = 0;
		for(int i = 0;i<RecommandList.size();i++) {
			if(RecommandList.get(i).getRes_num()==restDetail.getRes_num()) {
				dupl_res = true;
				count_dupl = i;
			}
		}
		//중복이 있을경우 - 중복된 경우의 수를 삭제한 리스트를 만든다.
		if(dupl_res) {
			RecommandList.remove(count_dupl);
		}
		//중복이 없을경우 - 그냥 4번째를 삭제한다.
		else {
			RecommandList.remove(3);
		}
		return RecommandList;
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

	public List<String> getRecommandGrade(List<RestaurantVO> recomRest) {
		List<String> recomGradeList = new ArrayList<String>();
		
		for(int i=0;i<recomRest.size();i++) {
			//별점 합
			int gradeSum = 0;
			//별점 한사람수
			int gradeCnt = HonmukDao.getGradeCnt(recomRest.get(i).getRes_num());
			if(gradeCnt == 0) {
				gradeCnt = 1;
			}else {
				gradeSum = HonmukDao.getGradeSum(recomRest.get(i).getRes_num());
			}
			
			//별점 계산
			
			recomGradeList.add(String.format("%.1f", (double)gradeSum/(double)gradeCnt));
			
		}
		
		return recomGradeList;
	}

	public int getGradeCnt(int res_num) {
		return HonmukDao.getGradeCnt(res_num);
	}
	
	//리뷰 가져오기
}
