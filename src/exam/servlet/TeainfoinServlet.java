package exam.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.print.attribute.standard.RequestingUserName;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.TeainfoDao;

/**
 * Servlet implementation class TeainfoinServlet
 */
@WebServlet("/TeainfoinServlet")
public class TeainfoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TeainfoinServlet() {
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

		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		if (session.getAttribute("role") == "admin" || session.getAttribute("role") == "teacher") {

			request.getRequestDispatcher("/teacheradd.jsp").forward(request, response);
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
		HttpSession session = request.getSession();
		if (session.getAttribute("role") == "teacher" || session.getAttribute("role") == "admin") {

		} else {

			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>alert('您还没有权限，请登录');window.document.location.href='login.jsp';</script>");
		}
		int tid = Integer.parseInt(request.getParameter("tid"));
		String tname = request.getParameter("tname");

		String tsex = request.getParameter("tsex");
		int tage = Integer.parseInt(request.getParameter("tage"));
		String txueke = request.getParameter("txueke");
		String tphone = request.getParameter("tphone");
		String temail = request.getParameter("temail");
String tidnum = request.getParameter("tidnum");
		String sql = "insert into teacher_info values(" + "\'" + tid + "\'" + "," + "\'" + tname + "\'" + "," + "\'"
				+ tsex + "\'" + "," + "\'" + tage + "\'" + "," + "\'" + txueke + "\'" + "," + "\'" + tphone + "\'" + ","
				+ "\'" + temail + "\'" + "," + "\'" + tidnum + "\'" + ");";
		try {

			int panduan = TeainfoDao.Teainfoinsert(sql, tid);
			if (panduan == 1) {
				System.out.println("chenggong");
				response.getWriter().write("success");

			} else if (panduan == 2) {
				System.out.println("shibai");
				response.getWriter().write("faile");
			} else if (panduan == 3) {
				response.getWriter().write("youle");
			}
			System.out.println("我还执行吗");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
