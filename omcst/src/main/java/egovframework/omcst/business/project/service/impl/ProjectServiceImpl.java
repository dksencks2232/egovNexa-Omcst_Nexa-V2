package egovframework.omcst.business.project.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.omcst.business.project.service.ProjectService;
import egovframework.omcst.business.project.service.ProjectVO;

@Service("ProjectService")
public class ProjectServiceImpl extends EgovAbstractServiceImpl implements ProjectService{

	@Resource(name = "ProjectDAO")
	private ProjectDAO projectDAO;
	
	/**
	 * 프로젝트 목록 조회
	 * @param ProjectVO projectVO
	 * @return List<ProjectVO>
	 * @exception Exception
	 */
	@Override
	public List<ProjectVO> selectListProject(ProjectVO projectVO) throws Exception{
		return projectDAO.selectListProject(projectVO);
	}
	
	/**
	 * 프로젝트 목록 조회
	 * @param ProjectVO projectVO
	 * @return List<ProjectVO>
	 * @exception Exception
	 */
	@Override
	public int selectListProjectTotCnt(ProjectVO projectVO) throws Exception{
		return projectDAO.selectListProjectTotCnt(projectVO);
	}
	
	/**
	 * 검색조건 정보조회
	 * @param ProjectVO projectVO
	 * @return List<ProjectVO>
	 * @exception Exception
	 */
	@Override
	public List<ProjectVO> selectListclient(ProjectVO projectVO) throws Exception{
		return projectDAO.selectListclient(projectVO);
	}
	
	/**
	 * 검색조건 정보조회
	 * @param ProjectVO projectVO
	 * @return List<ProjectVO>
	 * @exception Exception
	 */
	@Override
	public List<ProjectVO> SearchSelectBoxInfo(ProjectVO projectVO) throws Exception{
		return projectDAO.SearchSelectBoxInfo(projectVO);
	}
}
