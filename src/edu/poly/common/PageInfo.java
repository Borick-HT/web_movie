package edu.poly.common;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;

public class PageInfo {
	public static Map<PageType,PageInfo> pageRoute= new HashedMap();
	
	static {
		pageRoute.put(PageType.USER_MANAGEMENT_PAGE,new PageInfo("User management","/admin/user/users.jsp",null));	
		pageRoute.put(PageType.REPORT_MANAGEMENT_PAGE,new PageInfo("Report ","/admin/report/reports.jsp",null));	
		pageRoute.put(PageType.VIDEO_MANAGEMENT_PAGE,new PageInfo("Video management","/admin/video/videos.jsp",null));	
		pageRoute.put(PageType.SITE_HOME_PAGE,new PageInfo("Home Page","/site/home/home.jsp",null));

		pageRoute.put(PageType.SITE_LOGIN_PAGE,new PageInfo("Login Page","/site/user/login.jsp",null));	
		
		pageRoute.put(PageType.SITE_REGISTRATION_PAGE,new PageInfo("Registration Page","/site/user/registration.jsp",null));	
		pageRoute.put(PageType.SITE_CHANGE_PASSWORD_PAGE,new PageInfo("Change Password","/site/user/change_password.jsp",null));	
		pageRoute.put(PageType.SITE_EDIT_PROFILE_PAGE,new PageInfo("Edit Profile Page","/site/user/edit_profile.jsp",null));	
		pageRoute.put(PageType.SITE_FORGOT_PASSWORD_PAGE,new PageInfo("Forgot Password ","/site/user/forgot_password.jsp",null));	
		pageRoute.put(PageType.SITE_SHARE_PAGE,new PageInfo("Share Page","/site/video/share.jsp",null));	
		pageRoute.put(PageType.SITE_FAVORITE_PAGE,new PageInfo("Favorite Page","/site/video/favorites.jsp",null));	
		pageRoute.put(PageType.SITE_VIDEO_DETAIL_PAGE,new PageInfo("Video Detail Page","/site/video/detail.jsp",null));	



	}
	public static void preparedAndForward(HttpServletRequest request,HttpServletResponse reponse, PageType pageType) throws ServletException, IOException {
		PageInfo page = pageRoute.get(pageType);
		request.setAttribute("page", page);
		
		request.getRequestDispatcher("/admin/layout.jsp").forward(request, reponse);
	}
	public static void preparedAndForwardSite(HttpServletRequest request,HttpServletResponse reponse, PageType pageType) throws ServletException, IOException {
		PageInfo page = pageRoute.get(pageType);
		request.setAttribute("page", page);
		
		request.getRequestDispatcher("/site/layout.jsp").forward(request, reponse);
	}
	
	private String title;
	private String contentUrl;
	private String stripUrl;   
	
	
	public PageInfo(String title, String contentUrl, String stripUrl) {
		super();
		this.title = title;
		this.contentUrl = contentUrl;
		this.stripUrl = stripUrl;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContentUrl() {
		return contentUrl;
	}
	public void setContentUrl(String contentUrl) {
		this.contentUrl = contentUrl;
	}
	public String getStripUrl() {
		return stripUrl;
	}
	public void setStripUrl(String stripUrl) {
		this.stripUrl = stripUrl;
	}

}
