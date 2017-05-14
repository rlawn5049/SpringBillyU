<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {
		$(".K_trade").hide();

		$(".input").click(function() {
			$(".product").toggle();
			$(".K_trade").toggle(500);
			//$(".submit").toggle();
		});

		//�뿩 ��ư ������ tratype�� value���� rent��
		$('.re').click(function() {
			$('.tratype').val("rent");
		});
		//�Ǹ� ��ư ������ tratype�� value���� sale�� ,,
		$('.sa').click(function() {
			$('.tratype').val("sale");
		});

		$('.input').click(function() {
			$(this).toggleText('����', '����');
		});
	});
</script>
</head>
<body>
	<jsp:include page="Y_NavBar.jsp"></jsp:include>
	<br />
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-3"></div>
			<div class="col-lg-6">
				<div class="K_productRegist">
					<h2>��ǰ ���� �Է�</h2>
					<form action="regist.do" method="post">
						<div class="product">
							<div class="form-group">
								<label for="title">���� : </label> <input type="text"
									class="form-control" id="title" name="title"
									placeholder="Enter title">
							</div>
							<div class="form-group">
								<label for="category">ī�װ�:</label> <select class="form-control"
									id="category" name="category">
									<jsp:useBean id="sel"
										class="com.openmarket.Capstone_productDAO"></jsp:useBean>
									<%
										ArrayList<String> al = sel.selectCategory();
										for (int i = 0; i < al.size(); i++) {
									%>
									<option><%=al.get(i)%></option>
									<%
										}
									%>
								</select>
							</div>
							<div class="form-group">
								<label for="procondition">��ǰ���� :</label> <label
									class="radio-inline"> <input type="radio"
									name="procondition" value="s">S��
								</label> <label class="radio-inline"> <input type="radio"
									name="procondition" value="a">A��
								</label> <label class="radio-inline"> <input type="radio"
									name="procondition" value="b">B��
								</label>
							</div>
							<div class="form-group">
								<!--  �̰� text�� �ƴ϶� �ٸ� �������ι޴°� ���? -->
								<label for="proinfo">��ǰ����</label>
								<textarea class="form-control" rows="5" id="proinfo"
									placeholder="Input info" name="productinfo"></textarea>
							</div>

						</div>
						<!-- ������� �뿩 ���� �Է� -->
						<div class="K_trade">
							<ul class="nav nav-tabs">
								<li class="active"><a data-toggle="tab" href="#rent">�뿩</a></li>
								<li><a data-toggle="tab" href="#sale">�Ǹ�</a></li>
							</ul>

							<div class="tab-content">
								<div class="form-group">
									<input class="tratype" type="hidden" name="tratype" value="" />
								</div>
								<div id="rent" class="re tab-pane fade in active">
									<h3>�뿩</h3>

									<div class="form-group">
										<label for="renprice">�뿩�ݾ� : </label> <input type="text"
											class="form-control" id="renprice" name="renprice"
											placeholder="Enter rentalFee">
									</div>
									<div class="form-group">
										<label for="deposit">������ :</label> <input type="text"
											class="form-control" id="deposit" name="deposit"
											placeholder="Enter deposit">
									</div>
									<div class="form-group">
										<label for="renday">�뿩�����ϼ� :</label> <input type="text"
											class="form-control" id="renday" name="renday"
											placeholder="Enter renday">
									</div>
									<div class="form-group">
										<label for="traway">�ŷ���� : </label> <label
											class="radio-inline"> <input type="radio"
											name="traway" value="delivery">�ù�
										</label> <label class="radio-inline"> <input type="radio"
											name="traway" value="direct">���ŷ�
										</label>
									</div>
									<button type="submit" class="submit btn btn-default btn-block">Submit</button>
								</div>
								<div id="sale" class="sa tab-pane fade">
									<h3>�Ǹ�</h3>
									<div class="form-group">
										<label for="salprice">�Ǹűݾ� : </label> <input type="text"
											class="form-control" id="salprice" name="salprice"
											placeholder="Enter salprice">
									</div>
									<div class="form-group">
										<label for="traway">�ŷ���� : </label> <label
											class="radio-inline"> <input type="radio"
											name="traway" value="delivery">�ù�
										</label> <label class="radio-inline"> <input type="radio"
											name="traway" value="direct">���ŷ�
										</label>
									</div>
									<button type="submit" class="submit btn btn-default btn-block" >����ϱ�</button>
								</div>
							</div>
							<!-- �ŷ� ������ '�Ǹ�'�� �������� �� -->		
						</div>
					</form>
					<button type="button" class="input btn btn-primary btn-block">����</button>
				</div>
				
			</div>
			<div class="col-lg-3"></div>
			
		</div>
	</div>
	</div>
</body>
</html>