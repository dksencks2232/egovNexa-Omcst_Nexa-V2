package egovframework.omcst.vacation.year.service;

import java.util.List;
import java.util.Map;

public interface YearVacationMngService {

	List<YearVacationVO> selectListYearVacationMng(YearVacationVO mngVo) throws Exception;

	int updateSignYearVacation(String checkVcIdForAsk, String forSign) throws Exception;
	
	List<YearVacationVO> selectListInitVacationInfo(YearVacationVO mngVo) throws Exception;
	
	int selectListInitVacationInfoTotCnt(YearVacationVO mngVo) throws Exception;
	
	void vacationUpdate(String checkVcIdForAsk, YearVacationVO mngVo) throws Exception;
	
	Map<String, Object> selectYearVacationMng(YearVacationVO mngVo) throws Exception;

}
