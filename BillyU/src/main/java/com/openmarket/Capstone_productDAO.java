package com.openmarket;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.openmarket.*;

public class Capstone_productDAO {
private static Connection conn;
	
	//DB연동
	public Capstone_productDAO() {
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException ex){
			System.out.println("드라이버를 찾을 수 없습니다.");
		}
		try{
			conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/billyu?useUnicode=true&characterEncoding=euc-kr","root","1234");
		}catch(SQLException ex){
			System.out.println("SQL 오류(Connection) : " + ex.getLocalizedMessage());
		}
	}
	
	//등록할 상품의 거매유형이 '판매'일 경우
	public boolean insertSaleProduct(Capstone_productDTO dto){
		String query = "insert into product (nickname, catnum, title, proinfo, procondition, traway, tratype, salprice) values (?, ?, ?, ?, ?, ?, ?, ?);";
		boolean check = false;			//insert가 성공했는지 확인하기위한 boolean
		try{
			//stament가 아닌 preparedStatemint인 이유는 values에 ?를 사용해서 밑에서 보기좋게 하나하나 넣어주기 위해서!!!!
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getNickname());
			pstmt.setInt(2, dto.getCatnum());
			pstmt.setString(3, dto.getTitle());
			pstmt.setString(4, dto.getProinfo());
			pstmt.setString(5, dto.getProcondition());
			pstmt.setString(6, dto.getTraway());
			pstmt.setString(7, dto.getTratype());
			pstmt.setInt(8, dto.getSalprice());
			
			pstmt.executeUpdate();			//UPDATE, DELETE 등 결과가 없을 때 사용
			check = true;
			pstmt.close();
		}catch(SQLException ex){
			System.out.println("SQL insertSaleProduct 오류 : " + ex.getLocalizedMessage());
		}	
		return check;
	}
	
	//등록할 상품의 거매유형이 '대여'일 경우
	public boolean insertRentProduct(Capstone_productDTO dto){
		String query = "insert into product (nickname, catnum, title, proinfo, procondition, traway, tratype, renprice, deposit, renday) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
		boolean check = false;		//insert가 성공했는지 확인하기위한 boolean
		try{
			//stament가 아닌 preparedStatemint인 이유는 values에 ?를 사용해서 밑에서 보기좋게 하나하나 넣어주기 위해서!!!!
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getNickname());
			pstmt.setInt(2, dto.getCatnum());
			pstmt.setString(3, dto.getTitle());
			pstmt.setString(4, dto.getProinfo());
			pstmt.setString(5, dto.getProcondition());
			pstmt.setString(6, dto.getTraway());
			pstmt.setString(7, dto.getTratype());
			pstmt.setInt(8, dto.getRenprice());
			pstmt.setInt(9, dto.getDeposit());
			pstmt.setInt(10, dto.getRenday());
			
			
			pstmt.executeUpdate();			//UPDATE, DELETE 등 결과가 없을 때 사용
			check = true;
			pstmt.close();
		}catch(SQLException ex){
			System.out.println("SQL insertRentProduct 오류 : " + ex.getLocalizedMessage());
		}	
		return check;
	}
	
	//insert image
	public boolean insertImage(Capstone_productDTO dto, int pronum){
		//String query = "insert into product (nickname, catnum, title, proinfo, procondition, traway, tratype, salprice) values (?, ?, ?, ?, ?, ?, ?, ?);";
		String query = "insert into image (pronum, path,path2,path3,path4) value (?, 'img/"+ '?' +"','img/"+ '?' +"','img/"+ '?' +"','img/"+ '?' +"')";
		boolean check = false;			//insert가 성공했는지 확인하기위한 boolean
		try{
			//stament가 아닌 preparedStatemint인 이유는 values에 ?를 사용해서 밑에서 보기좋게 하나하나 넣어주기 위해서!!!!
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pronum);
			pstmt.setString(2, dto.getImg());
			pstmt.setString(3, dto.getImg2());
			pstmt.setString(4, dto.getImg3());
			pstmt.setString(5, dto.getImg4());
			
			pstmt.executeUpdate();			//UPDATE, DELETE 등 결과가 없을 때 사용
			check = true;
			pstmt.close();
		}catch(SQLException ex){
			System.out.println("SQL insertSaleProduct 오류 : " + ex.getLocalizedMessage());
		}	
		return check;
	}
	
	//select로 이미 만든 pronum을 반환한다
		public int selectPronum(){
			String query = "SELECT * FROM product ORDER BY pronum DESC LIMIT 1";
			int pronum = 0 ; 
			try{
				Statement stmt = conn.createStatement();		//문자열 sql문을 sql 수행시킬수 있는 statement생성
				ResultSet rs = stmt.executeQuery(query);		//select문 실행
				
				rs.next();
				pronum = Integer.parseInt(rs.getString("pronum"));
				
				stmt.close();
			}catch(SQLException ex){
				System.out.println("SQL selectCatnum 오류 : " + ex.getLocalizedMessage());
			}	
			return pronum;
		}
	
	
	//입력받은 small(소분류)로 catnum 찾아주는 함수
	public int selectCatnum(String catname){
		String query = "SELECT catnum FROM category WHERE small = " + "'" + catname +"'";
		int catnum = 0 ; 
		try{
			Statement stmt = conn.createStatement();		//문자열 sql문을 sql 수행시킬수 있는 statement생성
			ResultSet rs = stmt.executeQuery(query);		//select문 실행
			
			rs.next();
			catnum = Integer.parseInt(rs.getString("catnum"));
			
			stmt.close();
		}catch(SQLException ex){
			System.out.println("SQL selectCatnum 오류 : " + ex.getLocalizedMessage());
		}	
		return catnum;
	}
	//등록 페이지에 small(소분류)를 보여주기 위해서 select로 찾은 후 arrayList 배열로 리턴해주는 함수
	public ArrayList<String> selectCategory(){
		String query = "SELECT DISTINCT small FROM category";		//DISTINCT 중복있음 하나만 출력
		ArrayList<String> big = new ArrayList<String>();
		try{
			Statement stmt = conn.createStatement();		//문자열 sql문을 sql 수행시킬수 있는 statement생성
			ResultSet rs = stmt.executeQuery(query);		//select문 실행
			
			while(rs.next()){
				big.add(rs.getString("small"));
			}
			
			stmt.close();
		}catch(SQLException ex){
			System.out.println("SQL select 오류 : " + ex.getLocalizedMessage());
		}	
		return big;
	}
	//입력한 product 속성 view 페이지에서 보여주기 위한 select 
	public ArrayList<String> selectProduct(){
		String query = "SELECT * FROM product";
		ArrayList<String> al = new ArrayList<String>();
		try{
			Statement stmt = conn.createStatement();		//문자열 sql문을 sql 수행시킬수 있는 statement생성
			ResultSet rs = stmt.executeQuery(query);		//select문 실행
			
			rs.last();
			
			al.add(rs.getString("title"));
			al.add(rs.getString("proinfo"));
			al.add(rs.getString("procondition"));
			al.add(rs.getString("traway"));
			al.add(rs.getString("tratype"));
			al.add(rs.getString("renprice"));
			al.add(rs.getString("renday"));
			al.add(rs.getString("deposit"));
			al.add(rs.getString("salprice"));
			al.add(rs.getString("catnum"));
			
			
			stmt.close();
		}catch(SQLException ex){
			System.out.println("SQL selectCatnum 오류 : " + ex.getLocalizedMessage());
		}	
		return al;
	}
	//connection 다 사용했으니 닫아주기 !
	public void close(){
		try{
			if(conn != null){
				conn.close();
				conn = null;
			}
		}catch(SQLException ex){
			System.out.println("SQL 오류(close) : " + ex.getLocalizedMessage());
		}
		
	}
}
