package egovframework.omcst.manage.member.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.omcst.manage.member.service.MailSendService;
import egovframework.omcst.manage.member.service.MemberService;
import egovframework.omcst.manage.member.vo.MemberVO;

@Controller
public class MemberContoller {

	@Resource(name = "memberService")
	private MemberService memberService;
	
	@Autowired
	private MailSendService mailService;

	@GetMapping(value="/join")
	public String joinPage(ModelMap model) throws Exception{
		return "omcst/manage/users/Join";
	}
	
	@GetMapping(value="/welcome")
	public String welcome(ModelMap model) throws Exception{
		return "omcst/manage/users/JoinComplete";
	}
	
	@PostMapping(value="/join", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public ResponseEntity<String> join(ModelMap model,MemberVO memberVO, BindingResult bindingResult) {
		try {
			memberService.insertMember(memberVO, bindingResult);
			return ResponseEntity.ok().body(memberVO.getMberNm());
	    } catch (Exception e) {
	        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
	    }		
	}
	
	@PostMapping(value="/duplicatedId", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public ResponseEntity<String> duplicatedId(ModelMap model,@RequestParam(value="mberId", required=true) String mberId) throws Exception{
		try {
			memberService.duplicatedId(mberId);
			return ResponseEntity.ok().body(mberId);
	    } catch (Exception e) {
	        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
	    }	
	}
	
	@PostMapping(value="/duplicatedEmail", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public ResponseEntity<String> duplicatedEmail(@RequestParam(value="email", required=true) String email) throws Exception{
		try {
			memberService.duplicatedEmail(email);
			return ResponseEntity.ok().body(email);
	    } catch (Exception e) {
	        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
	    }	
	}
	
	@PostMapping(value="/mailCheck",  produces = "application/text; charset=UTF-8")
	@ResponseBody
	public ResponseEntity<String> mailCheck(@RequestParam(value="email", required=true)String email, HttpServletResponse response)throws Exception{
		System.out.println("이메일 인증메일 "+ email);
//		return ResponseEntity.ok().body("444444");
		try {
			return ResponseEntity.ok().body(mailService.joinEmail(email));
		}catch (Exception e) {
		     return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
		}	
	}
	
	
	/*
	 * @PostMapping(value="/mailAuth") public ResponseEntity<String>
	 * mailAuth(ModelMap model, @RequestParam(value="mberEmail", required=true)
	 * String mberEmail ) throws Exception { try { String authKey =
	 * mailSendService.sendAuthMail();
	 * 
	 * return ResponseEntity.ok().body(""); } catch (Exception e) { return
	 * ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage()); } }
	 */
}