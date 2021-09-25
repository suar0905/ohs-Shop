<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%
	// 한글 깨짐 방지
	request.setCharacterEncoding("utf-8");
	// 유효성 검사(null값 방지), 공백 방지코드
	if(request.getParameter("categoryNameCheck") == null || request.getParameter("categoryNameCheck").equals("")) {
		System.out.println("[debug] categoryNameCheck의 값이 Null 이거나 공백입니다.");
		response.sendRedirect(request.getContextPath() + "/insertCategoryForm.jsp");
		return;
	}
	
	// insertCategoryForm에서 categoryNameCheck값을 가져옴
	String categoryNameCheck = request.getParameter("categoryNameCheck");
	
	// 디버깅 코드
	System.out.println("[debug] categoryNameCheck 확인 -> " + categoryNameCheck);
	
	// (1) CategoryDao 클래스 객체 생성
	CategoryDao categoryDao = new CategoryDao();
	
	// result = categoryNameCheck값의 중복 유무를 결정하기 위한 변수 
	String result = categoryDao.selectCategoryNameCheck(categoryNameCheck);
	
	if(result == null) {
		// categoryNameCheck값이 null 이면 이름 사용 가능
		System.out.println("[debug] 해당 이름을 사용할 수 있습니다.");
		response.sendRedirect(request.getContextPath() + "/admin/insertCategoryForm.jsp?categoryNameCheck=" + categoryNameCheck);
	} else {
		// categoryNameCheck값이 이미 존재하여 이름 사용 불가능
		System.out.println("[debug] 해당 이름은 이미 존재하여 사용이 불가능합니다.");
		response.sendRedirect(request.getContextPath() + "/admin/insertCategoryForm.jsp?existName=Namealreadyexists");
	}	
%>