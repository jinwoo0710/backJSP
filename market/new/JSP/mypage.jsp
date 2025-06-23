<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String userid = (String) session.getAttribute("userid");
    String userID = (String) session.getAttribute("userID");
    
    // 세션 호환성 처리
    if (userid == null && userID != null) {
        userid = userID;
    } else if (userid != null && userID == null) {
        session.setAttribute("userID", userid);
    }
    
    if (userid == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
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

        /* 네비게이션 */
        .navbar {
            background-color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 100;
            margin-bottom: 20px;
        }

        .navbar-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 16px 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .navbar-logo {
            font-size: 20px;
            font-weight: 700;
            color: #3b82f6;
            text-decoration: none;
        }

        .navbar-menu {
            display: flex;
            gap: 24px;
        }

        .navbar-link {
            font-size: 16px;
            font-weight: 500;
            color: #4b5563;
            text-decoration: none;
            transition: all 0.2s;
        }

        .navbar-link:hover {
            color: #3b82f6;
        }

        .navbar-link.active {
            color: #3b82f6;
            font-weight: 600;
        }

        @media (max-width: 768px) {
            .navbar-menu {
                gap: 16px;
            }
            
            .navbar-link {
                font-size: 14px;
            }
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
            transition: all 0.2s;
            border-bottom: 2px solid transparent;
        }

        .tab-button.active {
            color: #3b82f6;
            border-bottom-color: #3b82f6;
        }

        .tab-button:hover {
            color: #3b82f6;
        }

        /* 아이템 리스트 */
        .item-list {
            display: grid;
            gap: 16px;
        }

        .item-card {
            display: flex;
            gap: 16px;
            padding: 16px;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            transition: all 0.2s;
        }

        .item-card:hover {
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .item-image {
            width: 80px;
            height: 80px;
            border-radius: 8px;
            overflow: hidden;
            background-color: #f3f4f6;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .item-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .item-info {
            flex: 1;
        }

        .item-title {
            font-size: 16px;
            font-weight: 600;
            color: #1f2937;
            margin-bottom: 4px;
        }

        .item-price {
            font-size: 18px;
            font-weight: 700;
            color: #3b82f6;
            margin-bottom: 8px;
        }

        .item-meta {
            font-size: 12px;
            color: #6b7280;
        }

        .item-status {
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 500;
        }

        .status-selling {
            background-color: #d1fae5;
            color: #065f46;
        }

        .status-sold {
            background-color: #fee2e2;
            color: #991b1b;
        }

        /* 버튼 */
        .btn {
            padding: 8px 16px;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s;
            border: none;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }

        .btn-primary {
            background-color: #3b82f6;
            color: white;
        }

        .btn-primary:hover {
            background-color: #2563eb;
        }

        .btn-outline {
            background-color: transparent;
            color: #3b82f6;
            border: 1px solid #3b82f6;
        }

        .btn-outline:hover {
            background-color: #3b82f6;
            color: white;
        }

        .btn-sm {
            padding: 6px 12px;
            font-size: 12px;
        }

        /* 사이드바 */
        .sidebar {
            display: flex;
            flex-direction: column;
            gap: 24px;
        }

        .sidebar-section {
            background: white;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .sidebar-title {
            font-size: 16px;
            font-weight: 600;
            color: #1f2937;
            margin-bottom: 16px;
        }

        .menu-list {
            list-style: none;
        }

        .menu-item {
            margin-bottom: 8px;
        }

        .menu-link {
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 8px 12px;
            color: #4b5563;
            text-decoration: none;
            border-radius: 6px;
            transition: all 0.2s;
        }

        .menu-link:hover {
            background-color: #f3f4f6;
            color: #3b82f6;
        }

        .menu-link.active {
            background-color: #eff6ff;
            color: #3b82f6;
        }

        /* 반응형 */
        @media (max-width: 768px) {
            .main-content {
                grid-template-columns: 1fr;
            }

            .profile-info {
                flex-direction: column;
                text-align: center;
            }

            .profile-stats {
                justify-content: center;
            }

            .item-card {
                flex-direction: column;
            }

            .item-image {
                width: 100%;
                height: 200px;
            }
        }
    </style>
</head>
<body>
    <!-- 네비게이션 -->
    <nav class="navbar">
        <div class="navbar-container">
            <a href="index.jsp" class="navbar-logo">중고마켓</a>
            <div class="navbar-menu">
                <a href="buy_working.jsp" class="navbar-link">구매하기</a>
                <a href="sell_working.jsp" class="navbar-link">판매하기</a>
                <a href="community_working.jsp" class="navbar-link">커뮤니티</a>
                <a href="mypage.jsp" class="navbar-link active">마이페이지</a>
                <a href="logout.jsp" class="navbar-link">로그아웃</a>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="mypage-container">
            <!-- 프로필 헤더 -->
            <div class="profile-header">
                <div class="profile-info">
                    <div class="profile-image">
                        <div class="placeholder">👤</div>
                    </div>
                    <div class="profile-details">
                        <h1 class="profile-name"><%= userid %></h1>
                        <p class="profile-email"><%= userid %></p>
                        <div class="profile-stats">
                            <div class="stat-item">
                                <span class="stat-number">5</span>
                                <span class="stat-label">판매중</span>
                            </div>
                            <div class="stat-item">
                                <span class="stat-number">12</span>
                                <span class="stat-label">판매완료</span>
                            </div>
                            <div class="stat-item">
                                <span class="stat-number">8</span>
                                <span class="stat-label">구매완료</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="profile-actions">
                    <a href="myfix.jsp" class="btn btn-outline">프로필 수정</a>
                    <a href="sellmake.jsp" class="btn btn-primary">상품 등록</a>
                </div>
            </div>

            <!-- 메인 콘텐츠 -->
            <div class="main-content">
                <div class="content-section">
                    <h2 class="section-title">📦 나의 활동</h2>
                    
                    <!-- 탭 메뉴 -->
                    <div class="tab-menu">
                        <button class="tab-button active" onclick="showTab('selling')">판매중</button>
                        <button class="tab-button" onclick="showTab('sold')">판매완료</button>
                        <button class="tab-button" onclick="showTab('buying')">구매내역</button>
                        <button class="tab-button" onclick="showTab('liked')">관심목록</button>
                    </div>

                    <!-- 판매중 탭 -->
                    <div id="selling-tab" class="tab-content">
                        <div class="item-list">
                            <%
                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/market_db?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Seoul", "root", "1111");
                                
                                String sql = "SELECT * FROM sellposts WHERE userid = ? ORDER BY created_at DESC LIMIT 5";
                                PreparedStatement pstmt = conn.prepareStatement(sql);
                                pstmt.setString(1, userid);
                                ResultSet rs = pstmt.executeQuery();
                                
                                while (rs.next()) {
                            %>
                            <div class="item-card">
                                <div class="item-image">
                                    <% if (rs.getString("image_path") != null && !rs.getString("image_path").isEmpty()) { %>
                                        <img src="../uploads/<%= rs.getString("image_path") %>" alt="상품 이미지">
                                    <% } else { %>
                                        📦
                                    <% } %>
                                </div>
                                <div class="item-info">
                                    <h3 class="item-title"><%= rs.getString("title") %></h3>
                                    <p class="item-price"><%= String.format("%,d", rs.getInt("price")) %>원</p>
                                    <p class="item-meta">
                                        <%= rs.getTimestamp("created_at") %> | 조회 <%= rs.getInt("views") %>
                                        <span class="item-status status-selling">판매중</span>
                                    </p>
                                </div>
                            </div>
                            <%
                                }
                                rs.close();
                                pstmt.close();
                                conn.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                            %>
                        </div>
                    </div>

                    <!-- 다른 탭들은 JavaScript로 동적 로딩 -->
                    <div id="sold-tab" class="tab-content" style="display: none;">
                        <p>판매완료된 상품이 없습니다.</p>
                    </div>

                    <div id="buying-tab" class="tab-content" style="display: none;">
                        <p>구매내역이 없습니다.</p>
                    </div>

                    <div id="liked-tab" class="tab-content" style="display: none;">
                        <p>관심목록이 없습니다.</p>
                    </div>
                </div>

                <!-- 사이드바 -->
                <div class="sidebar">
                    <div class="sidebar-section">
                        <h3 class="sidebar-title">🛍️ 거래관리</h3>
                        <ul class="menu-list">
                            <li class="menu-item">
                                <a href="sellmake.jsp" class="menu-link">상품 등록</a>
                            </li>
                            <li class="menu-item">
                                <a href="sell_working.jsp" class="menu-link">판매내역</a>
                            </li>
                            <li class="menu-item">
                                <a href="buy_working.jsp" class="menu-link">구매내역</a>
                            </li>
                        </ul>
                    </div>

                    <div class="sidebar-section">
                        <h3 class="sidebar-title">👤 계정관리</h3>
                        <ul class="menu-list">
                            <li class="menu-item">
                                <a href="myfix.jsp" class="menu-link">프로필 수정</a>
                            </li>
                            <li class="menu-item">
                                <a href="chat_list.jsp" class="menu-link">채팅목록</a>
                            </li>
                            <li class="menu-item">
                                <a href="logout.jsp" class="menu-link">로그아웃</a>
                            </li>
                        </ul>
                    </div>

                    <div class="sidebar-section">
                        <h3 class="sidebar-title">📊 활동 통계</h3>
                        <div style="text-align: center; padding: 20px;">
                            <div style="margin-bottom: 12px;">
                                <span style="font-size: 24px; font-weight: 700; color: #3b82f6;">17</span>
                                <p style="font-size: 12px; color: #6b7280;">총 거래횟수</p>
                            </div>
                            <div>
                                <span style="font-size: 18px; font-weight: 600; color: #10b981;">98%</span>
                                <p style="font-size: 12px; color: #6b7280;">거래 만족도</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function showTab(tabName) {
            // 모든 탭 숨기기
            const tabs = document.querySelectorAll('.tab-content');
            tabs.forEach(tab => {
                tab.style.display = 'none';
            });

            // 모든 탭 버튼 비활성화
            const buttons = document.querySelectorAll('.tab-button');
            buttons.forEach(button => {
                button.classList.remove('active');
            });

            // 선택된 탭 보이기
            document.getElementById(tabName + '-tab').style.display = 'block';

            // 선택된 탭 버튼 활성화
            event.target.classList.add('active');
        }
    </script>
</body>
</html>
