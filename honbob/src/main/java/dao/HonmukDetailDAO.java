package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.RestaurantImageVO;
import vo.RestaurantVO;

@Repository
public class HonmukDetailDAO {

	@Autowired
	SqlSessionTemplate sqlSession;	
	
	public List<RestaurantVO> searchList(RestaurantVO resVO){		
		return sqlSession.selectList("Honmuk.searchList", resVO);
	}  
	
	public int count() {
		return sqlSession.selectOne("Honmuk.searchCount");
	}

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
	public RestaurantImageVO getBestImageList(int res_num){
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
}
