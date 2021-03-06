package vo;

import java.util.List;

public class RestaurantVO {

	private int res_num;
	//식당이름
	private String res_name;
	//좋아요,별점
	private double grade;
	//조회수
	private int readcount;
	//주소
	private String address;
	//위도
	private double latitude;
	//경도
	private double longitude;
	//리뷰한사람
	private int reviewcount;
	//별점한 사람
	private int gradecount;
	
	
	//한식
	private int koreafood;
	//즁식
	private int chinafood;
	//일식
	private int japanfood;
	//양식
	private int westernfood;
	//기타
	private int etcfood;
	
	
	//혼술가능
	private int drink;
	//칸막이
	private int partition2;
	//무인계산기
	private int calculator;
	//주차
	private int park;
	//2인테이블
	private int table2;	
	
	//페이징 처리를 위한 값
	private int page;
	private int limit;
	private int startIndex;	
	private int count;

	
	//키워드
	private String keyword;
	
	//화면에 표시할 식당정보(한식,중식 .. 강남구.. 칸막이..)를 위해 문자를 담아둘 객체
	private String addressCut;
	private String category;
	private String option;
	
	//식당 대표이미지를 담아둘 객체
	private String res_image_name;	
	
	//최근방문식당 데이터 담아둘 객체
	private List<String> visit_num;
	
	//지역코드 담을 객체
	private int gu;
	
	
	public int getGu() {
		return gu;
	}

	public void setGu(int gu) {
		this.gu = gu;
	}

	public List<String> getVisit_num() {
		return visit_num;
	}

	public void setVisit_num(List<String> visit_num) {
		this.visit_num = visit_num;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getRes_image_name() {
		return res_image_name;
	}

	public void setRes_image_name(String res_image_name) {
		this.res_image_name = res_image_name;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getAddressCut() {
		return addressCut;
	}

	public void setAddressCut(String addressCut) {
		this.addressCut = addressCut;
	}

	public String getKeyword() {
		return keyword == null ? "" : keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	//초기 페이지 세팅, 1페이지당 표시될 데이터값 갯수 설정.
	public RestaurantVO() {
		this.page=1; 
		this.limit=10;
	}
	
	//페이지당 표시될 db데이터의 시작 인덱스 설정 (1페이지 0~9, 2페이지 10~19 ...)
	public int getStartIndex() {
		int i = (this.page-1)*this.limit;
		return i;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}	
	
	
	public int getKoreafood() {
		return koreafood;
	}
	public void setKoreafood(int koreafood) {
		this.koreafood = koreafood;
	}
	public int getChinafood() {
		return chinafood;
	}
	public void setChinafood(int chinafood) {
		this.chinafood = chinafood;
	}
	public int getJapanfood() {
		return japanfood;
	}
	public void setJapanfood(int japanfood) {
		this.japanfood = japanfood;
	}
	public int getWesternfood() {
		return westernfood;
	}
	public void setWesternfood(int westernfood) {
		this.westernfood = westernfood;
	}
	public int getEtcfood() {
		return etcfood;
	}
	public void setEtcfood(int etcfood) {
		this.etcfood = etcfood;
	}
	public int getDrink() {
		return drink;
	}
	public void setDrink(int drink) {
		this.drink = drink;
	}
	public int getPartition2() {
		return partition2;
	}
	public void setPartition2(int partition) {
		this.partition2 = partition;
	}
	public int getCalculator() {
		return calculator;
	}
	public void setCalculator(int calculator) {
		this.calculator = calculator;
	}
	public int getPark() {
		return park;
	}
	public void setPark(int park) {
		this.park = park;
	}
	public int getTable2() {
		return table2;
	}
	public void setTable2(int table) {
		this.table2 = table;
	}
	public int getRes_num() {
		return res_num;
	}
	public void setRes_num(int res_num) {
		this.res_num = res_num;
	}
	public String getRes_name() {
		return res_name;
	}
	public void setRes_name(String res_name) {
		this.res_name = res_name;
	}
	public double getGrade() {
		return grade;
	}
	public void setGrade(double grade) {
		this.grade = grade;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public int getReviewcount() {
		return reviewcount;
	}
	public void setReviewcount(int reviewcount) {
		this.reviewcount = reviewcount;
	}
	public int getGradecount() {
		return gradecount;
	}
	public void setGradecount(int gradecount) {
		this.gradecount = gradecount;
	}
}
