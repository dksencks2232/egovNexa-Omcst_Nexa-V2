package egovframework.omcst.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.egovframe.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;
import org.springframework.web.servlet.HandlerInterceptor;


/**
 * @author csh
 * 로그인 인터셉터 
 */
public class AuthInterceptor implements HandlerInterceptor{
	
	//interceptor 실행되지 않도록 blocked_urls 변수선언
	private final String[] BLOCKED_URLS= {".jpg",".js",".css", ".png",".gif",".ajax","validator.do","Login","actionLogout","FindId","FindPwd","/join","welcome","mailCheck","duplicated","authFailed"};
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		//url을 가져옴
		String requestUrl = request.getRequestURL().toString();
			
		for (String blockedUrl : BLOCKED_URLS) {
		//url비교후 boocked_urls 배열 변수에 포함된 항복이 있으면 interceptor 실행하지 않음
			if (requestUrl.contains(blockedUrl)) {
			   return true;
			}
		}	    
		
		boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		  
		if (isAuthenticated) {
		    return true;
		} else {
			response.sendRedirect(request.getContextPath() + "/uat/uia/authFailed.do");
            return false;
		}
		
	}
	
}
