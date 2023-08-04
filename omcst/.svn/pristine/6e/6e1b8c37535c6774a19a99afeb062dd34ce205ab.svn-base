package egovframework.omcst.business.client.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import egovframework.omcst.business.client.service.ClientVO;
import egovframework.omcst.business.project.service.ProjectVO;

@Repository("ClientDAO")
public class ClientDAO extends EgovAbstractMapper{
	
	/**
	 * 고객사 목록을 가져온다.
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<ClientVO> selectClientList(ClientVO vo) {
		return selectList("ClientDAO.selectClientList", vo);
	}

	public List<ClientVO> selectClientBoxInfo() {
		return selectList("ClientDAO.selectClientBoxInfo");
	}

	public int insertClientData(ClientVO vo) {
		return insert("ClientDAO.insertClientData", vo);
	}

	public int insertDepartmentData(ClientVO vo) {
		return insert("ClientDAO.insertDepartmentData", vo);
	}

	
}
