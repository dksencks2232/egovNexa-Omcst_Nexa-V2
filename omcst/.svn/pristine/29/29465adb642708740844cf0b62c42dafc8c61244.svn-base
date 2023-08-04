package egovframework.omcst.business.client.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.omcst.business.client.service.ClientService;
import egovframework.omcst.business.client.service.ClientVO;

@Service("ClientService")
public class ClientServiceImpl extends EgovAbstractServiceImpl implements ClientService{

	@Resource(name = "ClientDAO")
	private ClientDAO clientDAO;

	@Override
	public List<ClientVO> selectClientList(ClientVO clientVO) {
		return clientDAO.selectClientList(clientVO);
	}

	@Override
	public List<ClientVO> selectClientBoxInfo() {
		return clientDAO.selectClientBoxInfo();
	}

	@Override
	public int saveClientData(ClientVO clientVO) {
		if(clientVO.getClientNo().isEmpty()) {
			return clientDAO.insertClientData(clientVO);
		} else {
			return clientDAO.insertDepartmentData(clientVO);
		}
	}
}
