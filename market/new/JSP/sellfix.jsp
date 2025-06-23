<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="sellpostTable.SellPostDAO, sellpostTable.SellPostDTO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>판매 상품 수정 - 중고마켓</title>
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
            border-radius: 12px;
            padding: 24px;
            text-align: center;
            background-color: #f9fafb;
            transition: all 0.2s;
            cursor: pointer;
            margin-bottom: 16px;
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

        .image-preview-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
            gap: 12px;
            margin-top: 16px;
        }

        .image-preview-item {
            position: relative;
            aspect-ratio: 1;
            border-radius: 8px;
            overflow: hidden;
            border: 2px solid #e5e7eb;
        }

        .image-preview-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .image-preview-item .remove-btn {
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

        .image-preview-item .main-badge {
            position: absolute;
            bottom: 4px;
            left: 4px;
            background-color: #3b82f6;
            color: white;
            font-size: 10px;
            padding: 2px 6px;
            border-radius: 4px;
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
        }

        .radio-item input[type="radio"] {
            width: 18px;
            height: 18px;
            accent-color: #3b82f6;
        }

        .radio-item label {
            font-size: 14px;
            color: #4b5563;
            cursor: pointer;
        }

        /* 상태 배지 */
        .status-badge {
            display: inline-flex;
            align-items: center;
            gap: 4px;
            padding: 4px 8px;
            border-radius: 6px;
            font-size: 12px;
            font-weight: 500;
        }

        .status-selling {
            background-color: #d1fae5;
            color: #065f46;
        }

        .status-reserved {
            background-color: #fef3c7;
            color: #92400e;
        }

        .status-sold {
            background-color: #fee2e2;
            color: #991b1b;
        }

        /* 통계 카드 */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
            gap: 16px;
            margin-bottom: 20px;
        }

        .stat-card {
            background-color: #f9fafb;
            padding: 16px;
            border-radius: 8px;
            text-align: center;
        }

        .stat-number {
            font-size: 24px;
            font-weight: 700;
            color: #1f2937;
            margin-bottom: 4px;
        }

        .stat-label {
            font-size: 12px;
            color: #6b7280;
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

        .btn-danger {
            background-color: #ef4444;
            color: white;
        }

        .btn-danger:hover {
            background-color: #dc2626;
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
                gap: 8px;
            }

            .form-actions {
                flex-direction: column;
            }

            .action-left,
            .action-right {
                width: 100%;
                justify-content: center;
            }

            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
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
        <!-- 페이지 헤더 -->
        <div class="page-header">
            <h1 class="page-title">판매 상품 수정</h1>
            <p class="page-subtitle">상품 정보를 수정하여 더 많은 구매자에게 어필하세요</p>
        </div>

        <form action="sellfixPro.jsp" id="">
            <!-- 알림 메시지 -->
            <div class="alert alert-success" id="successAlert">
                상품 정보가 성공적으로 수정되었습니다.
            </div>
            
            <div class="alert alert-error" id="errorAlert">
                오류가 발생했습니다. 다시 시도해주세요.
            </div>
			<input type="hidden" name="postid" value="<%=dto.getPostid() %>">
            <!-- 상품 통계 -->
            <div class="section">
                <h2 class="section-title">📊 상품 통계</h2>
                <div class="stats-grid">
                    <div class="stat-card">
                        <div class="stat-number">245</div>
                        <div class="stat-label">조회수</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-number">12</div>
                        <div class="stat-label">찜 수</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-number">8</div>
                        <div class="stat-label">문의 수</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-number">3</div>
                        <div class="stat-label">가격제안</div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="form-label">현재 상태</label>
                    <div style="display: flex; gap: 12px; align-items: center;">
                        <span class="status-badge status-selling">● 판매중</span>
                        <span style="font-size: 12px; color: #6b7280;">등록일: 2024년 1월 15일</span>
                    </div>
                </div>
            </div>

            <!-- 상품 이미지 섹션 -->
            <div class="section">
                <h2 class="section-title">📷 상품 이미지</h2>
                <div class="image-upload-area" id="imageUploadArea">
                    <div class="upload-icon">📷</div>
                    <div class="upload-text">이미지를 드래그하거나 클릭하여 업로드</div>
                    <div class="upload-hint">JPG, PNG 파일만 업로드 가능 (최대 10장, 각 5MB)</div>
                    <input type="file" id="imageInput" multiple accept="image/*" style="display: none;">
                </div>
                <div class="image-preview-grid" id="imagePreviewGrid">
                    <!-- 기존 이미지들 -->
                    <div class="image-preview-item">
                        <img src="/placeholder.svg?height=120&width=120&text=상품1" alt="상품 이미지 1">
                        <div class="main-badge">대표</div>
                        <button type="button" class="remove-btn" onclick="removeImage(0)">×</button>
                    </div>
                    <div class="image-preview-item">
                        <img src="/placeholder.svg?height=120&width=120&text=상품2" alt="상품 이미지 2">
                        <button type="button" class="remove-btn" onclick="removeImage(1)">×</button>
                    </div>
                    <div class="image-preview-item">
                        <img src="/placeholder.svg?height=120&width=120&text=상품3" alt="상품 이미지 3">
                        <button type="button" class="remove-btn" onclick="removeImage(2)">×</button>
                    </div>
                </div>
                <div class="form-hint">첫 번째 이미지가 대표 이미지로 설정됩니다. 이미지를 드래그하여 순서를 변경할 수 있습니다.</div>
            </div>

            <!-- 상품 기본 정보 섹션 -->
            <div class="section">
                <h2 class="section-title">📝 상품 기본 정보</h2>
                
                <div class="form-group">
                    <label for="productTitle" class="form-label">상품명<span class="required">*</span></label>
                    <input type="text" id="productTitle" name="title" class="form-input" value="<%=dto.getTitle() %>" placeholder="상품명을 입력하세요" maxlength="50" required>
                    <div class="char-counter">
                        <span id="titleCount">35</span>/50자
                    </div>
                    <div class="form-error" id="titleError">상품명을 입력해주세요.</div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="category" class="form-label">카테고리<span class="required">*</span></label>
                        <select id="category" name="category" class="form-select" required>
                            <option value="">카테고리 선택</option>
                            <option value="electronics" selected>전자기기</option>
                            <option value="clothing">의류</option>
                            <option value="home">생활용품</option>
                            <option value="books">도서</option>
                            <option value="sports">스포츠/레저</option>
                            <option value="beauty">뷰티/미용</option>
                            <option value="baby">유아용품</option>
                            <option value="etc">기타</option>
                        </select>
                        <div class="form-error" id="categoryError">카테고리를 선택해주세요.</div>
                    </div>

                    <div class="form-group">
                        <label for="price" class="form-label">판매 가격<span class="required">*</span></label>
                        <div class="input-group">
                            <input type="number" id="price" name="price" class="form-input" value="<%=dto.getPrice() %>" placeholder="가격 입력" min="1000" max="50000000" required>
                        </div>
                        <div class="form-hint">1,000원 ~ 50,000,000원 사이로 입력해주세요.</div>
                        <div class="form-error" id="priceError">올바른 가격을 입력해주세요.</div>
                    </div>
                </div>
                <h2 class="section-title">📋 상품 상세 설명</h2>
                
                <div class="form-group">
                    <label for="description" class="form-label">상품 설명<span class="required">*</span></label>
                    <textarea id="description" name="content" class="form-input form-textarea" placeholder="상품에 대한 자세한 설명을 작성해주세요" maxlength="2000" required><%=dto.getContent() %></textarea>
                    <div class="char-counter">
                        <span id="descriptionCount">180</span>/2000자
                    </div>
                    <div class="form-error" id="descriptionError">상품 설명을 입력해주세요.</div>
                </div>
                <h2 class="section-title">🚚 거래 정보</h2>

                <div class="form-row">
                    <div class="form-group">
                        <label for="location" class="form-label">거래 지역</label>
                        <div class="input-group">
                            <input type="text" id="location" class="form-input" value="<%=dto.getLocation() %>" placeholder="거래 선호 지역">
                            <button type="button" class="btn btn-outline" onclick="getCurrentLocation()">현재 위치</button>
                        </div>
                        <div class="form-hint">직거래 시 선호하는 지역을 입력하세요.</div>
                    </div>
                </div>
            </div>

            <!-- 상품 상태 관리 섹션 -->
            <div class="section">
                <h2 class="section-title">📊 상품 상태 관리</h2>
                
                <div class="form-group">
                    <label for="productStatus" class="form-label">판매 상태</label>
                    <div class="radio-group">
                        <div class="radio-item">
                            <input type="radio" id="status1" name="productStatus" value="판매중" checked>
                            <label for="status1">판매중</label>
                        </div>
                        <div class="radio-item">
                            <input type="radio" id="status2" name="productStatus" value="예약중">
                            <label for="status2">예약중</label>
                        </div>
                        <div class="radio-item">
                            <input type="radio" id="status3" name="productStatus" value="판매완료">
                            <label for="status3">판매완료</label>
                        </div>
                    </div>
                    <div class="form-hint">상품의 현재 판매 상태를 설정하세요.</div>
                </div>
            </div>
            <!-- 위험 구역 -->
            <div class="section danger">
                <h2 class="section-title">⚠️ 상품 관리</h2>
                
                <div class="form-group">
                    <label class="form-label">상품 삭제</label>
                    <div style="display: flex; gap: 12px; margin-top: 8px;">
                        <button type="button" class="btn btn-secondary" onclick="hideProduct()">상품 숨기기</button>
                        <button type="button" class="btn btn-danger" onclick="deleteProduct()">상품 삭제</button>
                    </div>
                    <div class="form-hint">상품 삭제 시 모든 문의 내역과 통계가 영구적으로 삭제되며 복구할 수 없습니다.</div>
                </div>
            </div>


            <!-- 폼 액션 버튼 -->
            <div class="form-actions">
                <div class="action-left">
                    <button type="button" class="btn btn-secondary" onclick="goBack()">취소</button>
                </div>
                <div class="action-right">
                    <button type="button" class="btn btn-outline" onclick="previewProduct()">미리보기</button>
                    <button type="button" class="btn btn-outline" onclick="saveDraft()">임시저장</button>
                    <button type="submit" class="btn btn-primary" id="saveButton">변경사항 저장</button>
                </div>
            </div>
        </form>
    </div>

    <script>
        // 폼 요소들
        const productForm = document.getElementById('productForm');
        const imageInput = document.getElementById('imageInput');
        const imageUploadArea = document.getElementById('imageUploadArea');
        const imagePreviewGrid = document.getElementById('imagePreviewGrid');
        const productTitleInput = document.getElementById('productTitle');
        const descriptionTextarea = document.getElementById('description');
        const titleCount = document.getElementById('titleCount');
        const descriptionCount = document.getElementById('descriptionCount');
        const saveButton = document.getElementById('saveButton');

        let uploadedImages = [];

        // 페이지 로드 시 초기화
        window.addEventListener('load', function() {
            updateCharCounts();
            setupImageUpload();
        });

        // 글자 수 카운트 업데이트
        function updateCharCounts() {
            titleCount.textContent = productTitleInput.value.length;
            descriptionCount.textContent = descriptionTextarea.value.length;
        }

        // 제목 입력 이벤트
        productTitleInput.addEventListener('input', function() {
            updateCharCounts();
            if (this.value.length > 50) {
                titleCount.style.color = '#ef4444';
            } else {
                titleCount.style.color = '#6b7280';
            }
        });

        // 설명 입력 이벤트
        descriptionTextarea.addEventListener('input', function() {
            updateCharCounts();
            if (this.value.length > 2000) {
                descriptionCount.style.color = '#ef4444';
            } else {
                descriptionCount.style.color = '#6b7280';
            }
        });

        // 이미지 업로드 설정
        function setupImageUpload() {
            // 클릭으로 파일 선택
            imageUploadArea.addEventListener('click', function() {
                imageInput.click();
            });

            // 파일 선택 이벤트
            imageInput.addEventListener('change', function(e) {
                handleFiles(e.target.files);
            });

            // 드래그 앤 드롭 이벤트
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
                handleFiles(e.dataTransfer.files);
            });
        }

        // 파일 처리
        function handleFiles(files) {
            for (let file of files) {
                if (uploadedImages.length >= 10) {
                    showError('최대 10장까지만 업로드 가능합니다.');
                    break;
                }

                if (file.size > 5 * 1024 * 1024) {
                    showError(`${file.name}: 파일 크기는 5MB 이하여야 합니다.`);
                    continue;
                }

                if (!file.type.startsWith('image/')) {
                    showError(`${file.name}: 이미지 파일만 업로드 가능합니다.`);
                    continue;
                }

                const reader = new FileReader();
                reader.onload = function(e) {
                    addImagePreview(e.target.result, file.name);
                };
                reader.readAsDataURL(file);
            }
        }

        // 이미지 미리보기 추가
        function addImagePreview(src, name) {
            const imageItem = document.createElement('div');
            imageItem.className = 'image-preview-item';
            
            const isFirst = uploadedImages.length === 0;
            
            imageItem.innerHTML = `
                <img src="${src}" alt="${name}">
                ${isFirst ? '<div class="main-badge">대표</div>' : ''}
                <button type="button" class="remove-btn" onclick="removeImage(${uploadedImages.length + 3})">×</button>
            `;
            
            imagePreviewGrid.appendChild(imageItem);
            uploadedImages.push({ src, name });
        }

        // 이미지 삭제
        function removeImage(index) {
            if (index < 3) {
                // 기존 이미지 삭제
                const imageItems = imagePreviewGrid.children;
                if (imageItems[index]) {
                    imageItems[index].remove();
                }
            } else {
                // 새로 업로드한 이미지 삭제
                const newIndex = index - 3;
                uploadedImages.splice(newIndex, 1);
                updateImagePreview();
            }
        }

        // 이미지 미리보기 업데이트
        function updateImagePreview() {
            // 새로 업로드한 이미지들만 다시 렌더링
            const existingItems = Array.from(imagePreviewGrid.children).slice(0, 3);
            imagePreviewGrid.innerHTML = '';
            
            existingItems.forEach(item => imagePreviewGrid.appendChild(item));
            
            uploadedImages.forEach((image, index) => {
                addImagePreview(image.src, image.name);
            });
        }

        // 현재 위치 가져오기
        function getCurrentLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function(position) {
                    document.getElementById('location').value = '서울시 강남구 (현재 위치)';
                    showSuccess('현재 위치가 설정되었습니다.');
                }, function() {
                    showError('위치 정보를 가져올 수 없습니다.');
                });
            } else {
                showError('이 브라우저는 위치 서비스를 지원하지 않습니다.');
            }
        }

        // 상품 끌어올리기
        function boostProduct() {
            if (confirm('상품을 끌어올리시겠습니까?\n오늘 1회 남았습니다.')) {
                showSuccess('상품이 끌어올려졌습니다.');
            }
        }

        // 상품 복사
        function copyProduct() {
            if (confirm('현재 상품 정보를 복사하여 새 상품을 등록하시겠습니까?')) {
                showSuccess('상품 정보가 복사되었습니다. 새 상품 등록 페이지로 이동합니다.');
            }
        }

        // 상품 숨기기
        function hideProduct() {
            if (confirm('상품을 숨기시겠습니까?\n숨긴 상품은 검색 결과에 나타나지 않습니다.')) {
                showSuccess('상품이 숨겨졌습니다.');
            }
        }

        // 상품 삭제
        function deleteProduct() {
            const confirmation = prompt('상품을 삭제하려면 "삭제"를 입력하세요:');
            if (confirmation === '삭제') {
                if (confirm('정말로 상품을 삭제하시겠습니까?\n이 작업은 되돌릴 수 없습니다.')) {
                    alert('상품이 삭제되었습니다.');
                }
            } else if (confirmation !== null) {
                showError('입력이 올바르지 않습니다.');
            }
        }

        // 미리보기
        function previewProduct() {
            showSuccess('미리보기 기능은 준비 중입니다.');
        }

        // 임시저장
        function saveDraft() {
            showSuccess('임시저장되었습니다.');
        }

        // 뒤로가기
        function goBack() {
            if (confirm('변경사항이 저장되지 않을 수 있습니다. 정말 나가시겠습니까?')) {
                history.back();
            }
        }

        // 폼 제출
        productForm.addEventListener('submit', function(e) {
            e.preventDefault();

            if (!validateForm()) {
                return;
            }

            saveButton.disabled = true;
            saveButton.textContent = '저장 중...';

            setTimeout(() => {
                showSuccess('상품 정보가 성공적으로 수정되었습니다.');
                saveButton.disabled = false;
                saveButton.textContent = '변경사항 저장';
            }, 1500);
        });

        // 폼 유효성 검사
        function validateForm() {
            let isValid = true;

            // 제목 검사
            const title = productTitleInput.value.trim();
            if (!title) {
                showError('상품명을 입력해주세요.');
                isValid = false;
            }

            // 카테고리 검사
            const category = document.getElementById('category').value;
            if (!category) {
                showError('카테고리를 선택해주세요.');
                isValid = false;
            }

            // 가격 검사
            const price = document.getElementById('price').value;
            if (!price || price < 1000 || price > 50000000) {
                showError('올바른 가격을 입력해주세요.');
                isValid = false;
            }

            // 거래 방식 검사
            const directTrade = document.getElementById('directTrade').checked;
            const deliveryTrade = document.getElementById('deliveryTrade').checked;
            if (!directTrade && !deliveryTrade) {
                showError('거래 방식을 최소 1개 이상 선택해주세요.');
                isValid = false;
            }

            return isValid;
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
                productForm.dispatchEvent(new Event('submit'));
            }
        });
    </script>
</body>
</html>
