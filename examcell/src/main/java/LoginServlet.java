

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.examcell.util.DBManager;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection;
	private ResultSet resultSet;
	private Statement statement;
	private String sql;   
	private HttpSession session;
    public LoginServlet() throws SQLException {
        super();
        connection = DBManager.getConnection();
		statement = connection.createStatement();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		session = request.getSession();  
        session.setAttribute("uname",username);
        if(session.getAttribute("uname")==null) {
        	request.getRequestDispatcher("login.jsp").forward(request, response);
        }
		sql = "select * from userlogin where username='"+username+"' and password='"+password+"'";
		try {
			resultSet = statement.executeQuery(sql);
			if(resultSet.next()) {
				request.getRequestDispatcher("homemidpaper.jsp").forward(request, response);
			}else {
				request.setAttribute("loginFail", "username or password Invalid");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
