package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SosService {
	public void insert(SOS s) throws SQLException
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
			String sql = "Insert into sos (name,mob,location) "+ 
														"Values(?,?,?)";
			
			statement = connection.prepareStatement(sql);
			
			statement.setString(1,s.getName());
			statement.setString(2,s.getMob());
			statement.setString(3,s.getLocation());
			
			
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
