package service;

import java.sql.*;

import service.User;



public class RegisterService {
public boolean authenticate(User u) throws SQLException {
	Connection con = null;
	PreparedStatement stm = null;
	ResultSet rs = null;
	boolean flag = false;
	
	
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
			flag = true;
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
	return flag;
}
	

	public void register(User u) throws SQLException
	{
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		
		String dbUrl = "jdbc:mySql://localhost:3306/copfriendly";
		String user = "student";
		String password = "student";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(dbUrl,user,password);
			String sql = "Insert into user (email,name,password,mobile,department) "+ 
														"Values(?,?,?,?,?)";
			
			statement = connection.prepareStatement(sql);
			
			System.out.println(u.getMail());
			
			statement.setString(1,u.getMail());
			statement.setString(2,u.getName());
			statement.setString(3,u.getpWord());
			statement.setString(4,u.getMobNo());
			statement.setString(5,u.getDept());
			
			statement.executeUpdate();
			
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			if(connection!=null)
				connection.close();
			if(statement!=null)
				statement.close();
			if(resultSet!=null)
				resultSet.close();
		}

	}
}