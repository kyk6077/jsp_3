<%@page import="java.util.List"%>
<%@page import="com.iu.file.FileDTO"%>
<%@page import="com.iu.file.FileDAO"%>
<%@page import="com.iu.board.BoardDTO"%>
<%@page import="com.iu.notice.NoticeDTO"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../../../temp/bootstrap.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../../../temp/header.jsp"></jsp:include>

<div class="container-fluid">
	<h1 id="body_title">${requestScope.board}</h1>
	<table class="table">
		<tr class="active"><td>SUBJECT</td><td>NAME</td><td>Contents</td></tr>
		<tr><td>${dto.title}</td>
		<td>${dto.writer}</td>
		<td>${dto.contents }</td></tr>
		
	</table>
	
<%-- 	<%for(FileDTO file : ar) {%> --%>
<%-- 			<h3><a href="../upload/<%= file.getFname() %>"><%=file.getOname()%></a></h3> --%>
<%-- 	<%} %> --%>
	
	
	<a class="btn btn-primary" href="./${board}List.do?num=${dto.num}">List</a>
	<a class="btn btn-primary" href="./${board}Update.do?num=${dto.num}">UPDATE</a>
	<a class="btn btn-primary" href="./${board}Delete.do?num=${dto.num}">DELETE</a>
	<c:if test="${board!='notice'}">
		<a class="btn btn-primary" href="./${board}Reply.do?num=${dto.num}">Reply</a>
	</c:if>
</div>

<jsp:include page="../../../temp/footer.jsp"></jsp:include>
</body>
</html>