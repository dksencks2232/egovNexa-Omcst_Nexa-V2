<%--
  Class Name : EgovUserManage.jsp
  Description : 사용자관리(조회,삭제) JSP
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.03.03   JJY              최초 생성
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 JJY
    since    : 2009.03.03
--%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>내부업무 사이트 > 내부시스템관리 > 사용자등록관리(토스트 그리드 샘플)</title>
  <link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui.time-picker/v2.0.3/tui-time-picker.css"/>
  <link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui.date-picker/v4.1.0/tui-date-picker.css"/>

  <script src="https://uicdn.toast.com/tui.time-picker/v2.0.3/tui-time-picker.js"></script>
  <script src="https://uicdn.toast.com/tui.date-picker/v4.1.0/tui-date-picker.js"></script>

  <link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
  <script src="https://unpkg.com/babel-standalone@6.26.0/babel.min.js"></script>
  <script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>

<c:set var='emplyrSttusCode' value='<%= egovframework.omcst.common.service.CodeCacheService.getCode("COM013") %>' />
<script type="text/babel" class="code-js">

    	class CustomTextEditor {
      		constructor(props) {
        	const el = document.createElement('input');
        	const { maxLength } = props.columnInfo.editor.options;

        	el.type = 'text';
        	el.maxLength = maxLength;
        	el.value = String(props.value);

	        this.el = el;
      	}

      	getElement() {
        	return this.el;
      	}

      	getValue() {
        	return this.el.value;
      	}

      	mounted() {
	        this.el.select();
      	}
    	}

		let bef1 = '';
		let befmail=0;
		const Grid = tui.Grid;
		const instance = new Grid({
		  el: document.getElementById('grid'), // Container element
		  data: ${resultList},
		  rowHeaders: ['checkbox'],
      	  scrollX: false,
          scrollY: false,
		  draggable: true,
		  columns: [
		    {
		      header: '번호',
		      name: 'rownum',
			  align: 'center',
			  width:30 			  
		    },
		    {
		      header: '직원명',
		      name: 'userNm',
			  align: 'center', 			  
 			  sortable: true,
			  editor: {
            	type: CustomTextEditor,
            	options: {
              	maxLength: 10
              	}
          	  }
		    },
		    {
		      header: '아이디',
		      name: 'userId',
			  align: 'center',
			  filter: 'select'
		    },
		    {
		      header: '입사일',
		      name: 'joinDate',
			  align: 'center',
     		  editor: {
              	type: 'datePicker',
            	options: {
              		format: 'yyyy-MM-dd',
			  		language: 'ko'			  
              	}
          	  }
			},
		    {
		      header: '부서',
		      name: 'orgnztId',
			  align: 'center',
    		  formatter: 'listItemText',
			  editor: {
      		  type: 'radio',
      		  options: {
        			listItems: [
	          			{
		            		text: '기본조직',
	    	        		value: 'ORGNZT_0000000000000'
          				},
    	      			{
        	    			text: '오픈마인즈',
            				value: 'ORGNZT_0000000000001'
		          		}
        			]
      			}
    		  }
		    },
		    {
		      header: '이메일',
		      name: 'emailAdres',
			  align: 'center',
			  editor: {
            	type: CustomTextEditor,
            	options: {
              	maxLength: 30
              	}
          	  },
		      onBeforeChange(ev) {
				bef1 = ev.value;
      		  },
      		  onAfterChange(ev) {
				let str1 = ev.value;			
				let emailCheck = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

				if(!emailCheck.test(str1)) {
					if(ev.value == '')
					{						
					}
					else
					{						
						alert('이메일을 체크해주세요.이전값으로 되돌립니다.');
						befmail = 1;						
						instance.setValue(ev.rowKey,'emailAdres',bef1);						
					}
				} 
      		  }
		    },
		    {
		      header: '전화번호',
		      name: 'tel',
			  align: 'center',
			  editor: {
            	type: CustomTextEditor,
            	options: {
              	maxLength: 10
              	}
          	  },
		      onBeforeChange(ev) {
      		  },
      		  onAfterChange(ev) {
				let str1 = ev.value;

				let value = ev.value.replace(/[^0-9]/g, "");
  				let hip = value.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");				
				instance.setValue(ev.rowKey,'tel',hip);				
      		  }
		    },
		    {
		      header: '가입상태',
		      name: 'sttus',
			  align: 'center',
    		  formatter: 'listItemText',
			  editor: {
      		  type: 'select',
      		  options: {
        			listItems: [
	          			{
		            		text: '회원가입 신청 상태',
	    	        		value: 'A'
          				},
    	      			{
        	    			text: '회원가입 삭제 상태',
            				value: 'D'
		          		},
    	      			{
        	    			text: '회원가입 승인 상태',
            				value: 'P'
          				}
        			]
      			}
    		  }
		    },
		    {
		      header: '퇴사여부',
		      name: 'retire',
			  align: 'center',
 			  filter: 'text',
    		  formatter: 'listItemText',
    		  editor: {
      		  type: 'radio',
      			options: {
        			listItems: [
          			  { text: '예', value: '예' },
			          { text: '아니오', value:'아니오' }
        			]
			      }
    		  }  
		    }
		  ],
	      contextMenu: ({ rowKey, columnName }) => (
     	  [
          	[
            	{
              		name: 'export',
              		label: 'Export',
              		subMenu: [
                    {
                      name: 'csvExport',
                      label: 'CSV export',
                      action: () => {
                        instance.export('csv');
                      }
                    },
                    //{
                    //  name: 'excelExport',
                    //  label: 'Excel export',
                    //  action: () => {
                    //    instance.export('xlsx'); //엑셀이 설치 되어 있어야 사용가능
                    //  }
                    //},
                  	]
	            }
    	   ],
        ])

		});
		
		let edi1 = '';
		instance.on('editingStart', ev => {
			edi1=ev.value;			
		});

		instance.on('editingFinish', ev => {
			console.log(befmail+":"+edi1 +":"+ ev.value+":"+ev.columnName);
			if(ev.columnName=="emailAdres")
			{
				if(befmail == 1)
				{
					//instance.uncheck(ev.rowKey);
				}
				else
				{					
					instance.check(ev.rowKey);
				

}
				befmail=0;
			}
			else
			{
				if(edi1 == null)
				{
				}
				else if(edi1 == ev.value)
				{
				}
				else
				{			
					instance.check(ev.rowKey);
				}
			}
		});
		instance.on('click', ev => {
			if(ev.columnName == undefined)
			{
			}
			else if (ev.columnName == 'userNm')
			{
				
			}
			else if (ev.columnName == 'joinDate')
			{
				
			}
			else if (ev.columnName == 'emailAdres')
			{

			}
			else if (ev.columnName == 'tel')
			{
				
			}
			else if (ev.columnName == 'sttus')
			{
				
			}
			else if (ev.columnName == 'orgnztId')
			{
				
			}
			else if (ev.columnName != '_checked') {
				if(ev.rowKey == undefined)
				{
				}
				else
				{
		    		document.listForm.selectedId.value = instance.getData()[ev.rowKey].uniqId;
    				document.listForm.action = BASE_URL+'/userViewToast';
    				document.listForm.submit();
				}
			}
		});

		Grid.applyTheme('default', {
		  cell: {
    			normal: {
      				background: '#fff',
	      			border: '#e0e0e0',
      				showVerticalBorder: false,
	      			showHorizontalBorder: true
    			},
    			rowHeader: {
      				background: '#E6E6E6',
	      			border: '#e0e0e0'
    			},
    			header: {
      				background: '#E6E6E6',
	      			border: '#e0e0e0'
    			},
    			selectedHead: {
	      			background: '#0b3f73'					
    			}
    			//evenRow: {
	      			//background: '#FFFFFF',
    			//},
    			//oddRow: {
	      			//background: '#FFFFFF'
    			//}
  			},
  			row: { 
    			hover: { 
	      			background: '#A9BCF5' 
    			}
  			},
		});

		$('.code-html').mouseleave(function(e) {
			instance.blur();
			//instance.cancelEditing();			
		});		

	$(function(){
		if('${message}' == '')
		{		
		}
		else
		{
			alert('${message}');
		}
				
		$($('th')[3]).append('<span style="color:red">(변경가능)</span>');
		$($('th')[5]).append('<span style="color:red">(변경가능)</span>');
		$($('th')[6]).append('<span style="color:red">(변경가능)</span>');
		$($('th')[7]).append('<span style="color:red">(변경가능)</span>');
		$($('th')[8]).append('<span style="color:green">(자동하이픈변경)</span>');
		$($('th')[9]).append('<span style="color:red">(변경가능)</span>');

		$( "#g1sel" ).click(function() {
		    document.listForm.pageIndex.value = 1;
		    document.listForm.action = BASE_URL+'/selectGridList';
	    	document.listForm.submit();  		
		});

		$( "#g1update" ).click(function() {
			let chkRows = instance.getCheckedRows();
			if(chkRows.length == 0)
			{
				alert('직원명을 변경 완료 후 항목을 체크 해주세요.');
				return false;
			}

			let jsonList = [];			
			for(let i=0; i < chkRows.length; i++) {
				jsonList.push("{"
				+"'userNm':'"+chkRows[i].userNm+"'"
				+",'uniqId':'"+chkRows[i].uniqId+"'"
				+",'sttus':'"+chkRows[i].sttus+"'"
				+",'joinDate':'"+chkRows[i].joinDate+"'"
				+",'orgnztId':'"+chkRows[i].orgnztId+"'"
				+",'emailAdres':'"+chkRows[i].emailAdres+"'"
				+"}");
			}		
			let form = document.createElement('form'); // 폼객체 생성
			let tag;
			tag = document.createElement('input'); 
			tag.setAttribute('type', 'text'); 
			tag.setAttribute('name', 'jsonStr'); 
			tag.setAttribute('value', "["+jsonList.join()+"]"); //객체값
			form.appendChild(tag);
			form.setAttribute('method', 'post'); //get,post 가능
			form.setAttribute('action', "/updateGridList"); //보내는 url
			document.body.appendChild(form);
			form.submit();

		});

		$( "#g1del" ).click(function() {
		let checkedIds = "";
		let chkRows = instance.getCheckedRows();
		
		if(chkRows.length == 1) {
			checkedIds = chkRows[0].userTy + ":"+ chkRows[0].uniqId;
		}		
		else if(chkRows.length > 0) {
			for(let i=0; i < chkRows.length; i++) {
				if(i == 0)
				{
					checkedIds = chkRows[0].userTy + ":"+ chkRows[0].uniqId;		
				}
				else
				{
					checkedIds = checkedIds + ","+chkRows[i].userTy + ":"+ chkRows[i].uniqId;
				}
			}		
		}
    	if(checkedIds.length > 0) {
			let message = document.getElementById('sMessage').value;
        	
        	if(confirm(message)){				
            	document.listForm.checkedIdForDel.value=checkedIds;
            	document.listForm.action = BASE_URL+'/userToastDelete';
           		document.listForm.submit();
        	}
    	}
  		
		});

	});

	/* ********************************************************
 	* 유저 추가 페이지 이동
 	******************************************************** */
	function fn_addUserToastView() {
	    document.listForm.action = BASE_URL+'/userManageToastInfo';
	    document.listForm.submit();
	}
	
	/* ********************************************************
 	* 유저 삭제 처리
 	******************************************************** */
	function fn_deleteUser(checkedIds) {
		let message = document.getElementById('sMessage').value;
	    if(confirm(message)){
       	document.userManageVO.checkedIdForDel.value=checkedIds;
       	document.userManageVO.action = BASE_URL+'/userDeleteToast';
       	document.userManageVO.submit(); 
    }
}


