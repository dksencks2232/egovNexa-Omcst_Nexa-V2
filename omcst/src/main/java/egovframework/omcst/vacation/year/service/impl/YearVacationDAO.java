package egovframework.omcst.vacation.year.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import egovframework.omcst.vacation.year.service.YearVacationVO;

@Repository("YearVacationDAO")
public class YearVacationDAO  extends EgovAbstractMapper{
	
	/**
	 * 연차를 계획한다.
	 * @param vo
	 * @throws Exception
	 */
	public void insertYearVacation(YearVacationVO vo) throws Exception {
		insert("YearVacationDAO.insertYearVacation", vo);		
	}
	
	
	/**
	 * 연차 상태정보를 변경한다.
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int updateYearVacation(YearVacationVO vo) throws Exception{
		
		return update("YearVacationDAO.updateYearVacation", vo);
		
	}
	
	/**
	 * 한건의 연차 정보를 가져온다.
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public YearVacationVO selectYearVacation(YearVacationVO vo) throws Exception{
		
		return selectOne("YearVacationDAO.selectYearVacation", vo);
	} 
	
	/**
	 * 연차 목록을 가져온다.
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<YearVacationVO> selectListYearVacation(YearVacationVO vo) throws Exception{		
		return selectList("YearVacationDAO.selectListYearVacation", vo);
	}
	
	/**
	 *  현재년도 배정된 총 연차수를 가져온다
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int selectTotalDayCnt(YearVacationVO vo) throws Exception{
		return (Integer)selectOne("YearVacationDAO.selectTotalDayCnt",vo);
	}
	
	/**
	 *  현재까지 사용한 연차수의 총 합을 가져온다
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int selectUseDayCnt(YearVacationVO vo) throws Exception{
		return (Integer)selectOne("YearVacationDAO.selectUseDayCnt", vo);
	}
	
	/**
	 * 연차를 삭제한다.
	 * @param vo
	 */
	public int deleteYearVacation(YearVacationVO vo) throws Exception {
		
		return update("YearVacationDAO.deleteYearVacation", vo);
	}

}
