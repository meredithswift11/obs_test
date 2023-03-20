package test_sample;

public class Student {
	private String studentId;
	private String studentName;
	private String studentDept;
	private String studentMark;

	public Student(String id, String name, String dept, String mark) {
		studentId = id;
		studentName = name;
		studentDept = dept;
		studentMark = mark;
	}
	
	public String getStudentId() {
		return studentId;
	}
	
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	
	public String getStudentName() {
		return studentName;
	}
	
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	
	public String getStudentDept() {
		return studentDept;
	}
	
	public void setStudentDept(String studentDept) {
		this.studentDept = studentDept;
	}

	public String getStudentMark() {
		return studentMark;
	}

	public void setStudentMark(String studentMark) {
		this.studentMark = studentMark;
	}
}
