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


@WebServlet("/UpdateContactusServlet")
public class UpdateContactusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // No implementation needed for GET in this context
	    }

	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String id = request.getParameter("id");
	        String firstName = request.getParameter("FirstName");
	        String lastName = request.getParameter("LastName");
	        String emailAddress = request.getParameter("EmailAddress");
	        String phoneNumber = request.getParameter("PhoneNumber");
	        String message = request.getParameter("Message");

	        HttpSession session = request.getSession(false);
	        Integer sessionId = (session != null) ? (Integer) session.getAttribute("userId") : null;

	        if (sessionId == null || !id.equals(String.valueOf(sessionId))) {
	            response.getWriter().println("<script>alert('Unauthorized Access!'); window.location.href ='DisplayContactus'</script>");
	            return;
	        }

	        boolean isTrue = ContactusControl.updatedata(id, firstName, lastName, emailAddress, phoneNumber, message);

	        if (isTrue) {
	            List<ContactusModel> Contactdetails = ContactusControl.getById(id);
	            request.setAttribute("Contactdetails", Contactdetails);
	            String alertMessage = "Data Update Successful!";
	            response.getWriter().println("<script>alert('" + alertMessage + "'); window.location.href ='DisplayContactus'</script>");
	        } else {
	            RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
	            dis2.forward(request, response);
	        }
	    }

}
