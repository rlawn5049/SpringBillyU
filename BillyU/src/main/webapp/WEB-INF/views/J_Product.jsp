<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ok">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>bootlayout</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery.js"></script>

<style>
/* ���⼭ ���� */
.J_aell{
text-align: center;
}
.container{
background-color: #f8f8f8;
}
.J_container {
	margin-left: 15%;
	margin-right: 15%;
	text_align: center;
	width: 450px;
	margin: 0 auto;
}
h1, h2, h3, h4 {
	margin: 30px 0px;
}

.J_head {
	margin: 15px 0px;
	border: 1px solid #cccccc;
	text-align: center;
}
.J_text{
	margin: 15px 0px;
	text-align: center;
}
.J_form-group {
	float: right;
}
.J_submit{
margin: 15px 0px;
border: 1px solid #cccccc;
float: right;
}
.J_blank{
}
.J_cancel{
margin: 15px 0px;
border: 1px solid #cccccc;
float: left;
}
/* ������� �̹��� ��Ÿ��*/
/* Tab menu style*/

.J_tabs {
	list-style: none;
	border-bottom: 1px solid #eee;
	border-left: 1px solid #eee;
	width: 450px;
	font-family: "dotum";
	margin: 0;
	padding: 0;
	height: 32px;
	float: left;
	font-size: 30px;
}

ul.J_tabs li {
	float: left;
	text-align: center;
	cursor: pointer; /*���콺 �����͸� ������ �հ������� ����*/
	height: 31px;
	line-height: 31px;
	border: 1px solid #eee; /* ����,���� ĭ�� �����ִ� �� */
	font-weight: bold;
	background: #fafafa;
	overflow: hidden;
	position: relative;
}

.J_tabs2 {
	list-style: none;
	float: left;
}

ul.J_tabs li.active {
	background: #FFFFFF;
	border-bottom: 1px solid #FFFFFF;
}

.J_tab_container {
	border: 1px solid #eee;
	border-top: none;
	clear: both;
	float: left;
	width: 450px;
	hegith: 1170px;
	background: #FFFFFF;
}

.J_tab_content {
	padding: 5px;
	font-size: 12px;
	display: none;
}

.J_tab_container .J_tab_content ul {
	width: 100%;
	margin: 0px;
	padding: 0px;
}

