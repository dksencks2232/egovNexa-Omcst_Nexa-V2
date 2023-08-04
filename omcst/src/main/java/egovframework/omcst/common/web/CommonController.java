package egovframework.omcst.common.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.omcst.code.service.CommCodeMngService;
import egovframework.omcst.common.service.CommonService;

/**
 *
 * 공통코드에 관한 요청을 받아 서비스 클래스로 요청을 전달하고 서비스클래스에서 처리한 결과를 웹 화면으로 전달을 위한 Controller를 정의한다
 * @author 공통서비스 개발팀 이중호
 * @since 2009.04.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.01  이중호          최초 생성
 *   2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 * </pre>
 */
@Controller
public class CommonController {

	@Resource(name = "CommonService")
    private CommonService commonService;
	
	@Resource(name = "CommCodeMngService")
    private CommCodeMngService commCodeMngService;
	
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

	@Autowired
	private DefaultBeanValidator beanValidator;

    /**
	 * 공통코드 목록을 조회한다.
     * @param searchVO
     * @throws Exception
    */
    
    @PostMapping(value="commonCode")
    @ResponseBody
	public Map<String, List<?>> selectCommCodeAllList (@RequestParam(value="options", required=true) String options) throws Exception {
       Map<String, List<?>> result = commonService.selectCommonCode(options);
    	return result;
	}	    
}