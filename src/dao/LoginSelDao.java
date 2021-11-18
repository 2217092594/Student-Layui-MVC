package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.Ad_regi;
import bean.Gradeinfo;
import bean.Stu_regi;
import bean.Tea_regi;


public class LoginSelDao {

	
	public Stu_regi StudentSelect(int id) throws Exception {
		System.out.println("连接开始");
		Connection conn = JDBCUtil.getConn();
		
		Stu_regi student= new Stu_regi() ;
		PreparedStatement pstm = conn.prepareStatement("select * from student_login where id = ?");
		pstm.setInt(1, id);
		ResultSet rs = pstm.executeQuery(); // 执行查询
		if (rs.next()) {
			System.out.println("开始显示");
			
			student.setId(rs.getInt("id"));
			student.setName(rs.getString("name"));
			student.setPassword(rs.getString("password"));
			System.out.println(rs.getInt("id")+rs.getString("name")+rs.getString("password"));
          
		}
		JDBCUtil.close(conn, pstm, rs);
		return student;
	}
	
	public Tea_regi TeacherSelect(int id) throws Exception {
		System.out.println("连接开始");
		Connection conn = JDBCUtil.getConn();
		Tea_regi student = new Tea_regi();
	
		PreparedStatement pstm = conn.prepareStatement("select * from teacher_login where id = ?");
		pstm.setInt(1, id);
		ResultSet rs = pstm.executeQuery(); // 执行查询
		if (rs.next()) {
			System.out.println("teacher开始显示");

			student.setId(rs.getInt("id"));
			student.setName(rs.getString("name"));
			student.setPassword(rs.getString("password"));
			
		}
		JDBCUtil.close(conn, pstm, rs);
		return student;
	}
	
	
	public Ad_regi adminSelect(int id) throws Exception {
		System.out.println("连接开始");
		Connection conn = JDBCUtil.getConn();
		Ad_regi student = new Ad_regi();
	
		PreparedStatement pstm = conn.prepareStatement("select * from admin_login where id = ?");
		pstm.setInt(1, id);
		ResultSet rs = pstm.executeQuery(); // 执行查询
		if (rs.next()) {
			System.out.println("admin开始显示");

			student.setId(rs.getInt("id"));
			student.setName(rs.getString("name"));
			student.setPassword(rs.getString("password"));
			
		}
		JDBCUtil.close(conn, pstm, rs);
		return student;
	}
	
}