.J_tab_container .J_tab_content ul li {
	padding: 5px;
	list-style: none
}
/* Tab menu style end */
</style>
</head>
<body>
<form action="J_Prowork.jsp" method="post">
<jsp:include page="Y_NavBar.jsp" />
	<div class="container">
		<!-- �̹��� ���� -->
		<div class="row">
			<div class="col-sm-6">
				<div class="J_aell">
					<div style="max-width: 650px; margin: auto;">
						<h1>�̹����� �÷��ּ���</h1>
						<p class="lead">
							�̹����� PNG,JPG�� ���ּ���<span id="max-size"></span>
						</p>
						<form id="upload-image-form" action="" method="post"
							enctype="multipart/form-data">
							<div id="image-preview-div">
								<label for="exampleInputFile">���õ� ���� :</label> <br> <img
									id="preview-img" src="img/noimage.JPG">
							</div>
							<div class="J_form-group">
								<input type="file" name="file" id="file" required>
							</div>
						</form>

						<br>
						<div class="alert alert-info" id="loading" style="display: none;"
							role="alert">
							Uploading image...
							<div class="progress">
								<div class="progress-bar progress-bar-striped active"
									role="progressbar" aria-valuenow="45" aria-valuemin="0"
									aria-valuemax="100" style="width: 100%"></div>
							</div>
						</div>
						<div id="message"></div>
					</div>
				</div>
			</div>
		<!-- �̹��� �� -->
		<!-- tab menu start -->
			<div class="col-sm-6">
				<div class="J_container">
					<ul class="J_tabs">
						<li class="active" rel="tab1">�뿩</li>
						<li rel="tab2">�Ǹ�</li>
					</ul>
					<div class="J_tab_container">
						<div id="tab1" class="J_tab_content">
							<ul class="J_tabs2">
								<li>
									<label for="J_r_title">����:</label>
      								<input type="text" class="form-control" id="J_r_title" placeholder="������ �Է����ּ���.">
								</li>
								<li>
									<label for="J_rent">�뿩��:</label>
      								<input type="text" class="form-control" id="J_rent" placeholder="�뿩�Ḧ �Է��� �ּ���.">
								</li>
								<li>
									<label for="J_deposit">������:</label>
      								<input type="text" class="form-control" id="J_deposit" placeholder="�������� �Է��� �ּ���.">
								</li>
								<li>
									�뿩�ϼ� : <input type="text">
								</li>
								<li>ī�װ� : <select name="J_category">
									<option value="����">ī�װ�����</option>
									<option value="������ǰ">������ǰ</option>
									<option value="�Ƿ�">�Ƿ�</option>
									<option value="��Ÿ">��Ÿ</option>
									</select>
								</li>
									<li>�ŷ� ��� : <label><input type="radio" name="J_deal" value="���ŷ�">���ŷ�</label>
												<label><input type="radio" name="J_deal" value="�ù�">�ù�</label>
												<label><input type="radio" name="J_deal" value="�Ѵٰ���">�������</label>
												
									</li>
									<li>��ǰ���� : <label><input type="radio" name="J_state" value="��ȣ">��ȣ</label>
												<label><input type="radio" name="J_state" value="����">����</label>
												<label><input type="radio" name="J_state" value="�ſ�����">�ſ�����</label>
									</li>
								<li>
									<label>�󼼼���:</label>
  									<textarea class="form-control" rows="5" id="J_comment"></textarea>
								</li>
								<li>
									<input type="submit" value="���" class="btn btn-default">
									<input type="reset" value="���" class="btn btn-default">
								</li>
							</ul>
						</div>
					
						<!-- #tab1 -->
						<div id="tab2" class="J_tab_content">
							<ul>
								<li>
									<label for="J_s_title">����:</label>
      								<input type="text" class="form-control" id="J_s_title" placeholder="������ �Է����ּ���.">
								</li>
								<li>
									<label for="J_monsell">�Ǹŷ�:</label>
      								<input type="text" class="form-control" id="J_monsell" placeholder="�Ǹűݾ��� �Է����ּ���.">
								</li>
								<li>
									
								</li>
								<li>ī�װ� : <select name="J_category">
										<option value="">ī�װ�����</option>
										<option value="������ǰ">������ǰ</option>
										<option value="�Ƿ�">�Ƿ�</option>
										<option value="��Ÿ">��Ÿ</option>
									</select>
								</li>
								<li>�ŷ� ��� : <label><input type="radio" name="J_deal" value="���ŷ�">���ŷ�</label>
												<label><input type="radio" name="J_deal" value="�ù�">�ù�</label>
												<label><input type="radio" name="J_deal" value="�Ѵٰ���">�������</label>
								</li>
								<li>
									��ǰ���� : <label><input type="radio" name="J_state" value="��ȣ">��ȣ</label>
												<label><input type="radio" name="J_state" value="����">����</label>
												<label><input type="radio" name="J_state" value="�ſ�����">�ſ�����</label>
								</li>
								<li>
									<label for="J_comment">�󼼼���:</label>
  									<textarea class="form-control" rows="5" id="J_comment"></textarea>
								</li>
								<li>
									<input type="submit" value="input" class="btn btn-default">
									<input type="reset" value="input" class="btn btn-default">
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
</body>
<script type="text/javascript">
/*image Jquery*/
function noPreview() {
  $('#image-preview-div').css("display", "none");
  $('#preview-img').attr('src', 'noimage');
  $('upload-button').attr('disabled', '');
}
function selectImage(e) {
  $('#file').css("color", "green");
  $('#image-preview-div').css("display", "block");
  $('#preview-img').attr('src', e.target.result);
  $('#preview-img').css('max-width', '550px');
}
$(document).ready(function (e) {

  var maxsize = 500 * 1024; // 500 KB

  $('#max-size').html((maxsize/1024).toFixed(2));
  $('#upload-image-form').on('submit', function(e) {

    e.preventDefault();

    $('#message').empty();
    $('#loading').show();

    $.ajax({
      url: "upload-image.php",
      type: "POST",
      data: new FormData(this),
      contentType: false,
      cache: false,
      processData: false,
      success: function(data)
      {
        $('#loading').hide();
        $('#message').html(data);
      }
    });
  });
  $('#file').change(function() {
    $('#message').empty();

    var file = this.files[0];
    var match = ["image/jpeg", "image/png", "image/jpg"];

    if ( !( (file.type == match[0]) || (file.type == match[1]) || (file.type == match[2]) ) )
    {
      noPreview();
      $('#message').html('<div class="alert alert-warning" role="alert">Unvalid image format. Allowed formats: JPG, JPEG, PNG.</div>');
      return false;
    }

    if ( file.size > maxsize )
    {
      noPreview();
      /*$('#message').html('<div class=\"alert alert-danger\" role=\"alert\">The size of image you are attempting to upload is ' + (file.size/1024).toFixed(2) + ' KB, maximum size allowed is ' + (maxsize/1024).toFixed(2) + ' KB</div>');*/
      return false;
    }

    $('#upload-button').removeAttr("disabled");

    var reader = new FileReader();
    reader.onload = selectImage;
    reader.readAsDataURL(this.files[0]);
  });
});
/*image Jquery end*/
/*Tab menu Jquery */
$(function() {

	$(".J_tab_content").hide();
	$(".J_tab_content:first").show();

	$("ul.J_tabs li").click(function() {
		$("ul.J_tabs li").removeClass("active").css("color", "#333");
		//$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
		$(this).addClass("active").css("color", "darkred");
		$(".J_tab_content").hide()
		var activeTab = $(this).attr("rel");
		$("#" + activeTab).fadeIn()
	});
});
/*Tab menu Jquery end*/
</script>
</html>