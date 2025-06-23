<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>중고마켓 - 믿을 수 있는 중고거래</title>
    <style>
        /* 공통 스타일 */
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
            top: 50%;
            transform: translateY(-50%);
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

        /* 히어로 섹션 */
        .hero {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 80px 0;
            text-align: center;
        }

        .hero h1 {
            font-size: 48px;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .hero p {
            font-size: 20px;
            margin-bottom: 40px;
            opacity: 0.9;
        }

        .hero-buttons {
            display: flex;
            gap: 16px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .btn-primary {
            background-color: #3b82f6;
            color: white;
            border: none;
            padding: 16px 32px;
            border-radius: 8px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .btn-primary:hover {
            background-color: #2563eb;
            transform: translateY(-2px);
        }

        .btn-outline {
            background-color: transparent;
            color: white;
            border: 2px solid white;
            padding: 14px 30px;
            border-radius: 8px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .btn-outline:hover {
            background-color: white;
            color: #667eea;
        }

        /* 특징 섹션 */
        .features {
            padding: 80px 0;
            background: white;
        }

        .features h2 {
            text-align: center;
            font-size: 36px;
            font-weight: 700;
            margin-bottom: 60px;
            color: #1f2937;
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 40px;
        }

        .feature-card {
            text-align: center;
            padding: 40px 20px;
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
        }

        .feature-card:hover {
            transform: translateY(-5px);
        }

        .feature-icon {
            font-size: 48px;
            margin-bottom: 20px;
        }

        .feature-card h3 {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 16px;
            color: #1f2937;
        }

        .feature-card p {
            color: #6b7280;
            line-height: 1.6;
        }

        /* 인기 상품 섹션 */
        .popular-products {
            padding: 80px 0;
            background: #f8f9fa;
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 40px;
        }

        .section-header h2 {
            font-size: 36px;
            font-weight: 700;
            color: #1f2937;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 24px;
        }

        .product-card {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            transition: all 0.2s;
            cursor: pointer;
        }

        .product-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        }

        .product-image {
            position: relative;
            height: 200px;
            background: #e5e7eb;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #9ca3af;
            font-size: 14px;
        }

        .product-info {
            padding: 20px;
        }

        .product-title {
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 8px;
            color: #1f2937;
            line-height: 1.4;
        }

        .product-price {
            font-size: 20px;
            font-weight: 700;
            color: #3b82f6;
            margin-bottom: 8px;
        }

        .product-meta {
            display: flex;
            justify-content: space-between;
            font-size: 14px;
            color: #6b7280;
        }

        /* CTA 섹션 */
        .cta {
            padding: 80px 0;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            text-align: center;
        }

        .cta h2 {
            font-size: 36px;
            font-weight: 700;
            margin-bottom: 16px;
        }

        .cta p {
            font-size: 20px;
            margin-bottom: 40px;
            opacity: 0.9;
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

            .hero h1 {
                font-size: 32px;
            }

            .hero p {
                font-size: 18px;
            }

            .hero-buttons {
                flex-direction: column;
                align-items: center;
            }

            .features h2,
            .section-header h2,
            .cta h2 {
                font-size: 28px;
            }

            .section-header {
                flex-direction: column;
                gap: 20px;
                text-align: center;
            }
        }
    </style>
</head>
<body>
    <!-- 헤더 -->
    <header class="header">
        <div class="container">
            <div class="header-content">
                <div class="logo">
                    <a href="index.jsp">
                        <span class="logo-icon">JUPJUP</span>
                        <span class="logo-text">마켓</span>
                    </a>
                </div>
                
                <nav class="nav">
                    <a href="buy.jsp">구매하기</a>
                    <a href="sell.jsp">판매하기</a>
                    <a href="community.jsp">커뮤니티</a>
                </nav>
                
                <div class="header-actions">
                    <div class="search-box">
                        <input type="text" placeholder="상품을 검색해보세요...">
                        <button>🔍</button>
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

    <!-- 히어로 섹션 -->
    <section class="hero">
        <div class="container">
            <h1>믿을 수 있는 중고거래</h1>
            <p>안전하고 편리한 중고거래 플랫폼에서 원하는 상품을 찾아보세요</p>
            <div class="hero-buttons">
                <a href="buy.jsp" class="btn-primary">
                    🛒 구매하기
                </a>
                <a href="sell.jsp" class="btn-outline">
                    ➕ 판매하기
                </a>
            </div>
        </div>
    </section>

    <!-- 특징 섹션 -->
    <section class="features">
        <div class="container">
            <h2>왜 중고마켓을 선택해야 할까요?</h2>
            <div class="features-grid">
                <div class="feature-card">
                    <div class="feature-icon">🛡️</div>
                    <h3>안전한 거래</h3>
                    <p>본인인증과 거래 후기 시스템으로 안전한 거래를 보장합니다</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">⚡</div>
                    <h3>빠른 거래</h3>
                    <p>실시간 채팅으로 빠르고 편리하게 거래할 수 있습니다</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">👥</div>
                    <h3>활발한 커뮤니티</h3>
                    <p>다양한 정보를 공유하고 소통할 수 있는 커뮤니티가 있습니다</p>
                </div>
            </div>
        </div>
    </section>

    <!-- 인기 상품 섹션 -->
    <section class="popular-products">
        <div class="container">
            <div class="section-header">
                <h2>인기 상품</h2>
                <a href="buy.jsp" class="btn-primary">📈 더 보기</a>
            </div>
            <div class="product-grid">
                <div class="product-card">
                    <div class="product-image">상품 이미지</div>
                    <div class="product-info">
                        <h3 class="product-title">아이폰 14 Pro 128GB 딥퍼플 (배터리 100%)</h3>
                        <p class="product-price">850,000원</p>
                        <div class="product-meta">
                            <span>📍 강남구</span>
                            <span>2시간 전</span>
                        </div>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-image">상품 이미지</div>
                    <div class="product-info">
                        <h3 class="product-title">맥북 에어 M2 13인치 실버 (2022년형)</h3>
                        <p class="product-price">1,200,000원</p>
                        <div class="product-meta">
                            <span>📍 서초구</span>
                            <span>5시간 전</span>
                        </div>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-image">상품 이미지</div>
                    <div class="product-info">
                        <h3 class="product-title">에어팟 프로 2세대 새상품 미개봉</h3>
                        <p class="product-price">280,000원</p>
                        <div class="product-meta">
                            <span>📍 송파구</span>
                            <span>1일 전</span>
                        </div>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-image">상품 이미지</div>
                    <div class="product-info">
                        <h3 class="product-title">닌텐도 스위치 OLED 화이트 + 게임 5개</h3>
                        <p class="product-price">350,000원</p>
                        <div class="product-meta">
                            <span>📍 마포구</span>
                            <span>2일 전</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA 섹션 -->
    <section class="cta">
        <div class="container">
            <h2>지금 시작해보세요</h2>
            <p>수많은 사용자들이 이미 중고마켓에서 거래하고 있습니다</p>
            <a href="sell.jsp" class="btn-primary">무료로 판매하기</a>
        </div>
    </section>
</body>
</html>
