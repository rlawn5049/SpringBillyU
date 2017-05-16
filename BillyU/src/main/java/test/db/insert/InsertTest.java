package test.db.insert;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class InsertTest {
	
	public void insertCategory(int categorynum , String category) {

		try{
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/testbox";
			Connection conn = DriverManager.getConnection(url, "root", "skshboris2");
			Statement stmt = conn.createStatement();
			String sql = "insert into category values('" + categorynum + "','" + category + "')";
			stmt.executeUpdate(sql);
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void insertProduct(String title, String cetegory, String quantity, String condition, String info) {

		try{
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/testbox";
			Connection conn = DriverManager.getConnection(url, "root", "skshboris2");
			Statement stmt = conn.createStatement();
			String sql = "insert into product values('" + title + "','" + cetegory + "','" + quantity + "','" + condition
					+ "','" + condition + "','" + info + "')";
			stmt.executeUpdate(sql);
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void insertRental(String rentalfee, String deposit, String period, String trade) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/testbox";
			Connection conn = DriverManager.getConnection(url, "root", "skshboris2");
			Statement stmt = conn.createStatement();
			String sql = "insert into rental values('" + rentalfee + "','" + deposit + "','" + period + "','" + trade
					+ "')";
			stmt.executeUpdate(sql);
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void insertSale(String rental, String deposit, String able, String trade, String condition, String position,
			String info) {

		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/testbox";
			Connection conn = DriverManager.getConnection(url, "root", "skshboris2");
			Statement stmt = conn.createStatement();
			String sql = "insert into testinput values('" + rental + "','" + deposit + "','" + able + "','" + trade
					+ "','" + condition + "','" + position + "','" + info + "')";
			stmt.executeUpdate(sql);
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
