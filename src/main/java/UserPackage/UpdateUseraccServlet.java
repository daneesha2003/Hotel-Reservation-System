package UserPackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UpdateUseraccServlet")
public class UpdateUseraccServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  String id = request.getParameter("id");
	        String Fname = request.getParameter("Fname");
	        String Lname = request.getParameter("Lname");
	        String email = request.getParameter("email");

	        boolean isTrue = UseraccControl.updatedata(id, Fname, Lname, email);

	        if(isTrue) {
	            // Fetch latest user data and update session
	            List<SignupModel> user = UseraccControl.getById(id);
	            if(user != null && !user.isEmpty()) {
	                request.getSession().setAttribute("user", user.get(0));
	            }
	            response.sendRedirect("UserAccount.jsp");
	        } else {
	            // Handle error
	            request.setAttribute("error", "Update failed");
	            request.getRequestDispatcher("updateUseracc.jsp").forward(request, response);
	        }
	    }
	}
