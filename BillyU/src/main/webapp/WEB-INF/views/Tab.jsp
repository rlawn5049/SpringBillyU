<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Tab</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<style>
</style>
</head>
<body>
<img src="img/noimage.JPG" width="295px" height="295px" title="Ŭ���Ͻø� ����ũ��� ���� �� �ֽ��ϴ�."
     style="cursor: pointer;" onclick="doImgPop('img/noimage.JPG')" " />
</body>
<script type="text/javascript">

// �̹��� Ŭ���� ���� ũ��� �˾� ����
function doImgPop(img){ 
 img1= new Image(); 
 img1.src=(img); 
 imgControll(img); 
} 
  
function imgControll(img){ 
 if((img1.width!=0)&&(img1.height!=0)){ 
    viewImage(img); 
  } 
  else{ 
     controller="imgControll('"+img+"')"; 
     intervalID=setTimeout(controller,20); 
  } 
}
function viewImage(img){ 
 W=img1.width; 
 H=img1.height; 
 O="width="+W+",height="+H+",scrollbars=yes"; 
 imgWin=window.open("","",O); 
 imgWin.document.write("<html><head><title>:*:*:*: �̹����󼼺��� :*:*:*:*:*:*:</title></head>");
 imgWin.document.write("<body topmargin=0 leftmargin=0>");
 imgWin.document.write("<img src="+img+" onclick='self.close()' style='cursor:pointer;' title ='Ŭ���Ͻø� â�� �����ϴ�.'>");
 imgWin.document.close();
}
</script>
</html>