<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body{
	margin:20px;
	font-family:"���� ���";
}
#image-preview{
	display:none;
	width: 400px; 
	height: 300px; 
	overflow-x:hidden; 
	overflow-y:hidden;
}
.J_image_box{
	width: 400px; 
	height: 150px; 
	overflow-x:hidden; 
	overflow-y:hidden;
}
</style>
</head>
<body>
<form action="up.jsp" enctype="multipart/form-data" method="post">
	<div class="container">
	<!-- ūƲ -->
		<input type="file" name="upfile" id="image" style="display: none;">
        <input type="file" name="upfile2" id="image2" style="display: none;">
        <input type="file" name="upfile3" id="image3" style="display: none;">
        <input type="file" name="upfile4" id="image4" style="display: none;">
    	<div id="image_preview">
        	<img src="img/noimage.jpg " style="border: 1px solid black; width: 400px; height: 300px;" border="0" onclick="document.all.upfile.click(); ">
        	<br>
    	</div>
    	<div class="J_image_box">
    		<div id="J_image_2" style=" width: 100px; height: 100px; float: left;">
    			<img src="img/noimage.jpg " style="border: 1px solid black; width: 100px; height: 100px;" border="0" onclick="document.all.upfile2.click(); ">
    		</div>
    		<div id="J_image_3" style=" width: 100px; height: 100px; float: left; margin-left: 50px">
    			<img src="img/noimage.jpg " style="border: 1px solid black; width: 100px; height: 100px;" border="0" onclick="document.all.upfile3.click(); ">
    		</div>
    		<div id="J_image_4" style=" width: 100px; height: 100px; float: left; margin-left: 50px">
    			<img src="img/noimage.jpg " style="border: 1px solid black; width: 100px; height: 100px;" border="0" onclick="document.all.upfile4.click(); ">
    		</div>
    	</div>
    	<input type="submit" class="btn btn-primary" value="���" style="width: 400px;">
    </div>
</form>
</body>
<script type="text/javascript">
$('#image').on('change', function() {
    
    ext = $(this).val().split('.').pop().toLowerCase(); //Ȯ����
    
    //�迭�� ������ Ȯ���ڰ� �����ϴ��� üũ
    if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
        resetFormElement($(this)); //�� �ʱ�ȭ
        window.alert('�̹��� ������ �ƴմϴ�! (gif, png, jpg, jpeg �� ���ε� ����)');
    } else {
        file = $('#image').prop("files")[0];
        blobURL = window.URL.createObjectURL(file);
        $('#image_preview img').attr('src', blobURL);
        $('#image_preview').slideDown(); //���ε��� �̹��� �̸����� 
        $(this).slideUp(); //���� ��� ����
    }
});

$('#image2').on('change', function() {
    
    ext = $(this).val().split('.').pop().toLowerCase(); //Ȯ����
    
    //�迭�� ������ Ȯ���ڰ� �����ϴ��� üũ
    if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
        resetFormElement($(this)); //�� �ʱ�ȭ
        window.alert('�̹��� ������ �ƴմϴ�! (gif, png, jpg, jpeg �� ���ε� ����)');
    } else {
        file = $('#image2').prop("files")[0];
        blobURL = window.URL.createObjectURL(file);
        $('#J_image_2 img').attr('src', blobURL);
        $('#J_image_2').slideDown(); //���ε��� �̹��� �̸����� 
        $(this).slideUp(); //���� ��� ����
    }
});

$('#image3').on('change', function() {
    
    ext = $(this).val().split('.').pop().toLowerCase(); //Ȯ����
    
    //�迭�� ������ Ȯ���ڰ� �����ϴ��� üũ
    if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
        resetFormElement($(this)); //�� �ʱ�ȭ
        window.alert('�̹��� ������ �ƴմϴ�! (gif, png, jpg, jpeg �� ���ε� ����)');
    } else {
        file = $('#image3').prop("files")[0];
        blobURL = window.URL.createObjectURL(file);
        $('#J_image_3 img').attr('src', blobURL);
        $('#J_image_3').slideDown(); //���ε��� �̹��� �̸����� 
        $(this).slideUp(); //���� ��� ����
    }
});

$('#image4').on('change', function() {
    
    ext = $(this).val().split('.').pop().toLowerCase(); //Ȯ����
    
    //�迭�� ������ Ȯ���ڰ� �����ϴ��� üũ
    if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
        resetFormElement($(this)); //�� �ʱ�ȭ
        window.alert('�̹��� ������ �ƴմϴ�! (gif, png, jpg, jpeg �� ���ε� ����)');
    } else {
        file = $('#image4').prop("files")[0];
        blobURL = window.URL.createObjectURL(file);
        $('#J_image_4 img').attr('src', blobURL);
        $('#J_image_4').slideDown(); //���ε��� �̹��� �̸����� 
        $(this).slideUp(); //���� ��� ����
    }
});


$('#image_preview a').bind('click', function() {
    resetFormElement($('#image')); //������ ��� �ʱ�ȭ
    $('#image').slideDown(); //���� ��� ������
    $(this).parent().slideUp(); //�̸� ���� ���� ����
    return false; //�⺻ �̺�Ʈ ����
});
    
function resetFormElement(e) {
    e.wrap('<form>').closest('form').get(0).reset(); 
    e.unwrap();
}

</script>
</html>