<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="ISO-8859-1">
<title>Login</title>

<script
 	src="https://code.jquery.com/jquery-3.4.1.min.js"
 	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
 	crossorigin="anonymous"></script>
	<script type="text/javascript"
    src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js"></script>
    
    <style>
		#error{
			color: #ff0000;
		}
	</style>

</head>
<body>
	<form action="loginServlet" method="post" id="loginForm">
		<table style="with: 50%">
			<tr>
				<td>UserName</td>
				<td><input type="text" name="username" /></td>
			</tr>
				<tr>
				<td>Password</td>
				<td><input type="password" name="password" /></td>
			</tr>
		</table>
		<input type="submit" value="Login"/>
		<%
		if(request.getAttribute("error") != null) {
			String error = (String)request.getAttribute("error");
		
		%>
		<p id="error"><%=error%></p>
		<%
		}
		%>
	</form>
</body>

<script type="text/javascript">
    $(document).ready(function() {
        $("#loginForm").validate({
            rules: {
                username: "required",
                password: "required",
            },
             
            messages: {
            	username: "Please enter username",
                password: "Please enter password"
            }
        });
 
    });
</script>
</html>