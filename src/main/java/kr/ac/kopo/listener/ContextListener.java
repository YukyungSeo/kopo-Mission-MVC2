package kr.ac.kopo.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.board.service.BoardService;

/**
 * Application Lifecycle Listener implementation class ContextLisener
 *
 */
@WebListener
public class ContextListener implements ServletContextListener {

	/**
	 * @see ServletContextListener#contextDestroyed(ServletContextEvent)
	 */
	public void contextDestroyed(ServletContextEvent event) {
		
	}

	/**
	 * @see ServletContextListener#contextInitialized(ServletContextEvent)
	 */
	public void contextInitialized(ServletContextEvent event) {
		// 리스너는 제일 먼저 실행되고, 제일 마지막에 종료된다.
		// servletContext 영역은 Servelet 들이 공유하는 영역이다. == Application 영역
		System.out.println("리스너 시작...");
		
		ServletContext sc = event.getServletContext();
		
		BoardDAO boardDAO = new BoardDAO();
		BoardService boardService = new BoardService(boardDAO);
		
		sc.setAttribute("boardService", boardService);
		
	}

}
