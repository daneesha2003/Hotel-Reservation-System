package UserPackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Admin credentials
    private static final String ADMIN_EMAIL = "admin@admin.com";
    private static final String ADMIN_PASSWORD = "admin";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        // Check if it's admin login
        if (ADMIN_EMAIL.equals(email) && ADMIN_PASSWORD.equals(password)) {
            // For admin, we'll just store the email in session
            request.getSession().setAttribute("adminEmail", ADMIN_EMAIL);
            response.sendRedirect("adminDashboard.jsp");
            return;
        }
        
        // Regular customer login
        List<SignupModel> userlogin = UseraccControl.loginValidate(email, password);
        if (userlogin != null && !userlogin.isEmpty()) {
            SignupModel loggedInUser = userlogin.get(0);
            request.getSession().setAttribute("user", loggedInUser);
            response.sendRedirect("UserAccount.jsp");
        } else {
            request.setAttribute("errorMessage", "Invalid email or password!");
            RequestDispatcher dis = request.getRequestDispatcher("Login.jsp");
            dis.forward(request, response);
        }
    }
}