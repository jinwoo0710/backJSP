<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이폰 14 Pro 구매 후기 - 커뮤니티</title>
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

        /* 커뮤니티 상세 페이지 */
        .post-detail-container {
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

        .post-detail {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        /* 게시글 헤더 */
        .post-detail-header {
            padding: 24px;
            border-bottom: 1px solid #e5e7eb;
        }

        .post-category {
            display: inline-block;
            background-color: #e3f2fd;
            color: #1976d2;
            padding: 4px 12px;
            border-radius: 16px;
            font-size: 12px;
            font-weight: 500;
            margin-bottom: 12px;
        }

        .post-detail-title {
            font-size: 24px;
            font-weight: 700;
            color: #1f2937;
            margin-bottom: 16px;
            line-height: 1.4;
        }

        .post-detail-meta {
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: #6b7280;
            font-size: 14px;
        }

        .post-author-info {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .author-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: #f3f4f6;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 16px;
            color: #6b7280;
        }

        .author-details {
            display: flex;
            flex-direction: column;
        }

        .author-name {
            font-weight: 600;
            color: #1f2937;
            margin-bottom: 2px;
        }

        .author-level {
            font-size: 12px;
            color: #6b7280;
        }

        .post-stats {
            display: flex;
            gap: 16px;
            font-size: 14px;
            color: #6b7280;
        }

        .post-stat {
            display: flex;
            align-items: center;
            gap: 4px;
        }

        /* 게시글 내용 */
        .post-detail-content {
            padding: 24px;
            border-bottom: 1px solid #e5e7eb;
        }

        .post-content {
            line-height: 1.8;
            color: #374151;
            font-size: 16px;
        }

        .post-content p {
            margin-bottom: 16px;
        }

        .post-content ul {
            margin-left: 20px;
            margin-bottom: 16px;
        }

        .post-content li {
            margin-bottom: 8px;
        }

        /* 게시글 액션 */
        .post-actions {
            padding: 20px 24px;
            border-bottom: 1px solid #e5e7eb;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .action-buttons {
            display: flex;
            gap: 12px;
        }

        .action-btn {
            display: flex;
            align-items: center;
            gap: 6px;
            padding: 8px 16px;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            background: white;
            color: #6b7280;
            cursor: pointer;
            transition: all 0.2s;
            font-size: 14px;
        }

        .action-btn:hover {
            background-color: #f9fafb;
        }

        .action-btn.liked {
            color: #ef4444;
            border-color: #ef4444;
            background-color: #fef2f2;
        }

        .share-report {
            display: flex;
            gap: 8px;
        }

        .share-btn, .report-btn {
            background: none;
            border: none;
            color: #6b7280;
            cursor: pointer;
            padding: 8px;
            border-radius: 6px;
            transition: background-color 0.2s;
        }

        .share-btn:hover, .report-btn:hover {
            background-color: #f3f4f6;
        }

        /* 댓글 섹션 */
        .comments-section {
            padding: 24px;
        }

        .comments-header {
            display: flex;
            justify-content: between;
            align-items: center;
            margin-bottom: 20px;
        }

        .comments-title {
            font-size: 18px;
            font-weight: 600;
            color: #1f2937;
        }

        .comments-count {
            color: #3b82f6;
            margin-left: 8px;
        }

        /* 댓글 작성 */
        .comment-form {
            margin-bottom: 24px;
            padding: 16px;
            background-color: #f9fafb;
            border-radius: 8px;
        }

        .comment-input {
            width: 100%;
            min-height: 80px;
            padding: 12px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            resize: vertical;
            font-family: inherit;
            font-size: 14px;
            margin-bottom: 12px;
        }

        .comment-input:focus {
            outline: none;
            border-color: #3b82f6;
        }

        .comment-form-actions {
            display: flex;
            justify-content: flex-end;
            gap: 8px;
        }

        .btn-cancel {
            padding: 8px 16px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            background: white;
            color: #6b7280;
            cursor: pointer;
            font-size: 14px;
        }

        .btn-submit {
            padding: 8px 16px;
            border: none;
            border-radius: 6px;
            background: #3b82f6;
            color: white;
            cursor: pointer;
            font-size: 14px;
        }

        .btn-submit:hover {
            background: #2563eb;
        }

        /* 댓글 목록 */
        .comments-list {
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .comment-item {
            padding: 16px;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            background: white;
        }

        .comment-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 8px;
        }

        .comment-author {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .comment-avatar {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background-color: #f3f4f6;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            color: #6b7280;
        }

        .comment-author-name {
            font-weight: 500;
            color: #1f2937;
            font-size: 14px;
        }

        .comment-time {
            font-size: 12px;
            color: #9ca3af;
        }

        .comment-content {
            margin-bottom: 12px;
            color: #374151;
            font-size: 14px;
            line-height: 1.6;
        }

        .comment-actions {
            display: flex;
            gap: 12px;
        }

        .comment-action {
            background: none;
            border: none;
            color: #6b7280;
            cursor: pointer;
            font-size: 12px;
            display: flex;
            align-items: center;
            gap: 4px;
            padding: 4px 8px;
            border-radius: 4px;
            transition: background-color 0.2s;
        }

        .comment-action:hover {
            background-color: #f3f4f6;
        }

        .comment-action.liked {
            color: #ef4444;
        }

        /* 답글 */
        .reply-item {
            margin-left: 40px;
            margin-top: 12px;
            padding: 12px;
            background-color: #f9fafb;
            border-radius: 6px;
            border-left: 3px solid #3b82f6;
        }

        /* 관련 게시글 */
        .related-posts {
            margin-top: 40px;
        }

        .related-posts h3 {
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 20px;
            color: #1f2937;
        }

        .related-posts-list {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 16px;
        }

        .related-post-card {
            background: white;
            border-radius: 8px;
            padding: 16px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
            cursor: pointer;
            transition: all 0.2s;
            border: none;
            text-align: left;
            width: 100%;
        }

        .related-post-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }

        .related-post-category {
            font-size: 12px;
            color: #6b7280;
            margin-bottom: 8px;
        }

        .related-post-title {
            font-size: 16px;
            font-weight: 600;
            color: #1f2937;
            margin-bottom: 8px;
            line-height: 1.4;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .related-post-meta {
            display: flex;
            justify-content: space-between;
            font-size: 12px;
            color: #9ca3af;
        }

        /* 반응형 */
        @media (max-width: 768px) {
            .post-detail-meta {
                flex-direction: column;
                align-items: flex-start;
                gap: 12px;
            }

            .post-detail-title {
                font-size: 20px;
            }

            .action-buttons {
                flex-wrap: wrap;
            }

            .related-posts-list {
                grid-template-columns: 1fr;
            }

            .reply-item {
                margin-left: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="post-detail-container">
            <!-- 뒤로가기 버튼 -->
            <button class="back-button" onclick="goBack()">
                <span>←</span>
                커뮤니티로 돌아가기
            </button>
            
            <div class="post-detail">
                <!-- 게시글 헤더 -->
                <div class="post-detail-header">
                    <span class="post-category">후기</span>
                    <h1 class="post-detail-title">아이폰 14 Pro 구매 후기 - 정말 만족스러워요!</h1>
                    <div class="post-detail-meta">
                        <div class="post-author-info">
                            <div class="author-avatar">김</div>
                            <div class="author-details">
                                <span class="author-name">김철수</span>
                                <span class="author-level">활동 회원 · 가입 1년</span>
                            </div>
                        </div>
                        <div class="post-stats">
                            <div class="post-stat">
                                <span>🕒</span>
                                <span>2시간 전</span>
                            </div>
                            <div class="post-stat">
                                <span>👁️</span>
                                <span>156</span>
                            </div>
                            <div class="post-stat">
                                <span>❤️</span>
                                <span>24</span>
                            </div>
                            <div class="post-stat">
                                <span>💬</span>
                                <span>8</span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- 게시글 내용 -->
                <div class="post-detail-content">
                    <div class="post-content">
                        <p>안녕하세요! 중고마켓에서 아이폰 14 Pro를 구매한 후기를 공유하려고 합니다.</p>
                        
                        <p>처음에는 중고 제품이라 걱정이 많았는데, 판매자분이 정말 친절하시고 상품 상태도 설명 그대로였어요. 특히 다음 점들이 만족스러웠습니다:</p>
                        
                        <ul>
                            <li><strong>상품 상태:</strong> 설명과 100% 일치, 기스나 손상 전혀 없음</li>
                            <li><strong>배터리 효율:</strong> 100%로 새 제품과 동일</li>
                            <li><strong>구성품:</strong> 박스, 충전기, 이어폰 모두 포함</li>
                            <li><strong>거래 과정:</strong> 빠르고 안전한 직거래</li>
                            <li><strong>가격:</strong> 정가 대비 30만원 절약</li>
                        </ul>
                        
                        <p>판매자분께서 거래 전에 실제 사용 영상도 보내주시고, 직거래 시에도 충분히 확인할 시간을 주셔서 안심하고 구매할 수 있었습니다.</p>
                        
                        <p>중고 거래가 처음이라 많이 걱정했는데, 이런 좋은 경험 덕분에 앞으로도 중고마켓을 자주 이용할 것 같아요. 비슷한 고민을 하시는 분들께 도움이 되길 바랍니다!</p>
                        
                        <p><strong>추천도:</strong> ⭐⭐⭐⭐⭐ (5/5)</p>
                    </div>
                </div>
                
                <!-- 게시글 액션 -->
                <div class="post-actions">
                    <div class="action-buttons">
                        <button class="action-btn" onclick="toggleLike()">
                            <span>❤️</span>
                            <span>좋아요 24</span>
                        </button>
                        <button class="action-btn" onclick="toggleBookmark()">
                            <span>🔖</span>
                            <span>북마크</span>
                        </button>
                    </div>
                    <div class="share-report">
                        <button class="share-btn" onclick="sharePost()">🔗</button>
                        <button class="report-btn" onclick="reportPost()">🚨</button>
                    </div>
                </div>
                
                <!-- 댓글 섹션 -->
                <div class="comments-section">
                    <div class="comments-header">
                        <h3 class="comments-title">댓글 <span class="comments-count">8</span></h3>
                    </div>
                    
                    <!-- 댓글 작성 -->
                    <div class="comment-form">
                        <textarea class="comment-input" placeholder="댓글을 작성해주세요..." id="commentInput"></textarea>
                        <div class="comment-form-actions">
                            <button class="btn-cancel" onclick="cancelComment()">취소</button>
                            <button class="btn-submit" onclick="submitComment()">댓글 작성</button>
                        </div>
                    </div>
                    
                    <!-- 댓글 목록 -->
                    <div class="comments-list">
                        <div class="comment-item">
                            <div class="comment-header">
                                <div class="comment-author">
                                    <div class="comment-avatar">박</div>
                                    <span class="comment-author-name">박구매자</span>
                                </div>
                                <span class="comment-time">1시간 전</span>
                            </div>
                            <div class="comment-content">
                                저도 비슷한 고민을 하고 있었는데 후기 정말 도움이 됐어요! 혹시 판매자분 연락처 공유 가능한가요?
                            </div>
                            <div class="comment-actions">
                                <button class="comment-action" onclick="toggleCommentLike(1)">
                                    <span>❤️</span>
                                    <span>3</span>
                                </button>
                                <button class="comment-action" onclick="replyComment(1)">
                                    <span>💬</span>
                                    <span>답글</span>
                                </button>
                            </div>
                            
                            <!-- 답글 -->
                            <div class="reply-item">
                                <div class="comment-header">
                                    <div class="comment-author">
                                        <div class="comment-avatar">김</div>
                                        <span class="comment-author-name">김철수</span>
                                    </div>
                                    <span class="comment-time">30분 전</span>
                                </div>
                                <div class="comment-content">
                                    개인정보는 공유하기 어렵지만, 중고마켓에서 "아이폰 14 Pro"로 검색하시면 비슷한 매물들 많이 있어요!
                                </div>
                                <div class="comment-actions">
                                    <button class="comment-action" onclick="toggleCommentLike(2)">
                                        <span>❤️</span>
                                        <span>1</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                        
                        <div class="comment-item">
                            <div class="comment-header">
                                <div class="comment-author">
                                    <div class="comment-avatar">이</div>
                                    <span class="comment-author-name">이중고러</span>
                                </div>
                                <span class="comment-time">45분 전</span>
                            </div>
                            <div class="comment-content">
                                중고 거래 팁 공유해주셔서 감사해요. 저도 안전한 거래를 위해 참고하겠습니다!
                            </div>
                            <div class="comment-actions">
                                <button class="comment-action" onclick="toggleCommentLike(3)">
                                    <span>❤️</span>
                                    <span>5</span>
                                </button>
                                <button class="comment-action" onclick="replyComment(3)">
                                    <span>💬</span>
                                    <span>답글</span>
                                </button>
                            </div>
                        </div>
                        
                        <div class="comment-item">
                            <div class="comment-header">
                                <div class="comment-author">
                                    <div class="comment-avatar">최</div>
                                    <span class="comment-author-name">최애플</span>
                                </div>
                                <span class="comment-time">20분 전</span>
                            </div>
                            <div class="comment-content">
                                아이폰 14 Pro 정말 좋죠! 저도 중고로 구매했는데 만족하고 있어요. 좋은 후기 감사합니다 👍
                            </div>
                            <div class="comment-actions">
                                <button class="comment-action liked" onclick="toggleCommentLike(4)">
                                    <span>❤️</span>
                                    <span>2</span>
                                </button>
                                <button class="comment-action" onclick="replyComment(4)">
                                    <span>💬</span>
                                    <span>답글</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- 관련 게시글 -->
            <div class="related-posts">
                <h3>관련 게시글</h3>
                <div class="related-posts-list">
                    <button class="related-post-card" onclick="goToPost(1)">
                        <div class="related-post-category">정보</div>
                        <div class="related-post-title">중고 노트북 구매 시 체크포인트 공유합니다</div>
                        <div class="related-post-meta">
                            <span>테크러버</span>
                            <span>4시간 전</span>
                        </div>
                    </button>
                    
                    <button class="related-post-card" onclick="goToPost(2)">
                        <div class="related-post-category">주의사항</div>
                        <div class="related-post-title">사기 당할 뻔한 경험담 - 주의하세요!</div>
                        <div class="related-post-meta">
                            <span>안전거래</span>
                            <span>6시간 전</span>
                        </div>
                    </button>
                    
                    <button class="related-post-card" onclick="goToPost(3)">
                        <div class="related-post-category">질문</div>
                        <div class="related-post-title">애플워치 시리즈 8 vs 시리즈 9 비교</div>
                        <div class="related-post-meta">
                            <span>워치고민</span>
                            <span>1일 전</span>
                        </div>
                    </button>
                </div>
            </div>
        </div>
    </div>

    <script>
        // 좋아요 토글
        function toggleLike() {
            const btn = document.querySelector('.action-btn');
            const isLiked = btn.classList.contains('liked');
            
            if (isLiked) {
                btn.classList.remove('liked');
                btn.innerHTML = '<span>❤️</span><span>좋아요 23</span>';
                alert('좋아요를 취소했습니다.');
            } else {
                btn.classList.add('liked');
                btn.innerHTML = '<span>❤️</span><span>좋아요 25</span>';
                alert('좋아요를 눌렀습니다.');
            }
        }
        
        // 북마크 토글
        function toggleBookmark() {
            alert('게시글을 북마크에 저장했습니다.');
        }
        
        // 게시글 공유
        function sharePost() {
            navigator.clipboard.writeText(window.location.href).then(() => {
                alert('게시글 링크가 복사되었습니다.');
            });
        }
        
        // 게시글 신고
        function reportPost() {
            if (confirm('이 게시글을 신고하시겠습니까?')) {
                alert('신고가 접수되었습니다. 검토 후 조치하겠습니다.');
            }
        }
        
        // 댓글 작성
        function submitComment() {
            const input = document.getElementById('commentInput');
            const content = input.value.trim();
            
            if (!content) {
                alert('댓글 내용을 입력해주세요.');
                return;
            }
            
            // 새 댓글 추가 (실제로는 서버에 전송)
            const commentsList = document.querySelector('.comments-list');
            const newComment = document.createElement('div');
            newComment.className = 'comment-item';
            newComment.innerHTML = `
                <div class="comment-header">
                    <div class="comment-author">
                        <div class="comment-avatar">나</div>
                        <span class="comment-author-name">나</span>
                    </div>
                    <span class="comment-time">방금 전</span>
                </div>
                <div class="comment-content">${content}</div>
                <div class="comment-actions">
                    <button class="comment-action" onclick="toggleCommentLike(${Date.now()})">
                        <span>❤️</span>
                        <span>0</span>
                    </button>
                    <button class="comment-action" onclick="replyComment(${Date.now()})">
                        <span>💬</span>
                        <span>답글</span>
                    </button>
                </div>
            `;
            
            commentsList.appendChild(newComment);
            input.value = '';
            
            // 댓글 수 업데이트
            const commentsCount = document.querySelector('.comments-count');
            const currentCount = parseInt(commentsCount.textContent);
            commentsCount.textContent = currentCount + 1;
            
            alert('댓글이 작성되었습니다.');
        }
        
        // 댓글 작성 취소
        function cancelComment() {
            document.getElementById('commentInput').value = '';
        }
        
        // 댓글 좋아요 토글
        function toggleCommentLike(id) {
            const btn = event.target.closest('.comment-action');
            const isLiked = btn.classList.contains('liked');
            const countSpan = btn.querySelector('span:last-child');
            const currentCount = parseInt(countSpan.textContent);
            
            if (isLiked) {
                btn.classList.remove('liked');
                countSpan.textContent = currentCount - 1;
            } else {
                btn.classList.add('liked');
                countSpan.textContent = currentCount + 1;
            }
        }
        
        // 답글 작성
        function replyComment(id) {
            alert(`댓글 ${id}에 답글을 작성합니다.`);
        }
        
        // 관련 게시글로 이동
        function goToPost(id) {
            alert(`게시글 ${id}번으로 이동합니다.`);
        }
        
        // 뒤로가기
        function goBack() {
            alert('커뮤니티 목록으로 돌아갑니다.');
        }
    </script>
</body>
</html>
