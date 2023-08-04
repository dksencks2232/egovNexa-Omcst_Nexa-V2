package egovframework.omcst.common.service.impl;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import egovframework.omcst.common.service.CommonService;
import egovframework.omcst.common.service.dao.CommonDAO;
import egovframework.omcst.common.vo.CommonVO;



/**
 *
 * 공통코드 data
 * @author kje
 * @since 2023.02.13
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *
 * </pre>
 */
@Service("CommonService")
public class CommonServiceImpl extends EgovAbstractServiceImpl implements CommonService {

    @Resource(name="CommonDAO")
    private CommonDAO commonDAO;

	@Override
	public Map<String, List<?>> selectCommonCode(String options) throws Exception {
		Gson gson = new Gson();
		CommonVO[] optionArr = gson.fromJson(options, CommonVO[].class);
		List<CommonVO> optionList = Arrays.asList(optionArr);
		Map<String, List<?>> map = new HashMap<>();
		
		for(CommonVO option : optionList) {
			map.put(option.getCodeId(), commonDAO.selectCommonCode(option));
		}
		
		return map;
	}
}
