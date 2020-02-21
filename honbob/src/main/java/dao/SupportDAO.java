package dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import util.PagingOption;
import vo.support.SupportEditRequest;
import vo.support.SupportVO;

import java.util.List;

@Repository
public class SupportDAO {
    @Autowired
    SqlSessionTemplate sqlSession;

    public int countSupport() {
    	return sqlSession.selectOne("Support.countSupport");
    }
    public List<SupportVO> getSupports(PagingOption pagingOption) {
        return sqlSession.selectList("Support.getSupports", pagingOption);
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

    public void deleteSupport(int supportDocumentId) { int result = sqlSession.delete("Support.deleteSupport", supportDocumentId);
    }
}
