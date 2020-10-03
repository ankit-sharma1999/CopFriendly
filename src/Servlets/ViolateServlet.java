package Servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.RecordViolation;
import service.SendSms;
import service.SendSms;
/**
 * Servlet implementation class ViolateServlet
 */
@WebServlet("/Violation")
public class ViolateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViolateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String violatorsName = request.getParameter("violatorsName");
		String number = request.getParameter("mobNo");
		String violationType = request.getParameter("violationType");
		String dLiscence = request.getParameter("drivingLicence");
		String vType = request.getParameter("vehicleType");
		String vNo = request.getParameter("vehicleNo");
		String dt = request.getParameter("dateAndTime");
		String ro = request.getParameter("repeatedOffender");
		int fine = Integer.parseInt(request.getParameter("fine"));
		
		System.out.println(violatorsName +" " + violationType);
		
		RecordViolation rv = new RecordViolation();
		try {
			rv.record(violatorsName,number,violationType,dLiscence,vType,vNo,dt,ro,fine);
			String message = "\nCopFriendly\n\nName: "+violatorsName + "\nVehicle Number: "+vNo + "\nLicence: " + "\nViolation Type: "+ violationType + "\nDate/Time: "+ dt+"\nFine: "+fine;
			SendSms sms = new SendSms();
			sms.sendSms(message, number);
			response.sendRedirect("cop.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
