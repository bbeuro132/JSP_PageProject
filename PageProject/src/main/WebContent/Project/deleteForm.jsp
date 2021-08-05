<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- <link rel="stylesheet" href="css/style.css"> -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<title>게시판!!</title>
</head>
<body>
	<div class="container">
	
	<form method="post" name="delForm" action="deletePro.jsp?pageNum=<%=pageNum %>"
		onsubmit="return deleteSave()">
		<table class="table table hover table-striped text-center"
				style="border : 2px solid;">
			<tr height="30">
				<td align="center" width="200">
					<b>비밀번호를 입력해주쇼</b>
				</td>
			</tr>
			
			<tr height="30">
				<td align="center" width="200">
					비밀번호 : 
					<input type="password" name="passwd" size="8" maxlength="30">
					<input type="hidden" name="num" value="<%=num %>">
				</td>
			</tr>
			
			<tr height="30">
				<td align="center" width="200">
					<input type="submit" class = "btn btn-default" value="삭제하기">
					<input type="button" class = "btn btn-info" value="목록으로"
						onclick="document.location.href='list.jsp?pageNum=<%=pageNum %>'">
				</td>
			</tr>
		</table>
	</div>
</body>
</html>