<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ProjectBoard.BoardDB" %>
<%@ page import = "java.sql.Timestamp"%>

<%request.setCharacterEncoding("utf-8");%>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String passwd = request.getParameter("passwd");
	
	BoardDB db = BoardDB.getInstance();
	int check = db.deleteArticle(num, passwd);
	
	if (check == 1) {
%>
	<meta http-equiv="Refresh" content="0;url=list.jsp?pageNum=<%=pageNum%>">
<%
	} else {
%>
	<script type="text/javascript">
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
	</script>
<%
	}
%>