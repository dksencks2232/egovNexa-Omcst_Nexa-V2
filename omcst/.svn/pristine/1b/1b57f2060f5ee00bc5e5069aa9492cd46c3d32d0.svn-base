package egovframework.omcst.code.service.dao;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;

import org.springframework.stereotype.Repository;

import egovframework.omcst.code.vo.CodeVO;
import egovframework.omcst.code.vo.CommCodeVO;
import egovframework.omcst.common.vo.CommonVO;

/**
 *
 * 공통코드에 대한 데이터 접근 클래스를 정의한다
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
@Repository("CommCodeMngDAO")
public class CommCodeMngDAO extends EgovAbstractMapper {

    /**
	 * 공통코드 목록을 조회한다.
     * @param searchVO
     * @return List(공통코드 목록)
     * @throws Exception
     */
	public List<?> selectCommCodeList(CommCodeVO searchVO) throws Exception {
        return list("CommCodeMngDAO.selectCommCodeList", searchVO);
    }

	/**
	 * 공통코드 상세항목을 조회한다.
	 * @param codeVO
	 * @return CodeVO(공통코드)
	 */
	public CodeVO selectCommCodeDetail(CodeVO searchVO) throws Exception {
		return (CodeVO)selectOne("CommCodeMngDAO.selectCommCodeDetail", searchVO);
	}
	
    /**
	 * 공통코드 총 갯수를 조회한다.
     * @param searchVO
     * @return int(공통코드 총 갯수)
     */
    public int selectCommCodeListTotCnt(CommCodeVO searchVO) throws Exception {
        return (Integer)selectOne("CommCodeMngDAO.selectCommCodeListTotCnt", searchVO);
    }

	/**
	 * 공통코드를 등록한다.
	 * @param codeVO
	 * @throws Exception
	 */
	public void insertCommCode(CodeVO codeVO) throws Exception {
        insert("CommCodeMngDAO.insertCommCode", codeVO);
	}

	/**
	 * 공통코드를 수정한다.
	 * @param codeVO
	 * @throws Exception
	 */
	public void updateCommCode(CodeVO codeVO) throws Exception {
		update("CommCodeMngDAO.updateCommCode", codeVO);
	}

	/**
	 * 공통코드를 삭제한다.
	 * @param codeVO
	 * @throws Exception
	 */
	public void deleteCommCode(CodeVO codeVO) throws Exception {
		delete("CommCodeMngDAO.deleteCommCode", codeVO);
	}

}
