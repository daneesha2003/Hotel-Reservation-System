package UserPackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UseraccServlet")
public class UseraccServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
String id = request.getParameter("id");
        
        if(id != null && !id.isEmpty()) {
            List<SignupModel> user = UseraccControl.getById(id);
            request.setAttribute("user", user);
        } else {
            List<SignupModel> allusers = UseraccControl.getAllUser();
            request.setAttribute("allusers", allusers);
        }
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("UserAccount.jsp");
        dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
