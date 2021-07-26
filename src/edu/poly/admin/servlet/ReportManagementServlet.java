package edu.poly.admin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.poly.common.PageInfo;
import edu.poly.common.PageType;
import edu.poly.dao.FavoriteDao;
import edu.poly.dao.VideoDao;
import edu.poly.domain.FavoriteReport;
import edu.poly.domain.FavoriteUserReport;
import edu.poly.model.Video;

/**
 * Servlet implementation class ReportManagementServlet
 */
@WebServlet("/ReportManagementServlet")
public class ReportManagementServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		reporFavoriteByVideo(request, response);
		reporFavoriteUserByVideo(request, response);
		PageInfo.preparedAndForward(request, response, PageType.REPORT_MANAGEMENT_PAGE);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void reporFavoriteByVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			FavoriteDao dao = new FavoriteDao();
			List<FavoriteReport> list = dao.reporFavoriteByVideo();

			request.setAttribute("favList", list);
		} catch (Exception e) {
			// TODO: handle exception
			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}

	protected void reporFavoriteUserByVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String videoUserId = request.getParameter("videoUserId");
			VideoDao vdao = new VideoDao();
			List<Video> vList = vdao.findAll();
			if (videoUserId == null && vList.size() > 0) {
				videoUserId = vList.get(0).getVideoId();
			}
			FavoriteDao dao = new FavoriteDao();
			List<FavoriteUserReport> list = dao.reporFavoriteUserByVideo(videoUserId);
			request.setAttribute("videoUserId", videoUserId);
			request.setAttribute("vidList", vList);
			request.setAttribute("favUsers", list);

		} catch (Exception e) {
			// TODO: handle exception
			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}

}
