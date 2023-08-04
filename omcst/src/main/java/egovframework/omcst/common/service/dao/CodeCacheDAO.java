package egovframework.omcst.common.service.dao;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import egovframework.omcst.common.vo.CommonVO;

@Repository("codeCacheDAO")
public class CodeCacheDAO extends EgovAbstractMapper{
	
	/**
	 * 공통코드상세 List 조회
	 * 
	 * @param 
	 * @return
	 */
	public List<CommonVO> selectListCode() {
		return selectList("CodeCacheDAO.selectListCode");
	}

}
