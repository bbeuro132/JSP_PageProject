<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ProjectBoard.BoardData" %>
<%@ page import = "ProjectBoard.BoardDB" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- <link rel="stylesheet" href="css/style.css"> -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<title>게시판!</title>
</head>
<body>
	<div class="container">
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	try {
		BoardDB db = BoardDB.getInstance();
		BoardData article = db.getArticle(num);
		int ref = article.getRef();
		int re_step = article.getRe_step();
		int re_level = article.getRe_level();
		
%>
	<form>
		<table class="table table hover table-striped text-center"
			style="border : 2px solid;">
			<tr height="40">
				<td align="center" width="130">글 번호</td>
				<td align="center" width="130">
					<%=article.getNum() %>
				</td>
				<td align="center" width="130">조회수</td>
				<td align="center" width="130">
					<%=article.getReadcount() %>
				</td>
			</tr>
			
			<tr height="40">
				<td align="center" width="130">작성자</td>
				<td align="center" width="130">
					<%=article.getWriter() %>
				</td>
				<td align="center" width="130">작성날짜</td>
				<td align="center" width="130">
					<%=article.getReg_date() %>
				</td>
			</tr>
			
			<tr height="40">
				<td align="center" width="130">제목</td>
				<td align="center" width="350" colspan="3">
					<%=article.getSubject() %>
				</td>
			</tr>
			
			<tr>
				<td align="center" width="130">내용</td>
				<td align="left" width="400" colspan="3">
					<pre><%=article.getContent() %></pre>
				</td>
			</tr>
			
			<tr height="30">
				<td colspan="4" align="right">
					<input type="button" value="수정"
						onclick = 
		"document.location.href='updateForm.jsp?num=<%=article.getNum() %>&pageNum=<%=pageNum %>'"
						 class="btn btn-secondary">
					&nbsp;&nbsp;&nbsp;
					<input type="button" value="삭제"
						onclick = 
		"document.location.href='deleteForm.jsp?num=<%=article.getNum() %>&pageNum=<%=pageNum %>'"
						 class="btn btn-secondary">
					&nbsp;&nbsp;&nbsp;
					<input type="button" value="댓글작성"
						onclick = 
		"document.location.href='writeForm.jsp?num=<%=num %>&ref=<%=ref %>&re_step=<%=re_step %>&re_level=<%=re_level %>'"
						 class="btn btn-secondary">
					&nbsp;&nbsp;&nbsp;
					<input type="button" value="목록으로"
						onclick =
		"document.location.href='list.jsp?pageNum=<%=pageNum %>'"
						 class="btn btn-info">
				</td>
			</tr>
		</table>
<%
	} catch (Exception e) {
		e.printStackTrace();
	}	
%>
	</form>
	</div>
</body>
</html>