package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Stuinfo;

public class StuinfoDao {

	public static List<Object> StudentSelect() throws Exception {
		System.out.println("连接开始");
		Connection conn = JDBCUtil.getConn();
		
		List<Object> ls = new ArrayList<>();
		PreparedStatement pstm = conn.prepareStatement("select * from student_info ");

		ResultSet rs = pstm.executeQuery(); // 执行查询
		while (rs.next()) {
			Stuinfo student = new Stuinfo();

			student.setSid(rs.getInt("sid"));
			student.setSname(rs.getString("sname"));
			student.setSage(rs.getInt("sage"));
			student.setSphone(rs.getString("sphone"));
			student.setSclass(rs.getString("sclass"));
			student.setSsex(rs.getString("ssex"));
			student.setSzy(rs.getString("szy"));
			student.setSidnum(rs.getString("sidnum"));
			System.out.println(rs.getInt("sid")+rs.getString("sname"));
			ls.add(student);
			
		}
		System.out.println(ls.get(0));

		JDBCUtil.close(conn, pstm, rs);
		return ls;
	}

	public static int StuInfoupdate(int id, String field, String value) throws Exception {
		System.out.println("连接开始");
		int state;
		String sql = "UPDATE student_info SET " + field + "=" + "\'" + value + "\'" + " " + "WHERE" + " " + "sid"
				+ " = " + id;
		System.out.println(sql);
		DAO dao = new DAO();
		dao.update(sql, null);
		String sql1 = "select " + field + " from student_info where sid =" + "\'" + id + "\'";
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

	public static int StuInfodelete(int id) throws Exception {
		int state = 1;
		DAO dao = new DAO();
		String sql1 = "select Count(*)  from student_info;";
		System.out.println(sql1);
		Number z = (Number) dao.getForValue(sql1, null);
		int zhi = z.intValue();
		String sql = "DELETE FROM student_info WHERE sid =" + "\'" + id + "\'";

		System.out.println(sql);
		dao.update(sql, null);

		String sql2 = "select Count(*)  from student_info;";
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

	
	public static int Stuinfoinsert(String sql, int id) throws Exception {
		System.out.println("连接开始");
		System.out.println(sql);
		int state=0;
		
		try {
			DAO dao = new DAO();
			String sql2 = "select Count(*)  from student_info;";
			Number z = (Number) dao.getForValue(sql2, null);
			int zhi = z.intValue();
			
			dao.update(sql, null);
			Number zz = (Number) dao.getForValue(sql2, null);
			int zhi1 = zz.intValue();
			
			if (zhi != zhi1) { // 如果两次行数相同则，插入失败，否则成功
				state = 1;
			} else if (zhi == zhi1) {
				state = 2;
				String sql1 = "select *  from student_info where sid=" + "\'" + id + "\'" + ";";// 查询传入的id确定已经添加成功
				System.out.println(sql1);
				ResultSet st = dao.getresult(sql1);
				System.out.println(st);
				
				if (st.next()) {
					state = 3;
				}
			}
			
		} finally {
			// TODO: handle finally clause
			System.out.println(state);
			return state;

		}
		
	}

}
