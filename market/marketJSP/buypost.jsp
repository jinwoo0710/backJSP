<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="buypostTable.BuyPostDAO, buypostTable.BuyPostDTO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>샤</title>
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

        /* 상품 상세 페이지 */
        .product-detail-container {
            padding: 24px 0;
        }

        .back-button {
            margin-bottom: 20px;
            background: none;
            border: none;
            color: #3b82f6;
            cursor: pointer;
            font-size: 16px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .product-detail {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        /* 상품 이미지 갤러리 */
        .product-gallery {
            position: relative;
        }

        .main-image {
            height: 400px;
            background-color: #f3f4f6;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
        }

        .main-image img {
            width: 100%;
            height: 100%;
            object-fit: contain;
        }

        .image-counter {
            position: absolute;
            bottom: 16px;
            right: 16px;
            background: rgba(0, 0, 0, 0.6);
            color: white;
            padding: 4px 8px;
            border-radius: 12px;
            font-size: 12px;
        }

        .thumbnails {
            display: flex;
            gap: 8px;
            padding: 16px;
            overflow-x: auto;
            background-color: #f9fafb;
        }

        .thumbnail {
            width: 60px;
            height: 60px;
            border-radius: 8px;
            overflow: hidden;
            cursor: pointer;
            border: 2px solid transparent;
        }

        .thumbnail.active {
            border-color: #3b82f6;
        }

        .thumbnail img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* 상품 정보 */
        .product-detail-info {
            padding: 24px;
        }

        .product-detail-header {
            margin-bottom: 24px;
            padding-bottom: 24px;
            border-bottom: 1px solid #e5e7eb;
        }

        .product-detail-title {
            font-size: 24px;
            font-weight: 700;
            color: #1f2937;
            margin-bottom: 8px;
        }

        .product-detail-price {
            font-size: 28px;
            font-weight: 700;
            color: #3b82f6;
            margin-bottom: 16px;
        }

        .product-detail-meta {
            display: flex;
            justify-content: space-between;
            color: #6b7280;
            font-size: 14px;
        }

        .product-detail-location {
            display: flex;
            align-items: center;
            gap: 4px;
        }

        .product-detail-time {
            display: flex;
            align-items: center;
            gap: 4px;
        }

        .product-detail-stats {
            display: flex;
            gap: 16px;
            margin-top: 12px;
            color: #6b7280;
            font-size: 14px;
        }

        .product-detail-stat {
            display: flex;
            align-items: center;
            gap: 4px;
        }

        /* 상품 설명 */
        .product-detail-description {
            margin-bottom: 32px;
            line-height: 1.8;
            color: #4b5563;
        }

        /* 판매자 정보 */
        .product-detail-seller {
            display: flex;
            align-items: center;
            gap: 16px;
            padding: 16px;
            background-color: #f9fafb;
            border-radius: 8px;
            margin-bottom: 24px;
        }

        .seller-avatar {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            background-color: #f3f4f6;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            color: #6b7280;
        }

        .seller-info {
            flex: 1;
        }

        .seller-name {
            font-weight: 600;
            color: #1f2937;
            margin-bottom: 4px;
        }

        .seller-products {
            font-size: 14px;
            color: #6b7280;
        }

        .seller-rating {
            display: flex;
            align-items: center;
            gap: 4px;
            margin-top: 4px;
        }

        .rating-stars {
            color: #f59e0b;
        }

        /* 액션 버튼 */
        .product-detail-actions {
            display: flex;
            gap: 12px;
            margin-bottom: 24px;
        }

        .action-btn {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            padding: 12px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s;
        }

        .btn-primary {
            background-color: #3b82f6;
            color: white;
            border: none;
        }

        .btn-primary:hover {
            background-color: #2563eb;
        }

        .btn-outline {
            background-color: white;
            color: #3b82f6;
            border: 1px solid #3b82f6;
        }

        .btn-outline:hover {
            background-color: #f0f9ff;
        }

        /* 상품 정보 테이블 */
        .product-info-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 24px;
        }

        .product-info-table th,
        .product-info-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #e5e7eb;
        }

        .product-info-table th {
            width: 30%;
            color: #6b7280;
            font-weight: 500;
        }

        .product-info-table td {
            color: #1f2937;
        }

        /* 관련 상품 */
        .related-products {
            margin-top: 40px;
        }

        .related-products h3 {
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 20px;
            color: #1f2937;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
        }

        .product-card {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            transition: all 0.2s;
            cursor: pointer;
            border: none;
            padding: 0;
            width: 100%;
            text-align: left;
        }

        .product-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        }

        .product-image {
            position: relative;
            width: 100%;
            height: 180px;
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
            top: 12px;
            right: 12px;
            background: rgba(255, 255, 255, 0.9);
            border: none;
            border-radius: 50%;
            width: 36px;
            height: 36px;
            cursor: pointer;
            font-size: 16px;
            transition: all 0.2s;
        }

        .like-btn:hover {
            background: white;
            transform: scale(1.1);
        }

        .like-btn.liked {
            color: red;
        }

        .product-info {
            padding: 16px;
        }

        .product-title {
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 8px;
            line-height: 1.4;
            color: #1f2937;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .product-price {
            font-size: 18px;
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

        /* 반응형 */
        @media (max-width: 768px) {
            .product-detail-actions {
                flex-direction: column;
            }

            .main-image {
                height: 300px;
            }

            .product-detail-title {
                font-size: 20px;
            }

            .product-detail-price {
                font-size: 24px;
            }

            .product-grid {
                grid-template-columns: repeat(auto-fill, minmax(160px, 1fr));
            }
        }
    </style>
</head>
<body>
	<%
		String postid = request.getParameter("postid");
		BuyPostDAO dao = new BuyPostDAO();
		BuyPostDTO dto = dao.get(Integer.parseInt(postid));
	%>
    <div class="container">
        <div class="product-detail-container">
            <!-- 뒤로가기 버튼 -->
            <button class="back-button" onclick="goBack()">
                <span>←</span>
                목록으로 돌아가기
            </button>
            
            <div class="product-detail">
                <!-- 상품 이미지 갤러리 -->
                <div class="product-gallery">
                    <div class="main-image">
                        <img src="https://via.placeholder.com/800x600/f3f4f6/9ca3af?text=아이폰+14+Pro" alt="아이폰 14 Pro">
                        <div class="image-counter">1/5</div>
                    </div>
                    <div class="thumbnails">
                        <div class="thumbnail active" onclick="changeImage(0)">
                            <img src="https://via.placeholder.com/100x100/f3f4f6/9ca3af?text=1" alt="썸네일 1">
                        </div>
                        <div class="thumbnail" onclick="changeImage(1)">
                            <img src="https://via.placeholder.com/100x100/f3f4f6/9ca3af?text=2" alt="썸네일 2">
                        </div>
                        <div class="thumbnail" onclick="changeImage(2)">
                            <img src="https://via.placeholder.com/100x100/f3f4f6/9ca3af?text=3" alt="썸네일 3">
                        </div>
                        <div class="thumbnail" onclick="changeImage(3)">
                            <img src="https://via.placeholder.com/100x100/f3f4f6/9ca3af?text=4" alt="썸네일 4">
                        </div>
                        <div class="thumbnail" onclick="changeImage(4)">
                            <img src="https://via.placeholder.com/100x100/f3f4f6/9ca3af?text=5" alt="썸네일 5">
                        </div>
                    </div>
                </div>
                
                <!-- 상품 정보 -->
                <div class="product-detail-info">
                    <div class="product-detail-header">
                        <h1 class="product-detail-title"><%= dto.getTitle() %></h1>
                        <div class="product-detail-price"><%= dto.getPrice() %></div>
                        <div class="product-detail-meta">
                            <div class="product-detail-location">
                                <span>📍</span>
                                <span><%= dto.getLocation() %></span>
                            </div>
                            <div class="product-detail-time">
                                <span>🕒</span>
                                <span><%= dto.getUpdatedtime() %></span>
                            </div>
                        </div>
                        <div class="product-detail-stats">
                            <div class="product-detail-stat">
                                <span>👁️</span>
                                <span><%= dto.getViewcnt() %></span>
                            </div>
                            <div class="product-detail-stat">
                                <span>❤️</span>
                                <span>12</span>
                            </div>
                            <div class="product-detail-stat">
                                <span>💬</span>
                                <span>5</span>
                            </div>
                        </div>
                    </div>
                    
                    <!-- 상품 설명 -->
                    <div class="product-detail-description">
                        <%= dto.getContent() %>
                    </div>
                    
                    <!-- 판매자 정보 -->
                    <div class="product-detail-seller">
                        <div class="seller-avatar"><%= dto.getUsername().substring(0, 1) %></div>
                        <div class="seller-info">
                            <div class="seller-name"><%= dto.getUsername() %></div>
                            <div class="seller-products">판매상품 15개</div>
                            <div class="seller-rating">
                                <span class="rating-stars">★★★★☆</span>
                                <span>(4.8/5)</span>
                            </div>
                        </div>
                    </div>
                    
                    <!-- 액션 버튼 -->
                    <div class="product-detail-actions">
                        <button class="action-btn btn-outline" onclick="toggleWishlist()">
                            <span>❤️</span>
                            <span>찜하기</span>
                        </button>
                        <button class="action-btn btn-primary" onclick="startChat()">
                            <span>💬</span>
                            <span>채팅하기</span>
                        </button>
                        <button class="action-btn btn-primary" onclick="makeCall()">
                            <span></span>
                            <span>수정하기</span>
                        </button>
                    </div>
                    
                    <!-- 상품 정보 테이블 -->
                    <table class="product-info-table">
                        <tr>
                            <th>카테고리</th>
                            <td><%= dto.getCategory() %></td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td><%= dto.getPhone() %></td>
                        </tr>
                        <tr>
                            <th>연락</th>
                            <td><%= dto.getConcat() %>, <%= dto.getCalltime() %></td>
                        </tr>
                        <tr>
                            <th>거래 방식</th>
                            <td><%= dto.getDeal() %> 가능</td>
                        </tr>
                        <tr>
                            <th>거래 지역</th>
                            <td><%= dto.getLocation() %></td>
                        </tr>
                    </table>
                </div>
            </div>
       	</div>
     </div>
            

    <script>
        // 이미지 갤러리 기능
        function changeImage(index) {
            // 모든 썸네일에서 active 클래스 제거
            document.querySelectorAll('.thumbnail').forEach(thumb => {
                thumb.classList.remove('active');
            });
            
            // 클릭한 썸네일에 active 클래스 추가
            document.querySelectorAll('.thumbnail')[index].classList.add('active');
            
            // 메인 이미지 변경 (실제로는 이미지 URL을 변경해야 함)
            const mainImage = document.querySelector('.main-image img');
            mainImage.src = `https://via.placeholder.com/800x600/f3f4f6/9ca3af?text=이미지+${index + 1}`;
            
            // 이미지 카운터 업데이트
            document.querySelector('.image-counter').textContent = `${index + 1}/5`;
        }
        
        // 찜하기 기능
        function toggleWishlist() {
            alert('상품을 찜 목록에 추가했습니다.');
        }
        
        // 채팅하기 기능
        function startChat() {
            alert('판매자와의 채팅방으로 이동합니다.');
        }
        
        
        
        // 판매자 상품 보기
        function viewSellerProducts() {
            alert('판매자의 다른 상품 목록으로 이동합니다.');
        }
        
        // 관련 상품 보기
        function showRelatedProduct(id) {
            alert(`관련 상품 ${id}번의 상세 페이지로 이동합니다.`);
        }
        
        // 좋아요 토글
        function toggleLike(event, id) {
            // 이벤트 버블링 방지
            event.stopPropagation();
            
            const btn = event.target;
            btn.classList.toggle('liked');
            
            if (btn.classList.contains('liked')) {
                alert(`상품 ${id}번을 찜 목록에 추가했습니다.`);
            } else {
                alert(`상품 ${id}번을 찜 목록에서 제거했습니다.`);
            }
        }
        
        // 뒤로가기 기능
        function goBack() {
            alert('목록 페이지로 돌아갑니다.');
        }
    </script>
</body>
</html>