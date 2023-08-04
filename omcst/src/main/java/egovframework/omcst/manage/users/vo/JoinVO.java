package egovframework.omcst.manage.users.vo;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * 게시물에 대한 데이터 처리 모델 클래스
 * @author 공통 서비스 개발팀 이삼섭
 * @since 2009.03.06
 * @version 1.0
 * @see
 *  
 * <pre>
 * << 개정이력(Modification Information) >>
 * 
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2009.03.06  이삼섭          최초 생성
 *  2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성 
 *  
 *  </pre>
 */
@SuppressWarnings("serial")
public class JoinVO implements Serializable {
	private String emplyrId;
	private String userNm;
	private String password;
	private String mbtlnum;
	private String emailAdres;
	private String joinDate;
	
	
	public String getEmplyrId() {
		return emplyrId;
	}


	public void setEmplyrId(String emplyrId) {
		this.emplyrId = emplyrId;
	}


	public String getUserNm() {
		return userNm;
	}


	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getMbtlnum() {
		return mbtlnum;
	}


	public void setMbtlnum(String mbtlnum) {
		this.mbtlnum = mbtlnum;
	}


	public String getEmailAdres() {
		return emailAdres;
	}


	public void setEmailAdres(String emailAdres) {
		this.emailAdres = emailAdres;
	}


	public String getJoinDate() {
		return joinDate;
	}


	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}


	/**
	 * toString 메소드를 대치한다.
	 */
	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}
}
