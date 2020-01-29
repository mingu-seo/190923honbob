package service;

import org.springframework.stereotype.Service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

@Service
public class HonmukDetailService {
	
	@Autowired
	HonmukDAO HonmukDao;
	
	public List<RestaurantVO> searchList(RestaurantVO resVO){		
		return HonmukDao.searchList(resVO);
	}
	
	public int count() {
		return HonmukDao.count();
	}
}
