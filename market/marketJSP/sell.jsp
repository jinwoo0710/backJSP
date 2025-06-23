<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  %>
<%@page import="sellpostTable.SellPostDTO"%>
<%@page import="sellpostTable.SellPostDAO"%>
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>  
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>구매하기 - 중고마켓</title>
    <style>
        /* 전체 스타일 리셋 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box; 
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            line-height: 1.6;
            color: #333;
            background-color: #f8f9fa;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        /* 헤더 스타일 */
        .header {
            background: white;
            border-bottom: 1px solid #e5e7eb;
            position: sticky;
            top: 0;
            z-index: 50;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .header-content {
            display: flex;
            align-items: center;
            height: 64px;
            gap: 32px;
        }

        .logo a {
            display: flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
            color: inherit;
        }

        .logo-icon {
            background: #3b82f6;
            color: white;
            padding: 4px 8px;
            border-radius: 6px;
            font-weight: bold;
            font-size: 14px;
        }

        .logo-text {
            font-weight: bold;
            font-size: 20px;
            color: #1f2937;
        }

        .nav {
            display: flex;
            gap: 24px;
        }

        .nav a {
            text-decoration: none;
            color: #6b7280;
            font-weight: 500;
            transition: color 0.2s;
        }

        .nav a:hover,
        .nav a.active {
            color: #1f2937;
        }

        .header-actions {
            display: flex;
            align-items: center;
            gap: 16px;
            margin-left: auto;
        }

        .search-box {
            position: relative;
        }

        .search-box form {
            display: flex;
            align-items: center;
        }

        .search-box input {
            width: 300px;
            padding: 8px 40px 8px 12px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            font-size: 14px;
        }

        .search-box button {
            position: absolute;
            right: 8px;
            background: none;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }

        /* 등록 버튼 스타일 */
        .register-btn {
            background-color: #3b82f6;
            color: white;
            border: none;
            padding: 10px 16px;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 4px;
        }

        .register-btn:hover {
            background-color: #2563eb;
            transform: translateY(-1px);
        }

        .user-menu {
            display: flex;
            gap: 8px;
        }

        .icon-btn {
            background: none;
            border: none;
            padding: 4px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 20px;
            transition: background-color 0.2s;
            text-decoration: none;
        }

        .icon-btn:hover {
            background-color: #f3f4f6;
        }

        /* 플로팅 등록 버튼 */
        .floating-register-btn {
            position: fixed;
            bottom: 24px;
            right: 24px;
            width: 64px;
            height: 64px;
            background-color: #3b82f6;
            color: white;
            border: none;
            border-radius: 50%;
            font-size: 24px;
            cursor: pointer;
            box-shadow: 0 4px 16px rgba(59, 130, 246, 0.3);
            transition: all 0.2s;
            z-index: 1000;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .floating-register-btn:hover {
            background-color: #2563eb;
            transform: scale(1.1);
            box-shadow: 0 6px 20px rgba(59, 120, 246, 0.4);
        }

        /* 구매 페이지 스타일 */
        .buy-page {
            padding: 24px 0;
        }

        .search-filter-bar {
            display: flex;
            flex-direction: column;
            gap: 16px;
            margin-bottom: 24px;
        }

        .main-search {
            display: flex;
            gap: 16px;
            align-items: center;
        }

        .search-input-wrapper {
            position: relative;
            flex: 1;
        }

        .search-input {
            width: 100%;
            padding: 12px 16px 12px 40px;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            font-size: 16px;
        }

        .search-icon {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: #6b7280;
        }

        .filter-controls {
            display: flex;
            gap: 12px;
        }

        .sort-select {
            padding: 8px 12px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            background: white;
            cursor: pointer;
        }

        .filter-btn {
            background: white;
            border: 1px solid #d1d5db;
            padding: 8px 16px;
            border-radius: 6px;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: all 0.2s;
        }

        .filter-btn:hover {
            background-color: #f3f4f6;
        }

        .content-layout {
            display: grid;
            grid-template-columns: 250px 1fr;
            gap: 24px;
        }

        /* 사이드바 */
        .sidebar {
            background: white;
            border-radius: 12px;
            padding: 24px;
            height: fit-content;
            position: sticky;
            top: 100px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .filter-section {
            margin-bottom: 32px;
        }

        .filter-section:last-child {
            margin-bottom: 0;
        }

        .filter-section h3 {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 16px;
            color: #1f2937;
        }

        .category-list {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .category-item {
            padding: 8px 12px;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.2s;
            color: #6b7280;
        }

        .category-item:hover,
        .category-item.active {
            background-color: #f3f4f6;
            color: #1f2937;
        }

        .price-filter {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 16px;
        }

        .price-input {
            flex: 1;
            padding: 8px 12px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            font-size: 14px;
            width: 10%
        }

        .price-ranges {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .checkbox-item {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 14px;
            cursor: pointer;
        }

        .location-select {
            width: 100%;
            padding: 8px 12px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            background: white;
            cursor: pointer;
        }

        /* 메인 콘텐츠 */
        .main-content {
            background: white;
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .results-info {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 24px;
            font-size: 14px;
            color: #6b7280;
            flex-wrap: wrap;
        }

        .filter-tag {
            background-color: #e5e7eb;
            color: #374151;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 12px;
        }

        /* 상품 그리드 */
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 24px;
            margin-bottom: 32px;
        }

        .product-card {
            border: 1px solid #e5e7eb;
            border-radius: 12px;
            overflow: hidden;
            transition: all 0.2s;
            cursor: pointer;
            background: white;
        }

        .product-card:hover {
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            transform: translateY(-2px);
        }

        .product-image {
            position: relative;
            width: 100%;
            height: 200px;
            overflow: hidden;
        }

        .product-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s;
        }

        .product-card:hover .product-image img {
            transform: scale(1.05);
        }

        .like-btn {
            position: absolute;
            top: 8px;
            right: 8px;
            background: rgba(255, 255, 255, 0.9);
            border: none;
            border-radius: 50%;
            width: 32px;
            height: 32px;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.2s;
        }

        .like-btn:hover {
            background: white;
            transform: scale(1.1);
        }

        .like-btn.liked {
            color: red;
        }

        .status-badge {
            position: absolute;
            top: 8px;
            left: 8px;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 500;
            color: white;
        }

        .status-badge.reserved {
            background-color: #f59e0b;
        }

        .status-badge.sold {
            background-color: #ef4444;
        }

        .product-info {
            padding: 16px;
        }

        .product-title {
            font-size: 14px;
            font-weight: 500;
            margin-bottom: 8px;
            line-height: 1.4;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .product-price {
            font-size: 18px;
            font-weight: 700;
            color: #1f2937;
            margin-bottom: 8px;
        }

        .product-meta {
            display: flex;
            justify-content: space-between;
            font-size: 12px;
            color: #6b7280;
        }

        /* 빈 상태 */
        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #6b7280;
            grid-column: 1 / -1;
        }

        .empty-state p {
            font-size: 18px;
            margin-bottom: 20px;
        }

        .btn-primary {
            background-color: #3b82f6;
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.2s;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }

        .btn-primary:hover {
            background-color: #2563eb;
        }

        .btn-outline {
            background-color: transparent;
            color: #3b82f6;
            border: 1px solid #3b82f6;
            padding: 12px 24px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }

        .btn-outline:hover {
            background-color: #3b82f6;
            color: white;
        }

        .load-more {
            text-align: center;
        }

        /* 모바일 오버레이 */
        .mobile-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }

        .mobile-overlay.show {
            display: block;
        }

        /* 반응형 */
        @media (max-width: 768px) {
            .header-content {
                gap: 16px;
            }

            .search-box input {
                width: 200px;
            }

            .nav {
                gap: 16px;
            }

            .nav a {
                font-size: 14px;
            }

            .register-btn {
                padding: 8px 12px;
                font-size: 12px;
            }

            .floating-register-btn {
                width: 56px;
                height: 56px;
                bottom: 16px;
                right: 16px;
                font-size: 20px;
            }

            .content-layout {
                grid-template-columns: 1fr;
            }

            .sidebar {
                position: fixed;
                top: 0;
                left: -100%;
                width: 80%;
                height: 100%;
                z-index: 1000;
                background: white;
                overflow-y: auto;
                transition: left 0.3s ease;
            }

            .sidebar.show {
                left: 0;
            }

            .main-search {
                flex-direction: column;
                align-items: stretch;
            }

            .filter-controls {
                justify-content: space-between;
            }

            .product-grid {
                grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
                gap: 16px;
            }

            .results-info {
                flex-direction: column;
                align-items: flex-start;
                gap: 8px;
            }
        }
        .btn-outline {
            background: transparent;
            color: #007bff;
            border: 2px solid #007bff;
        }

        .btn-outline:hover {
            background: #007bff;
            color: white;
        }
        .filter-btns{
	         background-color: #3b82f6;
	         color: white;
	         border: none;
	         padding: 10px 16px;
	         border-radius: 6px;
	         font-size: 14px;
	         font-weight: 500;
	         cursor: pointer;
	         transition: all 0.2s;
	         text-decoration: none;
	         display: inline-flex;
	         align-items: center;
	         gap: 4px;
        }
    </style>
</head>
<body>
    <!-- 헤더 -->
    <header class="header">
        <div class="container">
            <div class="header-content">
                <!-- 로고 -->
                <div class="logo">
                    <a href="#" onclick="goHome()">
                        <span class="logo-icon">JUPJUP</span>
                        <span class="logo-text">마켓</span>
                    </a>
                </div>
                
                <!-- 네비게이션 -->
                <nav class="nav">
                    <a href="buy.jsp" onclick="goToSell()">구매하기</a>
                    <a href="sell.jsp" class="active">판매하기</a>
                    <a href="community.jsp" onclick="goToCommunity()">커뮤니티</a>
                </nav>
                
                <!-- 검색 및 사용자 메뉴 -->
                <div class="header-actions">
                    <div class="search-box">
                        <form onsubmit="return false;">
                            <input type="text" name="search" placeholder="상품을 검색해보세요...">
                            <button type="submit">🔍</button>
                        </form>
                    </div>
                    
                   
                   <div>
                   
                   <!-- 등록 버튼 추가 -->
                    <button class="register-btn" onclick="openCreatePost()">
                        ✏️ 글쓰기
                    </button>
                    </div>
                    <div class="user-menu">
                        <a href="chat.jsp" class="icon-btn">💬</a>
                        <%
						    String userid = (String) session.getAttribute("userid");
						
						    if (userid != null) {
						        out.println("<a href='mypage.jsp'class='icon-btn'>👤</a>");
						    } else {
						        out.println("<a href='login.jsp' class='icon-btn'>👤 </a>");
						    }
						%> 
                    </div>
                </div>
            </div>
        </div>
    </header>
	<%
		String category = request.getParameter("category");
	    String minPrice = request.getParameter("minPrice");
	    String maxPrice = request.getParameter("maxPrice");
	    String location = request.getParameter("location");
	 	String search = request.getParameter("search"); // 검색어 받아오기
	 	String sort = request.getParameter("sort");
	 	SellPostDAO dao = new SellPostDAO();
	 	ArrayList<SellPostDTO> dtos;
	 	boolean isAllEmpty = 
	 	        (search == null || search.trim().isEmpty()) &&
	 	        (category == null || category.trim().isEmpty()) &&
	 	        (minPrice == null || minPrice.trim().isEmpty()) &&
	 	        (maxPrice == null || maxPrice.trim().isEmpty()) &&
	 	        (location == null || location.trim().isEmpty()) &&
	 	        (sort == null || sort.trim().isEmpty());

	 	    if (isAllEmpty) {
	 	        dtos = dao.list();  // 전체 조회
	 	    } else {
	 		 	System.out.println("read");
	 	        dtos = dao.read(search, category, minPrice, maxPrice, location, sort);  // 조건 검색
	 	    }
	 	request.setAttribute("dtos", dtos);
	%>
    <!-- 모바일 오버레이 -->
    <div class="mobile-overlay" id="mobileOverlay" onclick="closeMobileFilter()"></div>
	<form action="sell.jsp" method="get">
    <div class="container">
        <div class="buy-page">
            <!-- 검색 및 필터 바 -->
            <div class="search-filter-bar">
                <div class="main-search">
                    <div class="search-input-wrapper">
	                        <span class="search-icon">🔍</span>
	                        <input type="text" class="search-input" name="search" value="<%= search != null ? search : "" %>" placeholder="상품명, 브랜드명 등을 검색해보세요" id="mainSearchInput">
                    </div>
                    <div class="filter-controls">
                        <select name="sort" class="sort-select" id="sortSelect">
						    <option value="latest" <%= "latest".equals(sort) ? "selected" : "" %>>최신순</option>
						    <option value="price-low" <%= "price-low".equals(sort) ? "selected" : "" %>>낮은 가격순</option>
						    <option value="price-high" <%= "price-high".equals(sort) ? "selected" : "" %>>높은 가격순</option>
						</select>
                        <button class="filter-btn" id="filterToggle" onclick="toggleMobileFilter()">
                            🔧 필터
                        </button>
                    </div>
                </div>
            </div>
            <div class="content-layout">
		                <!-- 사이드바 필터 -->
	                <div class="sidebar" id="filterSidebar">
	                <button type="submit" class="filter-btns">🔍 필터 적용</button>
	                    <div class="filter-section">
	                        <h3>카테고리</h3>
	                        <input type="hidden" name="category" id="selectedCategory" value="">
	                        <div class="category-list">
	                            <div class="category-item <%= (category == null || category.isEmpty()) ? "active" : "" %>" data-category="">전체</div>
								<div class="category-item <%= "전자기기".equals(category) ? "active" : "" %>" data-category="전자기기">전자기기</div>
								<div class="category-item <%= "의류".equals(category) ? "active" : "" %>" data-category="의류">의류</div>
								<div class="category-item <%= "가구".equals(category) ? "active" : "" %>" data-category="가구">가구/인테리어</div>
								<div class="category-item <%= "생활용품".equals(category) ? "active" : "" %>" data-category="생활용품">생활용품</div>
								<div class="category-item <%= "스포츠".equals(category) ? "active" : "" %>" data-category="스포츠">스포츠/레저</div>
								<div class="category-item <%= "도서".equals(category) ? "active" : "" %>" data-category="도서">도서/음반</div>
								<div class="category-item <%= "게임".equals(category) ? "active" : "" %>" data-category="게임">게임/취미</div>
								<div class="category-item <%= "반려동물".equals(category) ? "active" : "" %>" data-category="반려동물">반려동물용품</div>
	                        </div>
	                    </div>
	                    <div class="filter-section">
	                        <h3>가격대</h3>
	                        <div class="price-filter">
	                            <input type="number" name="minPrice" value="<%= minPrice != null ? minPrice : "" %>" placeholder="최소 가격" class="price-input" id="minPrice">
	                            <span>~</span>
	                            <input type="number" name="maxPrice" value="<%= maxPrice != null ? maxPrice : "" %>" placeholder="최대 가격" class="price-input" id="maxPrice">
	                        </div>
	                    </div>
	
	                    <div class="filter-section">
	                        <h3>지역</h3>
	                        <select name="location" class="location-select" id="locationSelect">
	                             <option value="" <%= location == null || location.equals("") ? "selected" : "" %>>지역 선택</option>
							    <option value="강남구" <%= "강남구".equals(location) ? "selected" : "" %>>강남구</option>
							    <option value="서초구" <%= "서초구".equals(location) ? "selected" : "" %>>서초구</option>
							    <option value="송파구" <%= "송파구".equals(location) ? "selected" : "" %>>송파구</option>
							    <option value="마포구" <%= "마포구".equals(location) ? "selected" : "" %>>마포구</option>
							    <option value="강동구" <%= "강동구".equals(location) ? "selected" : "" %>>강동구</option>
							    <option value="노원구" <%= "노원구".equals(location) ? "selected" : "" %>>노원구</option>
							    <option value="강서구" <%= "강서구".equals(location) ? "selected" : "" %>>강서구</option>
	                        </select>
	                    </div>
	                </div>
                <!-- 메인 콘텐츠 -->
                <div class="main-content">
                    <div class="results-info">
                        <span id="resultCount">총 6개의 상품</span>
                        <div id="activeFilters"></div>
                    </div>
                    
                    <div class="product-grid" id="">
						<c:forEach var="dto" items="${dtos}">
							<div class="product-card" onclick="goToProduct(${dto.postid})">
							    <div class="product-image">
							        <img src="../${dto.image }" alt="">
							        <button class="like-btn" onclick="toggleLike(event, this)">❤️</button>
							        <span class="status-badge reserved">${dto.sold }</span>
							    </div>
							    <div class="product-info">
							        <h3 class="product-title">${dto.title }</h3>
							        <p class="product-price">${dto.price }</p>
							        <div class="product-meta">
							            <span>📍 ${dto.location }</span>
							            <span>${dto.createdtime }</span>
							        </div>
							    </div>
							</div>
						</c:forEach>
                    </div>
                    <!-- 더보기 버튼 -->
                    <div class="load-more">
                        <button class="btn-outline" onclick="loadMoreProducts()">더 많은 상품 보기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>

    <!-- 플로팅 등록 버튼 -->
    <button class="floating-register-btn" onclick="openCreatePost()" title="구매 요청 등록">
        ✏️
    </button>

    <script>
	    document.querySelectorAll('.category-item').forEach(item => {
	        item.addEventListener('click', function () {
	            // 스타일 변경
	            document.querySelectorAll('.category-item').forEach(i => i.classList.remove('active'));
	            this.classList.add('active');
	
	            // 숨겨진 input에 값 설정
	            const category = this.getAttribute('data-category');
	            document.getElementById('selectedCategory').value = category;
	        });
	    });
        let filteredProducts = [...products];
        let currentFilters = {
            category: '',
            search: '',
            minPrice: '',
            maxPrice: '',
            location: '',
            priceRanges: []
        };

        // 페이지 로드 시 초기화
        document.addEventListener('DOMContentLoaded', function() {
            renderProducts();
            setupEventListeners();
        });

        // 구매 요청 등록 페이지 열기
        var userid = '<%= session.getAttribute("userid") != null ? session.getAttribute("userid") : "" %>';
	    function openCreatePost() {
	        if (userid !== "") {
	            window.location.href = 'sellmake.jsp';
	        } else {
		    	alert("로그인부터하세요.");
	            window.location.href = 'login.jsp';
	        }
	    }

        // 이벤트 리스너 설정
        function setupEventListeners() {
            // 카테고리 필터
            document.querySelectorAll('.category-item').forEach(item => {
                item.addEventListener('click', function() {
                    document.querySelectorAll('.category-item').forEach(i => i.classList.remove('active'));
                    this.classList.add('active');
                    currentFilters.category = this.dataset.category;
                    applyFilters();
                });
            });

            // 검색
            const searchInput = document.getElementById('mainSearchInput');
            if (searchInput) {
                searchInput.addEventListener('input', function() {
                    currentFilters.search = this.value;
                    applyFilters();
                });
            }

            // 가격 필터
            const minPrice = document.getElementById('minPrice');
            const maxPrice = document.getElementById('maxPrice');

            if (minPrice) {
                minPrice.addEventListener('input', function() {
                    currentFilters.minPrice = this.value;
                    applyFilters();
                });
            }

            if (maxPrice) {
                maxPrice.addEventListener('input', function() {
                    currentFilters.maxPrice = this.value;
                    applyFilters();
                });
            }

            // 가격대 체크박스
            document.querySelectorAll('input[data-range]').forEach(checkbox => {
                checkbox.addEventListener('change', function() {
                    if (this.checked) {
                        currentFilters.priceRanges.push(this.dataset.range);
                    } else {
                        currentFilters.priceRanges = currentFilters.priceRanges.filter(range => range !== this.dataset.range);
                    }
                    applyFilters();
                });
            });

            // 지역 필터
            const locationSelect = document.getElementById('locationSelect');
            if (locationSelect) {
                locationSelect.addEventListener('change', function() {
                    currentFilters.location = this.value;
                    applyFilters();
                });
            }

            // 정렬
            const sortSelect = document.getElementById('sortSelect');
            if (sortSelect) {
                sortSelect.addEventListener('change', function() {
                    sortProducts(this.value);
                });
            }
        }

        // 필터 적용
        function applyFilters() {
            filteredProducts = products.filter(product => {
                // 카테고리 필터
                if (currentFilters.category && product.category !== currentFilters.category) {
                    return false;
                }

                // 검색 필터
                if (currentFilters.search && !product.title.toLowerCase().includes(currentFilters.search.toLowerCase())) {
                    return false;
                }

                // 가격 필터
                if (currentFilters.minPrice && product.price < parseInt(currentFilters.minPrice)) {
                    return false;
                }
                if (currentFilters.maxPrice && product.price > parseInt(currentFilters.maxPrice)) {
                    return false;
                }

                // 가격대 필터
                if (currentFilters.priceRanges.length > 0) {
                    const inRange = currentFilters.priceRanges.some(range => {
                        const [min, max] = range.split('-').map(Number);
                        return product.price >= min && product.price <= max;
                    });
                    if (!inRange) return false;
                }

                // 지역 필터
                if (currentFilters.location && product.location !== currentFilters.location) {
                    return false;
                }

                return true;
            });

            renderProducts();
            updateResultCount();
            updateActiveFilters();
        }

        // 상품 정렬
        function sortProducts(sortType) {
            switch (sortType) {
                case 'price-low':
                    filteredProducts.sort((a, b) => a.price - b.price);
                    break;
                case 'price-high':
                    filteredProducts.sort((a, b) => b.price - a.price);
                    break;
                case 'popular':
                    filteredProducts.sort((a, b) => b.id - a.id);
                    break;
                default: // latest
                    filteredProducts.sort((a, b) => a.id - b.id);
            }
            renderProducts();
        }

        // 상품 렌더링
        function renderProducts() {
            const grid = document.getElementById('productGrid');
            
            if (!grid) return;

            if (filteredProducts.length === 0) {
                grid.innerHTML = `
                    <div class="empty-state">
                        <p>검색 결과가 없습니다.</p>
                        <button class="btn-primary" onclick="clearFilters()">전체 상품 보기</button>
                    </div>
                `;
                return;
            }

            grid.innerHTML = filteredProducts.map(product => `
                <div class="product-card" onclick="goToProduct(${product.id})">
                    <div class="product-image">
                        <img src="${product.image}" alt="${product.title}">
                        <button class="like-btn" onclick="toggleLike(event, this)">❤️</button>
                        <c:if test="${product.status != '판매중'}">
                        <c:choose>
                          <c:when test="${product.status == '예약중'}">
                            <span class="status-badge reserved">${product.status}</span>
                          </c:when>
                          <c:otherwise>
                            <span class="status-badge sold">${product.status}</span>
                          </c:otherwise>
                        </c:choose>
                      </c:if>
                    </div>
                    <div class="product-info">
                        <h3 class="product-title">${product.title}</h3>
                        <p class="product-price">${product.price.toLocaleString()}원</p>
                        <div class="product-meta">
                            <span>📍 ${product.location}</span>
                            <span>${product.timeAgo}</span>
                        </div>
                    </div>
                </div>
            `).join('');
        }

        // 결과 개수 업데이트
        function updateResultCount() {
            const resultCount = document.getElementById('resultCount');
            if (resultCount) {
                resultCount.textContent = `총 ${filteredProducts.length}개의 상품`;
            }
        }

        // 활성 필터 표시
        function updateActiveFilters() {
            const activeFiltersDiv = document.getElementById('activeFilters');
            if (!activeFiltersDiv) return;

            const filters = [];

            if (currentFilters.category) {
                filters.push(`<span class="filter-tag">${currentFilters.category}</span>`);
            }
            if (currentFilters.search) {
                filters.push(`<span class="filter-tag">"${currentFilters.search}"</span>`);
            }
            if (currentFilters.location) {
                filters.push(`<span class="filter-tag">${currentFilters.location}</span>`);
            }

            activeFiltersDiv.innerHTML = filters.join('');
        }

        // 필터 초기화
        function clearFilters() {
            currentFilters = {
                category: '',
                search: '',
                minPrice: '',
                maxPrice: '',
                location: '',
                priceRanges: []
            };

            // UI 초기화
            document.querySelectorAll('.category-item').forEach(item => item.classList.remove('active'));
            const firstCategory = document.querySelector('.category-item[data-category=""]');
            if (firstCategory) firstCategory.classList.add('active');

            const mainSearchInput = document.getElementById('mainSearchInput');
            if (mainSearchInput) mainSearchInput.value = '';

            const minPrice = document.getElementById('minPrice');
            if (minPrice) minPrice.value = '';

            const maxPrice = document.getElementById('maxPrice');
            if (maxPrice) maxPrice.value = '';

            const locationSelect = document.getElementById('locationSelect');
            if (locationSelect) locationSelect.value = '';

            document.querySelectorAll('input[data-range]').forEach(cb => cb.checked = false);

            filteredProducts = [...products];
            renderProducts();
            updateResultCount();
            updateActiveFilters();
        }

        // 좋아요 토글
        function toggleLike(event, button) {
            event.stopPropagation();
            button.classList.toggle('liked');
            
            // 애니메이션 효과
            button.style.transform = 'scale(1.2)';
            setTimeout(() => {
                button.style.transform = 'scale(1)';
            }, 150);
        }

        // 상품 상세 페이지로 이동
        function goToProduct(postid) {
	    	window.location.href = 'sellpost.jsp?postid=' + postid;
		}

        // 더 많은 상품 로드
        function loadMoreProducts() {
            alert('더 많은 상품을 로드합니다.');
        }

        // 모바일 필터 토글
        function toggleMobileFilter() {
            const sidebar = document.getElementById('filterSidebar');
            const overlay = document.getElementById('mobileOverlay');
            
            if (window.innerWidth <= 768) {
                if (sidebar) sidebar.classList.toggle('show');
                if (overlay) overlay.classList.toggle('show');
            }
        }

        // 모바일 필터 닫기
        function closeMobileFilter() {
            const sidebar = document.getElementById('filterSidebar');
            const overlay = document.getElementById('mobileOverlay');
            
            if (sidebar) sidebar.classList.remove('show');
            if (overlay) overlay.classList.remove('show');
        }

        // 네비게이션 함수들
        function goHome() {
            window.location.href = 'index.jsp';
        }

        function goToSell() {
            window.location.href = 'sell.jsp';
        }

        function goToCommunity() {
            window.location.href = 'community.jsp';
        }

        // 윈도우 리사이즈 처리
        window.addEventListener('resize', function() {
            if (window.innerWidth > 768) {
                closeMobileFilter();
            }
        });
    </script>
</body>
</html>