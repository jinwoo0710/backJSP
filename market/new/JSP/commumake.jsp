<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>커뮤니티 게시글 등록 - 중고마켓</title>
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
            max-width: 800px;
            margin: 0 auto;
            padding: 0 20px;
        }

        /* 헤더 */
        .page-header {
            background: white;
            border-radius: 12px;
            padding: 24px;
            margin: 24px 0;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .page-title {
            font-size: 28px;
            font-weight: 700;
            color: #1f2937;
            margin-bottom: 8px;
        }

        .page-subtitle {
            font-size: 14px;
            color: #6b7280;
        }

        /* 섹션 */
        .section {
            background: white;
            border-radius: 12px;
            padding: 24px;
            margin-bottom: 24px;
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

        .section.danger {
            border-left: 4px solid #ef4444;
        }

        .section.danger .section-title {
            color: #ef4444;
        }

        /* 폼 요소 */
        .form-group {
            margin-bottom: 20px;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
        }

        .form-label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            color: #4b5563;
            margin-bottom: 8px;
        }

        .form-label .required {
            color: #ef4444;
            margin-left: 4px;
        }

        .form-input {
            width: 100%;
            padding: 12px;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            font-size: 16px;
            transition: all 0.2s;
        }

        .form-input:focus {
            outline: none;
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.2);
        }

        .form-input:disabled {
            background-color: #f9fafb;
            color: #6b7280;
            cursor: not-allowed;
        }

        .form-input.error {
            border-color: #ef4444;
        }

        .form-input.success {
            border-color: #10b981;
        }

        .form-textarea {
            min-height: 200px;
            resize: vertical;
        }

        .form-select {
            width: 100%;
            padding: 12px;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            font-size: 16px;
            background-color: white;
            cursor: pointer;
        }

        .form-error {
            font-size: 12px;
            color: #ef4444;
            margin-top: 4px;
            display: none;
        }

        .form-error.visible {
            display: block;
        }

        .form-success {
            font-size: 12px;
            color: #10b981;
            margin-top: 4px;
            display: none;
        }

        .form-success.visible {
            display: block;
        }

        .form-hint {
            font-size: 12px;
            color: #6b7280;
            margin-top: 4px;
        }

        .char-counter {
            font-size: 12px;
            color: #6b7280;
            text-align: right;
            margin-top: 4px;
        }

        /* 이미지 업로드 */
        .image-upload {
            border: 2px dashed #d1d5db;
            border-radius: 8px;
            padding: 24px;
            text-align: center;
            cursor: pointer;
            transition: all 0.2s;
            margin-bottom: 16px;
        }

        .image-upload:hover {
            border-color: #3b82f6;
            background-color: #f8faff;
        }

        .image-upload.dragover {
            border-color: #3b82f6;
            background-color: #f0f9ff;
        }

        .upload-icon {
            font-size: 48px;
            color: #9ca3af;
            margin-bottom: 12px;
        }

        .upload-text {
            font-size: 16px;
            color: #4b5563;
            margin-bottom: 8px;
        }

        .upload-hint {
            font-size: 14px;
            color: #6b7280;
        }

        .image-preview {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
            gap: 12px;
            margin-top: 16px;
        }

        .image-preview-item {
            position: relative;
            width: 120px;
            height: 120px;
            border-radius: 8px;
            overflow: hidden;
            border: 1px solid #d1d5db;
        }

        .image-preview-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .image-remove-btn {
            position: absolute;
            top: 4px;
            right: 4px;
            width: 24px;
            height: 24px;
            background: rgba(0, 0, 0, 0.7);
            color: white;
            border: none;
            border-radius: 50%;
            cursor: pointer;
            font-size: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        /* 카테고리 선택 */
        .category-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
            gap: 12px;
            margin-top: 8px;
        }

        .category-item {
            position: relative;
        }

        .category-item input[type="radio"] {
            position: absolute;
            width: 1px;
            height: 1px;
            padding: 0;
            margin: -1px;
            overflow: hidden;
            clip: rect(0, 0, 0, 0);
            white-space: nowrap;
            border: 0;
        }

        .category-label {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 16px 12px;
            border: 2px solid #e5e7eb;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.2s;
            text-align: center;
        }

        .category-item input[type="radio"]:checked + .category-label {
            border-color: #3b82f6;
            background-color: #f0f9ff;
        }

        .category-icon {
            font-size: 24px;
            margin-bottom: 8px;
        }

        .category-text {
            font-size: 14px;
            font-weight: 600;
            color: #374151;
        }

        /* 버튼 */
        .btn {
            padding: 12px 24px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s;
            border: none;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
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

        .btn:disabled {
            background-color: #d1d5db;
            color: #9ca3af;
            cursor: not-allowed;
        }

        /* 액션 버튼 */
        .form-actions {
            display: flex;
            gap: 12px;
            justify-content: flex-end;
            margin-top: 32px;
        }

        /* 경고 메시지 */
        .warning-box {
            background-color: #fef3c7;
            border: 1px solid #f59e0b;
            border-radius: 8px;
            padding: 16px;
            margin-bottom: 20px;
        }

        .warning-title {
            font-weight: 600;
            color: #92400e;
            margin-bottom: 8px;
        }

        .warning-list {
            list-style: none;
            margin: 0;
            padding: 0;
        }

        .warning-list li {
            color: #92400e;
            font-size: 14px;
            margin-bottom: 4px;
            padding-left: 16px;
            position: relative;
        }

        .warning-list li:before {
            content: "•";
            position: absolute;
            left: 0;
        }

        /* 반응형 */
        @media (max-width: 768px) {
            .form-row {
                grid-template-columns: 1fr;
            }

            .category-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .form-actions {
                flex-direction: column;
            }

            .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- 페이지 헤더 -->
        <div class="page-header">
            <h1 class="page-title">💬 커뮤니티 게시글 등록</h1>
            <p class="page-subtitle">다양한 주제로 소통하고 정보를 공유해보세요</p>
        </div>

        <form action="commumakePro.jsp" method="post" enctype="multipart/form-data" id="communityForm">
            <!-- 주의사항 -->
            <div class="section danger">
                <h2 class="section-title">⚠️ 게시글 작성 규칙</h2>
                <div class="warning-box">
                    <div class="warning-title">커뮤니티 이용 규칙을 준수해주세요</div>
                    <ul class="warning-list">
                        <li>타인에게 불쾌감을 주는 내용은 삼가해주세요</li>
                        <li>개인정보나 연락처 공개는 피해주세요</li>
                        <li>상업적 광고나 스팸성 게시글은 금지됩니다</li>
                        <li>저작권을 침해하는 내용은 게시할 수 없습니다</li>
                        <li>허위사실 유포나 악의적인 게시글은 제재될 수 있습니다</li>
                    </ul>
                </div>
            </div>

            <!-- 기본 정보 -->
            <div class="section">
                <h2 class="section-title">📝 기본 정보</h2>
                
                <div class="form-group">
                    <label class="form-label">
                        카테고리<span class="required">*</span>
                    </label>
                    <div class="category-grid">
                        <div class="category-item">
                            <input type="radio" id="free" name="category" value="자유게시판" required>
                            <label for="free" class="category-label">
                                <div class="category-icon">💭</div>
                                <div class="category-text">자유게시판</div>
                            </label>
                        </div>
                        <div class="category-item">
                            <input type="radio" id="info" name="category" value="정보공유" required>
                            <label for="info" class="category-label">
                                <div class="category-icon">📢</div>
                                <div class="category-text">정보공유</div>
                            </label>
                        </div>
                        <div class="category-item">
                            <input type="radio" id="question" name="category" value="질문답변" required>
                            <label for="question" class="category-label">
                                <div class="category-icon">❓</div>
                                <div class="category-text">질문답변</div>
                            </label>
                        </div>
                        <div class="category-item">
                            <input type="radio" id="review" name="category" value="후기리뷰" required>
                            <label for="review" class="category-label">
                                <div class="category-icon">⭐</div>
                                <div class="category-text">후기리뷰</div>
                            </label>
                        </div>
                        <div class="category-item">
                            <input type="radio" id="tips" name="category" value="꿀팁공유" required>
                            <label for="tips" class="category-label">
                                <div class="category-icon">💡</div>
                                <div class="category-text">꿀팁공유</div>
                            </label>
                        </div>
                        <div class="category-item">
                            <input type="radio" id="etc" name="category" value="기타" required>
                            <label for="etc" class="category-label">
                                <div class="category-icon">📦</div>
                                <div class="category-text">기타</div>
                            </label>
                        </div>
                    </div>
                    <div class="form-error" id="categoryError">카테고리를 선택해주세요</div>
                </div>

                <div class="form-group">
                    <label class="form-label" for="title">
                        제목<span class="required">*</span>
                    </label>
                    <input type="text" id="title" name="title" class="form-input" 
                           placeholder="게시글 제목을 입력하세요" required maxlength="100">
                    <div class="char-counter">
                        <span id="titleCount">0</span>/100
                    </div>
                    <div class="form-error" id="titleError">제목을 입력해주세요</div>
                </div>

                <div class="form-group">
                    <label class="form-label" for="content">
                        내용<span class="required">*</span>
                    </label>
                    <textarea id="content" name="content" class="form-input form-textarea" 
                              placeholder="게시글 내용을 작성해주세요&#10;&#10;• 다른 사용자들에게 도움이 되는 내용을 작성해주세요&#10;• 정확하고 구체적인 정보를 제공해주세요&#10;• 예의를 지켜 작성해주세요" 
                              required maxlength="2000"></textarea>
                    <div class="char-counter">
                        <span id="contentCount">0</span>/2000
                    </div>
                    <div class="form-error" id="contentError">내용을 입력해주세요</div>
                </div>
            </div>

            <!-- 이미지 첨부 -->
            <div class="section">
                <h2 class="section-title">📷 이미지 첨부</h2>
                
                <div class="image-upload" id="imageUpload">
                    <div class="upload-icon">📷</div>
                    <div class="upload-text">이미지를 첨부하세요 (선택사항)</div>
                    <div class="upload-hint">클릭하거나 파일을 드래그하여 업로드 (최대 5장, 10MB 이하)</div>
                    <input type="file" id="imageInput" name="images" multiple accept="image/*" style="display: none;">
                </div>
                
                <div class="image-preview" id="imagePreview"></div>
                <div class="form-error" id="imageError"></div>
            </div>

            <!-- 폼 액션 -->
            <div class="form-actions">
                <button type="button" class="btn btn-outline" onclick="history.back()">
                    취소
                </button>
                <button type="submit" class="btn btn-primary" id="submitBtn">
                    💬 게시글 등록
                </button>
            </div>
        </form>
    </div>

    <script>
        // 폼 요소들
        const form = document.getElementById('communityForm');
        const titleInput = document.getElementById('title');
        const contentInput = document.getElementById('content');
        const imageInput = document.getElementById('imageInput');
        const imageUpload = document.getElementById('imageUpload');
        const imagePreview = document.getElementById('imagePreview');
        
        let selectedImages = [];

        // 문자 수 카운터
        titleInput.addEventListener('input', function() {
            updateCharCounter('title', 'titleCount', 100);
        });

        contentInput.addEventListener('input', function() {
            updateCharCounter('content', 'contentCount', 2000);
        });

        function updateCharCounter(inputId, counterId, maxLength) {
            const input = document.getElementById(inputId);
            const counter = document.getElementById(counterId);
            const length = input.value.length;
            
            counter.textContent = length;
            
            if (length > maxLength * 0.9) {
                counter.style.color = '#ef4444';
            } else if (length > maxLength * 0.7) {
                counter.style.color = '#f59e0b';
            } else {
                counter.style.color = '#6b7280';
            }
        }

        // 이미지 업로드
        imageUpload.addEventListener('click', function() {
            imageInput.click();
        });

        imageUpload.addEventListener('dragover', function(e) {
            e.preventDefault();
            this.classList.add('dragover');
        });

        imageUpload.addEventListener('dragleave', function(e) {
            e.preventDefault();
            this.classList.remove('dragover');
        });

        imageUpload.addEventListener('drop', function(e) {
            e.preventDefault();
            this.classList.remove('dragover');
            
            const files = Array.from(e.dataTransfer.files);
            handleImageFiles(files);
        });

        imageInput.addEventListener('change', function() {
            const files = Array.from(this.files);
            handleImageFiles(files);
        });

        function handleImageFiles(files) {
            const imageFiles = files.filter(file => file.type.startsWith('image/'));
            
            if (selectedImages.length + imageFiles.length > 5) {
                showError('imageError', '최대 5장까지 업로드 가능합니다.');
                return;
            }

            imageFiles.forEach(file => {
                if (file.size > 10 * 1024 * 1024) {
                    showError('imageError', '파일 크기는 10MB 이하여야 합니다.');
                    return;
                }

                selectedImages.push(file);
                displayImagePreview(file);
            });

            hideError('imageError');
        }

        function displayImagePreview(file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                const previewItem = document.createElement('div');
                previewItem.className = 'image-preview-item';
                previewItem.innerHTML = `
                    <img src="${e.target.result}" alt="미리보기">
                    <button type="button" class="image-remove-btn" onclick="removeImage(${selectedImages.length - 1})">×</button>
                `;
                imagePreview.appendChild(previewItem);
            };
            reader.readAsDataURL(file);
        }

        function removeImage(index) {
            selectedImages.splice(index, 1);
            updateImagePreview();
        }

        function updateImagePreview() {
            imagePreview.innerHTML = '';
            selectedImages.forEach((file, index) => {
                displayImagePreview(file);
            });
        }

        // 폼 검증
        function validateForm() {
            let isValid = true;

            // 카테고리 검증
            const category = document.querySelector('input[name="category"]:checked');
            if (!category) {
                showError('categoryError', '카테고리를 선택해주세요.');
                isValid = false;
            } else {
                hideError('categoryError');
            }

            // 제목 검증
            if (!titleInput.value.trim()) {
                showError('titleError', '제목을 입력해주세요.');
                isValid = false;
            } else {
                hideError('titleError');
            }

            // 내용 검증
            if (!contentInput.value.trim()) {
                showError('contentError', '내용을 입력해주세요.');
                isValid = false;
            } else if (contentInput.value.trim().length < 10) {
                showError('contentError', '내용을 10자 이상 입력해주세요.');
                isValid = false;
            } else {
                hideError('contentError');
            }

            return isValid;
        }

        function showError(errorId, message) {
            const errorElement = document.getElementById(errorId);
            errorElement.textContent = message;
            errorElement.classList.add('visible');
        }

        function hideError(errorId) {
            const errorElement = document.getElementById(errorId);
            errorElement.classList.remove('visible');
        }

        // 폼 제출
        form.addEventListener('submit', function(e) {
            e.preventDefault();
            
            if (!validateForm()) {
                return;
            }

            // 이미지 파일들을 FormData에 추가
            const formData = new FormData(form);
            
            // 기존 images 제거
            formData.delete('images');
            
            // 선택된 이미지들 추가
            selectedImages.forEach((file, index) => {
                formData.append('images', file);
            });

            // 제출 버튼 비활성화
            const submitBtn = document.getElementById('submitBtn');
            submitBtn.disabled = true;
            submitBtn.textContent = '등록 중...';

            // 폼 제출
            fetch('commumakePro.jsp', {
                method: 'POST',
                body: formData
            })
            .then(response => {
                if (response.ok) {
                    alert('게시글이 성공적으로 등록되었습니다.');
                    location.href = 'community.jsp';
                } else {
                    throw new Error('등록 실패');
                }
            })
            .catch(error => {
                alert('등록 중 오류가 발생했습니다. 다시 시도해주세요.');
                submitBtn.disabled = false;
                submitBtn.textContent = '💬 게시글 등록';
            });
        });
    </script>
</body>
</html>