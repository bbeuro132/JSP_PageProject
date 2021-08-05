<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="ProjectBoard.BoardDB"%>
<%@ page import="ProjectBoard.BoardData"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%!int pageSize = 10;
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");%>

<%
	String pageNum = request.getParameter("num");

	if (pageNum == null) {
		pageNum = "1";
	}

	int currentPage = Integer.parseInt(pageNum);
	int start = (currentPage - 1) * pageSize + 1;
	int end = currentPage * pageSize;
	int count = 0;
	int number = 0;
	List<BoardData> articleList = null;

	BoardDB DB = BoardDB.getInstance();
	count = DB.getArticleCount();

	if (count > 0) {
		articleList = DB.getArticles(start, pageSize);
	}

	number = count - (currentPage - 1) * pageSize;
%>

<html>
<head>
<!--<link rel="stylesheet" href="css/style.css">  -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<style>
	.pageTag {
		text-align: center;
		font-weight: bold;	
	}
	
	a.titleBTN {
		text-decoration: none;
	}
	
	a.nameBTN {
		text-decoration: none
	}
</style>

<title>게시판</title>
</head>
<body>
<div class="container">
<!-- bgcolor="#FAFAD2" -->
<%
	if (count == 0) {
%>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	<table class="table table hover table-striped text-center"
			style="border:none;">
		<tr height="30">
			<br>
			<td width="450" align="center">	
				<span style = " font-size:1.5em;">
					게시판인데 글이 하나도 없네요...
				</span>
			</td>
		</tr>
	</table>

<%
	} else {
%>
	
	<table class="table table hover table-striped text-center"
			style="border : 1px inset">
		<tr height="30">
			<br>
			<td width="200" align="center"><b>글 목록 [전체 글 :<%=count%>]</b></td>
		</tr>
	</table>
	
	<br><br>
	<table class="table table hover table-striped text-center"
			style="border : 1px inset;">
		<tr height="30">
			<td align="center" width="50">번호</td>
			<td align="center" width="150">제목</td>
			<td align="center" width="80">작성자</td>
			<td align="center" width="80">작성날짜</td>
			<td align="center" width="60">조회수</td>
			<td align="center" width="50">IP주소</td>
		</tr>
<%
		for (int i = 0; i < articleList.size(); i++) {
			BoardData article = articleList.get(i);
%>
		<tr height="30">
			<td width="50" align="center"><%=number--%></td>
			<td width="300" align="center">
<%
				int width = 0;
				if (article.getRe_level() > 0) {
					width = 5 * (article.getRe_level());
%> 
<%
 				} else {
%> 
<%
 				}
%> 
	
		<a href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>"
			class="titleBTN">
					<%=article.getSubject()%>
		</a> 

<%
		if (article.getReadcount() >= 20) {
%> 

<%
 }
%>
		</td>
			<td width="100" align="center"><a
				href="mailto:<%=article.getEmail()%>"
				class="nameBTN"> <%=article.getWriter()%>
			</a></td>
			<td width="150" align="center"><%=format.format(article.getReg_date())%></td>
			<td width="50" align="center"><%=article.getReadcount()%></td>
			<td width="120" align="center"><%=article.getIp()%></td>
		</tr>
<%
		}
%>
	</table>
	
	<br>
	</div>
<%
	}
%>

<%
	if (count > 0) {

		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = 1;

		if (currentPage % 10 != 0)
			startPage = (int) (currentPage / 10) * 10 + 1;
		else
			startPage = ((int) (currentPage / 10) - 1) * 10 + 1;

		int pageBlock = 10;
		int endPage = startPage + pageBlock - 1;

		if (endPage > pageCount)
			endPage = pageCount;

		if (startPage > 10) {
%>			<div class="pageTag">
			<a href="list.jsp?pageNum=<%=startPage - 10%>">[이전]</a>
			</div>
<%
		}

		for (int i = startPage; i <= endPage; i++) {
%>
			<div class="pageTag">
			<a href="list.jsp?pageNum=<%=i%>">[<%=i%>]</a>
			</div>
<%
		}

		if (endPage < pageCount) {
%>
			<div class="pageTag">
			<a href="list.jsp?pageNum=<%=startPage + 10%>">[다음]</a>
			</div>
<%
		}
	}
%>
	<br>
	<table align="center">
		<tr>
			<td>	
			<a href="writeForm.jsp" class="btn btn-primary">
					<b>게시글 작성</b>				
			</a>
			</td>
		</tr>
	</table>

</body>
</html>