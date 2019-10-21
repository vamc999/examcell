
public class QuestionPaperBean {
	public int qno;
	public String question;
	public String imageURL;
	public String level;
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public QuestionPaperBean(int qno, String question, String imageURL, String level) {
		this.qno = qno;
		this.question = question;
		this.imageURL = imageURL;
		this.level = level;
	}
	public QuestionPaperBean(int qno,String question) {
		this.qno = qno;
		this.question = question;
		
	}
	public QuestionPaperBean(int qno,String question,String imageURL) {
		this.qno = qno;
		this.question = question;
		this.imageURL = imageURL;
	}
	public int getQno() {
		return qno;
	}
	public void setQno(int qno) {
		this.qno = qno;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getImageURL() {
		return imageURL;
	}
	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}
}
