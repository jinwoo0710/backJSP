<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="sellpostTable.SellPostDAO, sellpostTable.SellPostDTO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 상품 관리 - 중고마켓</title>
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
            justify-content: between;
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
            grid-template-columns: 1fr 400px;
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
            font-weight: 500;
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

        /* 모달 */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 1000;
            align-items: center;
            justify-content: center;
        }

        .modal.show {
            display: flex;
        }

        .modal-content {
            background: white;
            border-radius: 12px;
            padding: 24px;
            max-width: 400px;
            width: 90%;
        }

        .modal-header {
            margin-bottom: 16px;
        }

        .modal-title {
            font-size: 18px;
            font-weight: 600;
            color: #1f2937;
        }

        .modal-body {
            margin-bottom: 24px;
        }

        .modal-actions {
            display: flex;
            gap: 12px;
            justify-content: flex-end;
        }

        .status-select {
            width: 100%;
            padding: 12px;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            font-size: 14px;
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
    </style>
</head>
<body>
	<%
		String postid = request.getParameter("postid");
		SellPostDAO dao = new SellPostDAO();
		SellPostDTO dto = dao.get(Integer.parseInt(postid));
	%>
    <div class="container">
        <div class="product-detail">
            <!-- 뒤로가기 버튼 -->
            <button class="back-button" onclick="goBack()">
                <span>←</span>
                내 상품 목록으로
            </button>
            
            <div class="product-container">
                <!-- 상품 헤더 -->
                <div class="product-header">
                    <div>
                        <span class="status-badge status-selling" id="statusBadge"><%= dto.getSold() %></span>
                        <h1 class="product-title"><%= dto.getTitle() %></h1>
                        <div class="product-meta">
                            <span>📅 <%= dto.getCreatedtime() %></span>
                            <span>👁️ 조회 <%= dto.getViewcnt() %>회</span>
                            <span>❤️ 찜 23개</span>
                            <span>💬 문의 8건</span>
                        </div>
                    </div>
                    <% 
					    Integer sessionUserNumber = (Integer) session.getAttribute("usernumber");
					    if (sessionUserNumber != null && sessionUserNumber == dto.getUsernumber()) {
					%>
					    <div class="product-actions">
					        <button class="btn btn-secondary" onclick="editProduct(<%= dto.getPostid() %>)">수정</button>
					        <form action="selldelete.jsp" method="post">
					        	<input type="hidden" name="postid" value="<%=dto.getPostid()%>">
					        	<button class="btn btn-danger" onclick="deleteProduct()">삭제</button>
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
                                <img src="../<%=dto.getImage() %>" alt="아이폰 14 Pro" id="mainImage">
                                <div class="image-counter">1 / 5  </div>
                            </div>
                            
                        </div>
                        
                        <!-- 상품 정보 -->
                        <div class="product-info">
                            <div class="price"><%= dto.getPrice() %>원</div>
                            
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
                            <%= dto.getContent() %>
							</div>
                        </div>
                    </div>
                    
                    <!-- 사이드바 -->
                    <div class="sidebar">
                        <!-- 통계 카드 -->
                        <div class="stats-card">
                            <h3>📊 상품 통계</h3>
                            <div class="stats-grid">
                                <div class="stat-item">
                                    <span class="stat-number">247</span>
                                    <div class="stat-label">조회수</div>
                                </div>
                                <div class="stat-item">
                                    <span class="stat-number">23</span>
                                    <div class="stat-label">찜</div>
                                </div>
                                <div class="stat-item">
                                    <span class="stat-number">8</span>
                                    <div class="stat-label">문의</div>
                                </div>
                                <div class="stat-item">
                                    <span class="stat-number">3</span>
                                    <div class="stat-label">가격제안</div>
                                </div>
                            </div>
                        </div>
                        
                        
                        
                        <!-- 문의 관리 -->
                        <div class="inquiries-card">
                            <h3>💬 최근 문의 <span class="inquiry-badge">3</span></h3>
                            <div class="inquiry-item">
                                <div class="inquiry-avatar">김</div>
                                <div class="inquiry-content">
                                    <div class="inquiry-name">김구매자</div>
                                    <div class="inquiry-message">직거래 가능한 시간이 언제인가요?</div>
                                </div>
                                <div class="inquiry-time">2시간 전</div>
                            </div>
                            <div class="inquiry-item">
                                <div class="inquiry-avatar">이</div>
                                <div class="inquiry-content">
                                    <div class="inquiry-name">이관심자</div>
                                    <div class="inquiry-message">80만원에 가능할까요?</div>
                                </div>
                                <div class="inquiry-time">5시간 전</div>
                            </div>
                            <div class="inquiry-item">
                                <div class="inquiry-avatar">박</div>
                                <div class="inquiry-content">
                                    <div class="inquiry-name">박구매희망</div>
                                    <div class="inquiry-message">케이스 포함인가요?</div>
                                </div>
                                <div class="inquiry-time">1일 전</div>
                            </div>
                            <button class="action-btn btn-primary" onclick="viewAllInquiries()" style="margin-top: 12px;">
                                모든 문의 보기
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 상태 변경 모달 -->
    <div class="modal" id="statusModal">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">판매 상태 변경</h3>
            </div>
            <div class="modal-body">
                <select class="status-select" id="statusSelect">
                    <option value="selling">판매중</option>
                    <option value="reserved">예약중</option>
                    <option value="sold">판매완료</option>
                </select>
            </div>
            <div class="modal-actions">
                <button class="btn btn-secondary" onclick="closeStatusModal()">취소</button>
                <button class="btn btn-primary" onclick="updateStatus()">변경</button>
            </div>
        </div>
    </div>

    <script>
        // 메인 이미지 변경
        function changeMainImage(thumbnail, imageSrc, imageNumber) {
            document.getElementById('mainImage').src = imageSrc;
            document.querySelector('.image-counter').textContent = `${imageNumber} / 5`;
            
            // 썸네일 활성화 상태 변경
            document.querySelectorAll('.thumbnail').forEach(thumb => thumb.classList.remove('active'));
            thumbnail.classList.add('active');
        }
        
        // 상품 수정
        function editProduct(postid) {
        	window.location.href = 'sellfix.jsp?postid=' + postid;
        }
        
        // 상태 변경 모달 표시
        function showStatusModal() {
            document.getElementById('statusModal').classList.add('show');
        }
        
        // 상태 변경 모달 닫기
        function closeStatusModal() {
            document.getElementById('statusModal').classList.remove('show');
        }
        
        // 상태 업데이트
        function updateStatus() {
            const newStatus = document.getElementById('statusSelect').value;
            const statusBadge = document.getElementById('statusBadge');
            
            // 상태 텍스트 및 클래스 변경
            statusBadge.className = 'status-badge';
            switch(newStatus) {
                case 'selling':
                    statusBadge.textContent = '판매중';
                    statusBadge.classList.add('status-selling');
                    break;
                case 'reserved':
                    statusBadge.textContent = '예약중';
                    statusBadge.classList.add('status-reserved');
                    break;
                case 'sold':
                    statusBadge.textContent = '판매완료';
                    statusBadge.classList.add('status-sold');
                    break;
            }
            
            closeStatusModal();
            alert('상품 상태가 변경되었습니다.');
        }
        
        // 상품 삭제
        function deleteProduct() {
            if (confirm('정말로 이 상품을 삭제하시겠습니까?\n삭제된 상품은 복구할 수 없습니다.')) {
            	alert('상품이 삭제되었습니다.');
            }
        }
        
        // 끌어올리기
        function boostProduct() {
            if (confirm('상품을 끌어올리시겠습니까?\n끌어올리기는 하루에 3번까지 가능합니다.')) {
                alert('상품이 끌어올려졌습니다!');
            }
        }
        
        // 공유하기
        function shareProduct() {
            if (navigator.share) {
                navigator.share({
                    title: '아이폰 14 Pro 128GB 딥퍼플',
                    text: '중고마켓에서 판매 중인 상품입니다.',
                    url: window.location.href
                });
            } else {
                // 클립보드에 복사
                navigator.clipboard.writeText(window.location.href);
                alert('상품 링크가 클립보드에 복사되었습니다.');
            }
        }
        
        
        
        // 복사하여 등록
        function duplicateProduct() {
            if (confirm('이 상품과 동일한 정보로 새 상품을 등록하시겠습니까?')) {
                alert('상품 등록 페이지로 이동합니다.');
            }
        }
        
        // 모든 문의 보기
        function viewAllInquiries() {
            alert('문의 관리 페이지로 이동합니다.');
        }
        
        // 뒤로가기
        function goBack() {
            window.location.href="sell.jsp";
        }
        
        // 모달 외부 클릭 시 닫기
        window.onclick = function(event) {
            const modal = document.getElementById('statusModal');
            if (event.target === modal) {
                closeStatusModal();
            }
        }
    </script>
</body>
</html>