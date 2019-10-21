
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.examcell.util.DBManager;

public class MidQuestionPaper extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection;
	private ResultSet resultSet;
	private Statement statement;
	private HttpSession session;
	private String sql;
	public QuestionPaperBean qpb;
	private List<QuestionPaperBean> questions;
	private List<QuestionPaperBean> allquestions;
	
	public MidQuestionPaper() throws SQLException {
		super();
		connection = DBManager.getConnection();
		statement = connection.createStatement();
		

	}
	public List<QuestionPaperBean> printQuestions(int[] unit,String subjectCode,String seed){
		List<QuestionPaperBean> questions =  new ArrayList<QuestionPaperBean>();
		int qno=1;
		for (int i = 0; i < 3; i++) {
			sql = "select qno,question from "+subjectCode+" where unit="+unit[i]+" order by rand("+seed+") limit 2 ";
			
			try {
				resultSet = statement.executeQuery(sql);
				while(resultSet.next()) {
					questions.add(new QuestionPaperBean(resultSet.getInt(1),resultSet.getString(2)));
					qno++;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return questions;
		
	}
	public List<QuestionPaperBean> printAllQuestions(int[] unit,String subjectCode){
		List<QuestionPaperBean> questions =  new ArrayList<QuestionPaperBean>();
		for (int i = 0; i < 3; i++) {
			sql = "select qno,question from "+subjectCode+" where unit="+unit[i]+" order by qno";
			
			try {
				resultSet = statement.executeQuery(sql);
				while(resultSet.next()) {
					questions.add(new QuestionPaperBean(resultSet.getInt(1),resultSet.getString(2)));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return questions;
		
	}
	public String getSubjectName(String subjectcode) {
		String name = null;
		String sql = "select subjectname from subjects where subjectcode='"+subjectcode+"';";
		try {
			resultSet = statement.executeQuery(sql);
			if(resultSet.next()) {
				name = resultSet.getString(1);
				System.out.println(name);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return name;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		questions = new ArrayList<QuestionPaperBean>();
		allquestions = new ArrayList<QuestionPaperBean>();
		String[] branch = request.getParameterValues("branch");
		String branches = "";
		String subjectCode = request.getParameter("subject");
		String mid = request.getParameter("mid");
		String seed = request.getParameter("seed");
		for (String b : branch) {
			if (branches.length() == 0)
				branches = branches + b;
			else
				branches = branches + "," + b;
		}
		request.setAttribute("branches", branches);
		if (mid.equals("I")) {
			int[] unit = { 1, 2, 3 };
			try {
				questions = new MidQuestionPaper().printQuestions(unit, subjectCode,seed);
				allquestions = new MidQuestionPaper().printAllQuestions(unit, subjectCode);
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if (mid.equals("II")) {
			int[] unit = { 4, 5, 6 };
			try {
				questions = new MidQuestionPaper().printQuestions(unit, subjectCode,seed);
				allquestions = new MidQuestionPaper().printAllQuestions(unit, subjectCode);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		session=request.getSession(false);  
		String subjectname=null;
		try {
			subjectname = new MidQuestionPaper().getSubjectName(subjectCode);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(subjectname);
		request.setAttribute("subjectname",subjectname);
        String user =(String)session.getAttribute("uname");  
		request.setAttribute("user",user);
		request.setAttribute("questions", questions);
		request.setAttribute("allquestions", allquestions);
		request.getRequestDispatcher("midquestionpaper.jsp").forward(request, response);
	}

}
