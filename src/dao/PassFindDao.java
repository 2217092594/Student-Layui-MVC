package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.Stu_regi;

public class PassFindDao {

	public String passCheck(int id) throws Exception {
		String sidnum = null;
		System.out.println("连接开始");
		Connection conn = JDBCUtil.getConn();
		PreparedStatement pstm = conn.prepareStatement("select * from student_info where sid = ?");
		pstm.setInt(1, id);
		ResultSet rs = pstm.executeQuery(); // 执行查询
		if(rs.next()){
		 sidnum = rs.getString("sidnum");
		}
	
		JDBCUtil.close(conn, pstm, rs);
		String sidnumsplit = sidnum.substring(12);
		return sidnumsplit;
	}

	public static int passSet(int id,  String value) throws Exception {
		System.out.println("shezhipassword连接开始");
		int state;
		String sql = "UPDATE student_login SET password = " + "\'" + value + "\'" + " " + "WHERE" + " " + "id"
				+ " = " + id;
		System.out.println(sql);
		DAO dao = new DAO();
		dao.update(sql, null);
		String sql1 = "select password from student_login where id ="  + id ;
	System.out.println(sql1);
		String zhi = dao.getForValue(sql1, null);
		System.out.println("value" + zhi);
		if (zhi.equals(value)) {
			state = 1;
		} else {
			state = 2;
		}
		return state;
	}

	
	public String teapassCheck(int id) throws Exception {
		String sidnum = null;
		System.out.println("连接开始");
		Connection conn = JDBCUtil.getConn();
		PreparedStatement pstm = conn.prepareStatement("select * from teacher_info where tid = ?");
		pstm.setInt(1, id);
		ResultSet rs = pstm.executeQuery(); // 执行查询
		if(rs.next()){
		 sidnum = rs.getString("tidnum");
		}
	
		JDBCUtil.close(conn, pstm, rs);
		String sidnumsplit = sidnum.substring(12);
		return sidnumsplit;
	}

	public static int teapassSet(int id,  String value) throws Exception {
		System.out.println("shezhipassword连接开始");
		int state;
		String sql = "UPDATE teacher_login SET password = " + "\'" + value + "\'" + " " + "WHERE" + " " + "id"
				+ " = " + id;
		System.out.println(sql);
		DAO dao = new DAO();
		dao.update(sql, null);
		String sql1 = "select password from teacher_login where id ="  + id ;
	System.out.println(sql1);
		String zhi = dao.getForValue(sql1, null);
		System.out.println("value" + zhi);
		if (zhi.equals(value)) {
			state = 1;
		} else {
			state = 2;
		}
		return state;
	}

	
	
}
