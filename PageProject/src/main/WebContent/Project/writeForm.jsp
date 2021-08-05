<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>게시판 입력 페이지</title>
<!-- <link rel="stylesheet" href="css/style.css"> -->


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


</head>
<body>

	<div class="container">
<%
	int num = 0;
	int ref = 1;
	int re_step = 0;
	int re_level = 0;
	
	String strV = "";
	
	try {
		if (request.getParameter("num") != null) {
			num = Integer.parseInt(request.getParameter("num"));
			ref = Integer.parseInt(request.getParameter("ref"));
			re_step = Integer.parseInt(request.getParameter("re_step"));
			re_level = Integer.parseInt(request.getParameter("re_level"));
		}
%>

	<form method="post" action="writePro.jsp" onsubmit="return writeSave()" name="writeform">
		<input type="hidden" name="num" value="<%=num %>">
		<input type="hidden" name="ref" value="<%=ref %>">
		<input type="hidden" name="re_step" value="<%=re_step %>">
		<input type="hidden" name="re_level" value="<%=re_level %>">
	
	<table class="table table hover table-striped text-center"
			style="border : 2px solid;">
		<tr height="30">
			<td align="right" colspan="2">
				<a href="list.jsp" class="btn btn-info btn-sm">글 목록</a>
			</td>
		</tr>
		
		<tr>
			<td width="80" align="center">이름</td>
			<td width="350" align="left">
				<input type="text" size="10" maxlength="10" name ="writer"
					style="ime-mode:active;">
			</td>
		</tr>
		
		<tr>
			<td width="80" align="center">제목</td>
			<td width="350" align="left">
				<%
					if (request.getParameter("num") == null)
						strV = "";
					else
						strV = "[답변]";
				%>
				<input type="text" size="40" maxlength="30" name="subject"
					value="<%=strV %>" style="ime-mode:active;">
			</td>
		</tr>
		
		<tr>
			<td width="80" align="center">이메일</td>
			<td width="350" align="left">
				<input type="text" size="40" maxlength="50" name="email"
					style="ime-mode:active;">
			</td>
		</tr>
		
		<tr>
			<td width="80" align="center">내용</td>
			<td width="350" align="left">
				<textarea name="content" rows="13" cols="40" style="ime-mode:active;">
				</textarea>
			</td>
		</tr>
		
		<tr>
			<td width="80" align="center">비밀번호</td>
			<td width="350" align="left">
				<input type="password" size="8" maxlength="12" name="passwd"
					style="ime-mode:inactive;">
			</td>
		</tr>
		
		<tr height="30">
			<td colspan=2 align="center">
				<input type="submit" class = "btn btn-default" value="게시">
				<input type="reset" class = "btn btn-default" value="다시 쓸래!">
				<input type="button" class = "btn btn-default" value="목록으로" OnClick="window.location='list.jsp'">
			</td>
		</tr>
	</table>
<%
	} catch (Exception e) {}
%>
	</form>
	</div>
</body>
</html>