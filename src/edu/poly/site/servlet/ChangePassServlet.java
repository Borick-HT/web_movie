package edu.poly.site.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import edu.poly.common.PageInfo;
import edu.poly.common.PageType;
import edu.poly.common.SessionUtils;
import edu.poly.dao.UserDao;
import edu.poly.domain.ChangePassword;

/**
 * Servlet implementation class ChangePassServlet
 */
@WebServlet("/ChangePass")
public class ChangePassServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = SessionUtils.getLoginedUsername(request);
		if (username == null) {
			request.getRequestDispatcher("/Login").forward(request, response);
			return;
		}
		request.setAttribute("username", username);
		PageInfo.preparedAndForwardSite(request, response, PageType.SITE_CHANGE_PASSWORD_PAGE);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String username = SessionUtils.getLoginedUsername(request);
			ChangePassword form = new ChangePassword();
			BeanUtils.populate(form, request.getParameterMap());
			request.setAttribute("username", username);
			if (!form.getConfirmpassword().equals(form.getPassword())) {
				request.setAttribute("error", "new password and confirm password do not match");

			} else {
				UserDao dao = new UserDao();
				dao.ChangePass(form.getUsername(), form.getCurrentpassword(), form.getPassword());
				request.setAttribute("message", "password login change");
			}

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e.getMessage());

		}
		PageInfo.preparedAndForwardSite(request, response, PageType.SITE_CHANGE_PASSWORD_PAGE);

	}

}
