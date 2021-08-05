<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ProjectBoard.BoardDB" %>
<%@ page import = "java.sql.Timestamp" %>

<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="article" scope="page" class="ProjectBoard.BoardData">
	<jsp:setProperty name="article" property="*"/>
</jsp:useBean>

<%
	article.setReg_date(new Timestamp(System.currentTimeMillis()));
	article.setIp(request.getRemoteAddr());
	
	BoardDB dbPro = BoardDB.getInstance();
	dbPro.insertArticle(article);
	
	response.sendRedirect("list.jsp");
%>