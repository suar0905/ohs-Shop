<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메뉴 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<!-- (1) 회원관리 : 회원목록 보기, 회원등급 수정, 회원강제 탈퇴 
			1.1) Member.class
			1.2) MemberDao.class
			1.3) selectMemberList.jsp (페이징 O)
			1.4) updateMemberLevelForm.jsp, updateMemberLevelAction.jsp
			1.5) updateMemberPwForm.jsp, updateMemberPwAction.jsp
			1.6) deleteMemberForm.jsp, deleteMemberAction.jsp
		-->	
		<a class="navbar-brand" href="<%=request.getContextPath()%>/admin/selectMemberList.jsp">[회원관리]</a>
		<!-- (2) 전자책 카테고리 관리 : 카테고리 목록, 카테고리 추가, 카테고리 사용유무 수정 
			2.1) Category.class 
	    	2.2) CategoryDao.class
	    	2.3) selectCategoryList.jsp (페이징 X) 
	    	2.4) insertCategoryForm.jsp, insertCategoryAction.jsp 
	    	2.5) selectCategoryNameCheckAction.jsp 
	        2.6) updateCategoryStateAction.jsp -? selectCategoryList.jsp에서 바로 실행될 수 있도록
		-->
		<a class="navbar-brand" href="<%=request.getContextPath()%>/admin/selectCategoryList.jsp">[전자책 카테고리 관리]</a>
		<!-- (3) 전자책 관리 :  -->
		<a class="navbar-brand" href="#">[전자책 관리]</a>
		<a class="navbar-brand" href="#">[주문 관리]</a>
		<a class="navbar-brand" href="#">[상품명 관리]</a>
		<a class="navbar-brand" href="#">[공지게시판 관리]</a>
		<a class="navbar-brand" href="#">[QnA게시판 관리]</a>
		<a class="navbar-brand" href="<%=request.getContextPath()%>/logout.jsp">로그아웃</a>
	</nav>
</body>
</html>