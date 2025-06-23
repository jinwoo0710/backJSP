<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>구매 요청 수정 - 중고마켓</title>
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

        .section.urgent {
            border-left: 4px solid #f59e0b;
        }

        .section.urgent .section-title {
            color: #f59e0b;
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

        .form-input.error {
            border-color: #ef4444;
        }

        .form-input.success {
            border-color: #10b981;
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
            font-size: 12px;
            color: #6b7280;
        }

        .image-preview {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
            gap: 12px;
            margin-top: 16px;
        }

        .image-item {
            position: relative;
            aspect-ratio: 1;
            border-radius: 8px;
            overflow: hidden;
            border: 1px solid #e5e7eb;
        }

        .image-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .image-remove {
            position: absolute;
            top: 4px;
            right: 4px;
            width: 24px;
            height: 24px;
            background-color: rgba(0, 0, 0, 0.7);
            color: white;
            border: none;
            border-radius: 50%;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
        }

        /* 라디오 그룹 */
        .radio-group {
            display: flex;
            gap: 16px;
            flex-wrap: wrap;
        }

        .radio-item {
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 8px 12px;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.2s;
        }

        .radio-item:hover {
            border-color: #3b82f6;
            background-color: #f0f9ff;
        }

        .radio-item.selected {
            border-color: #3b82f6;
            background-color: #dbeafe;
        }

        .radio-item input[type="radio"] {
            margin: 0;
        }

        .radio-item label {
            font-size: 14px;
            color: #4b5563;
            cursor: pointer;
            margin: 0;
        }

        /* 체크박스 그룹 */
        .checkbox-group {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .checkbox-item {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .checkbox-item input[type="checkbox"] {
            width: 18px;
            height: 18px;
            accent-color: #3b82f6;
        }

        .checkbox-item label {
            font-size: 14px;
            color: #4b5563;
            cursor: pointer;
        }

        /* 가격 입력 */
        .price-input {
            position: relative;
        }

        .price-input .currency {
            position: absolute;
            right: 12px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 14px;
            color: #6b7280;
            pointer-events: none;
        }

        .price-input .form-input {
            padding-right: 40px;
        }

        /* 버튼 */
        .btn {
            padding: 12px 16px;
            border-radius: 8px;
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

        .btn-disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }

        .btn-sm {
            padding: 8px 12px;
            font-size: 12px;
        }

        /* 액션 버튼 */
        .form-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 12px;
            margin-top: 32px;
            padding-top: 24px;
            border-top: 1px solid #e5e7eb;
        }

        .action-left {
            display: flex;
            gap: 12px;
        }

        .action-right {
            display: flex;
            gap: 12px;
        }

        /* 알림 */
        .alert {
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 14px;
            display: none;
        }

        .alert.visible {
            display: block;
        }

        .alert-success {
            background-color: #d1fae5;
            color: #065f46;
            border: 1px solid #a7f3d0;
        }

        .alert-error {
            background-color: #fee2e2;
            color: #991b1b;
            border: 1px solid #fca5a5;
        }

        .alert-warning {
            background-color: #fef3c7;
            color: #92400e;
            border: 1px solid #fcd34d;
        }

        /* 긴급 표시 */
        .urgent-badge {
            display: inline-flex;
            align-items: center;
            gap: 4px;
            padding: 4px 8px;
            background-color: #fef3c7;
            color: #92400e;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 500;
        }

        /* 반응형 */
        @media (max-width: 768px) {
            .container {
                padding: 0 16px;
            }

            .page-header {
                margin: 16px 0;
                padding: 16px;
            }

            .section {
                padding: 16px;
                margin-bottom: 16px;
            }

            .form-row {
                grid-template-columns: 1fr;
            }

            .radio-group {
                flex-direction: column;
            }

            .form-actions {
                flex-direction: column;
            }

            .action-left,
            .action-right {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- 페이지 헤더 -->
        <div class="page-header">
            <h1 class="page-title">구매 요청 수정</h1>
            <p class="page-subtitle">원하는 상품의 구매 요청을 수정하세요</p>
        </div>

        <form id="buyRequestForm">
            <!-- 알림 메시지 -->
            <div class="alert alert-success" id="successAlert">
                구매 요청이 성공적으로 수정되었습니다.
            </div>
            
            <div class="alert alert-error" id="errorAlert">
                오류가 발생했습니다. 다시 시도해주세요.
            </div>

            <!-- 기본 정보 섹션 -->
            <div class="section">
                <h2 class="section-title">📝 기본 정보</h2>
                
                <div class="form-group">
                    <label for="title" class="form-label">제목<span class="required">*</span></label>
                    <input type="text" id="title" class="form-input" value="아이폰 14 Pro 구매합니다" placeholder="구매하고 싶은 상품을 입력하세요" maxlength="50" required>
                    <div class="char-counter">
                        <span id="titleCount">15</span>/50자
                    </div>
                    <div class="form-error" id="titleError">제목을 입력해주세요.</div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="category" class="form-label">카테고리<span class="required">*</span></label>
                        <select id="category" class="form-select" required>
                            <option value="">카테고리 선택</option>
                            <option value="electronics" selected>전자기기</option>
                            <option value="fashion">의류/패션</option>
                            <option value="beauty">뷰티/미용</option>
                            <option value="home">생활용품</option>
                            <option value="sports">스포츠/레저</option>
                            <option value="books">도서/음반</option>
                            <option value="toys">완구/취미</option>
                            <option value="etc">기타</option>
                        </select>
                        <div class="form-error" id="categoryError">카테고리를 선택해주세요.</div>
                    </div>

                    <div class="form-group">
                        <label for="budget" class="form-label">희망 가격<span class="required">*</span></label>
                        <div class="price-input">
                            <input type="number" id="budget" class="form-input" value="850000" placeholder="0" min="1000" max="10000000" required>
                            <span class="currency">원</span>
                        </div>
                        <div class="form-hint">1,000원 ~ 10,000,000원</div>
                        <div class="form-error" id="budgetError">희망 가격을 입력해주세요.</div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label">긴급도</label>
                    <div class="radio-group">
                        <div class="radio-item selected">
                            <input type="radio" id="normal" name="urgency" value="normal" checked>
                            <label for="normal">일반</label>
                        </div>
                        <div class="radio-item">
                            <input type="radio" id="urgent" name="urgency" value="urgent">
                            <label for="urgent">급구 <span class="urgent-badge">🔥 급구</span></label>
                        </div>
                    </div>
                    <div class="form-hint">급구로 설정하면 더 많은 판매자에게 노출됩니다.</div>
                </div>
            </div>

            <!-- 상세 설명 섹션 -->
            <div class="section">
                <h2 class="section-title">📋 상세 설명</h2>
                
                <div class="form-group">
                    <label for="description" class="form-label">구매 요청 내용<span class="required">*</span></label>
                    <textarea id="description" class="form-input form-textarea" placeholder="원하는 상품의 상세 조건을 작성해주세요&#10;예: 색상, 용량, 상태, 구매 시기 등" maxlength="1000" required>아이폰 14 Pro 128GB 딥퍼플 색상으로 구매하고 싶습니다.
배터리 성능 80% 이상, 외관 상태 양호한 제품을 찾고 있습니다.
박스와 충전기 포함이면 더 좋겠습니다.
직거래 가능하며 빠른 거래 원합니다.</textarea>
                    <div class="char-counter">
                        <span id="descriptionCount">124</span>/1000자
                    </div>
                    <div class="form-error" id="descriptionError">상세 설명을 입력해주세요.</div>
                </div>
            </div>

            <!-- 참고 이미지 섹션 -->
            <div class="section">
                <h2 class="section-title">📷 참고 이미지</h2>
                
                <div class="image-upload-area" id="imageUploadArea">
                    <div class="upload-icon">📷</div>
                    <div class="upload-text">이미지를 드래그하거나 클릭하여 업로드</div>
                    <div class="upload-hint">JPG, PNG 파일 (최대 3장, 각 5MB 이하)</div>
                    <input type="file" id="imageInput" accept="image/*" multiple style="display: none;">
                </div>

                <div class="image-preview" id="imagePreview">
                    <div class="image-item">
                        <img src="/placeholder.svg?height=120&width=120&text=iPhone+14+Pro" alt="참고 이미지 1">
                        <button type="button" class="image-remove" onclick="removeImage(0)">×</button>
                    </div>
                    <div class="image-item">
                        <img src="/placeholder.svg?height=120&width=120&text=Deep+Purple" alt="참고 이미지 2">
                        <button type="button" class="image-remove" onclick="removeImage(1)">×</button>
                    </div>
                </div>
            </div>

            <!-- 거래 정보 섹션 -->
            <div class="section">
                <h2 class="section-title">📍 거래 정보</h2>
                
                <div class="form-group">
                    <label for="location" class="form-label">거래 지역<span class="required">*</span></label>
                    <div class="input-group">
                        <input type="text" id="location" class="form-input" value="서울시 강남구" placeholder="거래 희망 지역" required>
                        <button type="button" class="btn btn-outline" onclick="getCurrentLocation()">현재 위치</button>
                    </div>
                    <div class="form-hint">직거래를 원하는 지역을 입력하세요.</div>
                    <div class="form-error" id="locationError">거래 지역을 입력해주세요.</div>
                </div>

                <div class="form-group">
                    <label class="form-label">거래 방식<span class="required">*</span></label>
                    <div class="checkbox-group">
                        <div class="checkbox-item">
                            <input type="checkbox" id="meetup" checked>
                            <label for="meetup">직거래</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="delivery" checked>
                            <label for="delivery">택배거래</label>
                        </div>
                    </div>
                    <div class="form-hint">원하는 거래 방식을 선택하세요 (복수 선택 가능).</div>
                </div>
            </div>

            <!-- 연락처 정보 섹션 -->
            <div class="section">
                <h2 class="section-title">📞 연락처 정보</h2>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="phone" class="form-label">연락처</label>
                        <input type="tel" id="phone" class="form-input" value="010-1234-5678" placeholder="연락 가능한 번호">
                        <div class="form-hint">연락처는 판매자에게만 공개됩니다.</div>
                    </div>

                    <div class="form-group">
                        <label for="contactTime" class="form-label">연락 가능 시간</label>
                        <select id="contactTime" class="form-select">
                            <option value="anytime" selected>언제든지</option>
                            <option value="morning">오전 (09:00-12:00)</option>
                            <option value="afternoon">오후 (12:00-18:00)</option>
                            <option value="evening">저녁 (18:00-22:00)</option>
                            <option value="weekend">주말만</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label">연락 방법</label>
                    <div class="checkbox-group">
                        <div class="checkbox-item">
                            <input type="checkbox" id="chatContact" checked>
                            <label for="chatContact">채팅</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="phoneContact">
                            <label for="phoneContact">전화</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="messageContact">
                            <label for="messageContact">문자</label>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 폼 액션 버튼 -->
            <div class="form-actions">
                <div class="action-left">
                    <button type="button" class="btn btn-secondary" onclick="goBack()">취소</button>
                </div>
                <div class="action-right">
                    <button type="button" class="btn btn-outline" onclick="saveDraft()">임시저장</button>
                    <button type="button" class="btn btn-outline" onclick="previewPost()">미리보기</button>
                    <button type="submit" class="btn btn-primary" id="saveButton">수정 완료</button>
                </div>
            </div>
        </form>
    </div>

    <script>
        // 폼 요소들
        const buyRequestForm = document.getElementById('buyRequestForm');
        const titleInput = document.getElementById('title');
        const titleCount = document.getElementById('titleCount');
        const descriptionTextarea = document.getElementById('description');
        const descriptionCount = document.getElementById('descriptionCount');
        const imageUploadArea = document.getElementById('imageUploadArea');
        const imageInput = document.getElementById('imageInput');
        const imagePreview = document.getElementById('imagePreview');
        const saveButton = document.getElementById('saveButton');

        let uploadedImages = [
            '/placeholder.svg?height=120&width=120&text=iPhone+14+Pro',
            '/placeholder.svg?height=120&width=120&text=Deep+Purple'
        ];

        // 페이지 로드 시 초기화
        window.addEventListener('load', function() {
            updateCharCounts();
            setupEventListeners();
        });

        // 이벤트 리스너 설정
        function setupEventListeners() {
            // 제목 글자 수 카운트
            titleInput.addEventListener('input', function() {
                updateTitleCount();
                validateTitle();
            });

            // 설명 글자 수 카운트
            descriptionTextarea.addEventListener('input', function() {
                updateDescriptionCount();
                validateDescription();
            });

            // 이미지 업로드 영역 클릭
            imageUploadArea.addEventListener('click', function() {
                imageInput.click();
            });

            // 이미지 파일 선택
            imageInput.addEventListener('change', handleImageUpload);

            // 드래그 앤 드롭
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
                const files = e.dataTransfer.files;
                handleImageFiles(files);
            });

            // 라디오 버튼 스타일링
            document.querySelectorAll('.radio-item').forEach(item => {
                item.addEventListener('click', function() {
                    const radio = this.querySelector('input[type="radio"]');
                    radio.checked = true;
                    updateRadioStyles();
                });
            });

            // 폼 변경 감지
            document.querySelectorAll('input, textarea, select').forEach(element => {
                element.addEventListener('input', checkFormChanges);
                element.addEventListener('change', checkFormChanges);
            });
        }

        // 글자 수 업데이트
        function updateCharCounts() {
            updateTitleCount();
            updateDescriptionCount();
        }

        function updateTitleCount() {
            const length = titleInput.value.length;
            titleCount.textContent = length;
            
            if (length > 50) {
                titleCount.style.color = '#ef4444';
            } else {
                titleCount.style.color = '#6b7280';
            }
        }

        function updateDescriptionCount() {
            const length = descriptionTextarea.value.length;
            descriptionCount.textContent = length;
            
            if (length > 1000) {
                descriptionCount.style.color = '#ef4444';
            } else {
                descriptionCount.style.color = '#6b7280';
            }
        }

        // 이미지 업로드 처리
        function handleImageUpload(e) {
            const files = e.target.files;
            handleImageFiles(files);
        }

        function handleImageFiles(files) {
            if (uploadedImages.length >= 3) {
                showError('최대 3장까지 업로드 가능합니다.');
                return;
            }

            Array.from(files).forEach(file => {
                if (uploadedImages.length >= 3) return;

                // 파일 크기 체크 (5MB)
                if (file.size > 5 * 1024 * 1024) {
                    showError('파일 크기는 5MB 이하여야 합니다.');
                    return;
                }

                // 파일 형식 체크
                if (!file.type.startsWith('image/')) {
                    showError('이미지 파일만 업로드 가능합니다.');
                    return;
                }

                const reader = new FileReader();
                reader.onload = function(e) {
                    uploadedImages.push(e.target.result);
                    updateImagePreview();
                }
                reader.readAsDataURL(file);
            });
        }

        // 이미지 미리보기 업데이트
        function updateImagePreview() {
            imagePreview.innerHTML = '';
            
            uploadedImages.forEach((src, index) => {
                const imageItem = document.createElement('div');
                imageItem.className = 'image-item';
                imageItem.innerHTML = `
                    <img src="${src}" alt="참고 이미지 ${index + 1}">
                    <button type="button" class="image-remove" onclick="removeImage(${index})">×</button>
                `;
                imagePreview.appendChild(imageItem);
            });
        }

        // 이미지 삭제
        function removeImage(index) {
            uploadedImages.splice(index, 1);
            updateImagePreview();
            showSuccess('이미지가 삭제되었습니다.');
        }

        // 현재 위치 가져오기
        function getCurrentLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function(position) {
                    // 실제로는 좌표를 주소로 변환하는 API 사용
                    document.getElementById('location').value = '서울시 강남구 (현재 위치)';
                    showSuccess('현재 위치가 설정되었습니다.');
                }, function() {
                    showError('위치 정보를 가져올 수 없습니다.');
                });
            } else {
                showError('이 브라우저는 위치 서비스를 지원하지 않습니다.');
            }
        }

        // 라디오 버튼 스타일 업데이트
        function updateRadioStyles() {
            document.querySelectorAll('.radio-item').forEach(item => {
                const radio = item.querySelector('input[type="radio"]');
                if (radio.checked) {
                    item.classList.add('selected');
                } else {
                    item.classList.remove('selected');
                }
            });
        }

        // 폼 유효성 검사
        function validateForm() {
            let isValid = true;

            // 제목 검사
            if (!validateTitle()) isValid = false;
            
            // 카테고리 검사
            if (!validateCategory()) isValid = false;
            
            // 희망 가격 검사
            if (!validateBudget()) isValid = false;
            
            // 설명 검사
            if (!validateDescription()) isValid = false;
            
            // 거래 지역 검사
            if (!validateLocation()) isValid = false;
            
            // 거래 방식 검사
            if (!validateTradeMethod()) isValid = false;

            return isValid;
        }

        function validateTitle() {
            const title = titleInput.value.trim();
            const errorElement = document.getElementById('titleError');
            
            if (!title) {
                errorElement.textContent = '제목을 입력해주세요.';
                errorElement.classList.add('visible');
                titleInput.classList.add('error');
                return false;
            }
            
            if (title.length > 50) {
                errorElement.textContent = '제목은 50자 이하로 입력해주세요.';
                errorElement.classList.add('visible');
                titleInput.classList.add('error');
                return false;
            }
            
            errorElement.classList.remove('visible');
            titleInput.classList.remove('error');
            return true;
        }

        function validateCategory() {
            const category = document.getElementById('category').value;
            const errorElement = document.getElementById('categoryError');
            
            if (!category) {
                errorElement.classList.add('visible');
                return false;
            }
            
            errorElement.classList.remove('visible');
            return true;
        }

        function validateBudget() {
            const budget = parseInt(document.getElementById('budget').value);
            const errorElement = document.getElementById('budgetError');
            
            if (!budget || budget < 1000 || budget > 10000000) {
                errorElement.textContent = '1,000원 ~ 10,000,000원 사이로 입력해주세요.';
                errorElement.classList.add('visible');
                return false;
            }
            
            errorElement.classList.remove('visible');
            return true;
        }

        function validateDescription() {
            const description = descriptionTextarea.value.trim();
            const errorElement = document.getElementById('descriptionError');
            
            if (!description) {
                errorElement.textContent = '상세 설명을 입력해주세요.';
                errorElement.classList.add('visible');
                descriptionTextarea.classList.add('error');
                return false;
            }
            
            if (description.length > 1000) {
                errorElement.textContent = '설명은 1000자 이하로 입력해주세요.';
                errorElement.classList.add('visible');
                descriptionTextarea.classList.add('error');
                return false;
            }
            
            errorElement.classList.remove('visible');
            descriptionTextarea.classList.remove('error');
            return true;
        }

        function validateLocation() {
            const location = document.getElementById('location').value.trim();
            const errorElement = document.getElementById('locationError');
            
            if (!location) {
                errorElement.classList.add('visible');
                return false;
            }
            
            errorElement.classList.remove('visible');
            return true;
        }

        function validateTradeMethod() {
            const meetup = document.getElementById('meetup').checked;
            const delivery = document.getElementById('delivery').checked;
            
            if (!meetup && !delivery) {
                showError('거래 방식을 최소 하나 이상 선택해주세요.');
                return false;
            }
            
            return true;
        }

        // 변경사항 감지
        function checkFormChanges() {
            // 실제로는 현재 폼 데이터와 초기 데이터를 비교
            const hasChanges = true; // 임시로 항상 true
            
            if (hasChanges) {
                saveButton.classList.remove('btn-disabled');
                saveButton.disabled = false;
            } else {
                saveButton.classList.add('btn-disabled');
                saveButton.disabled = true;
            }
        }

        // 폼 제출
        buyRequestForm.addEventListener('submit', function(e) {
            e.preventDefault();

            if (!validateForm()) {
                return;
            }

            saveButton.disabled = true;
            saveButton.textContent = '수정 중...';

            setTimeout(() => {
                showSuccess('구매 요청이 성공적으로 수정되었습니다.');
                saveButton.disabled = false;
                saveButton.textContent = '수정 완료';
            }, 1500);
        });

        // 임시저장
        function saveDraft() {
            showSuccess('임시저장되었습니다.');
        }

        // 미리보기
        function previewPost() {
            if (!validateForm()) {
                return;
            }
            
            showSuccess('미리보기 기능은 준비 중입니다.');
        }

        // 뒤로가기
        function goBack() {
            if (confirm('변경사항이 저장되지 않을 수 있습니다. 정말 나가시겠습니까?')) {
                history.back();
            }
        }

        // 알림 표시 함수들
        function showSuccess(message) {
            const alert = document.getElementById('successAlert');
            alert.textContent = message;
            alert.classList.add('visible');
            setTimeout(() => alert.classList.remove('visible'), 3000);
        }

        function showError(message) {
            const alert = document.getElementById('errorAlert');
            alert.textContent = message;
            alert.classList.add('visible');
            setTimeout(() => alert.classList.remove('visible'), 3000);
        }

        // 키보드 단축키
        document.addEventListener('keydown', function(e) {
            if (e.ctrlKey && e.key === 's') {
                e.preventDefault();
                buyRequestForm.dispatchEvent(new Event('submit'));
            }
        });
    </script>
</body>
</html>
