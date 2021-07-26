package edu.poly.site.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.poly.common.PageInfo;
import edu.poly.common.PageType;
import edu.poly.dao.UserDao;
import edu.poly.dao.VideoDao;
import edu.poly.model.User;
import edu.poly.model.Video;

/**
 * Servlet implementation class DetailServlet
 */
@WebServlet("/Detail")
public class DetailServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String id = request.getParameter("videoId");
			VideoDao dao =new VideoDao();
			Video video=dao.findById(id);
			request.setAttribute("videos", video);

					
		
		PageInfo.preparedAndForwardSite(request, response, PageType.SITE_VIDEO_DETAIL_PAGE);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	private void findAll(HttpServletRequest request, HttpServletResponse response) {

		try {
			VideoDao dao = new VideoDao();
			List<Video> list = dao.findAll();
			request.setAttribute("videos", list);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("erro", "Erro : " + e.getMessage());
		}
	}

}
