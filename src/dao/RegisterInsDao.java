package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class RegisterInsDao {
	public static int SturegInsert(String name, String password,int id) throws Exception {
		int state=0;
		try {
			System.out.println("连接开始");
			
			Connection conn = JDBCUtil.getConn();

			PreparedStatement pstm = conn.prepareStatement("select * from student_login where  id=?");
			
			pstm.setInt(1, id);

			ResultSet rss = pstm.executeQuery();
			System.out.println("chaxunjieshu ");
			if (rss.next()) {
				
				return state=3;
			}
			System.out.println("chaxunstate"+state);
			JDBCUtil.close(conn, pstm, rss);
			Connection conn1 = JDBCUtil.getConn();
			PreparedStatement pstm1 = conn1.prepareStatement("insert into student_login values(?,?,?)");
			pstm1.setInt(1, id);
			pstm1.setString(2, name);
			pstm1.setString(3, password);
			int rs = pstm1.executeUpdate();// 执行插入

			JDBCUtil.close(conn1, pstm1);
			if (rs > 0) {
				return state=1;
			}else if(rs==0){
			return state=2;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}finally{
			return state;
		}
		
	
		
	}
	public static int TearegInsert(String name, String password,int id) throws Exception {
		System.out.println("连接开始");
		
		int state=0;
		try {
			Connection conn = JDBCUtil.getConn();

			PreparedStatement pstm = conn.prepareStatement("select * from teacher_login where  id=?");
	
			pstm.setInt(1, id);

			ResultSet rss = pstm.executeQuery();
			if (rss.next()) {
				return state=3;
			}
			JDBCUtil.close(conn, pstm, rss);
			Connection conn1 = JDBCUtil.getConn();
			PreparedStatement pstm1 = conn1.prepareStatement("insert into teacher_login values(?,?,?)");
			pstm1.setInt(1, id);
			pstm1.setString(2, name);
			pstm1.setString(3, password);
			int rs = pstm1.executeUpdate();// 执行插入

			JDBCUtil.close(conn1, pstm1);
			if (rs > 0) {
				return state=1;
			}else if(rs==0){
			return state=2;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			return state;
		}
	}
		
		
		public static int adminInsert(String name, String password,int id) throws Exception {
			System.out.println("连接开始");
			
			int state=0;
			try {
				Connection conn = JDBCUtil.getConn();

				PreparedStatement pstm = conn.prepareStatement("select * from admin_login where  id=?");
		
				pstm.setInt(1, id);

				ResultSet rss = pstm.executeQuery();
				if (rss.next()) {
					return state=3;
				}
				JDBCUtil.close(conn, pstm, rss);
				Connection conn1 = JDBCUtil.getConn();
				PreparedStatement pstm1 = conn1.prepareStatement("insert into admin_login values(?,?,?)");
				pstm1.setInt(1, id);
				pstm1.setString(2, name);
				pstm1.setString(3, password);
				int rs = pstm1.executeUpdate();// 执行插入

				JDBCUtil.close(conn1, pstm1);
				if (rs > 0) {
					return state=1;
				}else if(rs==0){
				return state=2;
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				return state;
			}
			
		
		
	}
     
}
