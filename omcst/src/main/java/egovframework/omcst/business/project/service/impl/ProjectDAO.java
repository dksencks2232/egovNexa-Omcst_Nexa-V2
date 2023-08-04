package egovframework.omcst.business.project.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import egovframework.omcst.business.project.service.ProjectVO;

@Repository("ProjectDAO")
public class ProjectDAO extends EgovAbstractMapper{
	
	/**
	 * 프로젝트 목록을 가져온다.
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<ProjectVO> selectListProject(ProjectVO vo) throws Exception{
		return selectList("ProjectDAO.selectListProject", vo);
	}
	
	/**
	 * 프로젝트 목록 총 갯수를 가져온다.
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int selectListProjectTotCnt(ProjectVO vo) throws Exception{
		return (Integer)selectOne("ProjectDAO.selectListProjectTotCnt", vo);
	}
	
	public List<ProjectVO> selectListclient(ProjectVO vo) throws Exception{
		return selectList("ProjectDAO.selectListclient", vo);
	}
	
	public List<ProjectVO> SearchSelectBoxInfo(ProjectVO vo) throws Exception{
		return selectList("ProjectDAO.SearchSelectBoxInfo", vo);
	}
}
