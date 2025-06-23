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
    <title>판매하기 - 중고마켓</title>
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

        .form-textarea {
            min-height: 120px;
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

        /* 인풋 그룹 */
        .input-group {
            display: flex;
            gap: 8px;
        }

        .input-group .form-input {
            flex: 1;
        }

        /* 이미지 업로드 */
        .image-upload-area {
            border: 2px dashed #d1d5db;
            border-radius: 8px;
            padding: 24px;
            text-align: center;
            background-color: #f9fafb;
            transition: all 0.2s;
            cursor: pointer;
        }

        .image-upload-area:hover {
            border-color: #3b82f6;
            background-color: #f0f9ff;
        }

        .image-upload-area.dragover {
            border-color: #3b82f6;
            background-color: #dbeafe;
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

        /* 상품 상태 선택 */
        .condition-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 12px;
            margin-top: 8px;
        }

        .condition-item {
            position: relative;
        }

        .condition-item input[type="radio"] {
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

        .condition-label {
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

        .condition-item input[type="radio"]:checked + .condition-label {
            border-color: #3b82f6;
            background-color: #f0f9ff;
        }

        .condition-icon {
            font-size: 24px;
            margin-bottom: 8px;
        }

        .condition-text {
            font-size: 14px;
            font-weight: 600;
            color: #374151;
        }

        .condition-desc {
            font-size: 12px;
            color: #6b7280;
            margin-top: 4px;
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

        /* 반응형 */
        @media (max-width: 768px) {
            .form-row {
                grid-template-columns: 1fr;
            }

            .condition-grid {
                grid-template-columns: 1fr;
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
            <h1 class="page-title">🛍️ 판매하기</h1>
            <p class="page-subtitle">안전하고 편리한 중고거래를 시작하세요</p>
        </div>

        <form action="sellmakePro.jsp" method="post" enctype="multipart/form-data" id="sellForm">
            <!-- 상품 이미지 -->
            <div class="section">
                <h2 class="section-title">📷 상품 이미지</h2>
                
                <div class="image-upload-area" id="imageUploadArea">
                    <div class="upload-icon">📷</div>
                    <div class="upload-text">상품 이미지를 업로드하세요</div>
                    <div class="upload-hint">클릭하거나 파일을 드래그하여 업로드 (최대 8장, 10MB 이하)</div>
                    <input type="file" id="imageInput" name="images" multiple accept="image/*" style="display: none;">
                </div>
                
                <div class="image-preview" id="imagePreview"></div>
                <div class="form-error" id="imageError"></div>
            </div>

            <!-- 기본 정보 -->
            <div class="section">
                <h2 class="section-title">📝 기본 정보</h2>
                
                <div class="form-group">
                    <label class="form-label" for="title">
                        상품명<span class="required">*</span>
                    </label>
                    <input type="text" id="title" name="title" class="form-input" 
                           placeholder="상품명을 입력하세요" required maxlength="100">
                    <div class="char-counter">
                        <span id="titleCount">0</span>/100
                    </div>
                    <div class="form-error" id="titleError">상품명을 입력해주세요</div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label" for="category">
                            카테고리<span class="required">*</span>
                        </label>
                        <select id="category" name="category" class="form-select" required>
                            <option value="">카테고리 선택</option>
                            <option value="전자기기">전자기기</option>
                            <option value="가전제품">가전제품</option>
                            <option value="패션의류">패션의류</option>
                            <option value="뷰티미용">뷰티미용</option>
                            <option value="스포츠레저">스포츠레저</option>
                            <option value="도서음반">도서음반</option>
                            <option value="생활용품">생활용품</option>
                            <option value="기타">기타</option>
                        </select>
                        <div class="form-error" id="categoryError">카테고리를 선택해주세요</div>
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="price">
                            판매 가격<span class="required">*</span>
                        </label>
                        <div class="input-group">
                            <input type="number" id="price" name="price" class="form-input" 
                                   placeholder="0" min="0" max="999999999" required>
                            <span style="display: flex; align-items: center; padding: 0 12px; background: #f3f4f6; border: 1px solid #d1d5db; border-radius: 8px;">원</span>
                        </div>
                        <div class="form-error" id="priceError">가격을 입력해주세요</div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label" for="content">
                        상품 설명<span class="required">*</span>
                    </label>
                    <textarea id="content" name="content" class="form-input form-textarea" 
                              placeholder="상품에 대한 자세한 설명을 작성해주세요&#10;- 상품의 상태, 브랜드, 모델명 등&#10;- 구매 시기, 사용 기간&#10;- 하자 여부, 기타 특이사항" 
                              required maxlength="1000"></textarea>
                    <div class="char-counter">
                        <span id="contentCount">0</span>/1000
                    </div>
                    <div class="form-error" id="contentError">상품 설명을 입력해주세요</div>
                </div>
            </div>

            <!-- 상품 상태 -->
            <div class="section">
                <h2 class="section-title">🔍 상품 상태</h2>
                
                <div class="form-group">
                    <label class="form-label">
                        상품 상태<span class="required">*</span>
                    </label>
                    <div class="condition-grid">
                        <div class="condition-item">
                            <input type="radio" id="new" name="condition" value="새상품" required>
                            <label for="new" class="condition-label">
                                <div class="condition-icon">✨</div>
                                <div class="condition-text">새상품</div>
                                <div class="condition-desc">미개봉 새상품</div>
                            </label>
                        </div>
                        <div class="condition-item">
                            <input type="radio" id="like_new" name="condition" value="거의새것" required>
                            <label for="like_new" class="condition-label">
                                <div class="condition-icon">⭐</div>
                                <div class="condition-text">거의 새것</div>
                                <div class="condition-desc">사용감 거의 없음</div>
                            </label>
                        </div>
                        <div class="condition-item">
                            <input type="radio" id="good" name="condition" value="좋음" required>
                            <label for="good" class="condition-label">
                                <div class="condition-icon">👍</div>
                                <div class="condition-text">좋음</div>
                                <div class="condition-desc">약간의 사용감</div>
                            </label>
                        </div>
                        <div class="condition-item">
                            <input type="radio" id="fair" name="condition" value="보통" required>
                            <label for="fair" class="condition-label">
                                <div class="condition-icon">👌</div>
                                <div class="condition-text">보통</div>
                                <div class="condition-desc">사용감 있음</div>
                            </label>
                        </div>
                    </div>
                    <div class="form-error" id="conditionError">상품 상태를 선택해주세요</div>
                </div>
            </div>

            <!-- 거래 정보 -->
            <div class="section">
                <h2 class="section-title">🤝 거래 정보</h2>
                
                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label" for="location">
                            거래 지역<span class="required">*</span>
                        </label>
                        <input type="text" id="location" name="location" class="form-input" 
                               placeholder="예: 서울 강남구" required maxlength="50">
                        <div class="form-hint">직거래 가능한 지역을 입력하세요</div>
                        <div class="form-error" id="locationError">거래 지역을 입력해주세요</div>
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="phone">
                            연락처
                        </label>
                        <input type="tel" id="phone" name="phone" class="form-input" 
                               placeholder="010-0000-0000" maxlength="20">
                        <div class="form-hint">연락받을 전화번호 (선택사항)</div>
                    </div>
                </div>
            </div>

            <!-- 폼 액션 -->
            <div class="form-actions">
                <button type="button" class="btn btn-outline" onclick="history.back()">
                    취소
                </button>
                <button type="submit" class="btn btn-primary" id="submitBtn">
                    🛍️ 상품 등록하기
                </button>
            </div>
        </form>
    </div>

    <script>
        // 폼 요소들
        const form = document.getElementById('sellForm');
        const titleInput = document.getElementById('title');
        const contentInput = document.getElementById('content');
        const priceInput = document.getElementById('price');
        const imageInput = document.getElementById('imageInput');
        const imageUploadArea = document.getElementById('imageUploadArea');
        const imagePreview = document.getElementById('imagePreview');
        
        let selectedImages = [];

        // 문자 수 카운터
        titleInput.addEventListener('input', function() {
            updateCharCounter('title', 'titleCount', 100);
        });

        contentInput.addEventListener('input', function() {
            updateCharCounter('content', 'contentCount', 1000);
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

        // 가격 입력 처리 (input type="number" 호환)
        priceInput.addEventListener('input', function() {
            // input type="number"는 자동으로 숫자만 허용하므로 별도 처리 불필요
            // 단, 최대값 체크만 수행
            if (this.value && parseInt(this.value) > 999999999) {
                this.value = '999999999';
            }
        });

        // 이미지 업로드
        imageUploadArea.addEventListener('click', function() {
            imageInput.click();
        });

        imageUploadArea.addEventListener('dragover', function(e) {
            e.preventDefault();
            this.classList.add('dragover');
        });

        imageUploadArea.addEventListener('dragleave', function(e) {
            e.preventDefault();
            this.classList.remove('dragover');
        });

        imageUploadArea.addEventListener('drop', function(e) {
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
            
            if (selectedImages.length + imageFiles.length > 8) {
                showError('imageError', '최대 8장까지 업로드 가능합니다.');
                return;
            }

            imageFiles.forEach(file => {
                if (file.size > 10 * 1024 * 1024) {
                    showError('imageError', '파일 크기는 10MB 이하여야 합니다.');
                    return;
                }

                const index = selectedImages.length;
                selectedImages.push(file);
                displayImagePreview(file, index);
            });

            hideError('imageError');
        }

        function displayImagePreview(file, index) {
            const reader = new FileReader();
            reader.onload = function(e) {
                const previewItem = document.createElement('div');
                previewItem.className = 'image-preview-item';
                previewItem.setAttribute('data-index', index);
                previewItem.innerHTML = `
                    <img src="${e.target.result}" alt="미리보기">
                    <button type="button" class="image-remove-btn" onclick="removeImage(${index})">×</button>
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
                displayImagePreview(file, index);
            });
        }

        // 폼 검증
        function validateForm() {
            let isValid = true;

            // 제목 검증
            if (!titleInput.value.trim()) {
                showError('titleError', '상품명을 입력해주세요.');
                isValid = false;
            } else {
                hideError('titleError');
            }

            // 카테고리 검증
            const category = document.getElementById('category');
            if (!category.value) {
                showError('categoryError', '카테고리를 선택해주세요.');
                isValid = false;
            } else {
                hideError('categoryError');
            }

            // 가격 검증
            if (!priceInput.value || parseInt(priceInput.value) <= 0) {
                showError('priceError', '올바른 가격을 입력해주세요.');
                isValid = false;
            } else {
                hideError('priceError');
            }

            // 내용 검증
            if (!contentInput.value.trim()) {
                showError('contentError', '상품 설명을 입력해주세요.');
                isValid = false;
            } else {
                hideError('contentError');
            }

            // 상품 상태 검증
            const condition = document.querySelector('input[name="condition"]:checked');
            if (!condition) {
                showError('conditionError', '상품 상태를 선택해주세요.');
                isValid = false;
            } else {
                hideError('conditionError');
            }

            // 지역 검증
            const location = document.getElementById('location');
            if (!location.value.trim()) {
                showError('locationError', '거래 지역을 입력해주세요.');
                isValid = false;
            } else {
                hideError('locationError');
            }

            // 이미지 검증
            if (selectedImages.length === 0) {
                showError('imageError', '최소 1장의 상품 이미지를 업로드해주세요.');
                isValid = false;
            } else {
                hideError('imageError');
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

            // 가격 값은 이미 숫자 형태이므로 별도 처리 불필요

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
            fetch('sellmakePro.jsp', {
                method: 'POST',
                body: formData
            })
            .then(response => {
                if (response.ok) {
                    alert('상품이 성공적으로 등록되었습니다.');
                    location.href = 'sell.jsp';
                } else {
                    throw new Error('등록 실패');
                }
            })
            .catch(error => {
                alert('등록 중 오류가 발생했습니다. 다시 시도해주세요.');
                submitBtn.disabled = false;
                submitBtn.textContent = '🛍️ 상품 등록하기';
            });
        });
    </script>
</body>
</html>