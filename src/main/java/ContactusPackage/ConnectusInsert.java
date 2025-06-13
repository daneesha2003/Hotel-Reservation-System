package ContactusPackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/ConnectusInsert")
public class ConnectusInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String firstName = request.getParameter("FirstName");
	        String lastName = request.getParameter("LastName");
	        String emailAddress = request.getParameter("EmailAddress");
	        String phoneNumber = request.getParameter("PhoneNumber");
	        String message = request.getParameter("Message");

	        if (firstName == null || lastName == null || emailAddress == null || phoneNumber == null || message == null) {
	            RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
	            dis2.forward(request, response);
	            return;
	        }

	        boolean isTrue = ContactusControl.insertdata(firstName, lastName, emailAddress, phoneNumber, message);

	        if (isTrue) {
	            List<ContactusModel> latest = ContactusControl.getAllcontact();
	            if (!latest.isEmpty()) {
	                int userId = latest.get(0).getIdcontactus();
	                HttpSession session = request.getSession();
	                session.setAttribute("userId", userId);
	            }
	            String alertMessage = "Data Insert Successful!";
	            response.getWriter().println("<script>alert('" + alertMessage + "'); window.location.href ='DisplayContactus'</script>");
	        } else {
	            RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
	            dis2.forward(request, response);
	        }
	}

}
