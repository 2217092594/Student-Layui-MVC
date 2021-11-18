package exam.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TeainfoDao;

/**
 * Servlet implementation class TeainfoupServlet
 */
@WebServlet("/TeainfoupServlet")
public class TeainfoupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeainfoupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		int state=1;
		int id = Integer.parseInt(request.getParameter("id"));
		String field = request.getParameter("field");
		String value = request.getParameter("value");
		System.out.println(id+field+value);
		try {
			 state = TeainfoDao.TeaInfoupdate(id, field, value);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (state==1) {
			System.out.println("chenggong");
			response.getWriter().write("success");
			
		} else if(state==2){
			System.out.println("shibai");
			response.getWriter().write("faile");
	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
