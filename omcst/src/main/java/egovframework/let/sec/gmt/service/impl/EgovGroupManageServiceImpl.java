package egovframework.let.sec.gmt.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.let.sec.gmt.service.EgovGroupManageService;
import egovframework.let.sec.gmt.service.GroupManage;
import egovframework.let.sec.gmt.service.GroupManageVO;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

/**
 * 그룹관리에 관한 ServiceImpl 클래스를 정의한다.
 * @author 공통서비스 개발팀 이문준
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.03.11  이문준          최초 생성
 *   2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성 
 *
 * </pre>
 */

@Service("egovGroupManageService")
public class EgovGroupManageServiceImpl extends EgovAbstractServiceImpl implements EgovGroupManageService {

	@Resource(name="groupManageDAO")
    private GroupManageDAO groupManageDAO;
	
	/**
	 * 시스템사용 목적별 그룹 목록 조회
	 * @param groupManageVO GroupManageVO
	 * @return List<GroupManageVO>
	 * @exception Exception
	 */
	public List<GroupManageVO> selectGroupList(GroupManageVO groupManageVO) throws Exception {
		return groupManageDAO.selectGroupList(groupManageVO);
	}
	
	/**
	 * 검색조건에 따른 그룹정보를 조회
	 * @param groupManageVO GroupManageVO
	 * @return GroupManageVO
	 * @exception Exception
	 */
	public GroupManageVO selectGroup(GroupManageVO groupManageVO) throws Exception {
		return groupManageDAO.selectGroup(groupManageVO);
	}

	/**
	 * 그룹 기본정보를 화면에서 입력하여 항목의 정합성을 체크하고 데이터베이스에 저장
	 * @param groupManage GroupManage
	 * @param groupManageVO GroupManageVO
	 * @return GroupManageVO
	 * @exception Exception
	 */
	public GroupManageVO insertGroup(GroupManage groupManage, GroupManageVO groupManageVO) throws Exception {
		groupManageDAO.insertGroup(groupManage);
		groupManageVO.setGroupId(groupManage.getGroupId());
		return groupManageDAO.selectGroup(groupManageVO);
	}

	/**
	 * 화면에 조회된 그룹의 기본정보를 수정하여 항목의 정합성을 체크하고 수정된 데이터를 데이터베이스에 반영
	 * @param groupManage GroupManage
	 * @exception Exception
	 */
	public void updateGroup(GroupManage groupManage) throws Exception {
		groupManageDAO.updateGroup(groupManage);
	}
	
	/**
	 * 불필요한 그룹정보를 화면에 조회하여 데이터베이스에서 삭제
	 * @param groupManage GroupManage
	 * @exception Exception
	 */
	public void deleteGroup(GroupManage groupManage) throws Exception {
		groupManageDAO.deleteGroup(groupManage);
	}
	
    /**
	 * 목록조회 카운트를 반환한다
	 * @param groupManageVO GroupManageVO
	 * @return int
	 * @exception Exception
	 */
	public int selectGroupListTotCnt(GroupManageVO groupManageVO) throws Exception {
		return groupManageDAO.selectGroupListTotCnt(groupManageVO);
	}
	
	/**
	 * 시스템사용 목적별 그룹 목록 조회 jq그리드용
	 * @param groupManageVO GroupManageVO
	 * @return List<GroupManageVO>
	 * @exception Exception
	 */
	public List<GroupManageVO> selectJqGroupList(GroupManageVO groupManageVO) throws Exception {
		return groupManageDAO.selectJqGroupList(groupManageVO);
	}
	
	//jqgrid 총 레코드 갯수
	public int selectJpGroupTotRecords(GroupManageVO groupManageVO) throws Exception{
		return groupManageDAO.selectJpGroupTotRecords(groupManageVO);
	}
	
	/**
	 * 화면에 조회된 그룹의 기본정보를 수정하여 항목의 정합성을 체크하고 수정된 데이터를 데이터베이스에 반영 jq 그리드용
	 * @param groupManage GroupManage
	 * @exception Exception
	 */
	public void updateJqGroup(Map<String,Object> map) throws Exception {
		groupManageDAO.updateJqGroup(map);
	}
	
	//그룹정보 insert jqgrid
	public void insertJqGroup(GroupManage groupManage) throws Exception{
		
		//마지막 id값 을 가지고 온다 Group_ + 숫자 14자리
		String lastId = groupManageDAO.selectLastGroupId();
		//가져온 id값 에서 문자열을 제거 한다
		String id = lastId.substring(6);
		//id값을 숫자로 변환후 다음 값을 구한다.
		int numberId = Integer.parseInt(id) +1;
		//id형식에 맞춰 다음 아이디를 생성한다
		String groupId = "GROUP_" + String.format("%014d", numberId);
		
		groupManage.setGroupId(groupId);
		
		groupManageDAO.insertGroup(groupManage);
	}
	
	//그룹정보 delete jqgrid
	public void deleteJqGroup(String data) throws Exception{
		GroupManage groupManage = new GroupManage();
		String groupIds[] = data.split(";");
		for(String groupId: groupIds) {
			groupManage.setGroupId(groupId);
			groupManageDAO.deleteGroup(groupManage);
		}
	}
}