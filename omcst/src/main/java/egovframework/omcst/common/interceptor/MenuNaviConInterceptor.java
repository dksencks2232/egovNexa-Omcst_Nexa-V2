package egovframework.omcst.common.interceptor;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import egovframework.let.sym.mnu.mpm.service.EgovMenuManageService;

/**
 * @author csh
 * 메뉴 네비게이션바 자동화를 위한 interceptor
 */
public class MenuNaviConInterceptor implements HandlerInterceptor{
	
	/** EgovMenuManageService */
	@Resource(name = "meunManageService")
    private EgovMenuManageService menuManageService;
	
	//interceptor 실행되지 않도록 blocked_urls 변수선언
	private final String[] BLOCKED_URLS= {".jpg",".js",".css", ".png",".gif","/mainMenuList.ajax","cmm/main/mainPage.do","uat/uia/actionMain.do","validator.do"};
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		//url을 가져옴
		String requestUrl = request.getRequestURL().toString();
		
	    for (String blockedUrl : BLOCKED_URLS) {
	    	//url비교후 boocked_urls 배열 변수에 포함된 항복이 있으면 interceptor 실행하지 않음
	        if (requestUrl.contains(blockedUrl)) {
	       // 	System.out.println("blockedUrl#############"+blockedUrl);
	            return true;
	        }
	    }
	    
	 //	System.out.println("======================   url  실행전 ====================" );
 	 //	System.out.println("====================== "+requestUrl+"====================" );
 		
	    //menu_no 를 가지고옴
 		String menuId = request.getParameter("menuId");
 		if(menuId == null || "null".equals(menuId)) {
	 		if(request.getSession().getAttribute("menuId") != null) {
	 			menuId= (String)request.getSession().getAttribute("menuId");
	 		}
 		}
 		
 		if(menuId != null && !"null".equals(menuId)) {
		    request.getSession().setAttribute("menuId", menuId);
		    String menuId2 = menuId.substring(0,1)+"000000";
	    
		    Map<String, Object> map = new HashMap<>();
		    map.put("menuId", menuId);
		    map.put("menuId2", menuId2);
		    
		    map = menuManageService.selectNaviTitle(map);
	 	
	 		request.setAttribute("firstTitle",map.get("firstTitle"));
 			request.setAttribute("lastTitle",map.get("lastTitle"));
 			
 			 if (!map.get("firstTitle").equals(map.get("secondTitle"))) {
 	            request.setAttribute("secondTitle", map.get("secondTitle"));
 	        }
	    }
	    
		return true;
	}

}
