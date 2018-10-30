<%@page import="com.iu.qna.QnaDTO"%>
<%@page import="com.iu.page.Pager"%>
<%@page import="com.iu.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.iu.page.MakePager"%>
<%@page import="com.iu.page.RowNumber"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@page import="com.iu.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../../../temp/bootstrap.jsp" %>
</head>
<body>
<c:import url="../../../temp/header.jsp">
	<c:param name="test" value="3"></c:param>
</c:import>
<div class="container-fluid">
	<div class="row">
		<h1>${board}</h1>
	</div>
	<div class="row">
		<div>
			<form class="form-inline" action="./${board}List.do">
				<div class="form-group">
					<select class="form-control" id="sel1" name="kind">
						<option>Title</option>
						<option>Contents</option>
						<option>Writer</option>
					</select>
					<input type="text"
						class="form-control" id="search" placeholder="Enter search" name="search">
				</div>
				<button type="submit" class="btn btn-default">Search</button>
			</form>
		</div>
	
		<table class="table table-hover">
			<tr>
				<td>NUM</td>
				<td>TITLE</td>
				<td>WRITER</td>
				<td>DATE</td>
				<td>HIT</td>
			</tr>
			
			<c:forEach items="${list}" var="boardDTO">
			<tr>
				<td>${boardDTO.num}</td>
				<td><a href="./${board}SelectOne.do?num=${boardDTO.num}">
				<c:catch>
					<c:forEach begin="1" end="${boardDTO.depth}">
						--
					</c:forEach>
				</c:catch>
				
				${boardDTO.title}</a></td>
				<td>${boardDTO.writer }</td>
				<td>${boardDTO.reg_date}></td>
				<td>${boardDTO.hit}</td>
			</tr>
			</c:forEach>
		</table>
	</div>
</div>
	<div class="container-fluid">
		<div class="row">
			<ul class="pagination">
				<li><a href="./${board}List.do?curPage=1"><span
						class="glyphicon glyphicon-backward"></span></a></li>
				<c:if test="${pager.curBlock}>1">
				<li><a href="./${board}List.do?curPage=${pager.startNum-1}"><span
						class="glyphicon glyphicon-chevron-left"></span></a></li>
				</c:if>
				
				<c:forEach	begin="${pager.startNum}" end="${pager.lastNum}" var="i" step="1">
					<li><a href="./${board}List.do?curPage=${i}">${i}</a></li>
				</c:forEach>
				
				<c:if test="${pager.curBlock < pager.totalBlock}">
				<li><a href="./${board}List.do?curPage=${pager.lastNum+1}"><span
						class="glyphicon glyphicon-chevron-right"></span></a></li>
				<li><a href="./${board}List.do?curPage=${pager.totalPage}"><span
						class="glyphicon glyphicon-forward"></span></a></li>
				</c:if>
				
			</ul>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<a class="btn btn-warning" href="${board}Write.do">Write</a>
		</div>
	</div>
<jsp:include page="../../../temp/footer.jsp"></jsp:include>
</body>
</html>