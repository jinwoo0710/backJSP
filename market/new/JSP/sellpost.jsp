<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="sellpostTable.SellPostDAO, sellpostTable.SellPostDTO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>판매 상품 상세 - 중고마켓</title>
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
        .product-detail {
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

        .product-container {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .product-header {
            padding: 24px;
            border-bottom: 1px solid #e5e7eb;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .status-badge {
            display: inline-block;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 12px;
        }

        .status-selling {
            background-color: #dcfce7;
            color: #166534;
        }

        .status-reserved {
            background-color: #fef3c7;
            color: #92400e;
        }

        .status-sold {
            background-color: #fee2e2;
            color: #991b1b;
        }

        .product-title {
            font-size: 24px;
            font-weight: 700;
            color: #1f2937;
            margin-bottom: 8px;
        }

        .product-meta {
            display: flex;
            gap: 16px;
            color: #6b7280;
            font-size: 14px;
        }

        .product-actions {
            display: flex;
            gap: 8px;
            margin-left: auto;
        }

        .btn {
            padding: 8px 16px;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            border: none;
            transition: all 0.2s;
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

        .btn-danger {
            background-color: #ef4444;
            color: white;
        }

        .btn-danger:hover {
            background-color: #dc2626;
        }

        .product-content {
            display: grid;
            grid-template-columns: 1fr;
            gap: 32px;
            padding: 24px;
        }

        /* 이미지 갤러리 */
        .image-gallery {
            margin-bottom: 32px;
        }

        .main-image {
            width: 100%;
            height: 400px;
            border-radius: 12px;
            overflow: hidden;
            margin-bottom: 16px;
            position: relative;
            background-color: #f3f4f6;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .main-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .image-counter {
            position: absolute;
            bottom: 12px;
            right: 12px;
            background: rgba(0, 0, 0, 0.7);
            color: white;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 12px;
        }

        .thumbnail-list {
            display: flex;
            gap: 8px;
            overflow-x: auto;
        }

        .thumbnail {
            width: 80px;
            height: 80px;
            border-radius: 8px;
            overflow: hidden;
            cursor: pointer;
            border: 2px solid transparent;
            transition: all 0.2s;
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
        .product-info {
            margin-bottom: 32px;
        }

        .price {
            font-size: 28px;
            font-weight: 700;
            color: #1f2937;
            margin-bottom: 16px;
        }

        .info-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 16px;
            margin-bottom: 24px;
        }

        .info-item {
            display: flex;
            justify-content: space-between;
            padding: 12px 0;
            border-bottom: 1px solid #f3f4f6;
        }

        .info-label {
            color: #6b7280;
            font-weight: 500;
        }

        .info-value {
            color: #1f2937;
        }

        .description {
            margin-bottom: 32px;
        }

        .description h3 {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 16px;
            color: #1f2937;
        }

        .description-content {
            color: #4b5563;
            line-height: 1.7;
            white-space: pre-line;
        }

        /* 사이드바 */
        .sidebar {
            display: flex;
            flex-direction: column;
            gap: 24px;
        }

        .stats-card {
            background: #f9fafb;
            border-radius: 12px;
            padding: 20px;
        }

        .stats-card h3 {
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 16px;
            color: #1f2937;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 16px;
        }

        .stat-item {
            text-align: center;
        }

        .stat-number {
            font-size: 24px;
            font-weight: 700;
            color: #3b82f6;
            display: block;
        }

        .stat-label {
            font-size: 12px;
            color: #6b7280;
            margin-top: 4px;
        }

        .management-card {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 12px;
            padding: 20px;
        }

        .management-card h3 {
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 16px;
            color: #1f2937;
        }

        .management-actions {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .action-btn {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            border: none;
            transition: all 0.2s;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .inquiries-card {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 12px;
            padding: 20px;
        }

        .inquiry-item {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 12px 0;
            border-bottom: 1px solid #f3f4f6;
        }

        .inquiry-item:last-child {
            border-bottom: none;
        }

        .inquiry-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: #e5e7eb;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
        }

        .inquiry-content {
            flex: 1;
        }

        .inquiry-name {
            font-weight: 500;
            font-size: 14px;
            margin-bottom: 2px;
        }

        .inquiry-message {
            font-size: 12px;
            color: #6b7280;
        }

        .inquiry-time {
            font-size: 12px;
            color: #9ca3af;
        }

        .inquiry-badge {
            background: #ef4444;
            color: white;
            font-size: 10px;
            padding: 2px 6px;
            border-radius: 10px;
            margin-left: 8px;
        }

        /* 댓글 섹션 */
        .comments-section {
            margin-top: 32px;
            padding-top: 32px;
            border-top: 1px solid #e5e7eb;
        }

        .comments-header {
            font-size: 18px;
            font-weight: 600;
            color: #1f2937;
            margin-bottom: 20px;
        }

        .comment-form {
            margin-bottom: 24px;
            padding: 16px;
            background-color: #f9fafb;
            border-radius: 8px;
        }

        .comment-input {
            width: 100%;
            padding: 12px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            font-size: 14px;
            resize: vertical;
            min-height: 80px;
            margin-bottom: 12px;
        }

        .comment-input:focus {
            outline: none;
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
        }

        .comment-actions {
            display: flex;
            justify-content: flex-end;
        }

        .comment-item {
            padding: 16px 0;
            border-bottom: 1px solid #f3f4f6;
        }

        .comment-item:last-child {
            border-bottom: none;
        }

        .comment-header {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 8px;
        }

        .comment-author {
            font-size: 14px;
            font-weight: 600;
            color: #1f2937;
        }

        .comment-time {
            font-size: 12px;
            color: #6b7280;
        }

        .comment-content {
            font-size: 14px;
            color: #4b5563;
            line-height: 1.5;
        }

        /* 반응형 */
        @media (max-width: 768px) {
            .product-content {
                grid-template-columns: 1fr;
                gap: 24px;
            }

            .product-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 16px;
            }

            .product-actions {
                width: 100%;
                justify-content: flex-start;
            }

            .info-grid {
                grid-template-columns: 1fr;
            }

            .stats-grid {
                grid-template-columns: repeat(4, 1fr);
            }
        }

        /* 채팅 사이드바 숨김 */
        .chat-sidebar {
            display: none;
        }
    </style>
</head>
<body>
	<%
		String postid = request.getParameter("id");
		if (postid == null) {
		    response.sendRedirect("sell.jsp");
		    return;
		}
		SellPostDAO dao = new SellPostDAO();
		SellPostDTO dto = dao.get(Integer.parseInt(postid));
		if (dto == null) {
		    response.sendRedirect("sell.jsp");
		    return;
		}
	%>
    <div class="container">
        <div class="product-detail">
            <!-- 뒤로가기 버튼 -->
            <button class="back-button" onclick="goBack()">
                <span>←</span>
                판매 목록으로
            </button>
            
            <div class="product-container">
                <!-- 상품 헤더 -->
                <div class="product-header">
                    <div>
                        <span class="status-badge status-selling" id="statusBadge"><%= dto.getSold() != null ? dto.getSold() : "판매중" %></span>
                        <h1 class="product-title"><%= dto.getTitle() %></h1>
                        <div class="product-meta">
                            <span>📅 <%= dto.getCreatedtime() %></span>
                            <span>👁️ 조회 <%= dto.getViewcnt() %>회</span>
                            <span>❤️ 찜 23개</span>
                            <span>💬 문의 8건</span>
                        </div>
                    </div>
                    <% 
					    String currentUser = (String) session.getAttribute("userid");
					    if (currentUser == null) {
					        currentUser = (String) session.getAttribute("userID");
					    }
					    Integer sessionUserNumber = (Integer) session.getAttribute("usernumber");
					    if (sessionUserNumber != null && sessionUserNumber == dto.getUsernumber()) {
					%>
					    <div class="product-actions">
					        <button class="btn btn-secondary" onclick="editProduct(<%= dto.getPostid() %>)">수정</button>
					        <form action="selldelete.jsp" method="post" style="display: inline;">
					        	<input type="hidden" name="postid" value="<%=dto.getPostid()%>">
					        	<button class="btn btn-danger" onclick="return deleteProduct()">삭제</button>
				        	</form>
					    </div>
					<% 
					    } 
					%>
                </div>
                
                <div class="product-content">
                    <!-- 메인 콘텐츠 -->
                    <div class="main-content">
                        <!-- 이미지 갤러리 -->
                        <div class="image-gallery">
                            <div class="main-image">
                                <% if (dto.getImage() != null && !dto.getImage().isEmpty()) { %>
                                    <img src="../uploads/sellImages/<%= dto.getImage() %>" alt="<%= dto.getTitle() %>" id="mainImage">
                                <% } else { %>
                                    <div style="font-size: 48px; color: #9ca3af;">📦</div>
                                <% } %>
                            </div>
                        </div>
                        
                        <!-- 상품 정보 -->
                        <div class="product-info">
                            <div class="price"><%= String.format("%,d", dto.getPrice()) %>원</div>
                            
                            <div class="info-grid">
                                <div class="info-item">
                                    <span class="info-label">카테고리</span>
                                    <span class="info-value"><%= dto.getCategory() %></span>
                                </div>
                                <div class="info-item">
                                    <span class="info-label">상품 상태</span>
                                    <span class="info-value">거의 새것</span>
                                </div>
                                <div class="info-item">
                                    <span class="info-label">거래 방식</span>
                                    <span class="info-value">직거래, 택배거래</span>
                                </div>
                                <div class="info-item">
                                    <span class="info-label">거래 지역</span>
                                    <span class="info-value"><%= dto.getLocation() %></span>
                                </div>
                                <div class="info-item">
                                    <span class="info-label">가격 제안</span>
                                    <span class="info-value">받음</span>
                                </div>
                                <div class="info-item">
                                    <span class="info-label">배송비</span>
                                    <span class="info-value">별도</span>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 상품 설명 -->
                        <div class="description">
                            <h3>📝 상품 설명</h3>
                            <div class="description-content">
                            <%= dto.getContent().replaceAll("\n", "<br>") %>
							</div>
                        </div>

                        <!-- 댓글 섹션 -->
                        <div class="comments-section">
                            <h3 class="comments-header">댓글 0개</h3>

                            <!-- 댓글 작성 폼 -->
                            <% if (currentUser != null) { %>
                            <div class="comment-form">
                                <form id="commentForm" action="commentAction.jsp" method="post">
                                    <input type="hidden" name="postId" value="<%= postid %>">
                                    <input type="hidden" name="postType" value="sell">
                                    <input type="hidden" name="action" value="add">
                                    <input type="hidden" name="redirectUrl" value="sellpost.jsp?id=<%= postid %>">
                                    <textarea name="content" class="comment-input" placeholder="댓글을 작성해주세요..." id="commentInput" required></textarea>
                                    <div class="comment-actions">
                                        <button type="submit" class="action-btn btn-primary" style="padding: 8px 16px; font-size: 14px;">댓글 작성</button>
                                    </div>
                                </form>
                            </div>
                            <% } else { %>
                            <div class="comment-form">
                                <p style="text-align: center; color: #6b7280; padding: 20px;">
                                    <a href="login.jsp" style="color: #3b82f6;">로그인</a>하시면 댓글을 작성할 수 있습니다.
                                </p>
                            </div>
                            <% } %>

                            <!-- 댓글 목록 -->
                            <div class="comments-list">
                                <div style="text-align: center; color: #6b7280; padding: 40px;">
                                    첫 번째 댓글을 작성해보세요!
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // 상품 수정
        function editProduct(postid) {
        	window.location.href = 'sellfix.jsp?postid=' + postid;
        }
        
        // 상품 삭제
        function deleteProduct() {
            return confirm('정말로 이 상품을 삭제하시겠습니까?\n삭제된 상품은 복구할 수 없습니다.');
        }
        
        // 모든 문의 보기
        function viewAllInquiries() {
            alert('문의 관리 페이지로 이동합니다.');
        }
        
        // 채팅방 열기
        function openChat() {
            window.location.href = '../chat.jsp?sellerId=<%= dto.getUsername() %>&postId=<%= dto.getPostid() %>';
        }
        
        // 뒤로가기
        function goBack() {
            window.location.href="sell.jsp";
        }
    </script>
</body>
</html>