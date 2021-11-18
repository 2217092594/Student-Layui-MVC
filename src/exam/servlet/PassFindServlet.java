package exam.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PassFindDao;

/**
 * Servlet implementation class WangjiServlet
 */
@WebServlet("/PassFindServlet")
public class PassFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PassFindServlet() {
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
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		if (session.getAttribute("role") == "admin" || session.getAttribute("role") == "teacher"
				|| session.getAttribute("role") == "student") {
			String page = request.getParameter("page");	
			System.out.println(page);
           if(page.equals("check")){
	request.getRequestDispatcher("/wangjipass.jsp").forward(request, response);
}else if(page.equals("set")){
	request.getRequestDispatcher("/passset.jsp").forward(request, response);
}
			
		} else {

			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();

			response.setContentType("text/html; charset=utf-8");

			out.print("<script>alert('您还没有权限，请登录');window.document.location.href='login.jsp';</script>");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id=0;
		HttpSession session = request.getSession();
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String opt = request.getParameter("opt");
		if(request.getParameter("id")!=null){
			 id = Integer.parseInt(request.getParameter("id"));
		}
		
		String sidnum = request.getParameter("sidnum");
		System.out.println(opt);
		if (opt.equals("check")) {
			if(session.getAttribute("role").equals("student")){
			PassFindDao ps = new PassFindDao();
			try {
				
				
				String sidnum2 = ps.passCheck(id);
				System.out.println(sidnum2);
				System.out.println(sidnum);
				if (sidnum2 != null && sidnum2.equals(sidnum)) {
					response.getWriter().write("success");
					/*System.out.println("我还在执行");
					request.getRequestDispatcher("/welcome.jsp").forward(request, response);
					System.out.println("我依然还在执行");*/
				} else {
					response.getWriter().write("faile");
					
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}else if(session.getAttribute("role").equals("teacher")){
				System.out.println("teachercheck");
				PassFindDao ps = new PassFindDao();
				try {
					
					
					String sidnum2 = ps.teapassCheck(id);
					System.out.println(sidnum2);
					System.out.println(sidnum);
					if (sidnum2 != null && sidnum2.equals(sidnum)) {
						response.getWriter().write("success");
						/*System.out.println("我还在执行");
						request.getRequestDispatcher("/welcome.jsp").forward(request, response);
						System.out.println("我依然还在执行");*/
					} else {
						response.getWriter().write("faile");
						
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}

		} else if (opt.equals("set")) {
		if(session.getAttribute("role").equals("student")){
            String password = request.getParameter("password");
            int loginid =(int) session.getAttribute("id") ;
			int state=0;
		
			try {
				state = PassFindDao.passSet(loginid, password);

				if (state !=0 && state == 1)
						 {

					response.getWriter().write("success");
				} else if(state!=0&& state ==2) {

					response.getWriter().write("faile");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(session.getAttribute("role").equals("teacher")){
			System.out.println("teacherpassset");
			
			 String password = request.getParameter("password");
	            int loginid =(int) session.getAttribute("id") ;
				int state=0;
			
				try {
					state = PassFindDao.teapassSet(loginid, password);

					if (state !=0 && state == 1)
							 {

						response.getWriter().write("success");
					} else if(state!=0&& state ==2) {

						response.getWriter().write("faile");
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
		}
			
		}

	}

}
