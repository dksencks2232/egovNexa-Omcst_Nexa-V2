<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrap">
        <div class="container">
            <div class="sub_layout">
                <div class="sub_in">
                    <div class="layout">
                        <div class="content_wrap">
                            <div id="contents" class="content">
                                 

                                <!-- 검색조건 -->
                                <div class="condition2">
                                	<div class="con2_wrap">
                                		<div>
		                                    <span class="lb">결재상태</span>
		                                    <label class="item f_select" for="sel1">
		                                        <select name="" id="sel1" title="조건">
		                                            <option value="">승인</option>
		                                            <option value="">대기</option>
		                                            <option value="">반려</option>
		                                        </select>
		                                    </label>
	                                    </div>
	                                    <div>
		                                    <span class="lb ml20">결재분류</span>
		                                    <label class="item f_select" for="sel1">
		                                        <select name="" id="sel1" title="조건">
		                                            <option value="">연차</option>
		                                            <option value="">반차</option>
		                                            <option value="">리프레쉬</option>
		                                        </select>
		                                    </label>
										</div>
										<div>
		                                    <label for="usernm" class="lb ml20">결재자</label>
		                                    <span class="item f_search">
		                                        <input class="f_input w_130" type="text" name="" id="usernm" title="검색어">
		                                    </span>
	                                    </div>
	                                    <span class="mgl10">
	                                    	<button class="btn btn_gray_46 w_100" type="submit">조회</button>
	                                    </span>
                                    </div>
                                </div>
                                <!--// 검색조건 -->

                                <div class="al_l mt20 ">
                                    <p class="font-w700 mb10">대기 <span class="f_color_g">1</span> / 승인 <span class="f_color_b">1</span> / 반려 <span class="f_color_r">1</span></p>
                                </div>
                                <!-- 게시판 -->
                                <div class="board_list">
                                    <table>
                                        <colgroup>
                                            <col style="width: 150px;">
                                            <col style="width: 150px;">
                                            <col style="width: 150px;">
                                            <col style="width: 150px;">
                                            <col style="width: 150px;">
                                            <col style="width: 150px;">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th scope="col">연차구분</th>
                                                <th scope="col">기안일</th>
                                                <th scope="col">기행일</th>
                                                <th scope="col">결재자</th>
                                                <th scope="col">결재일</th>
                                                <th scope="col">결재상태</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>연차</td>
                                                <td>2023-01-31</td>
                                                <td>2023-02-07</td>
                                                <td>강은경</td>
                                                <td>2023-02-01</td>
                                                <td>승인</td>
                                            </tr>
                                            <tr>
                                                <td>연차</td>
                                                <td>2023-01-31</td>
                                                <td>2023-02-07</td>
                                                <td>강은경</td>
                                                <td>2023-02-01</td>
                                                <td>대기</td>
                                            </tr>
                                            <tr>
                                                <td>연차</td>
                                                <td>2023-01-31</td>
                                                <td>2023-02-07</td>
                                                <td>강은경</td>
                                                <td>2023-02-01</td>
                                                <td>반려</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!--// 게시판 -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>