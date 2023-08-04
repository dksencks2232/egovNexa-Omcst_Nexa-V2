package egovframework.omcst.vacation.year.service;

import java.util.List;
import java.util.Map;

public interface YearVacationService {

	List<YearVacationVO> selectListYearVacation(YearVacationVO yearVacationVO) throws Exception;
	
	Map<String, Object> selectYearVacations(YearVacationVO yearVacationVO) throws Exception;

	YearVacationVO insertYearVacation(YearVacationVO yearVacationVo) throws Exception;
	
	int updateYearVacation(String chkeckVcId) throws Exception;
	

	int deleteYearVacation(String checkVcId) throws Exception ;

}
