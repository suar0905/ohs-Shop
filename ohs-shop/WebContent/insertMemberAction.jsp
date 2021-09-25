<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="dao.*"%>
<%
	//한글 깨짐 방지
	request.setCharacterEncoding("utf-8");
	// 인증 방어코드(로그인 전에만 열람 가능할 수 있도록)
	if(session.getAttribute("loginMember") != null) {
		System.out.println("[debug] 이미 로그인 되어있습니다.");
		response.sendRedirect(request.getContextPath() + "/index.jsp");
		return;
	}
	
	// 유효성 검사(null방지)
	if(request.getParameter("memberId") == null || request.getParameter("memberPw") == null || request.getParameter("memberLevel") == null || request.getParameter("memberName") == null || request.getParameter("memberAge") == null || request.getParameter("memberGender") == null) {
		System.out.println("[debug] null값이 존재합니다.");
		response.sendRedirect(request.getContextPath() + "/insertMemberForm.jsp");
		return;
	}
	
	// 공백 검사
	if(request.getParameter("memberId").equals("") || request.getParameter("memberPw").equals("") || request.getParameter("memberLevel").equals("") || request.getParameter("memberName").equals("") || request.getParameter("memberAge").equals("") || request.getParameter("memberGender").equals("")) {
		System.out.println("[debug] 공백값이 존재합니다.");
		response.sendRedirect(request.getContextPath() + "/insertMemberForm.jsp");
		return;
	}
	
	// insertMemberForm에서 추가한 변수 입력값 가져옴
	String memberId = request.getParameter("memberId");
	String memberPw = request.getParameter("memberPw");
	int memberLevel = Integer.parseInt(request.getParameter("memberLevel"));
	String memberName = request.getParameter("memberName");
	int memberAge = Integer.parseInt(request.getParameter("memberAge"));
	String memberGender = request.getParameter("memberGender");
	
	// 디버깅코드
	System.out.println("[debug] memberId값 확인 -> " + memberId);
	System.out.println("[debug] memberPw값 확인 -> " + memberPw);
	System.out.println("[debug] memberLevel값 확인 -> " + memberLevel);
	System.out.println("[debug] memberName값 확인 -> " + memberName);
	System.out.println("[debug] memberAge값 확인 -> " + memberAge);
	System.out.println("[debug] memberGender값 확인 -> " + memberGender);
	
	// (1) Member 클래스 객체 생성
	// paramMember 변수에 insertMemberForm에서 입력받은 값들 저장
	Member paramMember = new Member();
	paramMember.setMemberId(memberId);
	paramMember.setMemberPw(memberPw);
	paramMember.setMemberLevel(memberLevel);
	paramMember.setMemberName(memberName);
	paramMember.setMemberAge(memberAge);
	paramMember.setMemberGender(memberGender);
	System.out.println("[debug] paramMember 확인 -> " + paramMember);
	
	// (2) MemberDao 클래스 객체 생성
	// memberDao 변수에 paramMember매겨변수를 적용한 insertMember메소드 추가
	MemberDao memberDao = new MemberDao();
	int insertRs = memberDao.insertMember(paramMember);
	
	if(insertRs == 1) { // 회원가입 성공
		System.out.println("[debug] 정상적으로 회원가입 되었습니다.");
		response.sendRedirect(request.getContextPath() + "/index.jsp");
		return;
	} else { // 회원가입 실패
		System.out.println("[debug] 회원가입에 실패하였습니다.");
		response.sendRedirect(request.getContextPath() + "/insertMemberForm.jsp");
		return;
	}
%>