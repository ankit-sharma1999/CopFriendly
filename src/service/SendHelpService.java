package service;

import java.sql.*;

public class SendHelpService {
	public void sendHelp(int ID) throws SQLException
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		//ResultSet myRs = null;
		
		String dbUrl = "jdbc:mysql://localhost:3306/copfriendly";
		String user = "student";		
		String pass = "student";
		
		String sql = "Delete from emergency Where sl = ?";
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			myConn = DriverManager.getConnection(dbUrl, user, pass);
			
			myStmt = myConn.prepareStatement(sql);

			myStmt.setInt(1, ID);
			
			myStmt.executeUpdate();
		}
		catch (Exception exc) {
			exc.printStackTrace();
		}
		finally {
			if(myConn!=null)
				myConn.close();
			if(myStmt!=null)
				myStmt.close();
//			if(resultSet!=null)
//				resultSet.close();
		}
	}
	
}
