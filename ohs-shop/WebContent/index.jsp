<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<!-- 페이지 상단부분에 patial 폴더안의 mainMenu 내용 포함시키기 -->
	<div>
		<jsp:include page="/partial/mainMenu.jsp"></jsp:include>
	</div>
	
	<div class="jumbotron">
		<h1>메인 페이지</h1>
		<%
			// 로그인 전(session 영역안이 null값이면)
			if(session.getAttribute("loginMember") == null) {
		%>
				<div><a class="btn btn-outline-dark" href="<%=request.getContextPath()%>/loginForm.jsp">로그인</a></div>
				<div><a class="btn btn-outline-dark" href="<%=request.getContextPath()%>/insertMemberForm.jsp">회원가입</a></div>
		<% 	
			// 로그인 후(session 영역안에 로그인 정보가 있으면)
			} else {
				// Member 타입인 loginMember변수 안에 loginMember 정보 내용을 저장한다. 
				Member loginMember = (Member)session.getAttribute("loginMember");
		%>
				<div>반갑습니다. <%=loginMember.getMemberName()%>님</div> 
				<div><a class="btn btn-outline-dark" href="<%=request.getContextPath()%>/logout.jsp">로그아웃</a></div>
				<div><a class="btn btn-outline-dark" href="<%=request.getContextPath()%>/selectMemberOne.jsp">회원상세보기</a></div>		
		<% 		
				// memberLevel이 1(관리자)일때만 관리자 페이지로 들어가기
				if(loginMember.getMemberLevel() > 0) {
		%>
					<div><a class="btn btn-outline-dark" href="<%=request.getContextPath()%>/admin/adminIndex.jsp">관리자 페이지</a></div>
		<% 			
				}
			}
		%>
	</div>
</body>
</html>