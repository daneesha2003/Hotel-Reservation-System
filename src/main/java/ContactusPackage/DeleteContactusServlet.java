package ContactusPackage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/DeleteContactusServlet")
public class DeleteContactusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        response.sendRedirect("DisplayContactusServlet");
	    }

	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String id = request.getParameter("id");
	        HttpSession session = request.getSession(false);
	        Integer sessionId = (session != null) ? (Integer) session.getAttribute("userId") : null;

	        if (id == null || id.trim().isEmpty() || sessionId == null || !id.equals(String.valueOf(sessionId))) {
	            response.getWriter().println("<script>alert('Unauthorized Access!');window.location.href='Contactus.jsp';</script>");
	            return;
	        }

	        try {
	            boolean isTrue = ContactusControl.deleteData(id);

	            if (isTrue) {
	                session.removeAttribute("userId"); // Clear session attribute
	                response.getWriter().println("<script>alert('Data Delete Successful!');window.location.href='Contactus.jsp';</script>");
	            } else {
	                response.getWriter().println("<script>alert('Deletion failed!');window.location.href='DisplayContactusServlet';</script>");
	            }
	        } catch (NumberFormatException e) {
	            response.getWriter().println("<script>alert('Invalid ID format!');window.location.href='DisplayContactusServlet';</script>");
	        } catch (Exception e) {
	            response.getWriter().println("<script>alert('Server error!');window.location.href='DisplayContactusServlet';</script>");
	        }
	    }

}
