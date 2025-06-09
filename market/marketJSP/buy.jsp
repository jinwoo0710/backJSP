<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            padding: 8px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.2s;
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
            box-shadow: 0 6px 20px rgba(59, 130, 246, 0.4);
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
                    <a href="#" class="active">구매하기</a>
                    <a href="#" onclick="goToSell()">판매하기</a>
                    <a href="#" onclick="goToCommunity()">커뮤니티</a>
                </nav>
                
                <!-- 검색 및 사용자 메뉴 -->
                <div class="header-actions">
                    <div class="search-box">
                        <form onsubmit="return false;">
                            <input type="text" name="search" placeholder="상품을 검색해보세요...">
                            <button type="submit">🔍</button>
                        </form>
                    </div>
                    
                    <!-- 등록 버튼 추가 -->
                    <button class="register-btn" onclick="openCreatePost()">
                        ✏️ 글 등록
                    </button>
                    
                    <div class="user-menu">
                        <a href="like.jsp" class="icon-btn">❤️</a>
                        <a href="chat.jsp" class="icon-btn">💬</a>
                        <a href="mypage.jsp" class="icon-btn">👤</a>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- 모바일 오버레이 -->
    <div class="mobile-overlay" id="mobileOverlay" onclick="closeMobileFilter()"></div>

    <div class="container">
        <div class="buy-page">
            <!-- 검색 및 필터 바 -->
            <div class="search-filter-bar">
                <div class="main-search">
                    <div class="search-input-wrapper">
                        <span class="search-icon">🔍</span>
                        <input type="text" class="search-input" placeholder="상품명, 브랜드명 등을 검색해보세요" id="mainSearchInput">
                    </div>
                    <div class="filter-controls">
                        <select class="sort-select" id="sortSelect">
                            <option value="latest">최신순</option>
                            <option value="price-low">낮은 가격순</option>
                            <option value="price-high">높은 가격순</option>
                            <option value="popular">인기순</option>
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
                    <div class="filter-section">
                        <h3>카테고리</h3>
                        <div class="category-list">
                            <div class="category-item active" data-category="">전체</div>
                            <div class="category-item" data-category="전자기기">전자기기</div>
                            <div class="category-item" data-category="의류">의류</div>
                            <div class="category-item" data-category="가구">가구/인테리어</div>
                            <div class="category-item" data-category="생활용품">생활용품</div>
                            <div class="category-item" data-category="스포츠">스포츠/레저</div>
                            <div class="category-item" data-category="도서">도서/음반</div>
                            <div class="category-item" data-category="게임">게임/취미</div>
                            <div class="category-item" data-category="반려동물">반려동물용품</div>
                        </div>
                    </div>

                    <div class="filter-section">
                        <h3>가격대</h3>
                        <div class="price-filter">
                            <input type="number" placeholder="최소 가격" class="price-input" id="minPrice">
                            <span>~</span>
                            <input type="number" placeholder="최대 가격" class="price-input" id="maxPrice">
                        </div>
                        <div class="price-ranges">
                            <label class="checkbox-item">
                                <input type="checkbox" data-range="0-100000"> 10만원 이하
                            </label>
                            <label class="checkbox-item">
                                <input type="checkbox" data-range="100000-500000"> 10-50만원
                            </label>
                            <label class="checkbox-item">
                                <input type="checkbox" data-range="500000-1000000"> 50-100만원
                            </label>
                            <label class="checkbox-item">
                                <input type="checkbox" data-range="1000000-999999999"> 100만원 이상
                            </label>
                        </div>
                    </div>

                    <div class="filter-section">
                        <h3>지역</h3>
                        <select class="location-select" id="locationSelect">
                            <option value="">지역 선택</option>
                            <option value="강남구">강남구</option>
                            <option value="서초구">서초구</option>
                            <option value="송파구">송파구</option>
                            <option value="마포구">마포구</option>
                            <option value="강동구">강동구</option>
                            <option value="노원구">노원구</option>
                            <option value="강서구">강서구</option>
                        </select>
                    </div>
                </div>

                <!-- 메인 콘텐츠 -->
                <div class="main-content">
                    <div class="results-info">
                        <span id="resultCount">총 6개의 상품</span>
                        <div id="activeFilters"></div>
                    </div>

                    <div class="product-grid" id="productGrid">
                        <!-- 상품 카드들이 여기에 동적으로 생성됩니다 -->
                    </div>

                    <!-- 더보기 버튼 -->
                    <div class="load-more">
                        <button class="btn-outline" onclick="loadMoreProducts()">더 많은 상품 보기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 플로팅 등록 버튼 -->
    <button class="floating-register-btn" onclick="openCreatePost()" title="구매 요청 등록">
        ✏️
    </button>

    <script>
        // 샘플 상품 데이터
        const products = [
            {
                id: 1,
                title: "아이폰 14 Pro 128GB 딥퍼플 (배터리 100%) 삽니다",
                price: 850000,
                location: "강남구",
                timeAgo: "2시간 전",
                image: "https://via.placeholder.com/300x200/f3f4f6/9ca3af?text=아이폰+14+Pro",
                category: "전자기기",
                status: "판매중"
            },
            {
                id: 2,
                title: "맥북 에어 M2 13인치 실버 (2022년형) 삽니다",
                price: 1200000,
                location: "서초구",
                timeAgo: "5시간 전",
                image: "https://via.placeholder.com/300x200/f3f4f6/9ca3af?text=맥북+에어",
                category: "전자기기",
                status: "예약중"
            },
            {
                id: 3,
                title: "에어팟 프로 2세대 새상품 미개봉 삽니다",
                price: 280000,
                location: "송파구",
                timeAgo: "1일 전",
                image: "https://via.placeholder.com/300x200/f3f4f6/9ca3af?text=에어팟+프로",
                category: "전자기기",
                status: "판매중"
            },
            {
                id: 4,
                title: "닌텐도 스위치 OLED 화이트 + 게임 5개 삽니다",
                price: 350000,
                location: "마포구",
                timeAgo: "2일 전",
                image: "https://via.placeholder.com/300x200/f3f4f6/9ca3af?text=닌텐도+스위치",
                category: "게임",
                status: "판매중"
            },
            {
                id: 5,
                title: "갤럭시 S23 Ultra 256GB 팬텀블랙 삽니다",
                price: 750000,
                location: "강서구",
                timeAgo: "3일 전",
                image: "https://via.placeholder.com/300x200/f3f4f6/9ca3af?text=갤럭시+S23",
                category: "전자기기",
                status: "판매중"
            },
            {
                id: 6,
                title: "아이패드 프로 11인치 3세대 128GB WiFi 삽니다",
                price: 650000,
                location: "노원구",
                timeAgo: "4일 전",
                image: "https://via.placeholder.com/300x200/f3f4f6/9ca3af?text=아이패드+프로",
                category: "전자기기",
                status: "판매완료"
            }
        ];

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
        function openCreatePost() {
            alert('구매 요청 등록 페이지로 이동합니다.');
            // 실제로는 구매 요청 작성 페이지로 이동
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
                        <c:choose>
                        <c:when test="${product.status == '예약중'}">
                            <span class="status-badge reserved">${product.status}</span>
                        </c:when>
                        <c:when test="${product.status == '판매완료'}">
                            <span class="status-badge sold">${product.status}</span>
                        </c:when>
                    </c:choose>
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
        function goToProduct(id) {
            window.location.href = 'buypost.jsp';
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
