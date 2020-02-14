function ajaxView(star_count,res_num,userNo){
	//var data = $("#frm").serialize();
	$.ajax({
		url : 'starAjax.do',
		data :{
			'star_count' : star_count,
			'res_num' : res_num,
			'userNo' : userNo
		},
		dataType : 'JSON',
		success : function(data){
			star_cnt = data.new_star_count;
			detail_grade(data.new_star_count);
			document.getElementById("detail_grade_count").innerHTML = data.current_grade_count;
			document.getElementById("restaurant_grade_text").innerHTML = data.current_res_grade;
		},
		error : function(data){ 
			console.log(data);
		}
	});
}
function load()
{
	detail_grade(star_cnt);
}
$(function() {
	$('#detail_count_picture1').on('mouseenter',function() {
		detail_grade(1);
		
	}).on('mouseleave',function(){
		detail_grade(star_cnt);
	});
	$('#detail_count_picture2').on('mouseenter',function() {
		detail_grade(2);
		
	}).on('mouseleave',function(){
		detail_grade(star_cnt);
	});
	$('#detail_count_picture3').on('mouseenter',function() {
		detail_grade(3);
		
	}).on('mouseleave',function(){
		detail_grade(star_cnt);
	});
	$('#detail_count_picture4').on('mouseenter',function() {
		detail_grade(4);
		
	}).on('mouseleave',function(){
		detail_grade(star_cnt);
	});
	$('#detail_count_picture5').on('mouseenter',function() {
		detail_grade(5);
		
	}).on('mouseleave',function(){
		detail_grade(star_cnt);
	});
	
});
function detail_grade(star_count) {
	if(star_count==0){
		$('#detail_count_picture1').attr("src","images/detail/grade_star_off.jpg");
		$('#detail_count_picture2').attr("src","images/detail/grade_star_off.jpg");
		$('#detail_count_picture3').attr("src","images/detail/grade_star_off.jpg");
		$('#detail_count_picture4').attr("src","images/detail/grade_star_off.jpg");
		$('#detail_count_picture5').attr("src","images/detail/grade_star_off.jpg");
   }else if(star_count==1){
		$('#detail_count_picture1').attr("src","images/detail/grade_star_on.jpg");
		$('#detail_count_picture2').attr("src","images/detail/grade_star_off.jpg");
		$('#detail_count_picture3').attr("src","images/detail/grade_star_off.jpg");
		$('#detail_count_picture4').attr("src","images/detail/grade_star_off.jpg");
		$('#detail_count_picture5').attr("src","images/detail/grade_star_off.jpg");
   }else if(star_count==2){
		$('#detail_count_picture1').attr("src","images/detail/grade_star_on.jpg");
		$('#detail_count_picture2').attr("src","images/detail/grade_star_on.jpg");
		$('#detail_count_picture3').attr("src","images/detail/grade_star_off.jpg");
		$('#detail_count_picture4').attr("src","images/detail/grade_star_off.jpg");
		$('#detail_count_picture5').attr("src","images/detail/grade_star_off.jpg");
   }else if(star_count==3){
		$('#detail_count_picture1').attr("src","images/detail/grade_star_on.jpg");
		$('#detail_count_picture2').attr("src","images/detail/grade_star_on.jpg");
		$('#detail_count_picture3').attr("src","images/detail/grade_star_on.jpg");
		$('#detail_count_picture4').attr("src","images/detail/grade_star_off.jpg");
		$('#detail_count_picture5').attr("src","images/detail/grade_star_off.jpg");
   }else if(star_count==4){
		$('#detail_count_picture1').attr("src","images/detail/grade_star_on.jpg");
		$('#detail_count_picture2').attr("src","images/detail/grade_star_on.jpg");
		$('#detail_count_picture3').attr("src","images/detail/grade_star_on.jpg");
		$('#detail_count_picture4').attr("src","images/detail/grade_star_on.jpg");
		$('#detail_count_picture5').attr("src","images/detail/grade_star_off.jpg");
   }else if(star_count==5){
		$('#detail_count_picture1').attr("src","images/detail/grade_star_on.jpg");
		$('#detail_count_picture2').attr("src","images/detail/grade_star_on.jpg");
		$('#detail_count_picture3').attr("src","images/detail/grade_star_on.jpg");
		$('#detail_count_picture4').attr("src","images/detail/grade_star_on.jpg");
		$('#detail_count_picture5').attr("src","images/detail/grade_star_on.jpg");
   }
}