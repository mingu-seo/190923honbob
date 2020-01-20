package vo;

public class RestaurantImageVO {
	//식당사진번호
	private int res_image_num;
	//식당번호
	private int res_num;
	//대표사진여부
	private int best_image;
	//사진이름
	private String res_image_name;
	
	public int getRes_image_num() {
		return res_image_num;
	}
	public void setRes_image_num(int res_image_num) {
		this.res_image_num = res_image_num;
	}
	public int getRes_num() {
		return res_num;
	}
	public void setRes_num(int res_num) {
		this.res_num = res_num;
	}
	public int getBest_image() {
		return best_image;
	}
	public void setBest_image(int best_image) {
		this.best_image = best_image;
	}
	public String getRes_image_name() {
		return res_image_name;
	}
	public void setRes_image_name(String res_image_name) {
		this.res_image_name = res_image_name;
	}
	
	
	
}
