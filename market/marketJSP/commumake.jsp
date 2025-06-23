<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            background: rgba(0, 0, 0, 0.7);
            color: white;
            border: none;
            border-radius: 50%;
            width: 24px;
            height: 24px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
        }

        /* 태그 입력 */
        .tag-input-container {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            padding: 8px;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            min-height: 44px;
            cursor: text;
        }

        .tag-input-container:focus-within {
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.2);
        }

        .tag-item {
            background-color: #3b82f6;
            color: white;
            padding: 4px 8px;
            border-radius: 16px;
            font-size: 12px;
            display: flex;
            align-items: center;
            gap: 4px;
        }

        .tag-remove {
            background: none;
            border: none;
            color: white;
            cursor: pointer;
            font-size: 14px;
            padding: 0;
            width: 16px;
            height: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .tag-input {
            border: none;
            outline: none;
            flex: 1;
            min-width: 100px;
            padding: 4px;
            font-size: 14px;
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

        /* 게시글 통계 */
        .post-stats {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 16px;
            margin-bottom: 24px;
        }

        .stat-item {
            text-align: center;
            padding: 16px;
            background-color: #f8fafc;
            border-radius: 8px;
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

            .post-stats {
                grid-template-columns: repeat(2, 1fr);
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
            <h1 class="page-title">커뮤니티 게시글 등록</h1>
            <p class="page-subtitle">게시글을 수정하고 커뮤니티와 소통하세요</p>
        </div>

        <form action="commumakePro.jsp" id="">
            <!-- 알림 메시지 -->
            <div class="alert alert-success" id="successAlert">
                게시글이 성공적으로 수정되었습니다.
            </div>
            
            <div class="alert alert-error" id="errorAlert">
                오류가 발생했습니다. 다시 시도해주세요.
            </div>

            
            <!-- 기본 정보 섹션 -->
            <div class="section">
                <h2 class="section-title">📝 기본 정보</h2>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="category" class="form-label">카테고리<span class="required">*</span></label>
                        <select id="category" name="category" class="form-select" required>
                            <option value="">카테고리 선택</option>
                            <option value="info" selected>정보공유</option>
                            <option value="question">질문</option>
                            <option value="review">후기</option>
                            <option value="tip">꿀팁</option>
                            <option value="chat">잡담</option>
                            <option value="event">이벤트</option>
                            <option value="notice">공지</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="visibility" class="form-label">공개 범위</label>
                        <select id="visibility" name="visible" class="form-select">
                            <option value="public" selected>전체 공개</option>
                            <option value="members">회원만</option>
                            <option value="followers">팔로워만</option>
                            <option value="private">비공개</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="title" class="form-label">제목<span class="required">*</span></label>
                    <input type="text" id="title" name="title" class="form-input" placeholder="게시글 제목을 입력하세요" maxlength="100" required>
                    <div class="char-counter">
                        <span id="titleCount">15</span>/100자
                    </div>
                </div>
            </div>

            <!-- 내용 작성 섹션 -->
            <div class="section">
                <h2 class="section-title">📋 내용 작성</h2>
                
                <div class="form-group">
                    <label for="content" class="form-label">게시글 내용<span class="required">*</span></label>
                    	<textarea id="content" name="content" class="form-input form-textarea" placeholder="게시글 내용을 작성하세요" maxlength="5000" required></textarea>
                    <div class="char-counter">
                        <span id="contentCount">156</span>/5000자
                    </div>
                </div>
            </div>

            <!-- 이미지 첨부 섹션 -->
            <div class="section">
                <h2 class="section-title">📷 이미지 첨부</h2>
                
                <div class="image-upload" id="imageUpload">
                    <div class="upload-icon">📷</div>
                    <div class="upload-text">이미지를 드래그하거나 클릭하여 업로드</div>
                    <div class="upload-hint">JPG, PNG 파일만 업로드 가능 (최대 5장, 각 5MB)</div>
                    <input type="file" id="imageInput" accept="image/*" multiple style="display: none;">
                </div>

                <div class="image-preview" id="imagePreview">
                    <div class="image-item">
                        <img src="/placeholder.svg?height=120&width=120&text=Image1" alt="첨부 이미지 1">
                        <button type="button" class="image-remove" onclick="removeImage(0)">×</button>
                    </div>
                    <div class="image-item">
                        <img src="/placeholder.svg?height=120&width=120&text=Image2" alt="첨부 이미지 2">
                        <button type="button" class="image-remove" onclick="removeImage(1)">×</button>
                    </div>
                </div>
            </div>

            <!-- 태그 설정 섹션 -->
            <div class="section">
                <h2 class="section-title">🏷️ 태그 설정</h2>
                
                <div class="form-group">
                    <label for="tags" class="form-label">태그</label>
                    <div class="tag-input-container" id="tagContainer">
                        <input type="text" name="" class="tag-input" id="tagInput" placeholder="태그 입력 후 Enter">
                    </div>
                    <div class="form-hint">태그를 입력하고 Enter를 누르세요 (최대 10개)</div>
                </div>
            </div>

            <!-- 게시글 설정 섹션 -->
            <div class="section">
                <h2 class="section-title">⚙️ 게시글 설정</h2>
                
                <div class="checkbox-group">
                    <div class="checkbox-item">
                        <input type="checkbox" id="allowComments" checked>
                        <label for="allowComments">댓글 허용</label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" id="allowLikes" checked>
                        <label for="allowLikes">좋아요 허용</label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" id="allowShare" checked>
                        <label for="allowShare">공유 허용</label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" id="notifyComments" checked>
                        <label for="notifyComments">댓글 알림 받기</label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" id="notifyLikes">
                        <label for="notifyLikes">좋아요 알림 받기</label>
                    </div>
                </div>
            </div>

            <!-- 위험 구역 -->
            <div class="section danger">
                <h2 class="section-title">⚠️ 게시글 관리</h2>
                
                <div class="form-group">
                    <label class="form-label">게시글 상태</label>
                    <div style="display: flex; gap: 12px; margin-top: 8px;">
                        <button type="button" class="btn btn-secondary" onclick="hidePost()">게시글 숨기기</button>
                        <button type="button" class="btn btn-danger" onclick="deletePost()">게시글 삭제</button>
                    </div>
                    <div class="form-hint">게시글 삭제 시 모든 댓글과 좋아요가 함께 삭제되며 복구할 수 없습니다.</div>
                </div>
            </div>

            <!-- 폼 액션 버튼 -->
            <div class="form-actions">
                <div class="action-left">
                    <button type="button" class="btn btn-secondary" onclick="goBack()">취소</button>
                </div>
                <div class="action-right">
                    <button type="button" class="btn btn-outline" onclick="saveAsDraft()">임시저장</button>
                    <button type="button" class="btn btn-outline" onclick="previewPost()">미리보기</button>
                    <button type="submit" class="btn btn-primary" id="saveButton">등록 완료</button>
                </div>
            </div>
        </form>
    </div>

    <script>
        // 폼 요소들
        const postForm = document.getElementById('postForm');
        const titleInput = document.getElementById('title');
        const contentTextarea = document.getElementById('content');
        const titleCount = document.getElementById('titleCount');
        const contentCount = document.getElementById('contentCount');
        const imageUpload = document.getElementById('imageUpload');
        const imageInput = document.getElementById('imageInput');
        const imagePreview = document.getElementById('imagePreview');
        const tagInput = document.getElementById('tagInput');
        const tagContainer = document.getElementById('tagContainer');
        const saveButton = document.getElementById('saveButton');

        // 초기 데이터 저장 (변경사항 감지용)
        let initialData = {};
        let uploadedImages = [];
        let tags = ['중고거래', '꿀팁', '정보공유'];

        // 페이지 로드 시 초기화
        window.addEventListener('load', function() {
            saveInitialData();
            updateCharCounts();
        });

        // 초기 데이터 저장
        function saveInitialData() {
            const formData = new FormData(postForm);
            initialData = Object.fromEntries(formData);
        }

        // 글자 수 카운트 업데이트
        titleInput.addEventListener('input', updateCharCounts);
        contentTextarea.addEventListener('input', updateCharCounts);

        function updateCharCounts() {
            titleCount.textContent = titleInput.value.length;
            contentCount.textContent = contentTextarea.value.length;
            
            if (titleInput.value.length > 100) {
                titleCount.style.color = '#ef4444';
            } else {
                titleCount.style.color = '#6b7280';
            }
            
            if (contentTextarea.value.length > 5000) {
                contentCount.style.color = '#ef4444';
            } else {
                contentCount.style.color = '#6b7280';
            }
            
            checkFormChanges();
        }

        // 이미지 업로드 처리
        imageUpload.addEventListener('click', () => imageInput.click());
        imageUpload.addEventListener('dragover', handleDragOver);
        imageUpload.addEventListener('drop', handleDrop);
        imageInput.addEventListener('change', handleImageSelect);

        function handleDragOver(e) {
            e.preventDefault();
            imageUpload.classList.add('dragover');
        }

        function handleDrop(e) {
            e.preventDefault();
            imageUpload.classList.remove('dragover');
            const files = Array.from(e.dataTransfer.files);
            handleFiles(files);
        }

        function handleImageSelect(e) {
            const files = Array.from(e.target.files);
            handleFiles(files);
        }

        function handleFiles(files) {
            const imageFiles = files.filter(file => file.type.startsWith('image/'));
            
            if (uploadedImages.length + imageFiles.length > 5) {
                showError('최대 5장까지 업로드 가능합니다.');
                return;
            }

            imageFiles.forEach(file => {
                if (file.size > 5 * 1024 * 1024) {
                    showError(`${file.name}은 5MB를 초과합니다.`);
                    return;
                }

                const reader = new FileReader();
                reader.onload = function(e) {
                    uploadedImages.push({
                        file: file,
                        url: e.target.result
                    });
                    updateImagePreview();
                    checkFormChanges();
                }
                reader.readAsDataURL(file);
            });
        }

        function updateImagePreview() {
            const existingImages = imagePreview.querySelectorAll('.image-item');
            existingImages.forEach((item, index) => {
                if (index >= 2) { // 기존 이미지 2개 유지
                    item.remove();
                }
            });

            uploadedImages.forEach((image, index) => {
                const imageItem = document.createElement('div');
                imageItem.className = 'image-item';
                imageItem.innerHTML = `
                    <img src="${image.url}" alt="업로드 이미지 ${index + 1}">
                    <button type="button" class="image-remove" onclick="removeUploadedImage(${index})">×</button>
                `;
                imagePreview.appendChild(imageItem);
            });
        }

        function removeImage(index) {
            // 기존 이미지 제거 (서버에서 삭제 처리)
            showSuccess('이미지가 제거되었습니다.');
            checkFormChanges();
        }

        function removeUploadedImage(index) {
            uploadedImages.splice(index, 1);
            updateImagePreview();
            checkFormChanges();
        }

        // 태그 관리
        tagInput.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                e.preventDefault();
                addTag();
            }
        });

        function addTag() {
            const tagText = tagInput.value.trim();
            
            if (!tagText) return;
            
            if (tags.length >= 10) {
                showError('최대 10개의 태그만 추가할 수 있습니다.');
                return;
            }
            
            if (tags.includes(tagText)) {
                showError('이미 추가된 태그입니다.');
                return;
            }

            tags.push(tagText);
            
            const tagItem = document.createElement('div');
            tagItem.className = 'tag-item';
            tagItem.innerHTML = `
                ${tagText}
                <button type="button" class="tag-remove" onclick="removeTag(this)">×</button>
            `;
            
            tagContainer.insertBefore(tagItem, tagInput);
            tagInput.value = '';
            checkFormChanges();
        }

        function removeTag(button) {
            const tagItem = button.parentElement;
            const tagText = tagItem.textContent.trim().replace('×', '');
            const tagIndex = tags.indexOf(tagText);
            
            if (tagIndex > -1) {
                tags.splice(tagIndex, 1);
            }
            
            tagItem.remove();
            checkFormChanges();
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
        postForm.addEventListener('submit', function(e) {
            e.preventDefault();

            // 유효성 검사
            if (!validateForm()) {
                return;
            }

            // 저장 처리
            saveButton.disabled = true;
            saveButton.textContent = '수정 중...';

            setTimeout(() => {
                showSuccess('게시글이 성공적으로 수정되었습니다.');
                saveButton.disabled = false;
                saveButton.textContent = '수정 완료';
                saveInitialData(); // 새로운 초기 데이터로 업데이트
            }, 1500);
        });

        // 폼 유효성 검사
        function validateForm() {
            let isValid = true;

            // 제목 검사
            const title = titleInput.value.trim();
            if (!title || title.length < 5) {
                showError('제목은 5자 이상 입력해주세요.');
                isValid = false;
            }

            // 내용 검사
            const content = contentTextarea.value.trim();
            if (!content || content.length < 10) {
                showError('내용은 10자 이상 입력해주세요.');
                isValid = false;
            }

            // 카테고리 검사
            const category = document.getElementById('category').value;
            if (!category) {
                showError('카테고리를 선택해주세요.');
                isValid = false;
            }

            return isValid;
        }

        // 임시저장
        function saveAsDraft() {
            showSuccess('게시글이 임시저장되었습니다.');
        }

        // 미리보기
        function previewPost() {
            // 미리보기 모달 또는 새 창 열기
            showSuccess('미리보기 기능이 곧 제공됩니다.');
        }

        // 게시글 숨기기
        function hidePost() {
            if (confirm('게시글을 숨기시겠습니까?\n숨긴 게시글은 다른 사용자에게 보이지 않습니다.')) {
                showSuccess('게시글이 숨겨졌습니다.');
            }
        }

        // 게시글 삭제
        function deletePost() {
            const confirmation = prompt('게시글을 삭제하려면 "삭제"를 입력하세요:');
            if (confirmation === '삭제') {
                if (confirm('정말로 게시글을 삭제하시겠습니까?\n이 작업은 되돌릴 수 없습니다.')) {
                    alert('게시글이 삭제되었습니다.');
                    // 실제로는 목록 페이지로 이동
                }
            } else if (confirmation !== null) {
                showError('입력이 올바르지 않습니다.');
            }
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

        // 입력 필드 변경 감지
        document.querySelectorAll('input, textarea, select').forEach(element => {
            element.addEventListener('input', checkFormChanges);
            element.addEventListener('change', checkFormChanges);
        });

        // 키보드 단축키
        document.addEventListener('keydown', function(e) {
            if (e.ctrlKey && e.key === 's') {
                e.preventDefault();
                postForm.dispatchEvent(new Event('submit'));
            }
        });
    </script>
</body>
</html>