package test.db.input;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class InputTest {

	public void insert(String rental, String deposit, String able, String trade, String condition, String position, String info){
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost/testbox";
			Connection conn = DriverManager.getConnection(url,"root","skshboris2");
			Statement stmt = conn.createStatement();
			String sql = "insert into testinput values('"+rental+"','"+deposit+"','"+able+"','"+trade+"','"+condition+"','"+position+"','"+info+"')";
			stmt.executeUpdate(sql);
			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
