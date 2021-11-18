package exam.servlet;

import java.io.IOException;

import javax.print.attribute.SetOfIntegerSyntax;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import bean.Ad_regi;
import bean.Gradeinfo;
import bean.Stu_regi;
import bean.Tea_regi;
import dao.LoginSelDao;

/**
 * Servlet implementation class Control
 */
@WebServlet("/LoginControl")
public class LoginControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginControl() {
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
		//获取session等值
		HttpSession session = request.getSession();
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String opt = request.getParameter("opt");
		int id = Integer.parseInt(request.getParameter("id"));

		response.getWriter();
		String userName = request.getParameter("name");
		String password = request.getParameter("password");
		String s = request.getParameter("typ");
		if(id==1){
			System.out.println(id);
		}
		System.out.println("control接收到的表单信息"+opt+" "+id+" "+userName+" "+password+" "+s);
		
		if ("login".equals(opt)) {
					System.out.println("接受opt");
			
			if (s.equals("1")) {
				System.out.println("typ成功");
				LoginSelDao sel = new LoginSelDao();
				

				try {
					Stu_regi student = sel.StudentSelect(id);
					
					if (student != null &&student.getId()==id&& student.getName().equals(userName) && student.getPassword().equals( password)) {
						// session.setAttribute("IsLogin", "true");
						//设置session student
						session.setAttribute("role", "student");
						session.setAttribute("name", student.getName());
						session.setAttribute("id", id);
						System.out.println("学生登录servlet获取到的session为"+session.getAttribute("role"));
						response.sendRedirect("studentmainview.jsp");
						
					} else {

						response.sendRedirect("login_error.html");
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}else if(s.equals("2")){
				System.out.println("teachertyp成功");
				LoginSelDao sel = new LoginSelDao();
				

				try {
					Tea_regi teacher= sel.TeacherSelect(id);
					
					if (teacher != null &&teacher.getId()==id&& teacher.getName().equals(userName) && teacher.getPassword().equals( password)) {
						// session.setAttribute("IsLogin", "true");
						//设置session teacher
						session.setAttribute("role", "teacher");
						session.setAttribute("name", teacher.getName());
						session.setAttribute("id", id);
						response.sendRedirect("teachermainview.jsp");
					} else {

						response.sendRedirect("login_error.html");
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else if(s.equals("3")){
				System.out.println("admintyp成功");
				LoginSelDao sel = new LoginSelDao();
				

				try {
					Ad_regi teacher= sel.adminSelect(id);
					
					if (teacher != null &&teacher.getId()==id&& teacher.getName().equals(userName) && teacher.getPassword().equals( password)) {
						//设置session admin
						session.setAttribute("role", "admin");
						session.setAttribute("name", teacher.getName());
						session.setAttribute("id", id);
						response.sendRedirect("index.jsp");
					} else {

						response.sendRedirect("login_error.html");
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
System.out.println("最后了");
			return;
	}
	}
		
		//
		// // 是注销操作
		// else if("logout".equals(opt))
		//
		// {
		// request.getSession().invalidate();
		// path = "login.jsp";
		// }
		// request.getRequestDispatcher(path).forward(request,response);

//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
