<%@page import="com.iu.page.Pager"%>
<%@page import="java.util.List"%>
<%@page import="com.iu.qna.QnaDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.iu.qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<QnaDTO> ar = (List<QnaDTO>)request.getAttribute("list");
	Pager pager = (Pager)request.getAttribute("pager");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../../temp/bootstrap.jsp"></jsp:include>
</head>
<body>

<%@ include file="../../temp/header.jsp" %>

<div class="container-fluid">
		<div class="row">
			<form class="form-inline" action="./qnaList.jsp">
				<div class="form-group">
					<select class="form-control" id="sel1" name="kind">
						<option>ID</option>
						<option>NAME</option>
					</select>
					<input type="text"
						class="form-control" id="search" placeholder="Enter search" name="search">
				</div>
				<button type="submit" class="btn btn-default">Search</button>
			</form>
		</div>
		<h1 id="body_title">NOTICE</h1>
		<table class="table list_table">
			<tr class="active">
				<td>NUM</td>
				<td>TITLE</td>
				<td>WRITER</td>
				<td>reg_date</td>
				<td>hit</td>
			</tr>
			<%
				for (int a=0; a<ar.size();a++) {
			%>
			<tr>
				<td><%=ar.get(a).getNum()%></td>
				<td><a href="./qnaSelectOne.jsp?num=<%= ar.get(a).getNum()%>">
					<%for(int i=0;i<ar.get(a).getDepth();i++){ %>--<%}%>
					<%=ar.get(a).getTitle()%></a></td>
				<td><%=ar.get(a).getWriter()%></td>
				<td><%=ar.get(a).getReg_date()%></td>
				<td><%=ar.get(a).getHit()%></td>
				
			</tr>
			<%
				}
			%>
		</table>

	</div>

	<div class="container-fluid">
		<div class="row">
			<ul class="pagination">
				<li><a href="./qnaList.do?curPage=<%=1%>&kind=<%=pager.getSearch().getKind()%>&search=<%=pager.getSearch().getSearch()%>"><span
						class="glyphicon glyphicon-backward"></span></a></li>
				<%if (pager.getCurBlock() > 1) {%>
				<li><a href="./qnaList.do?curPage=<%=pager.getStartNum() - 1%>&kind=<%=pager.getSearch().getKind()%>&search=<%=pager.getSearch().getSearch()%>"><span
						class="glyphicon glyphicon-chevron-left"></span></a></li>
				<%}%>
				<%for (int i = pager.getStartNum(); i <= pager.getLastNum(); i++) {%>
				<li><a href="./qnaList.do?curPage=<%=i%>&kind=<%=pager.getSearch().getKind()%>&search=<%=pager.getSearch().getSearch()%>"><%=i%></a></li>
				<%}%>

				<%if (pager.getCurBlock() != pager.getTotalBlock()) {	%>
				<li><a href="./qnaList.do?curPage=<%=pager.getLastNum() + 1%>&kind=<%=pager.getSearch().getKind()%>&search=<%=pager.getSearch().getSearch()%>"><span
						class="glyphicon glyphicon-chevron-right"></span></a></li>
				<%}%>
				<li><a href="./qnaList.do?curPage=<%=pager.getTotalPage()%>&kind=<%=pager.getSearch().getKind()%>&search=<%=pager.getSearch().getSearch()%>"><span
						class="glyphicon glyphicon-forward"></span></a></li>
			</ul>
		</div>
	</div>
	
	<div class="container-fluid">
		<div class="row">
			<a class="btn btn-warning" href="qnaWriteForm.jsp">Write</a>
		</div>
	</div>
	
<%@ include file="../../temp/footer.jsp" %>
</body>
</html>