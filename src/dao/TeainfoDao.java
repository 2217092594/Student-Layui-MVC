package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Teainfo;

public class TeainfoDao {

	public static List<Object> TeacherSelect() throws Exception {
		System.out.println("连接开始");
		Connection conn = JDBCUtil.getConn();

		List<Object> ls = new ArrayList<>();
		PreparedStatement pstm = conn.prepareStatement("select * from teacher_info ");

		ResultSet rs = pstm.executeQuery(); // 执行查询
		while (rs.next()) {
			System.out.println("teacher开始显示");
			Teainfo student = new Teainfo();
			student.setTid(rs.getInt("tid"));
			student.setTname(rs.getString("tname"));
			student.setTage(rs.getInt("tage"));
			student.setTphone(rs.getString("tphone"));
			student.setTemail(rs.getString("temail"));
			student.setTsex(rs.getString("tsex"));
			student.setTxueke(rs.getString("txueke"));
			student.setTidnum(rs.getString("tidnum"));
			ls.add(student);
		}
		JDBCUtil.close(conn, pstm, rs);
		return ls;
	}

	public static int TeaInfoupdate(int id, String field, String value) throws Exception {
		System.out.println("连接开始");
		int state;
		String sql = "UPDATE teacher_info SET " + field + "=" + "\'" + value + "\'" + " " + "WHERE" + " " + "tid"
				+ " = " + id;
		System.out.println(sql);
		DAO dao = new DAO();
		dao.update(sql, null);
		String sql1 = "select " + field + " from teacher_info where tid =" + "\'" + id + "\'";
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

	public static int TeaInfodelete(int id) throws Exception {
		int state = 1;
		DAO dao = new DAO();
		String sql1 = "select Count(*)  from teacher_info;";
		System.out.println(sql1);
		Number z = (Number) dao.getForValue(sql1, null);
		int zhi = z.intValue();
		String sql = "DELETE FROM teacher_info WHERE tid =" + "\'" + id + "\'";

		System.out.println(sql);
		dao.update(sql, null);

		String sql2 = "select Count(*)  from teacher_info;";
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

	public static int Teainfoinsert(String sql, int id) throws Exception {
		System.out.println("连接开始");
		System.out.println(sql);
		int state=0;
		try {
			DAO dao = new DAO();
			String sql2 = "select Count(*)  from teacher_info;";
			Number z = (Number) dao.getForValue(sql2, null);
			int zhi = z.intValue();
			
			dao.update(sql, null);
			System.out.println("haizaizhixing ");
			Number zz = (Number) dao.getForValue(sql2, null);
			int zhi1 = zz.intValue();
	
			if (zhi != zhi1) { // 如果两次行数相同则，插入失败，否则成功
				state = 1;
			} else {
				state = 2;
				String sql1 = "select *  from teacher_info where tid= " + "\'" + id + "\'" + ";";// 查询传入的id确定已经存在
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
