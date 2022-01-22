package controller;

import java.io.IOException;

import entities.Message;
import entities.User;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.UserService;

/**
  ** Login Servlet **
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public LoginServlet() {
        super();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
    	
    	session.getAttribute("nom");
    	
    	session.invalidate();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("Username");
		String password = request.getParameter("Password");
		
		HttpSession session = request.getSession();
		session.setAttribute("username", username);
		session.setAttribute("password", password);
		
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		
		UserService su = new UserService();
		if(su.validate(user)) {
			response.sendRedirect("index.jsp");
		}
		else {
			Message message = new Message("Compte n'existe pas!", "error", "danger");
			HttpSession s = request.getSession();
			s.setAttribute("msg", message);
			response.sendRedirect("login.jsp");
		}
	}

}
