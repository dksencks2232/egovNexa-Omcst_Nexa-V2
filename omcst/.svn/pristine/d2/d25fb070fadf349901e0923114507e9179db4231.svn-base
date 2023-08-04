package egovframework.omcst.vacation.year.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.omcst.vacation.year.service.YearVacationService;
import egovframework.omcst.vacation.year.service.YearVacationVO;

@Service("YearVacationService")
public class YearVacationServiceImpl extends EgovAbstractServiceImpl implements YearVacationService{

	@Resource(name = "YearVacationDAO")
	private YearVacationDAO yearVacationDAO;

	@Override
	public List<YearVacationVO> selectListYearVacation(YearVacationVO yearVacationVO) throws Exception {

		return yearVacationDAO.selectListYearVacation(yearVacationVO);
	}
	
	@Override
	public Map<String, Object> selectYearVacations(YearVacationVO yearvacationVO) throws Exception{
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map = selectLastestVacationsInform(yearvacationVO, map);
		
		List<YearVacationVO> list = yearVacationDAO.selectListYearVacation(yearvacationVO);
		map.put("list", list);
		
		return map;
	}
	
	private Map<String, Object> selectLastestVacationsInform(YearVacationVO yearvacationVO, Map<String, Object> map) throws Exception{
		
		int totaldaycnt = yearVacationDAO.selectTotalDayCnt(yearvacationVO);
		int usedaycnt = yearVacationDAO.selectUseDayCnt(yearvacationVO);
		int nowdaycnt = totaldaycnt - usedaycnt;
		
		map.put("totaldaycnt", Integer.toString(totaldaycnt));
		map.put("usedaycnt", Integer.toString(usedaycnt));
		map.put("nowdaycnt", Integer.toString(nowdaycnt));
		
		return map;
	}

	@Override
	public YearVacationVO insertYearVacation(YearVacationVO yearVacationVo) throws Exception {
		
		yearVacationVo.setVcStatus("VC02"); 			// 신청 단계
		yearVacationVo.setEmplNo(yearVacationVo.getFrstRegisterId());
		yearVacationDAO.insertYearVacation(yearVacationVo);
		return yearVacationVo;
	}
	
	
	
	@Override
	public int updateYearVacation(String checkVcId) throws Exception {

		
		int totCnt = 0;
		String [] targetVcId = checkVcId.split(",");
		for(String tmpId : targetVcId) {
			YearVacationVO vo = new YearVacationVO();
			vo.setVcId(tmpId);
			vo.setVcStatus("VC02");
			totCnt += yearVacationDAO.updateYearVacation(vo);			
		}
		
		return totCnt;
	}
	
	

	@Override
	public int deleteYearVacation(String checkVcId) throws Exception {
		int totCnt = 0;
		String [] targetVcId = checkVcId.split(";");
		for(String tmpId : targetVcId) {
			YearVacationVO vo = new YearVacationVO();
			vo.setVcId(tmpId);
			totCnt += yearVacationDAO.deleteYearVacation(vo);			
		}
		
		
		return totCnt;
	}

	
	
	
	
}
