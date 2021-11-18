package exam.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest req = (HttpServletRequest) arg0;
		HttpServletResponse resp = (HttpServletResponse) arg1;
		String uri = req.getRequestURI();
		/*
		 * 如果这个字符串在位置uri之间或之后没有出现，则返回-1 。
		 */
		if (uri.indexOf("login.jsp") > -1 || uri.indexOf("checklogin.jsp") > -1 || uri.indexOf("checkteacher.jsp") > -1
				|| uri.indexOf("checkstudent.jsp") > -1) 
		{
			arg2.doFilter(arg0, arg1);
			return;
		}
		HttpSession s = req.getSession();
		String islogin = (String) s.getAttribute("IsLogin");
		if (islogin != null && islogin.equals("true")) {
			arg2.doFilter(arg0, arg1);
		} else {
			resp.sendRedirect("login.jsp");
		}

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
	}
}
