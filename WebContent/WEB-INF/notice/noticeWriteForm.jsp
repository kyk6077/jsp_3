
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="../../temp/bootstrap.jsp"></jsp:include>
</head>
<body>

<jsp:include page="../../temp/header.jsp"></jsp:include>


	<div class="container">
  <h2 class="body_title">Write</h2>
  <form class="form-horizontal" method="post" action="./noticeWriteProcess.jsp" enctype="multipart/form-data">
    <div class="form-group">
      <label class="control-label col-sm-2">Title:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" name="title">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2">Contents:</label>
      <div class="col-sm-10">          
        <textarea rows="15" cols="" class="form-control" name="contents"></textarea>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2">Writer:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" name="writer">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2">file:</label>
      <div class="col-sm-10">          
        <input type="file" class="form-control" name="f1">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2">file:</label>
      <div class="col-sm-10">          
        <input type="file" class="form-control" name="f2">
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default">Submit</button>
        <a href="noticeList.jsp" class="btn btn-default">List</a>
        
      </div>
    </div>
  </form>
</div>

<jsp:include page="../../temp/footer.jsp"></jsp:include>
</body>
</html>