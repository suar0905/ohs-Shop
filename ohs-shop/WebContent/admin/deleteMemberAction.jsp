<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	//한글 깨짐 방지
	request.setCharacterEncoding("utf-8");
	// (로그인 하지 못한 사람)과 (로그인을 했더라도 memberLevel이 1보다 작은 사람)은 들어오지 못하게 하는 코드
	Member loginMember = (Member)session.getAttribute("loginMember");
	if(loginMember == null || loginMember.getMemberLevel() < 1){
		System.out.println("로그인을 하세요");
		response.sendRedirect(request.getContextPath() + "/index.jsp");
		return;
	}
	
	// deleteMemberForm에서 memberNo값과 memberName값을 가져옴
	int memberNo = Integer.parseInt(request.getParameter("memberNo"));
	String memberName = request.getParameter("memberName");
	
	// 디버깅 코드
	System.out.println("[debug] memberNo 확인 -> " + memberNo);
	System.out.println("[debug] memberName 확인 -> " + memberName);
	
	// (1) Member 클래스 객체 생성
	Member paramMember = new Member();
	paramMember.setMemberNo(memberNo);
	paramMember.setMemberName(memberName);
	System.out.println("[debug] paramMember 확인 -> " + paramMember);
	
	// (2) MemberDao 클래스 객체 생성
	MemberDao memberDao = new MemberDao();
	memberDao.deleteMemberByAdmin(paramMember);
	System.out.println("[debug] memberDao 확인 -> " + memberDao);
	
	// 완료 후 selectMemberList로 이동
	System.out.println("[debug] 회원정보가 정상적으로 삭제되었습니다.");
	response.sendRedirect(request.getContextPath() + "/admin/selectMemberList.jsp");
%>