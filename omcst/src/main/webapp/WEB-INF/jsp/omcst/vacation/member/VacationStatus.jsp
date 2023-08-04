<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
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
                               
                                <!-- 게시판 -->
                                <div class="board_list mt20">
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
                                                <th scope="col">사원명</th>
                                                <th scope="col">부서</th>
                                                <th scope="col">입사일</th>
                                                <th scope="col">생성휴가</th>
                                                <th scope="col">사용휴가</th>
                                                <th scope="col">잔여휴가</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>사원명</td>
                                                <td>SI사업부</td>
                                                <td>2019-11-11</td>
                                                <td>15</td>
                                                <td><a class="lnk color_b" href="#">2</a></td>
                                                <td>13</td>
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