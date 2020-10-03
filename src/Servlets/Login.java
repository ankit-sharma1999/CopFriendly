package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.LoginService;
import service.User;


/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		User user = new User();
		user.setMail(request.getParameter("userId"));
		user.setpWord(request.getParameter("password"));
		LoginService ls = new LoginService();
		PrintWriter out = response.getWriter();
		String department = "";
		try {
			user = ls.authenticate(user);
			HttpSession session = request.getSession();
			if(session.getAttribute("loginType")!=null) 
				 department = (String)session.getAttribute("loginType"); 
			
			if(user != null)
			{
				String dpt = user.getDept();
				if (dpt == null || !department.equals(dpt))
				{
					session.removeAttribute("loginType");
					session.invalidate();
					out.println("<script type=\"text/javascript\">");
				    out.println("window.alert('User or password incorrect');");
				    out.println("location='index.jsp';");
				    out.println("</script>");
				}
				else {
					
					if(dpt.equals("Sergeant"))
					{
						session.setAttribute("User", user.getDept());
						session.setAttribute("userDetails", user);
						response.sendRedirect("cop.jsp");
						
					}
					else if(dpt.equals("Central"))
					{
						session.setAttribute("User", user.getDept());
						response.sendRedirect("Dashboard.jsp");
					}
					else if(dpt.equals("Medical")){
						
						session.setAttribute("User", user.getDept());
						response.sendRedirect("medical.jsp");
					}
					else {
						out.println("<script type=\"text/javascript\">");
					    out.println("alert('User or password incorrect');");
					    out.println("location='index.jsp';");
					    out.println("</script>");
					}
				}
				
			}
			else {
					out.println("<script type=\"text/javascript\">");
				    out.println("alert('User or password incorrect');");
				    out.println("location='index.jsp';");
				    out.println("</script>");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
