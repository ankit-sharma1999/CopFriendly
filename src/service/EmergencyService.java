package service;

import java.sql.*;

public class EmergencyService {
	
	public void registerEmergency(String loc, String accType,int priority,int noPeople ) throws SQLException{
		Connection connection = null;
		PreparedStatement statement = null;
		//ResultSet resultSet = null;
		
		String dbUrl = "jdbc:mysql://localhost:3306/copfriendly";
		String user = "student";
		String password = "student";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(dbUrl,user,password);
			
			String sql = "Insert into Emergency (location,accidentType,priority,numberOfPeople) "
									+ "Values(?,?,?,?)";
			
			statement = connection.prepareStatement(sql);
			
			statement.setString(1,loc);
			statement.setString(2, accType);
			statement.setInt(3, priority);
			statement.setInt(4, noPeople);
			
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
			/*
			 * if(resultSet!=null) resultSet.close();
			 */
		}
	}
}
