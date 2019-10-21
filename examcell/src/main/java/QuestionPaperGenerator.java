

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QuestionPaperGenerator extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public QuestionPaperGenerator() {
        super();
    
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] array = new String[]{"Easy","Easy","Easy","Easy","Easy","Medium","Medium","Medium","Medium","Hard","Hard","Hard"};
		 
		List<String> l = Arrays.asList(array);

		Collections.shuffle(l);
		List<String> questions = new ArrayList<String>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/examcell", "root", "iamvamsi");  
			Statement stmt = con.createStatement();			
			//String sql = "select * from registraion where email = '"+email+"' and password = '"+password+"';";
			int unitno=1;
			int qno=1;
			String sql="";
			for(String i:l) {
				sql = "select * from javaqb where unit="+unitno+" and prevselect not in(1) and trim(level) ='"+i+"' order by rand() limit 1 ";
				//System.out.println("Unit "+unitno+" Question "+qno+" "+i);
				ResultSet rs = stmt.executeQuery(sql);
				if(rs.next()) {
					//System.out.println("("+qno+")"+"Unit"+rs.getInt(2)+"   "+rs.getString(3) +"   "+rs.getString(4));
					questions.add("("+qno+")"+"Unit"+rs.getInt(2)+"   "+rs.getString(3) +"   "+rs.getString(4));
				}
				
				if(qno%2==0) {
					unitno++;
					System.out.println();
				}
				qno++;
			}
			con.close();
			} catch (Exception e) {
				System.out.println( e.toString());
			}
		String[] itemArray = new String[questions.size()];
		String[] question = questions.toArray(itemArray);
		request.setAttribute("questions", question);
		request.setAttribute("test", "test mail");
		request.getRequestDispatcher("questionpaper.jsp").forward(request, response);
		}
}
