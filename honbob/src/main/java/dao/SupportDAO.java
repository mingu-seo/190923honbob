package dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import vo.RestaurantVO;
import vo.SupportVO;

import java.util.List;

@Repository
public class SupportDAO {
    @Autowired
    SqlSessionTemplate sqlSession;

    public List<SupportVO> getSupports(int userId) {
        return sqlSession.selectList("Support.getSupports", userId);
    }
}
