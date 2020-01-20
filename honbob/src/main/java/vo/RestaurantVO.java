package vo;

public class RestaurantVO {
	//식당 번호
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
	private double longtitude;
	//리뷰한사람
	private int reviewcount;
	//별점한 사람
	private int gradecount;
	
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
	public double getLongtitude() {
		return longtitude;
	}
	public void setLongtitude(double longtitude) {
		this.longtitude = longtitude;
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
