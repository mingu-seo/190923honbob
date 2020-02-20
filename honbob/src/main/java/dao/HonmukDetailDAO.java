package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.GradeVO;
import vo.RestaurantImageVO;
import vo.RestaurantVO;
import vo.UserVO;
import vo.review.ReviewVO;

@Repository
public class HonmukDetailDAO {

	@Autowired
	SqlSessionTemplate sqlSession;		
	
	public List<RestaurantVO> getList() {
		
		return sqlSession.selectList("Honmuk.getList");
	}
	//식당 사진 데이터베이스 등록
	public int registImageVO(RestaurantImageVO resImageVo) {
		return sqlSession.insert("Honmuk.registImageVO", resImageVo);
	}
	//식당 사진 가져오기
	public List<RestaurantImageVO> getImageList(int res_num){
		return sqlSession.selectList("Honmuk.getImage", res_num);
	}
	//식당 대표사진 가져오기
	public RestaurantImageVO getBestImage(int res_num){
		return sqlSession.selectOne("Honmuk.getBestImage", res_num);
	}
	//식당 정보 가져오기
	public RestaurantVO getRestaurantById(int res_num) {
		return sqlSession.selectOne("Honmuk.getRestaurantById",res_num);
	}
	//조회수 올리기
	public int upViewCount(int res_num) {
		return sqlSession.update("Honmuk.upViewCount",res_num);
	}
	//별점 합 가져오기
	public int getGradeSum(int res_num) {
		return sqlSession.selectOne("Honmuk.getGradeSum",res_num);
	}
	//별점한 사람수
	public int getGradeCnt(int res_num) {
		return sqlSession.selectOne("Honmuk.getGradeCnt",res_num);
	}
	//추천 식당 가져오기
	public List<RestaurantVO> getRecommnadRestaurant(RestaurantVO restDetail) {
		return sqlSession.selectList("Honmuk.getRecommandRestaurant", restDetail);
	}
	
	//유저가 별점한건지 가져오기
	public int getUserGrade(GradeVO gradevo) {
		if (sqlSession.selectOne("Honmuk.getUserGrade", gradevo)==null) {
			return 0;
		}else {
			return sqlSession.selectOne("Honmuk.getUserGrade", gradevo);
		}
		
	}
	//insertGrade
	public int insertGrade(GradeVO gradevo) {
		return sqlSession.insert("Honmuk.insertGrade", gradevo);
	}
	//updateGrade
	public int updateGrade(GradeVO gradevo) {
		return sqlSession.update("Honmuk.updateGrade", gradevo);
	}
	//deleteGrade
	public int deleteGrade(GradeVO gradevo) {
		return sqlSession.delete("Honmuk.deleteGrade", gradevo);
	}
	//별점정보 레스토랑 테이블에 넣기
	public int updateRestuarantGrade(RestaurantVO resVO) {
		return sqlSession.update("Honmuk.updateRestaurantGrade",resVO);
	}
	//리뷰 가져오기
	public List<ReviewVO> getReviewList(int res_num) {
		return sqlSession.selectList("Honmuk.getReviewList", res_num);
	}
	//유저정보 가지고오기
	public UserVO getUserInfo(String userNo) {
		//return sqlSession.selectOne("Honmuk.getUserInfo",userNo);
		return null;
	}
	//리뷰 숫자 가져오기
	public int getReviewCount(int res_num) {
		return sqlSession.selectOne("Honmuk.getReviewCount",res_num);
	}
}
