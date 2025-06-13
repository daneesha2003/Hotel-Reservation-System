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


@WebServlet("/DisplayContactus")
public class DisplayContactus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        List<ContactusModel> allcontacts;

        // Check if session and userId are available
        if (session != null && session.getAttribute("userId") != null) {
            String userId = String.valueOf(session.getAttribute("userId"));
            allcontacts = ContactusControl.getById(userId);  // Get only the current user's data
        } else {
            allcontacts = java.util.Collections.emptyList(); // No data if no session
        }

        request.setAttribute("allcontacts", allcontacts);

        RequestDispatcher dispatcher = request.getRequestDispatcher("DisplayContactus.jsp");
        dispatcher.forward(request, response);
    }

}
