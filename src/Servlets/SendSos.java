package Servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.print.attribute.standard.Copies;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.SOS;
import service.SosService;

/**
 * Servlet implementation class SendSos
 */
@WebServlet("/sos")
public class SendSos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendSos() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SOS obj = new SOS();
		
		obj.setName(request.getParameter("fullName"));
		obj.setMob(request.getParameter("mobNo"));;
		obj.setLocation(request.getParameter("location"));
		
		SosService service = new SosService();
		try {
			service.insert(obj);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("cop.jsp");
	}

}
