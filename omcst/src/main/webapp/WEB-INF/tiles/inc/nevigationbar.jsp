<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!-- Location -->
	        <c:choose>
	        	<c:when test="${not empty firstTitle}">
	      		<div class="location">
	           		<ul>
	          			<li><a class="home" href="<c:url value='/'/>uat/uia/actionMain.do">Home</a></li>
	         			<li><c:out value="${firstTitle}"/></li>
	         				<c:if test="${not empty secondTitle}">
	         				<li><c:out value="${secondTitle}"/></li>
	         				</c:if>
	          			<li><c:out value="${lastTitle}"/></li>
	           		</ul>
	        	</div>
        		</c:when>
        	</c:choose>
  <!--// Location -->