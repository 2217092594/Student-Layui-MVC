package exam.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.GradeDao;
import dao.StuinfoDao;
import dao.TeainfoDao;

/**
 * Servlet implementation class StuinfoinServlet
 */
@WebServlet("/GradeinServlet")
public class GradeinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GradeinServlet() {
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

		System.out.println("doget");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		if (session.getAttribute("role") == "admin" || session.getAttribute("role") == "teacher") {

			request.getRequestDispatcher("/gradeadd.jsp").forward(request, response);
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
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String classs = request.getParameter("classs");
		int yuwen = Integer.parseInt(request.getParameter("yuwen"));
		int shuxue = Integer.parseInt(request.getParameter("shuxue"));
		int yingyu = Integer.parseInt(request.getParameter("yingyu"));
		int wuli = Integer.parseInt(request.getParameter("wuli"));
		int huaxue = Integer.parseInt(request.getParameter("huaxue"));
		int shengwu = Integer.parseInt(request.getParameter("shengwu"));

		String sql = "insert into student_grade values(" + "\'" + id + "\'" + "," + "\'" + name + "\'" + "," + "\'"
				+ classs + "\'" + "," + "\'" + yuwen + "\'" + "," + "\'" + shuxue + "\'" + "," + "\'" + yingyu + "\'"
				+ "," + "\'" + wuli + "\'" + "," + "\'" + huaxue + "\'" + "," + "\'" + shengwu + "\'" + ");";
		try {

			int panduan = GradeDao.gradeInsert(sql, id);
			System.out.println("状态码" + panduan);
			if (panduan == 1) {
				System.out.println("chenggong");
				response.getWriter().write("success");

			} else if (panduan == 2) {
				System.out.println("shibai");
				response.getWriter().write("faile");
			} else if (panduan == 3) {
				response.getWriter().write("youle");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
