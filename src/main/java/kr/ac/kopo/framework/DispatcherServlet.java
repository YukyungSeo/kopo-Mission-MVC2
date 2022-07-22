package kr.ac.kopo.framework;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DispatcherServlet
 */
@WebServlet(urlPatterns = { "*.do" }, initParams = {
		@WebInitParam(name = "controllers", value = "kr.ac.kopo.board.controller.BoardController"
				+ "|kr.ac.kopo.login.controller.LoginController") })
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private HandlerMapping mappings;

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		String ctrlNames = config.getInitParameter("controllers");
//		System.out.println(ctrlNames);

		try {
			mappings = new HandlerMapping(ctrlNames);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uri = request.getRequestURI();
		uri = uri.substring(request.getContextPath().length());
		System.out.println("uri : " + uri);
		
		String view = "";
		try {

			CtrlAndMethod cam = mappings.getCtrlAndMethod(uri);
			if (cam == null) {
				throw new Exception("해당 URL은 존재하지 않습니다.");
			}

			Object target = cam.getTarget();
			System.out.println(target);
			Method method = cam.getMethod();
			System.out.println(method);

			ModelAndView mav = (ModelAndView) method.invoke(target, request, response);
			view = mav.getView();

			// 공유영역 등록
			Map<String, Object> models = mav.getModel();
			Set<String> keys = models.keySet();
			for (String key : keys) {
				request.setAttribute(key, models.get(key));
			}

		} catch (Exception e) {
			// error 페이지를 따로 만들 수 있음!
//			response.setContentType("text/html; charset=utf-8");
//			PrintWriter out = response.getWriter();
//			out.print(e.getMessage());
//			out.close();
			view = "/jsp/error/error-404.jsp";
			
			System.out.println(e.getMessage());
		}
		
		//응답(forword, sendRedirect)
		if(view.startsWith("redirect:")) {
			view = view.substring("redirect:".length());
			response.sendRedirect(view);
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		}
	}

}
