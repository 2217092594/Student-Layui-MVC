package exam.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.StuinfoDao;
import dao.TeainfoDao;

/**
 * Servlet implementation class StuinfoinServlet
 */
@WebServlet("/StuinfoinServlet")
public class StuinfoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StuinfoinServlet() {
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
		if (session.getAttribute("role") == "admin" || session.getAttribute("role") == "teacher") {

			request.getRequestDispatcher("/studentadd.jsp").forward(request, response);
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
		int sid = Integer.parseInt(request.getParameter("sid"));
		String sname = request.getParameter("sname");

		String ssex = request.getParameter("ssex");
		int sage = Integer.parseInt(request.getParameter("sage"));
		String szy = request.getParameter("szy");
		String sphone = request.getParameter("sphone");
		String sclass = request.getParameter("sclass");
		String sidnum = request.getParameter("sidnum");
		String sql = "insert into student_info values(" + "\'" + sid + "\'" + "," + "\'" + sname + "\'" + "," + "\'"
				+ sage + "\'" + "," + "\'" + ssex + "\'" + "," + "\'" + szy + "\'" + "," + "\'" + sclass + "\'" + ","
				+ "\'" + sphone + "\'" + "," + "\'" + sidnum + "\'" + ");";
		try {

			int panduan = StuinfoDao.Stuinfoinsert(sql, sid);
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
