<html>
<script>
function validate(){
	var level1 = Number(document.getElementsByName('level1')[0].value);
	var level2 = Number(document.getElementsByName('level2')[0].value);
	var level3 = Number(document.getElementsByName('level3')[0].value);
	var sum = level1+level2+level3;
	if(level1+level2+level3 != 12){
		alert('your entered '+sum+ ' questions!.. please select 12 questions' )
		return false;
	}
	return true;
}
</script>
<body>
	<h2>Hello World!</h2>
	<form name="home" action="QuestionPaperGenerator" onsubmit="return validate()" method="post">
		<select name="subject">
			<option value="javaprogramming">Java Programming</option>
			<option value="databasemanagementsystem">Data Base
				Management System</option>
		</select> <br /> 
		Level1: <input type="number" name="level1" required> <br />
		Level2: <input type="number" name="level2" required> <br />
		Level3: <input type="number" name="level3" required> <br /> <input
			type="date" name="examdate" required> <br />
		<button type="submit">Generate</button>
	</form>
</body>
</html>
