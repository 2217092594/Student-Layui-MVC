package exam.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSONObject;

import bean.Vo;
import dao.GradeDao;
import dao.StuinfoDao;
import dao.TeainfoDao;

/**
 * Servlet implementation class StuinfoshServlet
 */
@WebServlet("/GradeshServlet2")
public class GradeshServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GradeshServlet2() {
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
		if (session.getAttribute("role") == "student" || session.getAttribute("role") == "teacher"
				|| session.getAttribute("role") == "student") {

			request.getRequestDispatcher("/studentgrade.jsp").forward(request, response);
		} else {

			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();

			response.setContentType("text/html; charset=utf-8");

			out.print("<script>alert('您还没有权限，请登录');window.document.location.href = 'login.jsp';</script>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		try {

			List<Object> ls = GradeDao.gradeSelect();
			System.out.println(ls);
			System.out.println(ls.get(0));
			response.setContentType("text/html; charset=UTF-8");
			Vo vo = new Vo();
			vo.setCode(0);
			vo.setCount(ls.size());
			vo.setData(ls);
			vo.setMsg("success");
			response.getWriter().write(JSONObject.toJSON(vo).toString());
			System.out.println(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
