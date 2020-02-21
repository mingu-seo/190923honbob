package service.support;

import dao.SupportDAO;
import util.PagingOption;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vo.support.SupportEditRequest;
import vo.support.SupportVO;

import java.util.Calendar;
import java.util.List;

@Service
public class SupportService {
    @Autowired
    private SupportDAO supportDao;
    
    public int countSupport() {
        return supportDao.countSupport();
    }

    public List<SupportVO> getLatestSupports(PagingOption pagingOption) {
        List<SupportVO> results = supportDao.getSupports(pagingOption);
        return results;
    }

    public SupportVO getSupportDetail(int supportDocumentId) {
        SupportVO supportVO = supportDao.getSupport(supportDocumentId);
        return supportVO;
    }

    public void insertSupport(SupportVO vo) {
        supportDao.insertSupport(vo);
    }

    public void updateSupport(SupportEditRequest requestVo) {
        supportDao.updateSupport(requestVo);
    }

    public void deleteSupport(int supportDocumentId) {
        supportDao.deleteSupport(supportDocumentId);
    }
}