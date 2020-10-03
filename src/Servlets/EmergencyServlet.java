package Servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.EmergencyService;

/**
 * Servlet implementation class EmergencyServlet
 */
@WebServlet("/Emergency")
public class EmergencyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmergencyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String loc = request.getParameter("location");
		String accType = request.getParameter("accidentType");
		int priority = Integer.parseInt(request.getParameter("priority"));
		int noPeople = Integer.parseInt(request.getParameter("noPeople"));
		
		EmergencyService eS = new EmergencyService();
		try {
			eS.registerEmergency(loc, accType, priority, noPeople);
			response.sendRedirect("cop.jsp"); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
