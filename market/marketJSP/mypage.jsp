<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지 - 중고마켓</title>
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

        /* 마이페이지 컨테이너 */
        .mypage-container {
            padding: 24px 0;
        }

        /* 프로필 헤더 */
        .profile-header {
            background: white;
            border-radius: 12px;
            padding: 24px;
            margin-bottom: 24px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .profile-info {
            display: flex;
            align-items: center;
            gap: 24px;
            margin-bottom: 24px;
        }

        .profile-image {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            overflow: hidden;
            background-color: #f3f4f6;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
        }

        .profile-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .profile-image .placeholder {
            font-size: 40px;
            color: #9ca3af;
        }

        .profile-details {
            flex: 1;
        }

        .profile-name {
            font-size: 24px;
            font-weight: 700;
            color: #1f2937;
            margin-bottom: 8px;
        }

        .profile-email {
            font-size: 14px;
            color: #6b7280;
            margin-bottom: 12px;
        }

        .profile-stats {
            display: flex;
            gap: 24px;
        }

        .stat-item {
            text-align: center;
        }

        .stat-number {
            font-size: 20px;
            font-weight: 700;
            color: #3b82f6;
            display: block;
        }

        .stat-label {
            font-size: 12px;
            color: #6b7280;
            margin-top: 4px;
        }

        .profile-actions {
            display: flex;
            gap: 12px;
        }

        /* 메인 콘텐츠 */
        .main-content {
            display: grid;
            grid-template-columns: 1fr 300px;
            gap: 24px;
        }

        .content-section {
            background: white;
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .section-title {
            font-size: 18px;
            font-weight: 600;
            color: #1f2937;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        /* 탭 메뉴 */
        .tab-menu {
            display: flex;
            border-bottom: 1px solid #e5e7eb;
            margin-bottom: 20px;
        }

        .tab-button {
            padding: 12px 16px;
            background: none;
            border: none;
            font-size: 14px;
            font-weight: 500;
            color: #6b7280;
            cursor: pointer;
            border-bottom: 2px solid transparent;
            transition: all 0.2s;
        }

        .tab-button.active {
            color: #3b82f6;
            border-bottom-color: #3b82f6;
        }

        .tab-button:hover {
            color: #3b82f6;
        }

        .tab-content {
            display: none;
        }

        .tab-content.active {
            display: block;
        }

        /* 상품 카드 */
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 16px;
        }

        .product-card {
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            overflow: hidden;
            transition: all 0.2s;
            cursor: pointer;
        }

        .product-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .product-image {
            width: 100%;
            height: 120px;
            background-color: #f3f4f6;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
        }

        .product-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .product-status {
            position: absolute;
            top: 8px;
            left: 8px;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 10px;
            font-weight: 600;
            color: white;
        }

        .status-selling {
            background-color: #10b981;
        }

        .status-sold {
            background-color: #ef4444;
        }

        .status-reserved {
            background-color: #f59e0b;
        }

        .product-info {
            padding: 12px;
        }

        .product-title {
            font-size: 14px;
            font-weight: 500;
            color: #1f2937;
            margin-bottom: 4px;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .product-price {
            font-size: 16px;
            font-weight: 700;
            color: #3b82f6;
            margin-bottom: 4px;
        }

        .product-meta {
            font-size: 12px;
            color: #6b7280;
        }

        /* 게시글 리스트 */
        .post-list {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .post-item {
            padding: 16px;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            transition: all 0.2s;
            cursor: pointer;
        }

        .post-item:hover {
            background-color: #f9fafb;
        }

        .post-title {
            font-size: 14px;
            font-weight: 500;
            color: #1f2937;
            margin-bottom: 8px;
        }

        .post-meta {
            display: flex;
            justify-content: space-between;
            font-size: 12px;
            color: #6b7280;
        }

        /* 사이드바 */
        .sidebar {
            display: flex;
            flex-direction: column;
            gap: 24px;
        }

        .quick-actions {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .action-btn {
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 12px;
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            font-size: 14px;
            color: #4b5563;
            text-decoration: none;
            transition: all 0.2s;
            cursor: pointer;
        }

        .action-btn:hover {
            background-color: #f9fafb;
            border-color: #3b82f6;
            color: #3b82f6;
        }

        /* 최근 활동 */
        .activity-list {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .activity-item {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 12px 0;
            border-bottom: 1px solid #f3f4f6;
        }

        .activity-item:last-child {
            border-bottom: none;
        }

        .activity-icon {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background-color: #f3f4f6;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
        }

        .activity-content {
            flex: 1;
        }

        .activity-text {
            font-size: 14px;
            color: #4b5563;
            margin-bottom: 2px;
        }

        .activity-time {
            font-size: 12px;
            color: #9ca3af;
        }

        /* 버튼 */
        .btn {
            padding: 8px 16px;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            border: none;
            transition: all 0.2s;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 4px;
        }

        .btn-primary {
            background-color: #3b82f6;
            color: white;
        }

        .btn-primary:hover {
            background-color: #2563eb;
        }

        .btn-secondary {
            background-color: white;
            color: #6b7280;
            border: 1px solid #d1d5db;
        }

        .btn-secondary:hover {
            background-color: #f9fafb;
        }

        .btn-outline {
            background-color: transparent;
            color: #3b82f6;
            border: 1px solid #3b82f6;
        }

        .btn-outline:hover {
            background-color: #f0f9ff;
        }

        /* 빈 상태 */
        .empty-state {
            text-align: center;
            padding: 40px 20px;
            color: #6b7280;
        }

        .empty-state .icon {
            font-size: 48px;
            margin-bottom: 16px;
            opacity: 0.5;
        }

        .empty-state .title {
            font-size: 16px;
            font-weight: 500;
            margin-bottom: 8px;
        }

        .empty-state .description {
            font-size: 14px;
        }

        /* 반응형 */
        @media (max-width: 768px) {
            .main-content {
                grid-template-columns: 1fr;
            }

            .profile-info {
                flex-direction: column;
                text-align: center;
                gap: 16px;
            }

            .profile-stats {
                justify-content: center;
            }

            .profile-actions {
                justify-content: center;
            }

            .product-grid {
                grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
            }

            .tab-menu {
                overflow-x: auto;
                white-space: nowrap;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="mypage-container">
            <!-- 프로필 헤더 -->
            <div class="profile-header">
                <div class="profile-info">
                    <div class="profile-image">
                        <img src="/placeholder.svg?height=100&width=100" alt="프로필 이미지" id="profileImg">
                    </div>
                    <div class="profile-details">
                        <h1 class="profile-name">공민승</h1>
                        <p class="profile-email">user@example.com</p>
                        <div class="profile-stats">
                            <div class="stat-item">
                                <span class="stat-number">15</span>
                                <div class="stat-label">판매 상품</div>
                            </div>
                            <div class="stat-item">
                                <span class="stat-number">8</span>
                                <div class="stat-label">구매 완료</div>
                            </div>
                            <div class="stat-item">
                                <span class="stat-number">4.8</span>
                                <div class="stat-label">평점</div>
                            </div>
                            <div class="stat-item">
                                <span class="stat-number">23</span>
                                <div class="stat-label">찜한 상품</div>
                            </div>
                        </div>
                    </div>
                    <div class="profile-actions">
                        <button class="btn btn-primary" onclick="editProfile()">프로필 수정</button>
                        <button class="btn btn-secondary" onclick="logout()">로그아웃</button>
                    </div>
                </div>
            </div>

            <div class="main-content">
                <!-- 메인 콘텐츠 -->
                <div class="content-section">
                    <h2 class="section-title">📦 나의 거래</h2>
                    
                    <!-- 탭 메뉴 -->
                    <div class="tab-menu">
                        <button class="tab-button active" onclick="showTab('selling')">판매 중 (3)</button>
                        <button class="tab-button" onclick="showTab('sold')">판매 완료 (12)</button>
                        <button class="tab-button" onclick="showTab('buying')">구매 내역 (8)</button>
                        <button class="tab-button" onclick="showTab('wishlist')">찜한 상품 (23)</button>
                        <button class="tab-button" onclick="showTab('posts')">작성 글 (5)</button>
                    </div>

                    <!-- 판매 중 탭 -->
                    <div class="tab-content active" id="selling">
                        <div class="product-grid">
                            <div class="product-card" onclick="viewProduct(1)">
                                <div class="product-image">
                                    <img src="/placeholder.svg?height=120&width=200" alt="아이폰 14 Pro">
                                    <div class="product-status status-selling">판매중</div>
                                </div>
                                <div class="product-info">
                                    <div class="product-title">아이폰 14 Pro 128GB 딥퍼플</div>
                                    <div class="product-price">850,000원</div>
                                    <div class="product-meta">조회 247 · 찜 23 · 2시간 전</div>
                                </div>
                            </div>
                            
                            <div class="product-card" onclick="viewProduct(2)">
                                <div class="product-image">
                                    <img src="/placeholder.svg?height=120&width=200" alt="맥북 프로">
                                    <div class="product-status status-selling">판매중</div>
                                </div>
                                <div class="product-info">
                                    <div class="product-title">맥북 프로 13인치 M2 칩</div>
                                    <div class="product-price">1,200,000원</div>
                                    <div class="product-meta">조회 156 · 찜 8 · 1일 전</div>
                                </div>
                            </div>
                            
                            <div class="product-card" onclick="viewProduct(3)">
                                <div class="product-image">
                                    <img src="/placeholder.svg?height=120&width=200" alt="에어팟 프로">
                                    <div class="product-status status-selling">판매중</div>
                                </div>
                                <div class="product-info">
                                    <div class="product-title">에어팟 프로 2세대</div>
                                    <div class="product-price">180,000원</div>
                                    <div class="product-meta">조회 89 · 찜 12 · 3일 전</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 판매 완료 탭 -->
                    <div class="tab-content" id="sold">
                        <div class="product-grid">
                            <div class="product-card">
                                <div class="product-image">
                                    <img src="/placeholder.svg?height=120&width=200" alt="갤럭시 S23">
                                    <div class="product-status status-sold">판매완료</div>
                                </div>
                                <div class="product-info">
                                    <div class="product-title">갤럭시 S23 Ultra 256GB</div>
                                    <div class="product-price">950,000원</div>
                                    <div class="product-meta">1주일 전 판매완료</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 구매 내역 탭 -->
                    <div class="tab-content" id="buying">
                        <div class="product-grid">
                            <div class="product-card">
                                <div class="product-image">
                                    <img src="/placeholder.svg?height=120&width=200" alt="아이패드">
                                </div>
                                <div class="product-info">
                                    <div class="product-title">아이패드 에어 5세대 64GB</div>
                                    <div class="product-price">450,000원</div>
                                    <div class="product-meta">2주일 전 구매완료</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 찜한 상품 탭 -->
                    <div class="tab-content" id="wishlist">
                        <div class="product-grid">
                            <div class="product-card">
                                <div class="product-image">
                                    <img src="/placeholder.svg?height=120&width=200" alt="닌텐도 스위치">
                                </div>
                                <div class="product-info">
                                    <div class="product-title">닌텐도 스위치 OLED 화이트</div>
                                    <div class="product-price">280,000원</div>
                                    <div class="product-meta">강남구 · 1시간 전</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 작성 글 탭 -->
                    <div class="tab-content" id="posts">
                        <div class="post-list">
                            <div class="post-item" onclick="viewPost(1)">
                                <div class="post-title">[후기] 아이폰 14 Pro 사용 후기</div>
                                <div class="post-meta">
                                    <span>댓글 12 · 좋아요 25</span>
                                    <span>3일 전</span>
                                </div>
                            </div>
                            
                            <div class="post-item" onclick="viewPost(2)">
                                <div class="post-title">[질문] 중고 맥북 구매 시 주의사항</div>
                                <div class="post-meta">
                                    <span>댓글 8 · 좋아요 15</span>
                                    <span>1주일 전</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 사이드바 -->
                <div class="sidebar">
                    <!-- 빠른 액션 -->
                   

                    <!-- 최근 활동 -->
                    <div class="content-section">
                        <h3 class="section-title">📈 최근 활동</h3>
                        <div class="activity-list">
                            <div class="activity-item">
                                <div class="activity-icon">💬</div>
                                <div class="activity-content">
                                    <div class="activity-text">새로운 채팅 메시지</div>
                                    <div class="activity-time">10분 전</div>
                                </div>
                            </div>
                            
                            <div class="activity-item">
                                <div class="activity-icon">❤️</div>
                                <div class="activity-content">
                                    <div class="activity-text">상품이 찜 목록에 추가됨</div>
                                    <div class="activity-time">1시간 전</div>
                                </div>
                            </div>
                            
                            <div class="activity-item">
                                <div class="activity-icon">👁️</div>
                                <div class="activity-content">
                                    <div class="activity-text">상품 조회수 +15</div>
                                    <div class="activity-time">2시간 전</div>
                                </div>
                            </div>
                            
                            <div class="activity-item">
                                <div class="activity-icon">💰</div>
                                <div class="activity-content">
                                    <div class="activity-text">가격 제안 받음</div>
                                    <div class="activity-time">3시간 전</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // 탭 전환 기능
        function showTab(tabName) {
            // 모든 탭 버튼 비활성화
            document.querySelectorAll('.tab-button').forEach(btn => {
                btn.classList.remove('active');
            });
            
            // 모든 탭 콘텐츠 숨기기
            document.querySelectorAll('.tab-content').forEach(content => {
                content.classList.remove('active');
            });
            
            // 선택된 탭 활성화
            event.target.classList.add('active');
            document.getElementById(tabName).classList.add('active');
        }
        
        // 상품 보기
        function viewProduct(id) {
            alert(`상품 ${id}번의 상세 페이지로 이동합니다.`);
        }
        
        // 게시글 보기
        function viewPost(id) {
            alert(`게시글 ${id}번의 상세 페이지로 이동합니다.`);
        }
        
        // 프로필 수정
        function editProfile() {
        	window.location.href = 'myfix.jsp';
        }
        
        // 로그아웃
        function logout() {
            if (confirm('정말 로그아웃 하시겠습니까?')) {
                alert('로그아웃되었습니다.');
                // 실제로는 로그인 페이지로 이동
            }
        }
        
      
        
        // 페이지 로드 시 초기화
        window.addEventListener('load', function() {
            // 사용자 정보 로드 (실제로는 서버에서 가져옴)
            loadUserData();
        });
        
        // 사용자 데이터 로드
        function loadUserData() {
            // 실제로는 서버 API 호출
            const userData = {
                name: '공민승',
                email: 'user@example.com',
                profileImage: '/placeholder.svg?height=100&width=100',
                stats: {
                    selling: 15,
                    bought: 8,
                    rating: 4.8,
                    wishlist: 23
                }
            };
            
            // UI 업데이트
            document.querySelector('.profile-name').textContent = userData.name;
            document.querySelector('.profile-email').textContent = userData.email;
            document.getElementById('profileImg').src = userData.profileImage;
        }
    </script>
</body>
</html>
