package com.openmarket;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.openmarket.*;

public class process_backup extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		/*
		 * �Ű澲���� super.doPost(req, resp); String uri = req.getRequestURI();
		 * System.out.println("uri = " + uri); String command =
		 * uri.substring(uri.lastIndexOf("/") + 1, uri.lastIndexOf(".do"));
		 * if(command != null && command.trim().equals("regist")){
		 */

		// DAO ��ü ���� (�Է¹��� ���� DB�� �����ϱ�����)
		Capstone_productDAO dao = new Capstone_productDAO();
		// ��ǰ ���� �Է� ����
		String category = req.getParameter("category"); // category num �ٽ� ã�ƾߵ�,
		int catnum = dao.selectCatnum(category); // �Է¹��� category�� catnum ã�ƿ�.
		String title = req.getParameter("title");
		String productinfo = req.getParameter("productinfo");
		String productcondition = req.getParameter("procondition");
		String tratype = req.getParameter("tratype");
		String traway = req.getParameter("traway");
		String salprice_s = req.getParameter("salprice");
		String renprice_s = req.getParameter("renprice");
		String deposit_s = req.getParameter("deposit");
		String renday_s = req.getParameter("renday");
		
		
		
		
		
		
		
		//�Ǹ� ��ǰ ��� , �뿩 ��ǰ ����� �� �ٸ� ���� null�� �Ǵϱ� 0���� ä����.
		if(salprice_s == ""){
			salprice_s = "0";
		}else if(renprice_s == ""){
			renprice_s ="0";
			deposit_s = "0";
			renday_s = "0";
		}
		// sale�ǸŻ�ǰ �Է� ���� �� �ʿ��� ����
		int salprice = Integer.parseInt(salprice_s);

		// rent�뿩��ǰ �Է� ���� �� �ʿ��� ����
		int renprice = Integer.parseInt(renprice_s);
		int deposit = Integer.parseInt(deposit_s);
		int renday = Integer.parseInt(renday_s);

		// DTO��ü ���� (���� SET/GET �ϱ�����)
		Capstone_productDTO dto = new Capstone_productDTO();
		
		
		HttpSession ses = req.getSession();
		String nickname = (String)ses.getAttribute("id");
		// ��ǰ ���� ���� �Է�
		dto.setNickname(nickname); // �̰͵� ȸ�� �������� �ٲ�ߵ�!
		dto.setCatnum(catnum);
		dto.setTitle(title);
		dto.setProinfo(productinfo);
		dto.setProcondition(productcondition);
		dto.setTraway(traway);
		dto.setSalprice(salprice);

		/* �Ǹ� ���� �Է� */
		dto.setTratype(tratype);

		/* �뿩 ���� �Է� */
		dto.setRenprice(renprice);
		dto.setDeposit(deposit);
		dto.setRenday(renday);

		if (dto.getTratype().equals("rent")) {
			dao.insertRentProduct(dto); // �ŷ������� �뿩��� ...
		} else if (dto.getTratype().equals("sale")) {
			dao.insertSaleProduct(dto); // �ŷ������� �ǸŶ�� ...
		}

		RequestDispatcher view = req.getRequestDispatcher("K_view.jsp");
		view.forward(req, resp);

	}
}
