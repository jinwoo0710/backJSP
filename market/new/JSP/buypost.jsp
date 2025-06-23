<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="buypostTable.BuyPostDAO, buypostTable.BuyPostDTO, commentTable.CommentDAO, commentTable.CommentDTO, java.util.List" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>구매 요청 상세</title>
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
        }
    </style>
</head>
<body>
	<%
		String postid_str = request.getParameter("id");
		if (postid_str == null) {
		    response.sendRedirect("buy.jsp");
		    return;
		}
		int postid = Integer.parseInt(postid_str);

		BuyPostDAO dao = new BuyPostDAO();
		BuyPostDTO dto = dao.select(postid);
		dao.visitcount(postid);

		// 댓글 기능 추가
		CommentDAO commentDAO = new CommentDAO();
		List<CommentDTO> comments = commentDAO.getCommentsByPost("buy", postid);
		int commentCount = comments.size();
		
		String currentUserId = (String) session.getAttribute("userid");
		boolean isLoggedIn = (currentUserId != null && !currentUserId.isEmpty());
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
                        <% if (dto.getImage() != null && !dto.getImage().isEmpty()) { %>
                            <img src="../uploads/buyImages/<%= dto.getImage() %>" alt="<%= dto.getTitle() %>">
                        <% } else { %>
                            <div style="font-size: 48px; color: #9ca3af;">📦</div>
                        <% } %>
                    </div>
                </div>
                
                <!-- 상품 정보 -->
                <div class="product-detail-info">
                    <div class="product-detail-header">
                        <h1 class="product-detail-title"><%= dto.getTitle() %></h1>
                        <div class="product-detail-price"><%= String.format("%,d", dto.getPrice()) %>원</div>
                        <div class="product-detail-meta">
                            <div class="product-detail-location">
                                <span>📍</span>
                                <span><%= dto.getLocation() != null ? dto.getLocation() : "위치 미제공" %></span>
                            </div>
                            <div class="product-detail-time">
                                <span>🕒</span>
                                <span><%= dto.getCreatedtime() %></span>
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
                        <h3>상품 설명</h3>
                        <p><%= dto.getContent().replaceAll("\n", "<br>") %></p>
                    </div>
                    
                    <!-- 댓글 섹션 (여기에 추가) -->
                    <div class="comments-section" style="margin-top: 32px; border-top: 1px solid #e5e7eb; padding-top: 24px;">
                        <div class="comments-header">
                            <h3 class="comments-title">댓글 <span class="comments-count"><%= commentCount %></span></h3>
                        </div>
                        
                        <!-- 댓글 작성 -->
                        <% if (isLoggedIn) { %>
                        <div class="comment-form" style="margin-top:16px;">
                            <form id="commentForm" action="commentAction.jsp" method="post">
                                <input type="hidden" name="postId" value="<%= postid %>">
                                <input type="hidden" name="postType" value="buy">
                                <input type="hidden" name="action" value="add">
                                <input type="hidden" name="redirectUrl" value="buypost.jsp?id=<%= postid %>">
                                <textarea name="content" class="comment-input" placeholder="댓글을 작성해주세요..." id="commentInput" required style="width:100%; padding:10px; border:1px solid #d1d5db; border-radius:8px; min-height:80px;"></textarea>
                                <div class="comment-form-actions" style="text-align:right; margin-top:8px;">
                                    <button type="submit" class="btn-submit" style="padding: 8px 16px; border:none; background-color:#3b82f6; color:white; border-radius:6px; cursor:pointer;">댓글 작성</button>
                                </div>
                            </form>
                        </div>
                        <% } else { %>
                        <div class="comment-form" style="text-align: center; color: #6b7280; padding: 20px;">
                            <a href="login.jsp?returnUrl=<%= java.net.URLEncoder.encode("buypost.jsp?id=" + postid, "UTF-8") %>" style="color: #3b82f6;">로그인</a> 후 댓글을 작성할 수 있습니다.
                        </div>
                        <% } %>
                        
                        <!-- 댓글 목록 -->
                        <div class="comments-list" style="margin-top:24px;">
                            <% if (comments != null && !comments.isEmpty()) { 
                                for (CommentDTO comment : comments) {
                            %>
                            <div class="comment-item" style="border-bottom: 1px solid #f3f4f6; padding: 16px 0;">
                                 <div class="comment-header" style="display:flex; justify-content:space-between; align-items:center; margin-bottom:8px;">
                                    <span style="font-weight:600;"><%= comment.getUsername() %></span>
                                    <span style="font-size:12px; color:#9ca3af;"><%= comment.getTimeAgo() %></span>
                                </div>
                                <div class="comment-content" style="color:#4b5563; line-height:1.5;"><%= comment.getContent().replaceAll("\n", "<br>") %></div>
                            </div>
                            <% } 
                            } else { %>
                            <div style="text-align: center; color: #6b7280; padding: 40px;">
                                <p>아직 댓글이 없습니다. 첫 댓글을 작성해보세요!</p>
                            </div>
                            <% } %>
                        </div>
                    </div>
                    
                    <!-- 판매자 정보 -->
                    <div class="product-detail-seller">
                        <div class="seller-avatar"><%= dto.getUsername().substring(0, 1) %></div>
                        <div class="seller-info">
                            <div class="seller-name"><%= dto.getUsername() %></div>
                            <div class="seller-products">구매 요청 15개</div>
                            <div class="seller-rating">
                                <span class="rating-stars">★★★★☆</span>
                                <span>(4.8/5)</span>
                            </div>
                        </div>
                    </div>
                    
                    <!-- 상품 정보 테이블 -->
                    <table class="product-info-table">
                        <tr>
                            <th>카테고리</th>
                            <td><%= dto.getCategory() %></td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td><%= dto.getPhone() != null ? dto.getPhone() : "미제공" %></td>
                        </tr>
                        <tr>
                            <th>연락 방법</th>
                            <td><%= dto.getConcat() != null ? dto.getConcat() : "채팅" %></td>
                        </tr>
                        <tr>
                            <th>거래 방식</th>
                            <td><%= dto.getDeal() != null ? dto.getDeal() : "협의" %> 가능</td>
                        </tr>
                        <tr>
                            <th>거래 지역</th>
                            <td><%= dto.getLocation() != null ? dto.getLocation() : "미제공" %></td>
                        </tr>
                    </table>
                </div>
            </div>
       	</div>
     </div>

    <script>
        // 댓글 관련 스크립트
        var isLoggedIn = <%= isLoggedIn %>;
        if (isLoggedIn) {
            document.getElementById('commentForm').addEventListener('submit', function(e) {
                const content = this.querySelector('textarea[name="content"]').value;
                if (!content || content.trim() === '') {
                    e.preventDefault();
                    alert('댓글 내용을 입력해주세요.');
                }
            });
        }
        
        // 뒤로가기 기능
        function goBack() {
            window.location.href = 'buy.jsp';
        }
    </script>
</body>
</html>