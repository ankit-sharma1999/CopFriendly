package service;

import java.sql.*;

public class LoginService {
	public User authenticate(User u) throws SQLException {
		
		Connection con = null;
		PreparedStatement stm = null;
		ResultSet rs = null;
		
		
		String dbURL = "jdbc:mysql://localhost:3306/copfriendly";
		String user = "student";
		String pass = "student";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,user,pass);
			
			stm = con.prepareStatement("select * from user where email = ? and password = ?");
			
			stm.setString(1, u.getMail());
			stm.setString(2, u.getpWord());
			
			rs = stm.executeQuery();
			
			if(rs.next()) {
				u.setDept(rs.getString("department"));
				u.setName(rs.getString("name"));
				u.setMail(rs.getString("email"));
				u.setpWord(rs.getString("password"));
				u.setMobNo(rs.getString("mobile"));
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			if(con!=null)
				con.close();
			if(stm!=null)
				stm.close();
			if(rs!=null)
				rs.close();
		}
		return u;
	}
}
