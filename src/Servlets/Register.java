package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.RegisterService;
import service.User;



/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		User user = new User();
		
		user.setName(request.getParameter("fullName"));
		user.setMail(request.getParameter("userMail"));
		user.setpWord(request.getParameter("pword"));
		user.setMobNo(request.getParameter("mobNo"));
		user.setDept(request.getParameter("dept"));
		
		PrintWriter out = response.getWriter();
		
		RegisterService rs = new RegisterService();
		try {
			if(rs.authenticate(user)) {
				out.println("<script type=\"text/javascript\">");
		    	out.println("window.alert('User already exists');");
		    	out.println("location='index.jsp';");
		    	out.println("</script>");
				System.out.println("Existing User");
		    	response.sendRedirect("index.jsp");
			}
	    	else {
				rs.register(user);
				out.println("<script type=\"text/javascript\">");
		    	out.println("window.alert('Successfully Registered');");
		    	out.println("location='index.jsp';");
		    	out.println("</script>");
		    	response.sendRedirect("index.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
