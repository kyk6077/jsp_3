<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:import url="../../../temp/bootstrap.jsp"/>
</head>
<body>
<c:import url="../../../temp/header.jsp"/>


	<div class="container">
	<h2 class="body_title">${board} Update</h2>
  <form class="form-horizontal" method="post" action="./${board}Update.do" enctype="multipart/form-data">
    <div class="form-group">
    	<input type="hidden" name="num" value="${dto.num}">
      <label class="control-label col-sm-2">Title:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" name="title" value="${dto.title}">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2">Contents:</label>
      <div class="col-sm-10">          
        <textarea rows="15" cols="" class="form-control" name="contents">${dto.contents}</textarea>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2">Writer:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" name="writer" value="${dto.writer}" disabled="disabled">
      </div>
    </div>
    
   
    <c:forEach items="${files}" var="file" varStatus="i">
    <div class="form-group">
      <label class="control-label col-sm-2">file:</label>
      <div class="col-sm-10">          
        <input type="file" value="${file.oname}" class="form-control" name="f${i.count}">
      </div>
    </div>
   	</c:forEach>
    
    
    
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default">Submit</button>
        <a href="${board}List.jsp" class="btn btn-default">List</a>
      </div>
    </div>
  </form>
</div>

<c:import url="../../../temp/footer.jsp"/>
</body>
</html>