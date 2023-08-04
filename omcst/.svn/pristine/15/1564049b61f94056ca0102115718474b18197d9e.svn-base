package egovframework.omcst.vacation.year.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import egovframework.omcst.vacation.year.service.YearVacationVO;

@Repository("YearVacationMngDAO")
public class YearVacationMngDAO extends EgovAbstractMapper {

	public List<YearVacationVO> selectListYearVacationMng(YearVacationVO mngVo) throws Exception {
		
		return selectList("YearVacationMngDAO.selectListYearVacationMng", mngVo);
	}
	
	public int selectListYearVacationMngCnt(YearVacationVO mngVo) throws Exception {
		
		return (Integer)selectOne("YearVacationMngDAO.selectListYearVacationMngCnt", mngVo);
		
	}
	
	public YearVacationVO selectCurrentVacationSituation(YearVacationVO mngVo) throws Exception{
		return (YearVacationVO)selectOne("YearVacationMngDAO.selectCurrentVacationSituation", mngVo);
	}

	public int updateSignYearVacation(YearVacationVO vo) throws Exception{

		return update("YearVacationMngDAO.updateSignYearVacation", vo);
	}
	
	public List<YearVacationVO> selectListInitVacationInfo(YearVacationVO mngVo) throws Exception{
		return selectList("YearVacationMngDAO.selectListInitVacationInfo", mngVo);
	}
	
	public int selectListInitVacationInfoTotCnt(YearVacationVO mngVo) throws Exception{
		return (Integer)selectOne("YearVacationMngDAO.selectListInitVacationInfoTotCnt", mngVo);
	}
	
	public void vacationUpdate(YearVacationVO mngVo) throws Exception{
		update("YearVacationMngDAO.vacationUpdate", mngVo);
	}

}
