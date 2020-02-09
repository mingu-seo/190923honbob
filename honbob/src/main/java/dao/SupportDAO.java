package dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import vo.support.SupportEditRequest;
import vo.support.SupportVO;

import java.util.List;

@Repository
public class SupportDAO {
    @Autowired
    SqlSessionTemplate sqlSession;

    public List<SupportVO> getSupports(int userId) {
        return sqlSession.selectList("Support.getSupports", userId);
    }

    public SupportVO getSupport(int supportDocumentId) {
        SupportVO vo = sqlSession.selectOne("Support.getSupport", supportDocumentId);
        return vo;
    }

    public void insertSupport(SupportVO vo) {
        int result = sqlSession.insert("Support.insertSupport", vo);
    }

    public void updateSupport(SupportEditRequest requestVo) {
        sqlSession.update("Support.updateSupport", requestVo);
    }
}
