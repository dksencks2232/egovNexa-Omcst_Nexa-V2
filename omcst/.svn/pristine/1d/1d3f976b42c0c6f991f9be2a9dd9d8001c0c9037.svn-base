package egovframework.omcst.vacation.year.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.omcst.vacation.year.service.YearVacationMngService;
import egovframework.omcst.vacation.year.service.YearVacationVO;

@Service("YearVacationMngService")
public class YearVacationMngServiceImpl extends EgovAbstractServiceImpl implements YearVacationMngService {
	
	@Resource(name = "YearVacationMngDAO")
	private YearVacationMngDAO yearVacationMngDAO;

	@Override
	public List<YearVacationVO> selectListYearVacationMng(YearVacationVO mngVo) throws Exception {
		
		return yearVacationMngDAO.selectListYearVacationMng(mngVo);
	}

	@Override
	public int updateSignYearVacation(String checkVcIdForAsk, String forSign) throws Exception {
		
		int totCnt = 0;
		String [] targetVcId = checkVcIdForAsk.split(",");
		for(String tmpId : targetVcId) {
			YearVacationVO vo = new YearVacationVO();
			vo.setVcId(tmpId);
			vo.setVcStatus(forSign);
			totCnt += yearVacationMngDAO.updateSignYearVacation(vo);		
		}
		return totCnt;
	}
	
	@Override
	public List<YearVacationVO> selectListInitVacationInfo(YearVacationVO mngVo) throws Exception{
		
		return yearVacationMngDAO.selectListInitVacationInfo(mngVo);
	}
	
	@Override
	public int selectListInitVacationInfoTotCnt(YearVacationVO mngVo) throws Exception{
		
		return yearVacationMngDAO.selectListInitVacationInfoTotCnt(mngVo);
	}
	
	@Override
	public void vacationUpdate(String checkVcIdForAsk, YearVacationVO mngVo) throws Exception{
		String [] targetVcId = checkVcIdForAsk.split(",");
		for(String tempId: targetVcId) {
			mngVo.setEmplNo(tempId);
			yearVacationMngDAO.vacationUpdate(mngVo);
		}
	}
	
	@Override
	public Map<String, Object> selectYearVacationMng(YearVacationVO mngVo) throws Exception{
		
		List<YearVacationVO> list = yearVacationMngDAO.selectListYearVacationMng(mngVo);
		int cnt = yearVacationMngDAO.selectListYearVacationMngCnt(mngVo);
		mngVo = yearVacationMngDAO.selectCurrentVacationSituation(mngVo);
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("resultList", list);
		map.put("resultCnt", Integer.toString(cnt));
		map.put("apply", mngVo.getApply());
		map.put("pass", mngVo.getPass());
		map.put("deny", mngVo.getDeny());
		return map;
	}

}
