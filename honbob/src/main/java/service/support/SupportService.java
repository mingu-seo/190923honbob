package service.support;

import dao.SupportDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vo.SupportVO;

import java.util.ArrayList;
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
}