package egovframework.omcst.code.service.impl;

import java.util.List;

import egovframework.omcst.code.service.CommCodeMngService;
import egovframework.omcst.code.service.dao.CommCodeMngDAO;
import egovframework.omcst.code.vo.CodeVO;
import egovframework.omcst.code.vo.CommCodeVO;
import egovframework.omcst.common.vo.CommonVO;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;



/**
 *
 * 공통코드에 대한 서비스 구현클래스를 정의한다
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
@Service("CommCodeMngService")
public class CommCodeMngServiceImpl extends EgovAbstractServiceImpl implements CommCodeMngService {

    @Resource(name="CommCodeMngDAO")
    private CommCodeMngDAO commCodeMngDAO;

	/**
	 * 공통코드 목록을 조회한다.
	 */
	@Override
	public List<?> selectCommCodeList(CommCodeVO searchVO) throws Exception {
        return commCodeMngDAO.selectCommCodeList(searchVO);
	}

	/**
	 * 공통코드 총 갯수를 조회한다.
	 */
	@Override
	public int selectCommCodeListTotCnt(CommCodeVO searchVO) throws Exception {
        return commCodeMngDAO.selectCommCodeListTotCnt(searchVO);
	}
	
	/**
	 * 공통코드를 삭제한다.
	 */
	@Override
	public void deleteCommCode(CodeVO codeVO) throws Exception {
		commCodeMngDAO.deleteCommCode(codeVO);
	}

	/**
	 * 공통코드를 등록한다.
	 */
	@Override
	public void insertCommCode(CodeVO codeVO) throws Exception {
    	commCodeMngDAO.insertCommCode(codeVO);
	}

	/**
	 * 공통코드 상세항목을 조회한다.
	 */
	@Override
	public CodeVO selectCommCodeDetail(CodeVO searchVO) throws Exception {
		CodeVO ret = commCodeMngDAO.selectCommCodeDetail(searchVO);
    	return ret;
	}

	/**
	 * 공통코드를 수정한다.
	 */
	@Override
	public void updateCommCode(CodeVO codeVO) throws Exception {
		commCodeMngDAO.updateCommCode(codeVO);
	}
}
