package egovframework.omcst.business.client.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.let.utl.fcc.service.PageInfoUtil;
import egovframework.omcst.business.client.service.ClientService;
import egovframework.omcst.business.client.service.ClientVO;
import egovframework.omcst.business.project.service.ProjectVO;

@Controller
public class ClientController {
	
	@Resource(name = "ClientService") 
	private ClientService clientService;
	
	@Autowired
    private PageInfoUtil pageInfoUtil;

	@RequestMapping("/omcst/business/selectClientList.do")
	public String selectListProject(@ModelAttribute("searchVO") ClientVO clientVO, ModelMap model, HttpServletRequest request) throws Exception {

		request.getSession().setAttribute("baseMenuNo", "1100000");
		
		PaginationInfo paginationInfo = (PaginationInfo) pageInfoUtil.makePaginationInfo(clientVO);
		clientVO = (ClientVO) pageInfoUtil.makeObjectVO(paginationInfo, clientVO);
		
		List<ClientVO> clientList = clientService.selectClientList(clientVO);
		int totCnt = clientList.get(0).getTotCnt();
		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("clientList", clientList);
		return "omcst/business/ClientList";
	}
	

	@RequestMapping("/omcst/business/addClientData.do")
	public String registClientData(@ModelAttribute("searchVO") ClientVO clientVO, HttpServletRequest request) throws Exception {
		return "omcst/business/ClientRegist";
	}	

	@RequestMapping(value = "/omcst/business/selectClientBoxInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<ClientVO>> selectClientBoxInfo() throws Exception  {
		return ResponseEntity.ok().body(clientService.selectClientBoxInfo());
	}
	
	@RequestMapping("/omcst/business/saveClientData.do")
	public String saveClientData(@ModelAttribute("searchVO") ClientVO clientVO, HttpServletRequest request) throws Exception {
		int saveResult = clientService.saveClientData(clientVO);
		
		return "forward:/omcst/business/selectClientList.do";
	}		
}
