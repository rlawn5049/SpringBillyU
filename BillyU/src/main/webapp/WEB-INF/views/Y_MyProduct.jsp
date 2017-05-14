<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="product.proDAO" %>
<%@ page import="product.proDTO" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="product_list" class="product.proDAO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<style>
.toggles {
  width: 800px;
  margin: auto;
  display: block;
  clear: both;
  overflow: hidden;
}

.button {
  border: 2px solid #D8D8D8;
  border-radius: 40px;
  color: #5E610B;
  display: block;
  float: left;
  margin: auto;
  padding: 10px;
  width: 150px;
  cursor: pointer;
  font-size: 14px;
  margin: 5px 5px;
}

.posts {
  width: 800px;
  margin: 2em auto;
}

.panel-group{
  font: 16px/18px Arial;
  width: 1000px;
  height: 150px;
  margin: 10px auto;
  display: block;
  text-align: center;
}
.img-rounded{
width:100%;
height:100%;
}

</style>
</head>
<body>
<div id="wrapper">
<center>
<div style="width:1000px">
<h2 id="Y_result" style="float:left;display:inline-block;">내가등록한상품</h2>
<div style="background:#428bca;width:20px;height:20px;display:inline-block;float:right"> </div><p style="display:inline-block;float:right">대여</p>
<div style="background:#ebcccc;width:20px;height:20px;display:inline-block;float:right"> </div><p style="display:inline-block;float:right">판매</p>
</div>
</center>

<div class="panel-group posts" style="clear:both">
<%
	ArrayList<proDTO> pro_mylist = product_list.MyPage(session.getAttribute("id"));
	String Y_Category="";
	String cate_name="";
	
	for(int i=0;i<pro_mylist.size();i++){
		proDTO dto = pro_mylist.get(i);
		int pronum = dto.getPronum();
		String img = dto.getImg();
		String title = dto.getTitle();
		int renprice = dto.getRenprice();
		int deposite = dto.getDeposit();
		int renday = dto.getRenday();
		String tratype = dto.getTratype();
		int salprice = dto.getSalprice();
		int catnum = dto.getCatnum();
		String proinfo = dto.getProinfo();
		
		if(catnum<200 && catnum>100){
			Y_Category="cate1";
			cate_name="의류";
		}else if(catnum<300 && catnum>200){
			Y_Category="cate2";
			cate_name="잡화";
		}else if(catnum<400 && catnum>300){
			Y_Category="cate3";
			cate_name="유아동";
		}else if(catnum<500 && catnum>400){
			Y_Category="cate4";
			cate_name="식품";
		}else if(catnum<600 && catnum>500){
			Y_Category="cate5";
			cate_name="생필품";
		}else if(catnum<700 && catnum>600){
			Y_Category="cate6";
			cate_name="홈데코";
		}else if(catnum<800 && catnum>700){
			Y_Category="cate7";
			cate_name="건강";
		}else if(catnum<900 && catnum>800){
			Y_Category="cate8";
			cate_name="문구";
		}else if(catnum<1000 && catnum>900){
			Y_Category="cate9";
			cate_name="스포츠";
		}else if(catnum<1100 && catnum>1000){
			Y_Category="cate10";
			cate_name="자동차";
		}else if(catnum<1200 && catnum>1100){
			Y_Category="cate11";
			cate_name="가전";
		}else if(catnum<1300 && catnum>1200){
			Y_Category="cate12";
			cate_name="디지털";
		}else if(catnum<1400 && catnum>1300){
			Y_Category="cate13";
			cate_name="컴퓨터";
		}else if(catnum<1500 && catnum>1400){
			Y_Category="cate14";
			cate_name="도서";
		}else if(catnum<1600 && catnum>1500){
			Y_Category="cate15";
			cate_name="여행";
		}else if(catnum<1700 && catnum>1600){
			Y_Category="cate16";
			cate_name="티켓";
		}
		
		if(tratype.equals("대여"))
		{
			%>
	<div class="panel panel-primary <%=Y_Category%> post">
      <div class="panel-heading" style="height:32px"><span style="float:left">상품번호(<%=pronum %>)</span><span style="text-align:center;">대여상품(<%=cate_name %>)</span><span style="float:right"><a style="color:white" href="#">X</a></span></div>
      <div class="panel-body">
      <div class="col-xs-3 col-md-3"><a href="K_view.jsp?pronum=<%=pronum %>"><img class="img-rounded" src="<%=img %>" alt="사진없음" /></a></div>
      <div class="col-xs-6 col-md-3"><a href="K_view.jsp?pronum=<%=pronum %>"><%=title %></a></div>
      <div class="col-xs-1 col-md-2">대여료(원)<br /><br /><%=renprice %></div>
      <div class="col-xs-1 col-md-2">보증금(원)<br /><br /><%=deposite %></div>
      <div class="col-xs-1 col-md-2">대여기간(일)<br /><br /><%=renday %></div>
      </div>
    </div>
			<%
		}else{
			%>
	<div class="panel panel-danger <%=Y_Category%> post">
      <div class="panel-heading" style="height:32px"><span style="float:left">상품번호(<%=pronum %>)</span><span style="text-align:center;">판매상품(<%=cate_name %>)</span><span style="float:right"><a style="color:white" href="#">X</a></span></div>
      <div class="panel-body">
      <div class="col-xs-3 col-md-3"><a href="K_view.jsp?pronum=<%=pronum %>"><img class="img-rounded" src="<%=img %>" alt="사진없음" /></a></div>
      <div class="col-xs-6 col-md-3"><a href="K_view.jsp?pronum=<%=pronum %>"><%=title %></a></div>
      <div class="col-xs-1 col-md-2"><br /><br /></div>
      <div class="col-xs-1 col-md-2">물품상태<br /><br /><%=proinfo %></div>
      <div class="col-xs-1 col-md-2">판매가격<br /><br /><%=salprice %></div>
      </div>
    </div>
			<%
		}
	}
%>
    <br />
  </div>
</div>
<br />
<script>
$(document).ready(function() {
    $('.toggles button').click(function(){
      var get_id = this.id;
      var get_current = $('.posts .' + get_id);
      var name = $(this).attr('value');
      $('#Y_result').text('"'+name+'"'+" 검색결과");
  
        $('.post').not( get_current ).hide(500);
        get_current.show(500);
    });
    $('#showall').click(function() {
        $('.post').show(500);
    });
}); 

    </script>
</body>
</html>