package test_sample;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String USERNAME = "hello";
	private static final String PASSWORD = "password123";
       
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		if(username.isEmpty() || password.isEmpty()) {
			RequestDispatcher req = request.getRequestDispatcher("login.jsp");
			req.include(request, response);
		}
		else if (!username.equals(USERNAME) || !password.equals(PASSWORD)) {
			RequestDispatcher req = request.getRequestDispatcher("login.jsp");
			request.setAttribute("error", "Invalid username or password");
			req.include(request, response);
		}
		else {
			request.setAttribute("Departments", this.getDepartments(this.getStudentDetails()));
			request.setAttribute("StudentList", this.getStudentDetails());
			RequestDispatcher req = request.getRequestDispatcher("index.jsp");
			req.forward(request, response);
		}
	}
    
    public ArrayList<Student> getStudentDetails(){
		ArrayList<Student> studentList = new ArrayList<Student>();
		 
		studentList.add(new Student("S1", "Student1", "Dep 1", "35"));
    	studentList.add(new Student("S2", "Student2", "Dep 1", "70"));
    	studentList.add(new Student("S3", "Student3", "Dep 1", "60"));
    	studentList.add(new Student("S4", "Student4", "Dep 1", "90"));
    	studentList.add(new Student("S5", "Student5", "Dep 2", "30"));
    	studentList.add(new Student("S6", "Student6", "Dep 3", "32"));
    	studentList.add(new Student("S7", "Student7", "Dep 3", "70"));
    	studentList.add(new Student("S8", "Student8", "Dep 3", "20"));

		return studentList;
	}
    
    public ArrayList<String> getDepartments(ArrayList<Student> studentList){
    	ArrayList<String> departments = new ArrayList<String>();
    	for(Student student : studentList) {
    		if(!departments.contains(student.getStudentDept())) {
    			departments.add(student.getStudentDept());
    		}
    	}
    	return departments;
    }
}
