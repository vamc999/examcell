<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.11.1/dist/katex.min.css" integrity="sha384-zB1R0rpPzHqg7Kpt0Aljp8JPLqbXI3bhnPWROx27a9N0Ll6ZP/+DiW/UqRcLbRjq" crossorigin="anonymous">
<script defer src="https://cdn.jsdelivr.net/npm/katex@0.11.1/dist/katex.min.js" integrity="sha384-y23I5Q6l+B6vatafAwxRu/0oK/79VlbSz7Q9aiSZUvyWYIYsd+qj+o24G5ZU2zJz" crossorigin="anonymous"></script>
<script defer src="https://cdn.jsdelivr.net/npm/katex@0.11.1/dist/contrib/auto-render.min.js" integrity="sha384-kWPLUVMOks5AQFrykwIup5lo0m3iMkkHrD0uJ4H5cjeGihAutqP0yW0J6dpFiVkI" crossorigin="anonymous"></script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        renderMathInElement(document.body, {
            // ...options...
            [
			  {left: "$$", right: "$$", display: true},
			  {left: "\\(", right: "\\)", display: false},
			  {left: "\\[", right: "\\]", display: true}
			]
        });
    });
</script>
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

<head>
<link rel="import" href="/math/19BS1T02/formula/1a.html">
</head>
<body>
	<h2>Hello World!</h2>
	katex.render("c = \\pm\\sqrt{a^2 + b^2}", element, {
    throwOnError: false
});
	$$p=x \times y$$
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
