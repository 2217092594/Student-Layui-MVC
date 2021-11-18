package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Gradeinfo;
import bean.Teainfo;

public class GradeDao {

	public static List<Object> gradeSelect() throws Exception {
		System.out.println("连接开始");
		Connection conn = JDBCUtil.getConn();

		List<Object> ls = new ArrayList<>();
		PreparedStatement pstm = conn.prepareStatement("select * from student_grade ");

		ResultSet rs = pstm.executeQuery(); // 执行查询
		while (rs.next()) {
			System.out.println("teacher开始显示");
			Gradeinfo student = new Gradeinfo();
			student.setId(rs.getInt("id"));
			student.setName(rs.getString("name"));
			student.setClasss(rs.getString("classs"));
			student.setYuwen(rs.getInt("yuwen"));
			student.setShuxue(rs.getInt("shuxue"));
			student.setYingyu(rs.getInt("yingyu"));
			student.setWuli(rs.getInt("wuli"));
			student.setHuaxue(rs.getInt("huaxue"));
			student.setShengwu(rs.getInt("shengwu"));
			ls.add(student);
		}
		JDBCUtil.close(conn, pstm, rs);
		return ls;
	}

	public static int gradeUpdate(int id, String field, String value) throws Exception {
		System.out.println("连接开始");
		int state;
		String sql = "UPDATE student_grade SET " + field + "=" + "\'" + value + "\'" + " " + "WHERE" + " " + "id"
				+ " = " + id;
		System.out.println(sql);
		DAO dao = new DAO();
		dao.update(sql, null);
		String sql1 = "select " + field + " from student_grade where id =" + "\'" + id + "\'";
		System.out.println(sql1);
		String zhi = dao.getForValue(sql, null);
		System.out.println("value" + zhi);
		if (zhi.equals(value)) {
			state = 1;
		} else {
			state = 2;
		}
		return state;
	}

	public static int gradeDelete(int id) throws Exception {
		int state = 1;
		DAO dao = new DAO();
		String sql1 = "select Count(*)  from student_grade;";
		System.out.println(sql1);
		Number z = (Number) dao.getForValue(sql1, null);
		int zhi = z.intValue();
		String sql = "DELETE FROM student_grade WHERE id =" + "\'" + id + "\'";

		System.out.println(sql);
		dao.update(sql, null);

		String sql2 = "select Count(*)  from student_grade;";
		System.out.println(sql1);
		Number zz = (Number) dao.getForValue(sql, null);
		int zhi1 = zz.intValue();
		if (zhi != zhi1) {
			state = 1;
		} else {
			state = 2;
		}
		return state;

	}

	public static int gradeInsert(String sql, int id) throws Exception {
		System.out.println("连接开始");
		System.out.println(sql);
		int state=0;
		try {
			DAO dao = new DAO();
			String sql2 = "select Count(*)  from student_grade;";
			Number z = (Number) dao.getForValue(sql2, null);
			int zhi = z.intValue();
			
			dao.update(sql, null);
			System.out.println("haizaizhixing ");
			Number zz = (Number) dao.getForValue(sql2, null);
			int zhi1 = zz.intValue();
	System.out.println("zhi"+zhi+"zhi1"+zhi);
			if (zhi != zhi1) { // 如果两次行数相同则，插入失败，否则成功
				state = 1;
			} else {
				state = 2;
				String sql1 = "select *  from student_grade where id= " + "\'" + id + "\'" + ";";// 查询传入的id确定已经存在
				System.out.println(sql1);
				ResultSet st = dao.getresult(sql1);
				System.out.println(st);
			
				if (st.next()) {
					state = 3;
				}
				System.out.println("chongfudaima");
				System.out.println(state);
			} 
		} catch(Exception e){
			e.printStackTrace();
		}
			finally {
		
			// TODO: handle finally clause
			return state;
		
		}
		

	}

}
