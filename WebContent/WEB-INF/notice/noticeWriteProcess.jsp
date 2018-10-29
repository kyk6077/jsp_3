<%@page import="com.iu.file.FileDAO"%>
<%@page import="com.iu.file.FileDTO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.iu.notice.NoticeDTO"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

NoticeDAO ntDAO = new NoticeDAO();

String path = request.getServletContext().getRealPath("upload");

System.out.println(path);
int max = 1024*1024*10;
MultipartRequest multi = new MultipartRequest(request,path,max,"UTF-8",new DefaultFileRenamePolicy());
//path경로에 파일 업로드 끝

NoticeDTO ntDTO = new NoticeDTO();
ntDTO.setTitle(multi.getParameter("title"));
ntDTO.setContents(multi.getParameter("contents"));
ntDTO.setWriter(multi.getParameter("writer"));
FileDTO f1 = new FileDTO();
FileDTO f2 = new FileDTO();

f1.setFname(multi.getFilesystemName("f1"));//파라미터 이름
f1.setOname(multi.getOriginalFileName("f1"));
f2.setFname(multi.getFilesystemName("f2"));//파라미터 이름
f2.setOname(multi.getOriginalFileName("f2"));


// File f = multi.getFile("f1");
// Enumeration e = multi.getFileNames();//파라미터 명들

int num = ntDAO.getNum();
ntDTO.setNum(num);
int result = ntDAO.insert(ntDTO);

f1.setNum(num);
f2.setNum(num);
f1.setKind("N");
f2.setKind("N");

FileDAO fileDAO = new FileDAO();
fileDAO.insert(f1);
fileDAO.insert(f2);


String message = "Insert Fail";
if(result>0){
	message = "Insert Success";
}
request.setAttribute("message", message);
request.setAttribute("path","./noticeList.jsp");
RequestDispatcher view = request.getRequestDispatcher("../common/result.jsp");
view.forward(request, response);

//redirect
// response.sendRedirect("../index.jsp");//이동해야할 주소

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
</script>
</head>
<body>

</body>
</html>