</script>


</head>
<body>


<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

    <!-- Skip navigation -->
    <a href="#contents" class="skip_navi">본문 바로가기</a>

    <div class="wrap">
 		<div class="container">
            <div class="sub_layout">
                <div class="sub_in">
                    <div class="layout">
                        <div class="content_wrap">
                            <div id="contents" class="content">
                                 

								<form name="listForm" action="<c:url value='/selectGridList'/>" method="get">
								
								<input name="selectedId" type="hidden" />
								<input name="checkedIdForDel" type="hidden" />
								<input name="pageIndex" type="hidden" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
								<input name="json1" type="hidden" value=""/>

                                
                                <!-- 검색조건 -->
                                <div class="condition">
                                    <label class="item f_select" for="sbscrbSttus">
                                        <select name="sbscrbSttus" id="sbscrbSttus" title="검색조건1-사용자상태">
                                            <option value="0" <c:if test="${empty userSearchVO.sbscrbSttus || userSearchVO.sbscrbSttus == '0'}">selected="selected"</c:if> >가입상태(전체)</option>
                                            	<c:forEach var="escode" items="${emplyrSttusCode}" varStatus="status">
                                                	<option value="<c:out value="${escode.code}"/>" <c:if test="${userSearchVO.sbscrbSttus == escode.code}"> selected="selected"</c:if>><c:out value="${escode.codeNm}"/></option>
                                                </c:forEach>
                                        </select>
                                    </label>
                                    <label class="item f_select" for="searchCondition">
                                        <select name="searchCondition" id="searchCondition" title="검색조건2-검색어구분">
                                            <option value="0" <c:if test="${userSearchVO.searchCondition == '0'}">selected="selected"</c:if> >직원명</option>
                                            <option value="1" <c:if test="${empty userSearchVO.searchCondition || userSearchVO.searchCondition == '1'}">selected="selected"</c:if> >아이디</option>
                                        </select>
                                    </label>

                                    <span class="item f_search">
                                        <input class="f_input w_350" name="searchKeyword" title="검색어" type="text" value="<c:out value="${userSearchVO.searchKeyword}"/>" />
                                        <button class="btn" type="button" id="g1sel"><spring:message code='button.inquire' /></button><!-- 조회 -->
                                    </span>
                                    <%-- <span class="ml10">
                                    	<button class="btn btn_blue_46 w_100" type="submit" onclick="javascript:fn_search(); return false;"><spring:message code='button.inquire' /></button><!-- 조회 -->
                                    </span> --%>
                                </div>
                                <!--// 검색조건 -->
								
								
								
								<div class="board_list_top">
									<div class="left_col">
	                                	<div class="list_count">
	                                 		<span>사용자수</span>
	                                 		<strong><c:out value="${paginationInfo.totalRecordCount}"/></strong>
	                                 	</div>
	                            	</div>
	                            	<div class="al_r">
										<a href="#LINK" class="item btn btn_red_46 w_100" id="g1del"><spring:message code="button.delete" /></a><!-- 삭제 -->
	                                    <a href="<c:url value='/userManageInfo'/>" class="item btn btn_blue_46 w_100" onclick="fn_addUserToastView(); return false;"><spring:message code="button.create" /></a><!-- 등록 -->
	                                    <a href="#" id="g1update" class="item btn btn_gray_46 w_100" id="g1del">변경</a><!-- 변경 -->
									</div>
                                </div>								
                                <div class="code-html contents">
  									<div id="grid"></div>
								</div>                                

								<!-- 페이지 네비게이션 시작 -->
								<%-- <c:if test="${!empty userAbsnceVO.pageIndex }"> --%>
								<c:if test="${!empty userSearchVO.pageIndex }">
                                <div class="board_list_bot">
                                    <div class="paging" id="paging_div">
                                        <ul>
                                            <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_linkPage" />                                            
                                        </ul>
                                    </div>
                                    <div id="pagination" class="tui-pagination"></div>
                                </div>
                                </c:if>
                                <!-- //페이지 네비게이션 끝 -->
                                <!--// 게시판 -->
                                
                                <!-- 20230216 페이지 진입시 처리결과 메세지 처리 -->
                                <c:choose>
                                	<c:when test="${!empty resultMsg}">
                                		<input type="hidden" id="resultMsg" value="<spring:message code='${resultMsg}' />"/>
                                	</c:when>
                                	<c:otherwise>
                                		<input type="hidden" id="resultMsg" value=""/>
                                	</c:otherwise>
                                </c:choose>
                                <!-- 20230216 유저 삭제시 메세지 -->
                                <input type="hidden" id="sMessage" value="<spring:message code='common.delete.msg' />"/>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>