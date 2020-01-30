package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.HonmukDetailDAO;
import vo.RestaurantImageVO;
import vo.RestaurantVO;

@Service
public class HonmukDetailService {

	@Autowired
	HonmukDetailDAO HonmukDao;
	
	public List<RestaurantVO> searchList(RestaurantVO resVO){		
		return HonmukDao.searchList(resVO);
	}
	
	public int count() {
		return HonmukDao.count();
	}

	public List<RestaurantVO> getList() {
		return HonmukDao.getList();
		
	}

	public int registImageVO(RestaurantImageVO resImageVo) {
		return HonmukDao.registImageVO(resImageVo);
	}
	
}
