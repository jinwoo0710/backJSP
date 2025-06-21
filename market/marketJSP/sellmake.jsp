<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        /* 헤더 스타일 */
        .header {
            background: white;
            border-bottom: 1px solid #e5e7eb;
            position: sticky;
            top: 0;
            z-index: 50;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .header-content {
            display: flex;
            align-items: center;
            height: 64px;
            gap: 32px;
        }

        .logo a {
            display: flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
            color: inherit;
        }

        .logo-icon {
            background: #3b82f6;
            color: white;
            padding: 4px 8px;
            border-radius: 6px;
            font-weight: bold;
            font-size: 14px;
        }

        .logo-text {
            font-weight: bold;
            font-size: 20px;
            color: #1f2937;
        }

        .nav {
            display: flex;
            gap: 24px;
        }

        .nav a {
            text-decoration: none;
            color: #6b7280;
            font-weight: 500;
            transition: color 0.2s;
        }

        .nav a:hover,
        .nav a.active {
            color: #1f2937;
        }

        .header-actions {
            display: flex;
            align-items: center;
            gap: 16px;
            margin-left: auto;
        }

        .search-box {
            position: relative;
        }

        .search-box form {
            display: flex;
            align-items: center;
        }

        .search-box input {
            width: 300px;
            padding: 8px 40px 8px 12px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            font-size: 14px;
        }

        .search-box button {
            position: absolute;
            right: 8px;
            background: none;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }

        .user-menu {
            display: flex;
            gap: 8px;
        }

        .icon-btn {
            background: none;
            border: none;
            padding: 4px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 20px;
            transition: background-color 0.2s;
            text-decoration: none;
        }

        .icon-btn:hover {
            background-color: #f3f4f6;
        }

        /* 판매 페이지 스타일 */
        .sell-page {
            padding: 24px 0;
            max-width: 1000px;
            margin: 0 auto;
        }

        .page-header {
            margin-bottom: 32px;
        }

        .page-header h1 {
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 8px;
            color: #1f2937;
        }

        .page-header p {
            color: #6b7280;
            font-size: 16px;
        }

        .sell-form {
            background: white;
            border-radius: 12px;
            padding: 32px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .form-layout {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 32px;
        }

        /* 폼 카드 */
        .form-card {
            margin-bottom: 32px;
            padding-bottom: 32px;
            border-bottom: 1px solid #e5e7eb;
        }

        .form-card:last-child {
            margin-bottom: 0;
            padding-bottom: 0;
            border-bottom: none;
        }

        .form-card h3 {
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 20px;
            color: #1f2937;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        /* 이미지 업로드 */
        .image-upload-area {
            margin-bottom: 16px;
        }

        .image-preview {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
            gap: 12px;
            margin-bottom: 12px;
        }

        .upload-placeholder {
            aspect-ratio: 1;
            border: 2px dashed #d1d5db;
            border-radius: 8px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.2s;
            background: #f9fafb;
            position: relative;
        }

        .upload-placeholder:hover {
            border-color: #3b82f6;
            background: #f0f9ff;
        }

        .upload-placeholder span {
            font-size: 24px;
            margin-bottom: 8px;
        }

        .upload-placeholder p {
            font-size: 14px;
            color: #6b7280;
            margin-bottom: 4px;
            text-align: center;
        }

        .upload-placeholder small {
            font-size: 12px;
            color: #9ca3af;
        }

        .image-item {
            position: relative;
            aspect-ratio: 1;
            border-radius: 8px;
            overflow: hidden;
        }

        .image-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .remove-image {
            position: absolute;
            top: 4px;
            right: 4px;
            background: rgba(239, 68, 68, 0.9);
            color: white;
            border: none;
            border-radius: 50%;
            width: 24px;
            height: 24px;
            cursor: pointer;
            font-size: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .upload-info {
            font-size: 14px;
            color: #6b7280;
        }

        /* 폼 그룹 */
        .form-group {
            margin-bottom: 24px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #374151;
        }

        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 12px 16px;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            font-size: 16px;
            transition: border-color 0.2s;
        }

        .form-group input:focus,
        .form-group select:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
        }

        .char-count {
            display: block;
            text-align: right;
            font-size: 12px;
            color: #9ca3af;
            margin-top: 4px;
        }

        .price-input-wrapper {
            position: relative;
        }

        .currency {
            position: absolute;
            left: 16px;
            top: 50%;
            transform: translateY(-50%);
            color: #6b7280;
            font-weight: 500;
        }

        .price-input-wrapper input {
            padding-left: 40px;
        }

        /* 사이드바 */
        .sidebar .form-card {
            border-bottom: none;
            padding-bottom: 24px;
        }

        /* 미리보기 */
        .preview-card {
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            overflow: hidden;
        }

        .preview-image {
            width: 100%;
            height: 200px;
            background: #f3f4f6;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #9ca3af;
            font-size: 14px;
        }

        .preview-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .preview-card h4 {
            padding: 16px;
            margin: 0;
            font-size: 16px;
            font-weight: 500;
            color: #1f2937;
        }

        .preview-price {
            padding: 0 16px 16px;
            margin: 0;
            font-size: 18px;
            font-weight: 700;
            color: #1f2937;
        }

        /* 팁 */
        .tips ul {
            list-style: none;
            padding: 0;
        }

        .tips li {
            padding: 8px 0;
            font-size: 14px;
            color: #6b7280;
            position: relative;
            padding-left: 16px;
        }

        .tips li:before {
            content: "•";
            color: #3b82f6;
            position: absolute;
            left: 0;
        }

        /* 제출 액션 */
        .submit-actions {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .submit-actions button {
            width: 100%;
            padding: 14px;
            font-size: 16px;
            font-weight: 600;
            border-radius: 8px;
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
            background-color: transparent;
            color: #3b82f6;
            border: 1px solid #3b82f6;
        }

        .btn-outline:hover {
            background-color: #3b82f6;
            color: white;
        }

        /* 알림 */
        .alert {
            padding: 12px 16px;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .alert-error {
            background-color: #fef2f2;
            color: #dc2626;
            border: 1px solid #fecaca;
        }

        .alert-success {
            background-color: #f0fdf4;
            color: #16a34a;
            border: 1px solid #bbf7d0;
        }

        /* 반응형 */
        @media (max-width: 768px) {
            .header-content {
                gap: 16px;
            }
            
            .search-box input {
                width: 200px;
            }
            
            .nav {
                gap: 16px;
            }
            
            .nav a {
                font-size: 14px;
            }

            .sell-page {
                padding: 16px 0;
            }

            .sell-form {
                padding: 20px;
            }

            .form-layout {
                grid-template-columns: 1fr;
                gap: 24px;
            }

            .page-header h1 {
                font-size: 24px;
            }

            .image-preview {
                grid-template-columns: repeat(auto-fill, minmax(100px, 1fr));
            }

            .submit-actions {
                order: -1;
                margin-bottom: 24px;
            }
        }
    </style>
</head>
<body>
    <!-- 헤더 -->
    <header class="header">
        <div class="container">
            <div class="header-content">
                <!-- 로고 -->
                <div class="logo">
                    <a href="index.jsp">
                        <span class="logo-icon">중고</span>
                        <span class="logo-text">마켓</span>
                    </a>
                </div>
                
                <!-- 네비게이션 -->
                <nav class="nav">
                    <a href="buy.jsp">구매하기</a>
                    <a href="sell.jsp" class="active">판매하기</a>
                    <a href="community.jsp">커뮤니티</a>
                </nav>
                
                <!-- 검색 및 사용자 메뉴 -->
                <div class="header-actions">
                    <div class="search-box">
                        <form>
                            <input type="text" name="search" placeholder="상품을 검색해보세요...">
                            <button type="submit">🔍</button>
                        </form>
                    </div>
                    <div class="user-menu">
                        <a href="chat.jsp" class="icon-btn">💬</a>
                         <%
						    String userid = (String) session.getAttribute("userid");
						
						    if (userid != null) {
						        out.println("<a href='mypage.jsp'class='icon-btn'>👤</a>");
						    } else {
						        out.println("<a href='login.jsp' class='icon-btn'>👤 </a>");
						    }
						%> 
                    </div>
                </div>
            </div>
        </div>
    </header>
    
    <form action="sellmakePro.jsp" method="post" >
    <div class="container">
        <div class="sell-page">
            <div class="page-header">
                <h1>상품 등록</h1>
                <p>정확한 정보를 입력해주시면 더 빠른 거래가 가능합니다.</p>
            </div>
            
            <div class="sell-form">
                <div class="form-layout">
                    <!-- 메인 폼 -->
                    <div class="main-form">
                        <!-- 상품 사진 -->
                        <div class="form-card">
                            <h3>📷 상품 사진</h3>
                            <div class="image-upload-area">
                                <div class="image-preview" id="imagePreview">
                                    <div class="upload-placeholder" onclick="triggerFileInput()">
                                        <span>📷</span>
                                        <p>사진 추가</p>
                                        <small id="imageCount">0/8</small>
                                    </div>
                                </div>
                                <input type="file" id="imageInput" name="image" accept="image/*" multiple style="display: none;" onchange="handleImageUpload(this)">
                                <p class="upload-info">첫 번째 사진이 대표 사진이 됩니다. (최대 8장)</p>
                            </div>
                        </div>
                        
                        <!-- 기본 정보 -->
                        <div class="form-card">
                            <h3>📝 기본 정보</h3>
                            <div class="form-group">
                                <label for="category">카테고리 *</label>
                                <select id="category"  name="category" required>
                                    <option value="">카테고리를 선택해주세요</option>
                                    <option value="전자기기">전자기기</option>
                                    <option value="의류">의류</option>
                                    <option value="가구">가구/인테리어</option>
                                    <option value="생활용품">생활용품</option>
                                    <option value="스포츠">스포츠/레저</option>
                                    <option value="도서">도서/음반</option>
                                    <option value="게임">게임/취미</option>
                                    <option value="반려동물">반려동물용품</option>
                                    <option value="기타">기타</option>
                                </select>
                            </div>
                            
                            <div class="form-group">
                                <label for="title">제목 *</label>
                                <input type="text" id="title" name="title" maxlength="40" placeholder="상품 제목을 입력해주세요" required oninput="updatePreview()">
                                <small class="char-count" id="titleCount">0/40</small>
                            </div>
                            
                            <div class="form-group">
                                <label for="price">가격 *</label>
                                <div class="price-input-wrapper">
                                    <span class="currency">₩</span>
                                    <input type="number" id="price" name="price" placeholder="가격을 입력해주세요" required oninput="updatePreview()">
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="description">상품 설명</label>
                                <textarea id="description" name="content" rows="6" maxlength="1000" placeholder="상품에 대한 자세한 설명을 입력해주세요" oninput="updateCharCount(this, 1000)"></textarea>
                                <small class="char-count" id="descriptionCount">0/1000</small>
                            </div>
                        </div>
                        
                        <!-- 거래 정보 -->
                        <div class="form-card">
                            <h3>📍 거래 희망 지역</h3>
                            <div class="form-group">
                                <select id="location" name="location" required>
                                    <option value="">지역을 선택해주세요</option>
                                    <option value="강남구">강남구</option>
                                    <option value="서초구">서초구</option>
                                    <option value="송파구">송파구</option>
                                    <option value="마포구">마포구</option>
                                    <option value="강동구">강동구</option>
                                    <option value="노원구">노원구</option>
                                    <option value="강서구">강서구</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    
                    <!-- 사이드바 -->
                    <div class="sidebar">
                        <!-- 미리보기 -->
                        <div class="form-card">
                            <h3>👀 미리보기</h3>
                            <div class="preview-card">
                                <div class="preview-image" id="previewImage">
                                    <span>사진을 추가해주세요</span>
                                </div>
                                <h4 id="previewTitle">상품 제목을 입력해주세요</h4>
                                <p class="preview-price" id="previewPrice">가격을 입력해주세요</p>
                            </div>
                        </div>
                        
                        <!-- 판매 팁 -->
                        <div class="form-card">
                            <h3>💡 판매 팁</h3>
                            <div class="tips">
                                <ul>
                                    <li>깔끔한 사진으로 상품의 상태를 정확히 보여주세요</li>
                                    <li>상품의 장단점을 솔직하게 작성해주세요</li>
                                    <li>적정한 가격으로 책정해주세요</li>
                                    <li>빠른 답변으로 구매자와 소통해주세요</li>
                                </ul>
                            </div>
                        </div>
                        
                        <!-- 제출 버튼 -->
                        <div class="submit-actions">
                            <button type="submit" class="btn-primary" onclick="submitProduct()">상품 등록하기</button>
                            <button type="button" class="btn-outline" onclick="saveDraft()">임시저장</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
    
    <script>
        let uploadedImages = [];
        
        // 파일 입력 트리거
        function triggerFileInput() {
            if (uploadedImages.length < 8) {
                document.getElementById('imageInput').click();
            }
        }
        
        // 이미지 업로드 처리
        function handleImageUpload(input) {
            const files = Array.from(input.files);
            
            files.forEach(file => {
                if (uploadedImages.length >= 8) return;
                
                const reader = new FileReader();
                reader.onload = function(e) {
                    uploadedImages.push({
                        file: file,
                        url: e.target.result
                    });
                    renderImagePreview();
                    updatePreview();
                };
                reader.readAsDataURL(file);
            });
            
            // 입력 초기화
            input.value = '';
        }
        
        // 이미지 미리보기 렌더링
        function renderImagePreview() {
            const preview = document.getElementById('imagePreview');
            const imageCount = document.getElementById('imageCount');
            
            preview.innerHTML = '';
            
            // 업로드된 이미지들
            uploadedImages.forEach((image, index) => {
                const imageItem = document.createElement('div');
                imageItem.className = 'image-item';
                imageItem.innerHTML = `
                    <img src="${image.url}" alt="상품 이미지 ${index + 1}">
                    <button class="remove-image" onclick="removeImage(${index})">×</button>
                `;
                preview.appendChild(imageItem);
            });
            
            // 업로드 버튼 (8장 미만일 때만)
            if (uploadedImages.length < 8) {
                const uploadBtn = document.createElement('div');
                uploadBtn.className = 'upload-placeholder';
                uploadBtn.onclick = triggerFileInput;
                uploadBtn.innerHTML = `
                    <span>📷</span>
                    <p>사진 추가</p>
                    <small>${uploadedImages.length}/8</small>
                `;
                preview.appendChild(uploadBtn);
            }
            
            imageCount.textContent = `${uploadedImages.length}/8`;
        }
        
        // 이미지 제거
        function removeImage(index) {
            uploadedImages.splice(index, 1);
            renderImagePreview();
            updatePreview();
        }
        
        // 미리보기 업데이트
        function updatePreview() {
            const title = document.getElementById('title').value;
            const price = document.getElementById('price').value;
            const previewImage = document.getElementById('previewImage');
            const previewTitle = document.getElementById('previewTitle');
            const previewPrice = document.getElementById('previewPrice');
            
            // 제목 업데이트
            previewTitle.textContent = title || '상품 제목을 입력해주세요';
            
            // 가격 업데이트
            if (price) {
                previewPrice.textContent = parseInt(price).toLocaleString() + '원';
            } else {
                previewPrice.textContent = '가격을 입력해주세요';
            }
            
            // 이미지 업데이트
            if (uploadedImages.length > 0) {
                previewImage.innerHTML = `<img src="${uploadedImages[0].url}" alt="미리보기">`;
            } else {
                previewImage.innerHTML = '<span>사진을 추가해주세요</span>';
            }
            
            // 제목 글자 수 업데이트
            updateCharCount(document.getElementById('title'), 40);
        }
        
        // 글자 수 업데이트
        function updateCharCount(element, maxLength) {
            const countElement = document.getElementById(element.id + 'Count');
            if (countElement) {
                countElement.textContent = `${element.value.length}/${maxLength}`;
            }
        }
        
        // 상품 등록
        function submitProduct() {
            const title = document.getElementById('title').value;
            const price = document.getElementById('price').value;
            const category = document.getElementById('category').value;
            const location = document.getElementById('location').value;
            const description = document.getElementById('description').value;
            
            // 유효성 검사
            if (!title.trim()) {
                showAlert('제목을 입력해주세요.', 'error');
                return;
            }
            
            if (!price) {
                showAlert('가격을 입력해주세요.', 'error');
                return;
            }
            
            if (!category) {
                showAlert('카테고리를 선택해주세요.', 'error');
                return;
            }
            
            if (!location) {
                showAlert('거래 희망 지역을 선택해주세요.', 'error');
                return;
            }
            
            if (uploadedImages.length === 0) {
                showAlert('최소 1장의 상품 사진을 업로드해주세요.', 'error');
                return;
            }
            
            // 상품 등록 처리 (실제로는 서버로 전송)
            const productData = {
                title,
                price: parseInt(price),
                category,
                location,
                description,
                images: uploadedImages
            };
            
            console.log('상품 등록 데이터:', productData);
            showAlert('상품이 성공적으로 등록되었습니다!', 'success');
            
            // 3초 후 구매 페이지로 이동
            setTimeout(() => {
                window.location.href = 'buy.html';
            }, 3000);
        }
        
        // 임시저장
        function saveDraft() {
            const draftData = {
                title: document.getElementById('title').value,
                price: document.getElementById('price').value,
                category: document.getElementById('category').value,
                location: document.getElementById('location').value,
                description: document.getElementById('description').value,
                images: uploadedImages
            };
            
            localStorage.setItem('productDraft', JSON.stringify(draftData));
            showAlert('임시저장되었습니다.', 'success');
        }
        
        // 임시저장 데이터 불러오기
        function loadDraft() {
            const draftData = localStorage.getItem('productDraft');
            if (draftData) {
                const data = JSON.parse(draftData);
                
                document.getElementById('title').value = data.title || '';
                document.getElementById('price').value = data.price || '';
                document.getElementById('category').value = data.category || '';
                document.getElementById('location').value = data.location || '';
                document.getElementById('description').value = data.description || '';
                
                if (data.images) {
                    uploadedImages = data.images;
                    renderImagePreview();
                }
                
                updatePreview();
            }
        }
        
        // 알림 표시
        function showAlert(message, type) {
            // 기존 알림 제거
            const existingAlert = document.querySelector('.alert');
            if (existingAlert) {
                existingAlert.remove();
            }
            
            const alert = document.createElement('div');
            alert.className = `alert alert-${type}`;
            alert.textContent = message;
            
            const form = document.querySelector('.sell-form');
            form.insertBefore(alert, form.firstChild);
            
            // 5초 후 자동 제거
            setTimeout(() => {
                alert.remove();
            }, 5000);
        }
        
        // 페이지 로드 시 임시저장 데이터 불러오기
        document.addEventListener('DOMContentLoaded', function() {
            loadDraft();
            
            // 입력 이벤트 리스너 추가
            document.getElementById('title').addEventListener('input', updatePreview);
            document.getElementById('price').addEventListener('input', updatePreview);
            document.getElementById('description').addEventListener('input', function() {
                updateCharCount(this, 1000);
            });
        });
        
        // 페이지 떠날 때 확인
        window.addEventListener('beforeunload', function(e) {
            const title = document.getElementById('title').value;
            const price = document.getElementById('price').value;
            
            if (title || price) {
                e.preventDefault();
                e.returnValue = '';
            }
        });
    </script>
</body>
</html>