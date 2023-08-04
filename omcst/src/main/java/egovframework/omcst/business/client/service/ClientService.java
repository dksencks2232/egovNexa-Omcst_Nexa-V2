package egovframework.omcst.business.client.service;

import java.util.List;

public interface ClientService {

	List<ClientVO> selectClientList(ClientVO clientVO);

	List<ClientVO> selectClientBoxInfo();

	int saveClientData(ClientVO clientVO);

}
