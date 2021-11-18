package exam.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RegisterInsDao;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());
//		doPost(request, response);
		request.getRequestDispatcher("/WEB-INF/jsp/Register.jsp").forward(request, response);
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String opt=request.getParameter("opt");
	    System.out.println("opt"+opt+"name"+name+"password"+password);
	    int panduan =0;
		
		if (opt.equals("student")) {//学生类型
try {
	 
	panduan = RegisterInsDao.SturegInsert(name, password,id);
		
} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}finally {
	System.out.println("传回的状态"+panduan);
	if (panduan==1) { 	
		System.out.println("chenggong");
		response.getWriter().write("success");
		
		
	} else if(panduan==2){
		System.out.println("shibai");
		response.getWriter().write("faile");
	
	}else if(panduan==3){
		response.getWriter().write("youle");
	
	}
}


		}else if(opt.equals("teacher")){//教师类型
			
			try {
				 
				panduan = RegisterInsDao.TearegInsert(name, password,id);
					
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				if (panduan==1) {
					System.out.println("chenggong");
					response.getWriter().write("success");
					
					
				} else if(panduan==2){
					System.out.println("shibai");
					response.getWriter().write("faile");
			
				}else if(panduan==3){
					response.getWriter().write("youle");
			
				}
			}

		}else if(opt.equals("admin")){
			
			try {
				 
				panduan = RegisterInsDao.adminInsert(name, password,id);
					
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				if (panduan==1) {
					System.out.println("chenggong");
					response.getWriter().write("success");
					
					
				} else if(panduan==2){
					System.out.println("shibai");
					response.getWriter().write("faile");
			
				}else if(panduan==3){
					response.getWriter().write("youle");
			
				}
			}

			
		}

	}

}
