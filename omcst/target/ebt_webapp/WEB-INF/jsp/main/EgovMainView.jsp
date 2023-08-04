<%--
  Class Name : EgovMainView.jsp 
  Description : 메인화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 실행환경개발팀 JJY
    since    : 2011.08.31 
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
    var message = '${message}';
    if (message) {
    	alert(message);
    }
    
    function changeImage(value){
        if(value == "퇴근"){
        	$("#attQrCode").addClass("qrcode2");
        	$("#attQrCode").removeClass("qrcode");
        }else if(value == "출근"){
        	$("#attQrCode").addClass("qrcode");
        	$("#attQrCode").removeClass("qrcode2");
        }
    }
    
    
</script>

	    <div class="container main">
	        <div class="P_MAIN">
	            <div class="inner mt50">
	                <p class="visual">
	                    <span class="t_1">(주)오픈마인즈</span>
	                    <span class="t_2">CONNECT EVERYTHING </span>
	                    <span class="t_3">더 나은 세상을 위해 연결하다.</span>
	                </p>
<!-- 	                <p id="attQrCode" class="qrcode"></p> -->
<!-- 	                <input type="radio" class="chkbtn" name="imageBtn" value="출근" onclick="changeImage(this.value)" checked> -->
<!-- 	                <input type="radio" class="chkbtn" name="imageBtn" value="퇴근" onclick="changeImage(this.value)"> -->
	    </div>

        <div class="bot">
            <div class="col">
                <div class="left_col">
                    <div class="box">
                        <div class="head">
                            <h2>오늘의 <span>할일</span></h2>
                            <a href="<c:url value='/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_CCCCCCCCCCCC'/>" class="more">더보기</a>
                        </div>
                        <ul class="list">
                        	<c:forEach var="result" items="${bbsList}" varStatus="status">
                        	<c:if test="${!(result.isExpired=='Y' || result.useAt == 'N')}">
                            <li>
                                <a href="<c:url value='/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_CCCCCCCCCCCC'/>">
                                	<c:out value="${result.nttSj}" />
                                </a>
                                <c:if test="${result.newContent=='Y'}"><span class="new_red">NEW</span></c:if>
                                <span><c:out value="${result.frstRegisterPnttm}"/></span>
                            </li>
                            </c:if>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="right_col">
                    <div class="box">
                        <div class="head">
                            <h2>최신 업무공지 <span>정보</span></h2>
                            <a href="<c:url value='/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_AAAAAAAAAAAA'/>" class="more">더보기</a>
                        </div>
                        <div class="list">
                            <table>
                                <colgroup>
                                    <col style="width: auto;">
                                    <col style="width: 15%">
                                    <col style="width: 30%">
                                </colgroup>
                                <c:forEach var="result" items="${notiList}" varStatus="status">
                                <c:if test="${!(result.isExpired=='Y' || result.useAt == 'N')}">
                                <tr>
                                    <td>
                                    	<c:if test="${result.replyLc!=0}">
                                			<c:forEach begin="0" end="${result.replyLc}" step="1">
                                				&nbsp;
                                			</c:forEach>
                                			<img src="<c:url value='/'/>images/ico_reply.png" alt="reply arrow">
                                		</c:if>
                                    	<a href="<c:url value='/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_AAAAAAAAAAAA'/>">
                                    		<c:out value="${result.nttSj}" />
                                    	</a>
                                    	<c:if test="${result.newContent=='Y'}"><span>NEW</span></c:if>
                                    </td>
                                    <td class="al_c"><c:out value="${result.frstRegisterNm}" /></td>
                                    <td class="al_r date"><c:out value="${result.frstRegisterPnttm}" /></td>
                                </tr>
                                </c:if>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
