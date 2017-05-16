package com.openmarket;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.openmarket.*;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProccessBackup extends HttpServlet {
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
		
		/*	
		String savePath = "C:/WebSoft/WORKSPACE/SUBNET/Capstone/WebContent/img/"; // ������ ���丮 (������)
		int sizeLimit = 10 * 1024 * 1024; // 10�ް����� ���� �Ѿ�� ���ܹ߻�
		String img = "";
		String img2 = "";
		String img3 = "";
		String img4 = "";
		String originalFileName = "";
	
		MultipartRequest multi = new MultipartRequest(req, savePath, sizeLimit, "utf-8",
				new DefaultFileRenamePolicy());
		Enumeration files = multi.getFileNames(); // ���� �̸� ��ȯ
		
		String file = (String)files.nextElement();
		img = multi.getFilesystemName(file);
		String file2 = (String)files.nextElement();
		img2 = multi.getFilesystemName(file2);
		String file3 = (String)files.nextElement();
		img3 = multi.getFilesystemName(file3);
		String file4 = (String)files.nextElement();
		img4 = multi.getFilesystemName(file4);
*/
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
		
		/*�̹��� �ּ� �Է�
		dto.setImg(img);
		dto.setImg2(img2);
		dto.setImg3(img3);
		dto.setImg4(img4);
		
		*/
		if (dto.getTratype().equals("rent")) {
			dao.insertRentProduct(dto); // �ŷ������� �뿩��� ...
		} else if (dto.getTratype().equals("sale")) {
			dao.insertSaleProduct(dto); // �ŷ������� �ǸŶ�� ...
		}

		RequestDispatcher view = req.getRequestDispatcher("K_view.jsp");
		view.forward(req, resp);

	}
}
