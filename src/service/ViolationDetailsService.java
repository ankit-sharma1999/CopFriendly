package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
public class ViolationDetailsService {
	public ArrayList<Violation> getViolationDetails() throws SQLException {

		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		ArrayList<Violation> al =  new ArrayList<>();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/copfriendly", "student" , "student");
			
			myStmt = myConn.createStatement();
			
			myRs = myStmt.executeQuery("select vNumber, name, vType, dLicence, violationType, fine from violation");
			
			while(myRs.next()) {
				Violation violation = new Violation();
				
				violation.vNo = myRs.getString("vNumber");
				violation.name = myRs.getString("name");
				violation.vType = myRs.getString("vType");
				violation.dLicence = myRs.getString("dLicence");
				violation.violationType = myRs.getString("violationType");
				violation.fine = myRs.getInt("fine");
				
				al.add(violation);
			}
			
			
		}
		catch (Exception exc) {
			exc.printStackTrace();
		}
		finally {
			if (myRs != null) {
				myRs.close();
			}
			
			if (myStmt != null) {
				myStmt.close();
			}
			
			if (myConn != null) {
				myConn.close();
			}
		}
		return al;
		
	}
}
