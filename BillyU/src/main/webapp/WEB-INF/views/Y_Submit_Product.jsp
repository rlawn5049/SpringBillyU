<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%request.setCharacterEncoding("euc-kr");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
String pronum = request.getParameter("pronum");
Object quest = request.getParameter("apple");
String ren = request.getParameter("ren");
String way = request.getParameter("wayRadio");

out.println(pronum);
out.println(quest);
out.println(ren);
out.println(way);

%>
</body>
</html>