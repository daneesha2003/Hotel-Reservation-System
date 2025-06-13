package UserPackage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String Fname = request.getParameter("Fname");
        String Lname = request.getParameter("Lname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        int userId = UseraccControl.insertAndGetId(Fname, Lname, email, password);
        
        if(userId > 0) {
            // Redirect to login page after successful signup
            response.sendRedirect("Login.jsp");
        } else {
            RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
            dis2.forward(request, response);
        }
	}

}
