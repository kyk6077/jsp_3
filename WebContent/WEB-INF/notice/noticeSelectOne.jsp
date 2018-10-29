<%@page import="java.util.List"%>
<%@page import="com.iu.file.FileDTO"%>
<%@page import="com.iu.file.FileDAO"%>
<%@page import="com.iu.board.BoardDTO"%>
<%@page import="com.iu.notice.NoticeDTO"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardDTO boardDTO = (BoardDTO)request.getAttribute("dto");
	List<FileDTO> ar = (List<FileDTO>)request.getAttribute("files");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../../temp/bootstrap.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../../temp/header.jsp"></jsp:include>

<div class="container-fluid">
	<h1 id="body_title">NOTICE</h1>
	<table class="table">
		<tr class="active"><td>SUBJECT</td><td>NAME</td><td>DATE</td><td>HIT</td></tr>
		<tr><td><%= boardDTO.getTitle() %></td>
		<td><%= boardDTO.getWriter() %></td>
		<td><%= boardDTO.getReg_date() %></td>
		<td><%= boardDTO.getHit() %></td></tr>
		
	</table>
	<p id ="content_main"><%= boardDTO.getContents() %></p>
	<%for(FileDTO file : ar) {%>
			<h3><a href="../upload/<%= file.getFname() %>"><%=file.getOname()%></a></h3>
	<%} %>
	
	
	<a class="btn btn-primary" href="./noticeList.do?num=<%= boardDTO.getNum()%>">List</a>
	<a class="btn btn-primary" href="./noticeUpdateForm.jsp?num=<%= boardDTO.getNum()%>">UPDATE</a>
	<a class="btn btn-primary" href="./noticeDeleteProcess.jsp?num=<%= boardDTO.getNum()%>">DELETE</a>

</div>

<jsp:include page="../../temp/footer.jsp"></jsp:include>
</body>
</html>