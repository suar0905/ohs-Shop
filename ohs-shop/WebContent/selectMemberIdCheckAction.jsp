<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%
	// 한글 깨짐 방지
	request.setCharacterEncoding("utf-8");
	// 유효성 검사(null값 방지), 공백 방지코드
	if(request.getParameter("memberIdCheck") == null || request.getParameter("memberIdCheck").equals("")) {
		System.out.println("[debug] memberIdCheck의 값이 Null 이거나 공백입니다.");
		response.sendRedirect(request.getContextPath() + "/insertMemberForm.jsp");
		return;
	}
	
	// insertMemberForm에서 memberIdCheck값을 가져옴
	String memberIdCheck = request.getParameter("memberIdCheck");
	
	// 디버깅 코드
	System.out.println("[debug] memberIdCheck 확인 -> " + memberIdCheck);
	
	// (1) MemberDao 클래스 객체 생성
	MemberDao memberDao = new MemberDao();
	
	// result = memberIdCheck값의 중복 유무를 결정하기 위한 변수 
	String result = memberDao.selectMemberIdCheck(memberIdCheck);
	
	if(result == null) {
		// memberIdCheck값이 null 이면 아이디 사용 가능
		System.out.println("[debug] 해당 아이디를 사용할 수 있습니다.");
		response.sendRedirect(request.getContextPath() + "/insertMemberForm.jsp?memberIdCheck=" + memberIdCheck);
	} else {
		// memberIdCheck값이 이미 존재하여 아이디 사용 불가능
		System.out.println("[debug] 해당 아이디는 이미 존재하여 사용이 불가능합니다.");
		response.sendRedirect(request.getContextPath() + "/insertMemberForm.jsp?existId=IDalreadyexists");
	}	
%>