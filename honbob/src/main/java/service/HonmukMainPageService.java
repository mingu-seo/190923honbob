package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.HonmukMainPageDAO;
import vo.RestaurantVO;


@Service
public class HonmukMainPageService {
	
	@Autowired
	private HonmukMainPageDAO mainpageDAO;
	
	public List<RestaurantVO> mainList(vo.RestaurantVO rvo){
		return mainpageDAO.mainList(rvo);
	}

	

}
