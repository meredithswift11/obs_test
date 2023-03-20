<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Logged In</title>
	<style>
		table, th, td {
			border: 1px solid;
			border-collapse: collapse;
			padding: 10px;
		}
		
		th {
			background-color: #3F7AD6;
		}
	</style>

</head>
<body>
	<%@page import="java.util.ArrayList"%>
	<%@page import="java.util.Iterator"%>
	<%@page import="java.util.Collections"%>
	<%@page import="test_sample.Student"%>
	
	<% String username = request.getParameter("username"); %>
	<a>Welcome <% out.println(username); %> ~!!</a>
	<br><br>

	<table cellspacing="2" cellpadding="2">
	<tr><th>Department</th><th>Student ID</th><th>Marks</th><th>Pass %</th></tr>
	<%
	if(request.getAttribute("StudentList") != null){
		ArrayList<String> departmentsList = (ArrayList)request.getAttribute("Departments");
		ArrayList<Student> studentList = (ArrayList)request.getAttribute("StudentList");
		Iterator<String> iterator = departmentsList.iterator();
		while(iterator.hasNext()){
			String department = iterator.next();
			String converted = "";
			boolean first = true;
			int rowspan = 1;
			float count = 0;
			float pass = 0;
			float percent = 0;
			for (Student s : studentList) {
				if (s.getStudentDept().equals(department)) {
					rowspan++;
					count = count + 1;
					if (Float.parseFloat(s.getStudentMark()) >= 50) {
						pass = pass + 1;
					}
					percent = (pass / count) * 100;
					converted = String.format("%.2f", percent);
				}
			}
		%>
		<tr>
			<td rowspan=<%=rowspan%>><%=department%></td>
			
			<% 
				Iterator<Student> iterator2 = studentList.iterator();
				while(iterator2.hasNext()){
					Student student = iterator2.next();
					if (student.getStudentDept() == department) {
			%>
				<tr>
					<td><a href="#" onclick="alert('<%=student.getStudentName()%>');"><%=student.getStudentId()%></a></td>
					<td><%=student.getStudentMark()%></td>
					<%
						if (first) {
					%>
					<td rowspan=<%=rowspan%>><%=converted%></td>
					<%
						}
						first = false;
					%>
				</tr>
					<% 
					}
				}
				
			%>
		</tr>
			<%
		}
	}	
	%>
	</table>
	<br><br>
	<a href="login.jsp"><b>Logout</b></a>
</body>
</html>