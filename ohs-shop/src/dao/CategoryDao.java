package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import commons.DBUtil;
import vo.Category;

public class CategoryDao {
	
	// (4) [관리자] 카테고리 상태유무 수정 코드
	public void updateCategoryState(Category category) throws ClassNotFoundException, SQLException {
		// updateCategoryState메소드의 categoryName 입력값 확인
		System.out.println("[debug] categoryName param 확인 -> " + category.getCategoryName());
		// updateCategoryState메소드의 categoryState 입력값 확인
		System.out.println("[debug] categoryState param 확인 -> " + category.getCategoryState());
		
		// maria db 사용 및 접속
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		// 쿼리 생성
		// 쿼리문 : category테이블에서 category_name이 ?(category.getCategoryName())일때, category_state를 ?(category.getCategoryState())로 수정하여라.
		String sql = "UPDATE category SET category_state=? WHERE category_name=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, category.getCategoryState());
		stmt.setString(2, category.getCategoryName());
		System.out.println("[debug] stmt 확인 -> " + stmt);
		
		// 쿼리 실행
		stmt.executeUpdate();
		
		// 기록 종료
		stmt.close();
		conn.close();
	}
	
	// (3) [관리자] 카테고리 추가 전 중복 카테고리 이름(categoryName) 검사 코드
	public String selectCategoryNameCheck(String categoryNameCheck) throws ClassNotFoundException, SQLException {
		// selectCategoryNameCheck메소드의 categoryNameCheck 입력값 확인
		System.out.println("[debug] categoryNameCheck param 확인 -> " + categoryNameCheck);
		
		// maria db 사용 및 접속
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		// 쿼리 생성
		// 쿼리문 : category테이블에서 category_name이 ?(categoryNameCheck)일때, categoryName값을 구하여라.
		String sql = "SELECT category_name categoryName FROM category WHERE category_name=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, categoryNameCheck);
		System.out.println("[debug] stmt 확인 -> " + stmt);
		
		// 쿼리 실행
		ResultSet rs = stmt.executeQuery();
		
		// 쿼리 실행한 값을 저장하기 위한 변수(categoryName) 생성
		String categoryName = null;
		
		if(rs.next()) {
			categoryName = rs.getString("categoryName");
		}
		
		// 기록 종료
		rs.close();
		stmt.close();
		conn.close();
		
		return categoryName;
	}
	
	// (2) [관리자] 카테고리 추가 코드
	public void insertCategory(Category category) throws ClassNotFoundException, SQLException {
		// insertCategory메소드의 categoryName 입력값 확인
		System.out.println("[debug] categoryName param 확인 -> " + category.getCategoryName());
		// insertCategory메소드의 categoryState 입력값 확인
		System.out.println("[debug] categoryState param 확인 -> " + category.getCategoryState());
		
		// maria db 사용 및 접속
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		// 쿼리 생성 
		// 쿼리문 : 카테고리 테이블의 categoryName, updateDate, createDate, categoryState에다 ?,now(),now(),? 값을 추가하여라.
		String sql = "INSERT INTO category(category_name, update_date, create_date, category_state) VALUES(?,now(),now(),?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, category.getCategoryName());
		stmt.setString(2, category.getCategoryState());
		System.out.println("[debug] stmt 확인 - > " + stmt);
		
		// 쿼리 실행
		stmt.executeUpdate();
		
		// 기록 종료
		stmt.close();
		conn.close();
	}
	
	// (1) [관리자] 카테고리 목록 출력 코드
	public ArrayList<Category> selectCategoryListAllByPage(int beginRow, int rowPerPage) throws ClassNotFoundException, SQLException {
		// selectCategoryListAllByPage메소드의 beginRow 입력값 확인
		System.out.println("[debug] beginRow param 확인 -> " + beginRow);
		// selectCategoryListAllByPage메소드의 rowPerPage 입력값 확인
		System.out.println("[debug] rowPerPage param 확인 -> " + rowPerPage);
		
		// maria db 사용 및 접속
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		// 쿼리 생성
		// 쿼리문 : category테이블에서 create_date 항목을 내림차순으로 ?(beginRow)에서 ?(rowPerPage)까지 categoryName, updateDate, createDate, categoryName 항목의 값을 구하여라.
		String sql = "SELECT category_name categoryName, update_date updateDate, create_date createDate, category_state categoryState FROM category ORDER BY create_date DESC LIMIT ?,?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		System.out.println("[debug] stmt 확인 -> " + stmt);
		
		// 쿼리 실행
		ResultSet rs = stmt.executeQuery();
		
		// 1.1) Category 클래스 배열 객체 생성
		ArrayList<Category> list = new ArrayList<Category>();
		
		while(rs.next()) {
			// 1.2) Category 클래스 객체 생성
			Category returnCategory = new Category();
			returnCategory.setCategoryName(rs.getString("categoryName"));
			returnCategory.setUpdateDate(rs.getString("updateDate"));
			returnCategory.setCreateDate(rs.getString("createDate"));
			returnCategory.setCategoryState(rs.getString("categoryState"));
			list.add(returnCategory);
		}
		System.out.println("[debug] list 확인 -> " + list);
		
		// 기록 종료
		rs.next();
		stmt.close();
		conn.close();
		
		return list;
	}
}