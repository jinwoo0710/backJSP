
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>커뮤니티 - 중고마켓</title>
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

        /* 커뮤니티 페이지 스타일 */
        .community-page {
            padding: 24px 0;
        }

        .page-header {
            margin-bottom: 32px;
        }

        .header-content-page {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .page-header h1 {
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 8px;
            color: #1f2937;
        }

        .page-header p {
            color: #6b7280;
            font-size: 16px;
        }

        .write-btn {
            background-color: #3b82f6;
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.2s;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .write-btn:hover {
            background-color: #2563eb;
        }

        .content-layout {
            display: grid;
            grid-template-columns: 250px 1fr;
            gap: 32px;
        }

        /* 사이드바 */
        .sidebar {
            display: flex;
            flex-direction: column;
            gap: 24px;
        }

        .sidebar-card {
            background: white;
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .sidebar-card h3 {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 16px;
            color: #1f2937;
        }

        .category-list {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .category-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
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

        .count {
            font-size: 12px;
            background-color: #e5e7eb;
            color: #6b7280;
            padding: 2px 6px;
            border-radius: 10px;
        }

        .tag-list {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
        }

        .tag {
            background-color: #f3f4f6;
            color: #374151;
            padding: 4px 8px;
            border-radius: 12px;
            font-size: 12px;
            cursor: pointer;
            transition: all 0.2s;
        }

        .tag:hover {
            background-color: #3b82f6;
            color: white;
        }

        .stats {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .stat-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .stat-label {
            font-size: 14px;
            color: #6b7280;
        }

        .stat-value {
            font-weight: 600;
            color: #1f2937;
        }

        /* 메인 콘텐츠 */
        .main-content {
            background: white;
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .search-section {
            display: flex;
            gap: 16px;
            margin-bottom: 24px;
        }

        .search-form {
            flex: 1;
            display: flex;
            gap: 8px;
        }

        .search-input {
            flex: 1;
            padding: 12px 16px;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            font-size: 16px;
        }

        .search-btn {
            background: #3b82f6;
            color: white;
            border: none;
            padding: 12px 16px;
            border-radius: 8px;
            cursor: pointer;
        }

        .sort-select {
            padding: 8px 12px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            background: white;
        }

        /* 탭 메뉴 */
        .tab-menu {
            display: flex;
            border-bottom: 1px solid #e5e7eb;
            margin-bottom: 24px;
        }

        .tab-btn {
            background: none;
            border: none;
            padding: 12px 24px;
            cursor: pointer;
            color: #6b7280;
            font-weight: 500;
            border-bottom: 2px solid transparent;
            transition: all 0.2s;
        }

        .tab-btn:hover,
        .tab-btn.active {
            color: #3b82f6;
            border-bottom-color: #3b82f6;
        }

        /* 게시글 목록 */
        .post-list {
            display: flex;
            flex-direction: column;
            gap: 16px;
            margin-bottom: 32px;
        }

        .post-card {
            border: 1px solid #e5e7eb;
            border-radius: 12px;
            padding: 20px;
            transition: all 0.2s;
            cursor: pointer;
        }

        .post-card:hover {
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            transform: translateY(-1px);
        }

        .post-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 12px;
        }

        .category-badge {
            background-color: #e5e7eb;
            color: #374151;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 500;
        }

        .post-time {
            font-size: 12px;
            color: #9ca3af;
        }

        .post-title {
            margin-bottom: 12px;
        }

        .post-title h3 {
            font-size: 18px;
            font-weight: 600;
            color: #1f2937;
            transition: color 0.2s;
        }

        .post-card:hover .post-title h3 {
            color: #3b82f6;
        }

        .post-content {
            color: #6b7280;
            font-size: 14px;
            line-height: 1.6;
            margin-bottom: 16px;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .post-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .author-info {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .author-avatar {
            width: 24px;
            height: 24px;
            border-radius: 50%;
            background-color: #f3f4f6;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
        }

        .author-name {
            font-size: 14px;
            color: #6b7280;
        }

        .post-stats {
            display: flex;
            gap: 12px;
        }

        .stat {
            font-size: 12px;
            color: #9ca3af;
            display: flex;
            align-items: center;
            gap: 4px;
        }

        /* 빈 상태 */
        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #6b7280;
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

        /* 더보기 */
        .load-more {
            text-align: center;
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

            .content-layout {
                grid-template-columns: 1fr;
            }

            .sidebar {
                order: 2;
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                gap: 16px;
            }

            .header-content-page {
                flex-direction: column;
                align-items: flex-start;
                gap: 16px;
            }

            .search-section {
                flex-direction: column;
            }

            .tab-menu {
                overflow-x: auto;
                white-space: nowrap;
            }

            .tab-btn {
                flex-shrink: 0;
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
                    <a href="index.jsp">
                        <span class="logo-icon">JUPJUP</span>
                        <span class="logo-text">마켓</span>
                    </a>
                </div>
                
                <!-- 네비게이션 -->
                <nav class="nav">
                    <a href="buy.jsp">구매하기</a>
                    <a href="sell.jsp">판매하기</a>
                    <a href="community.jsp" class="active">커뮤니티</a>
                </nav>
                
                <!-- 검색 및 사용자 메뉴 -->
                <div class="header-actions">
                    <div class="search-box">
                        <form>
                            <input type="text" name="search" placeholder="상품을 검색해보세요...">
                            <button type="submit">🔍</button>
                        </form>
                    </div>
                    <div class="user-menu">
                        <a href="like.jsp" class="icon-btn">❤️</a>
                        <a href="chat.jsp" class="icon-btn">💬</a>
                        <a href="mypage.jsp" class="icon-btn">👤</a>
                    </div>
                </div>
            </div>
        </div>
    </header>
    
    <div class="container">
        <div class="community-page">
            <!-- 페이지 헤더 -->
            <div class="page-header">
                <div class="header-content-page">
                    <div>
                        <h1>커뮤니티</h1>
                        <p>중고거래 정보를 공유하고 소통해보세요</p>
                    </div>
                    <button class="write-btn" onclick="writePost()">✏️ 글쓰기</button>
                </div>
            </div>
            
            <div class="content-layout">
                <!-- 사이드바 -->
                <div class="sidebar">
                    <!-- 카테고리 -->
                    <div class="sidebar-card">
                        <h3>카테고리</h3>
                        <div class="category-list">
                            <div class="category-item active" data-category="all">
                                <span>전체</span>
                                <span class="count">1,234</span>
                            </div>
                            <div class="category-item" data-category="후기">
                                <span>후기</span>
                                <span class="count">456</span>
                            </div>
                            <div class="category-item" data-category="정보">
                                <span>정보</span>
                                <span class="count">789</span>
                            </div>
                            <div class="category-item" data-category="질문">
                                <span>질문</span>
                                <span class="count">234</span>
                            </div>
                            <div class="category-item" data-category="주의사항">
                                <span>주의사항</span>
                                <span class="count">123</span>
                            </div>
                            <div class="category-item" data-category="자유">
                                <span>자유</span>
                                <span class="count">567</span>
                            </div>
                        </div>
                    </div>
                    
                    <!-- 인기 태그 -->
                    <div class="sidebar-card">
                        <h3>🔥 인기 태그</h3>
                        <div class="tag-list">
                            <span class="tag">#아이폰</span>
                            <span class="tag">#맥북</span>
                            <span class="tag">#갤럭시</span>
                            <span class="tag">#에어팟</span>
                            <span class="tag">#닌텐도</span>
                            <span class="tag">#플스5</span>
                            <span class="tag">#아이패드</span>
                            <span class="tag">#애플워치</span>
                        </div>
                    </div>
                    
                    <!-- 커뮤니티 현황 -->
                    <div class="sidebar-card">
                        <h3>커뮤니티 현황</h3>
                        <div class="stats">
                            <div class="stat-item">
                                <span class="stat-label">👥 전체 회원</span>
                                <span class="stat-value">12,345명</span>
                            </div>
                            <div class="stat-item">
                                <span class="stat-label">💬 오늘 게시글</span>
                                <span class="stat-value">89개</span>
                            </div>
                            <div class="stat-item">
                                <span class="stat-label">📈 이번 주 활동</span>
                                <span class="stat-value">567개</span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- 메인 콘텐츠 -->
                <div class="main-content">
                    <!-- 검색 및 필터 -->
                    <div class="search-section">
                        <div class="search-form">
                            <input type="text" placeholder="게시글을 검색해보세요" class="search-input" id="searchInput">
                            <button type="button" class="search-btn" onclick="searchPosts()">🔍</button>
                        </div>
                        
                        <select class="sort-select" id="sortSelect" onchange="sortPosts()">
                            <option value="latest">최신순</option>
                            <option value="popular">인기순</option>
                            <option value="comments">댓글순</option>
                            <option value="views">조회순</option>
                        </select>
                    </div>
                    
                    <!-- 탭 메뉴 -->
                    <div class="tab-menu">
                        <button class="tab-btn active" data-tab="all" onclick="switchTab('all')">전체</button>
                        <button class="tab-btn" data-tab="hot" onclick="switchTab('hot')">인기글</button>
                        <button class="tab-btn" data-tab="notice" onclick="switchTab('notice')">공지사항</button>
                        <button class="tab-btn" data-tab="event" onclick="switchTab('event')">이벤트</button>
                    </div>
                    
                    <!-- 게시글 목록 -->
                    <div class="post-list" id="postList">
                        <!-- 게시글들이 여기에 동적으로 생성됩니다 -->
                    </div>
                    
                    <!-- 더보기 -->
                    <div class="load-more">
                        <button class="btn-outline" onclick="loadMorePosts()">더 많은 게시글 보기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script>
        // 샘플 게시글 데이터
        const posts = [
            {
                id: 1,
                title: "아이폰 14 Pro 구매 후기 - 정말 만족스러워요!",
                content: "중고마켓에서 아이폰 14 Pro를 구매했는데 정말 상태가 좋네요. 판매자분도 친절하시고 빠른 거래였습니다. 다음에도 이용할 예정이에요.",
                author: "김철수",
                category: "후기",
                timeAgo: "2시간 전",
                likes: 24,
                comments: 8,
                views: 156,
                isHot: true
            },
            {
                id: 2,
                title: "중고 노트북 구매 시 체크포인트 공유합니다",
                content: "중고 노트북을 여러 번 사고팔면서 얻은 노하우를 공유해드려요. 배터리 상태, 키보드 상태, 화면 상태 등 꼼꼼히 확인해야 할 부분들이 있어요.",
                author: "테크러버",
                category: "정보",
                timeAgo: "4시간 전",
                likes: 45,
                comments: 12,
                views: 289,
                isHot: true
            },
            {
                id: 3,
                title: "사기 당할 뻔한 경험담 - 주의하세요!",
                content: "최근에 중고거래에서 사기를 당할 뻔한 경험이 있어서 공유합니다. 이런 패턴의 사기꾼들을 조심하세요.",
                author: "안전거래",
                category: "주의사항",
                timeAgo: "6시간 전",
                likes: 67,
                comments: 23,
                views: 445,
                isHot: true
            },
            {
                id: 4,
                title: "강남역 근처 직거래 장소 추천해주세요",
                content: "강남역 근처에서 안전하게 직거래할 수 있는 장소를 찾고 있어요. 추천해주실 곳이 있나요?",
                author: "거래초보",
                category: "질문",
                timeAgo: "8시간 전",
                likes: 12,
                comments: 15,
                views: 98,
                isHot: false
            },
            {
                id: 5,
                title: "중고마켓 이용 꿀팁 모음집",
                content: "중고마켓을 1년 넘게 이용하면서 터득한 꿀팁들을 정리해봤어요. 초보자분들에게 도움이 되길 바랍니다.",
                author: "거래고수",
                category: "정보",
                timeAgo: "1일 전",
                likes: 89,
                comments: 34,
                views: 567,
                isHot: true
            },
            {
                id: 6,
                title: "애플워치 시리즈 8 vs 시리즈 9 비교",
                content: "애플워치 구매를 고민 중인데 시리즈 8과 9 중 어떤 걸 사는 게 좋을까요? 가격 차이만큼 성능 차이가 있나요?",
                author: "워치고민",
                category: "질문",
                timeAgo: "1일 전",
                likes: 18,
                comments: 27,
                views: 234,
                isHot: false
            }
        ];

        let filteredPosts = [...posts];
        let currentTab = 'all';
        let currentCategory = 'all';

        // 페이지 로드 시 초기화
        document.addEventListener('DOMContentLoaded', function() {
            renderPosts();
            setupEventListeners();
        });

        // 이벤트 리스너 설정
        function setupEventListeners() {
            // 카테고리 클릭
            document.querySelectorAll('.category-item').forEach(item => {
                item.addEventListener('click', function() {
                    document.querySelectorAll('.category-item').forEach(i => i.classList.remove('active'));
                    this.classList.add('active');
                    currentCategory = this.dataset.category;
                    filterPosts();
                });
            });

            // 태그 클릭
            document.querySelectorAll('.tag').forEach(tag => {
                tag.addEventListener('click', function() {
                    const tagText = this.textContent.replace('#', '');
                    document.getElementById('searchInput').value = tagText;
                    searchPosts();
                });
            });
        }

        // 게시글 렌더링
        function renderPosts() {
            const postList = document.getElementById('postList');
            
            if (filteredPosts.length === 0) {
                postList.innerHTML = `
                    <div class="empty-state">
                        <p>게시글이 없습니다.</p>
                        <button class="btn-primary" onclick="writePost()">첫 번째 글을 작성해보세요</button>
                    </div>
                `;
                return;
            }

            postList.innerHTML = filteredPosts.map(post => `
                <div class="post-card" onclick="goToPost(${post.id})">
                    <div class="post-header">
                        <span class="category-badge">${post.category}</span>
                        <span class="post-time">${post.timeAgo}</span>
                    </div>
                    <div class="post-title">
                        <h3>${post.title}</h3>
                    </div>
                    <p class="post-content">${post.content}</p>
                    <div class="post-footer">
                        <div class="author-info">
                            <span class="author-avatar">👤</span>
                            <span class="author-name">${post.author}</span>
                        </div>
                        <div class="post-stats">
                            <span class="stat">👁️ ${post.views}</span>
                            <span class="stat">❤️ ${post.likes}</span>
                            <span class="stat">💬 ${post.comments}</span>
                        </div>
                    </div>
                </div>
            `).join('');
        }

        // 탭 전환
        function switchTab(tab) {
            document.querySelectorAll('.tab-btn').forEach(btn => btn.classList.remove('active'));
            document.querySelector(`[data-tab="${tab}"]`).classList.add('active');
            
            currentTab = tab;
            filterPosts();
        }

        // 게시글 필터링
        function filterPosts() {
            filteredPosts = posts.filter(post => {
                // 카테고리 필터
                if (currentCategory !== 'all' && post.category !== currentCategory) {
                    return false;
                }

                // 탭 필터
                if (currentTab === 'hot' && !post.isHot) {
                    return false;
                }
                if (currentTab === 'notice') {
                    return false; // 공지사항 없음
                }
                if (currentTab === 'event') {
                    return false; // 이벤트 없음
                }

                return true;
            });

            renderPosts();
        }

        // 게시글 검색
        function searchPosts() {
            const searchTerm = document.getElementById('searchInput').value.toLowerCase();
            
            if (!searchTerm) {
                filterPosts();
                return;
            }

            filteredPosts = posts.filter(post => {
                const matchesSearch = post.title.toLowerCase().includes(searchTerm) ||
                                    post.content.toLowerCase().includes(searchTerm);
                
                // 카테고리 필터도 적용
                const matchesCategory = currentCategory === 'all' || post.category === currentCategory;
                
                // 탭 필터도 적용
                let matchesTab = true;
                if (currentTab === 'hot' && !post.isHot) {
                    matchesTab = false;
                }
                if (currentTab === 'notice' || currentTab === 'event') {
                    matchesTab = false;
                }

                return matchesSearch && matchesCategory && matchesTab;
            });

            renderPosts();
        }

        // 게시글 정렬
        function sortPosts() {
            const sortType = document.getElementById('sortSelect').value;
            
            switch (sortType) {
                case 'popular':
                    filteredPosts.sort((a, b) => b.likes - a.likes);
                    break;
                case 'comments':
                    filteredPosts.sort((a, b) => b.comments - a.comments);
                    break;
                case 'views':
                    filteredPosts.sort((a, b) => b.views - a.views);
                    break;
                default: // latest
                    filteredPosts.sort((a, b) => a.id - b.id);
            }
            
            renderPosts();
        }

        // 게시글 상세 페이지로 이동
        function goToPost(id) {
            window.location.href = `commupost.jsp?id=${id}`;
        }

        // 글쓰기
        function writePost() {
            window.location.href = 'write.html';
        }

        // 더 많은 게시글 로드
        function loadMorePosts() {
            alert('더 많은 게시글을 로드합니다.');
        }

        // 검색 입력 시 실시간 검색
        document.getElementById('searchInput').addEventListener('input', function() {
            const searchTerm = this.value.toLowerCase();
            
            if (searchTerm.length === 0) {
                filterPosts();
            } else if (searchTerm.length >= 2) {
                searchPosts();
            }
        });
    </script>
</body>
</html>
