package egovframework.omcst.attendance.web;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.egovframe.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.com.cmm.LoginVO;
import egovframework.omcst.attendance.service.AttendanceService;
import egovframework.omcst.attendance.vo.AttendanceVO;


@Controller
public class AttendanceController {
	
	@Autowired
	private AttendanceService attendanceService;
	
	private List<AttendanceVO> attList = new ArrayList<AttendanceVO>();
	private AttendanceVO attendanceVO = new AttendanceVO();
	
	private LoginVO loginVO;
	private String loginId;
	private Map<String,Object> resultMap = new HashMap<String,Object>();	
	
	ObjectMapper mapper = new ObjectMapper();
	
	//로그인 ID로 사번조회
	private String searchEstnlId(String loginId) throws Exception {				
		//loginId값을 받아 사번을 조회하고 조회한 사번값을 VO에 SET해주어 저장
		String result = attendanceService.searchEstnlId(loginId);
		return result;
	}
	
	//ATT_ID 검색\	
	private String searchAttId(AttendanceVO attendanceVO) throws Exception {				
		//출석체크정보 세팅시 VO set을 set한 VO정보로 조회
		String result = attendanceService.searchAttId(attendanceVO);
		return result;
	}
	
	//출석체크에 필요한 정보 SET
	private AttendanceVO setAttendanceInfo(String loginId, int gubun) throws Exception {
		String esntlId = searchEstnlId(loginId);
		
		if(attList.size() == 0)
        
		if(gubun == 1) {
			attendanceVO.setEsntl_id(esntlId);
			return attendanceVO;
		}
		
		attendanceVO.setEsntl_id(esntlId);
		attendanceVO.setAttDate(attList.get(0).getAttDate());
		attendanceVO.setAtt_id(searchAttId(attendanceVO));
		
		return attendanceVO; 		
	}
	
	
	//String 값의 null체크
	private boolean stringNullCheck(String check) {
		if( check == null || check.isEmpty()) {
			return false;
		}
		return true;
	}
	
	//시간비교 함수
	private int compareTime(String time1, String time2) {
		int result  = time1.compareTo(time1);
		return result;
	}
	
	//로그인정보 SET
	private void loginInfoSet() {
		loginVO = EgovUserDetailsHelper.isAuthenticated()? (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser():null;
		loginId = loginVO.getId();
	}
	
	//날짜 유효성 검사
	private boolean isDateValid(String esntlId, int gubun) throws Exception {		
		Date date = new Date();
		SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String workTime  = formatter1.format(date).substring(0,11) + "08:30:00";
		
		//검색할 사번값 NullCheck
		if(!stringNullCheck(esntlId)) {
			//사번값이 없으면 조회할 attList가 존재하지않으므로 에러가발생 => 에러방지 + 출석체크가 되어야하는상태로 간주 
			return true;
		}
		
		attList = attendanceService.searchAttInfo(esntlId);
		
		//출근체크시 조회값이 없다는건 출근체크를 아직 하지않은경우이므로 true 리턴 후 출근처리
		if(gubun == 1 && attList.size() == 0) {			
			return true;
		}
		
		//퇴근체크시 조회값이 없다는건 아직 출근체크를 하지않았는데 퇴근체크를 할려는 경우이므로 false 리턴후 출근체크를 아직 하지않았다는 메세지 출력
		if(gubun == 2 && attList.size() == 0) {
			resultMap.put("message", "출근체크를 하지 않으셨습니다.");
			resultMap.put("isSuccess",false);
			return false;
		}
		
		String attDate = attList.get(0).getAttDate();
		String status  = attList.get(0).getStatus();		
		
		//출근체크할때 저장된시간이 당일 출근시간 이후이다. (이미출근체크한상태)   
		if( gubun == 1 && compareTime(attDate,workTime) <= 0) {
        	return false;
        }
		
		//상태가 퇴근인것만 확인 (퇴근은 한번 등록하면 바꾸지못하게 신중히 하도록 유도 추후에 수정할수있는 기능개발
        if( status.equals("2") ) {
        	return false;
        }
        
		return true;
	}
	
	@RequestMapping(value = "/attendanceCheck.do",  produces = "application/text; charset=UTF-8")
	@ResponseBody
	public ResponseEntity<String> attendanceCheck() throws Exception {		
		try {
			//로그인정보 Set
			loginInfoSet();
			
			//출결작업 시작
			resultMap.put("message", "이미 출근체크를 하셨습니다.");
			resultMap.put("isSuccess", false);
			if(isDateValid(searchEstnlId(loginId),1)) {
				//출석체크
				attendanceService.attendanceCheck(setAttendanceInfo(loginId,1));
				resultMap.put("message", "출근체크 완료");
				resultMap.put("isSuccess", true);
			}
			return ResponseEntity.ok().body(mapper.writeValueAsString(resultMap));
	    } catch (Exception e) {
	    	return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
	    }	
	}		
	
	@RequestMapping(value = "/attendanceCheck2.do",  produces = "application/text; charset=UTF-8")
	@ResponseBody
	public ResponseEntity<String> attendanceCheck2() throws Exception {				
		try {		
			//로그인정보 Set
			loginInfoSet();
			
			//출결체크 작업 시작
			resultMap.put("message","이미 퇴근체크를 하셨습니다.");
			resultMap.put("isSuccess",false);
			
			if(isDateValid(searchEstnlId(loginId),2)) {
				//출석체크
				attendanceService.attendanceCheck2(setAttendanceInfo(loginId,2));
				resultMap.put("message","퇴근체크 성공");
				resultMap.put("isSuccess",true);
			}
			return ResponseEntity.ok().body(mapper.writeValueAsString(resultMap));
	    } catch (Exception e) {
	    	return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
	    }	
	}	
}
