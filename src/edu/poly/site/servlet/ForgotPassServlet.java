package edu.poly.site.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.poly.common.EmailUtil;
import edu.poly.common.PageInfo;
import edu.poly.common.PageType;
import edu.poly.dao.UserDao;
import edu.poly.domain.Email;
import edu.poly.model.User;

/**
 * Servlet implementation class ForgotPassServlet
 */
@WebServlet("/ForgotPass")
public class ForgotPassServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PageInfo.preparedAndForwardSite(request, response, PageType.SITE_FORGOT_PASSWORD_PAGE);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String emailAddress =request.getParameter("email");
			String username =request.getParameter("username");
			System.out.println(username);
			System.out.println(emailAddress);
			UserDao dao=new UserDao();
			User user=dao.findByUserIdAndEmail(username, emailAddress);
			

			if (user==null) {
				request.setAttribute("error", "username or email are incorrect");
			}else {
				Email mail=new Email();
				mail.setFrom("thongho431@gmail.com");
				mail.setFrompassword("thonghuynhho");
				mail.setTo(emailAddress);
				StringBuilder sb=new StringBuilder();
				sb.append("Dear").append(username).append("<br>");
				sb.append("you are used the forgotpassword funtion <br>");
				sb.append("your password is <br>").append(user.getPassword()).append("<br>");
				sb.append("Regards<br>");
				
				mail.setContent(sb.toString());
				EmailUtil.send(mail);
				
				request.setAttribute("message", "mail sent.Pleas check and get password");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			request.setAttribute("error", e.getMessage());
		}
		PageInfo.preparedAndForwardSite(request, response, PageType.SITE_FORGOT_PASSWORD_PAGE);

	}

}
