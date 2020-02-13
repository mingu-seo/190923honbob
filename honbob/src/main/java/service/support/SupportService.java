package service.support;

import dao.SupportDAO;
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

    public List<SupportVO> getLatestSupports(int userId) {
        List<SupportVO> results = supportDao.getSupports(userId);
        return results;
    }

    public SupportVO getSupportDetail(int supportDocumentId) {
        SupportVO supportVO = supportDao.getSupport(supportDocumentId);
        return supportVO;
    }

    public void insertSupport(SupportVO vo) {
        java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTime().getTime());
        vo.setRegistdate(date);
        vo.setUser_userId(1);
        supportDao.insertSupport(vo);
    }

    public void updateSupport(SupportEditRequest requestVo) {
        supportDao.updateSupport(requestVo);
    }

    public void deleteSupport(int supportDocumentId) {
        supportDao.deleteSupport(supportDocumentId);
    }
}