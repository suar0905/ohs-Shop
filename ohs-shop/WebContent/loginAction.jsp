<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="dao.*"%>
<%
	//한글 깨짐 방지
	request.setCharacterEncoding("utf-8");
	//인증 방어코드(로그인 전에만 열람 가능할 수 있도록)
	if(session.getAttribute("loginMember") != null) {
		System.out.println("[debug] 이미 로그인 되어있습니다.");
		response.sendRedirect(request.getContextPath() + "/index.jsp");
		return;
	}
	
	// 유효성 검사(null 방지) 및 공백 방지
	if(request.getParameter("memberId") == null || request.getParameter("memberPw") == null || request.getParameter("memberId").equals("") || request.getParameter("memberPw").equals("")) {
		System.out.println("[debug] memberId, memberPw 값이 null값이거나 공백값입니다.");
		response.sendRedirect(request.getContextPath() + "/loginForm.jsp");
		return;
	}
	
	// loginForm에서 추가한 변수 입력값 가져옴
	String memberId = request.getParameter("memberId");
	String memberPw = request.getParameter("memberPw");
	
	// 디버깅코드
	System.out.println("[debug] memberId값 확인 -> " + memberId);
	System.out.println("[debug] memberPw값 확인 -> " + memberPw);
	
	// (1) Member 클래스 객체 생성
	// paramMember 변수에 loginForm에서 입력받은 값들 저장
	Member paramMember = new Member();
	paramMember.setMemberId(memberId);
	paramMember.setMemberPw(memberPw);
	System.out.println("[debug] paramMember 확인 -> " + paramMember);
	
	// (2) MemberDao 클래스 객체 생성
	MemberDao memberDao = new MemberDao();
	
	// (3) Member 클래스 객체 생성
	Member returnMember = new Member();
	// login메소드 사용
	returnMember = memberDao.login(paramMember);
	System.out.println("[debug] returnMember 확인 -> " + returnMember);
	
	if(returnMember == null) {
		// 로그인 실패할 때
		System.out.println("[debug] 로그인에 실패하였습니다.");
		response.sendRedirect(request.getContextPath() + "/loginForm.jsp");
		return; 
	} else {
		// 로그인 성공할 때
		System.out.println("[debug] 로그인에 성공하였습니다.");
		System.out.println("[debug] 로그인 정보 -> " + returnMember.getMemberNo());
		System.out.println("[debug] 로그인 정보 -> " + returnMember.getMemberId());
		System.out.println("[debug] 로그인 정보 -> " + returnMember.getMemberLevel());
		System.out.println("[debug] 로그인 정보 -> " + returnMember.getMemberName());
		// 변수이름:loginMember, 값:returnMebmer
		// loginMember안에는 Member타입의 returnMember변수(memberNo, memberId, memberLevel, memberName)가 들어가 있다.
		session.setAttribute("loginMember", returnMember);
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}
%>