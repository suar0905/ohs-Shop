<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//한글 깨짐 방지
	request.setCharacterEncoding("utf-8");
	// logout 시 바로 index페이지로 넘어가게함.
	session.invalidate(); // 사용자의 기존 세션을 삭제하고 새로운 세션으로 갱신한다.
	response.sendRedirect(request.getContextPath() + "/index.jsp");
%>