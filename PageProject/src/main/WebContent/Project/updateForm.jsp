<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ProjectBoard.BoardData" %>
<%@ page import = "ProjectBoard.BoardDB" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="css/style.css"> -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<title>게시판?</title>
</head>
<body>
	<div class="container">
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	try {
		BoardDB db = BoardDB.getInstance();
		BoardData article = db.updateGetArticle(num);
%>
	<form method="post" name="writeform" action="updatePro.jsp?pageNum=<%=pageNum %>"
		onsubmit="return writeSave()">
		<table class="table table hover table-striped text-center"
			style="border : 2px solid;">
			<tr>
				<td width="70" align="center">이름</td>
				<td align="left" width="330">
					<input type="text" size="10" maxlength="10" name="writer"
					value="<%=article.getWriter() %>" style="ime-mode:active;">
					<input type="hidden" name="num" value="<%=article.getNum() %>">
				</td>
			</tr>
			
			<tr>
				<td width="70" align="center">제목</td>
				<td align="left" width="330">
					<input type="text" size="40" maxlength="50" name="subject"
					value="<%=article.getSubject() %>" style="ime-mode:active;">
				</td>
			</tr>
			
			<tr>
				<td width="70" align="center">내용</td>
				<td align="left" width="330">
					<textarea name="content" rows="13" cols="40" style="ime-mode:active;">
						<%=article.getContent() %>
					</textarea>
				</td>
			</tr>
			
			<tr>
				<td width="70" align="center">비밀번호</td>
				<td align="left" width="330">
					<input type="password" size="8" maxlength="30" name="passwd" style="ime-mode:active;">
				</td>
			</tr>
			
			<tr>
				<td colspan=2 align="center">
					<input type="submit" class = "btn btn-default" value="수정하기">
					<input type="button" class = "btn btn-info" value="목록으로"
						onclick="document.location.href='list.jsp?pageNum=<%=pageNum %>'">
				</td>
			</tr>
		</table>
	</form>
<%
	} catch (Exception e) {}
%>
	</div>
</body>
</html>