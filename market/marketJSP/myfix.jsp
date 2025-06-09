<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보 수정 - 중고마켓</title>
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
            min-height: 100px;
            resize: vertical;
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

        /* 프로필 이미지 업로드 */
        .profile-upload {
            display: flex;
            align-items: center;
            gap: 24px;
            margin-bottom: 24px;
        }

        .profile-image {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            background-color: #f3f4f6;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            position: relative;
            border: 3px solid #e5e7eb;
        }

        .profile-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .profile-image .placeholder {
            font-size: 48px;
            color: #9ca3af;
        }

        .profile-upload-controls {
            flex: 1;
        }

        .upload-buttons {
            display: flex;
            gap: 12px;
            margin-bottom: 12px;
        }

        .upload-btn {
            position: relative;
            overflow: hidden;
            display: inline-block;
        }

        .upload-btn input[type="file"] {
            position: absolute;
            left: -9999px;
        }

        /* 비밀번호 강도 */
        .password-strength {
            margin-top: 8px;
            height: 4px;
            background-color: #e5e7eb;
            border-radius: 2px;
            overflow: hidden;
        }

        .strength-meter {
            height: 100%;
            width: 0;
            transition: width 0.3s, background-color 0.3s;
        }

        .strength-weak {
            width: 33%;
            background-color: #ef4444;
        }

        .strength-medium {
            width: 66%;
            background-color: #f59e0b;
        }

        .strength-strong {
            width: 100%;
            background-color: #10b981;
        }

        .strength-text {
            font-size: 12px;
            margin-top: 4px;
            font-weight: 500;
        }

        .strength-text.weak {
            color: #ef4444;
        }

        .strength-text.medium {
            color: #f59e0b;
        }

        .strength-text.strong {
            color: #10b981;
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

            .profile-upload {
                flex-direction: column;
                text-align: center;
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
            <h1 class="page-title">회원정보 수정</h1>
            <p class="page-subtitle">개인정보를 안전하게 관리하세요</p>
        </div>

        <form action="myfixPro.jsp" method="post">
            <!-- 알림 메시지 -->
            <div class="alert alert-success" id="successAlert">
                회원정보가 성공적으로 수정되었습니다.
            </div>
            
            <div class="alert alert-error" id="errorAlert">
                오류가 발생했습니다. 다시 시도해주세요.
            </div>

            <!-- 프로필 이미지 섹션 -->
            <div class="section">
                <h2 class="section-title">📷 프로필 이미지</h2>
                <div class="profile-upload">
                    <div class="profile-image" id="profilePreview">
                        <img src="/placeholder.svg?height=120&width=120" alt="프로필 이미지" id="profileImg">
                    </div>
                    <div class="profile-upload-controls">
                        <div class="upload-buttons">
                            <label class="btn btn-outline upload-btn">
                                이미지 변경
                                <input type="file" id="profileImageInput" accept="image/*">
                            </label>
                            <button type="button" class="btn btn-secondary" onclick="removeProfileImage()">기본 이미지</button>
                        </div>
                        <div class="form-hint">JPG, PNG 파일만 업로드 가능 (최대 5MB)</div>
                    </div>
                </div>
            </div>

            <!-- 기본 정보 섹션 -->
            <div class="section">
                <h2 class="section-title">👤 기본 정보</h2>
                
                <div class="form-group">
                    <label for="email" class="form-label">이메일</label>
                    <input type="email" id="email" class="form-input" value="user@example.com" disabled>
                    <div class="form-hint">이메일은 보안상 변경할 수 없습니다. 변경이 필요한 경우 고객센터에 문의하세요.</div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="nickname" class="form-label">닉네임<span class="required">*</span></label>
                        <div class="input-group">
                            <input type="text" id="nickname" name="nickname" class="form-input" value="김사용자" placeholder="닉네임 입력" required>
                            <button type="button" class="btn btn-outline" id="nicknameCheck">중복확인</button>
                        </div>
                        <div class="form-error" id="nicknameError">이미 사용 중인 닉네임입니다.</div>
                        <div class="form-success" id="nicknameSuccess">사용 가능한 닉네임입니다.</div>
                    </div>

                    <div class="form-group">
                        <label for="phone" class="form-label">전화번호<span class="required">*</span></label>
                        <div class="input-group">
                            <input type="tel" id="phone" name="phone" class="form-input" value="01012345678" placeholder="'-' 없이 입력" required>
                            <button type="button" class="btn btn-outline" id="phoneVerify">인증</button>
                        </div>
                        <div class="form-hint">전화번호 변경 시 인증이 필요합니다.</div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="bio" class="form-label">자기소개</label>
                    <textarea id="bio" class="form-input form-textarea" placeholder="자신을 소개해보세요" maxlength="200">안녕하세요! 깔끔한 거래를 지향하는 판매자입니다.</textarea>
                    <div class="char-counter">
                        <span id="bioCount">35</span>/200자
                    </div>
                </div>

                <div class="form-group">
                    <label for="location" class="form-label">거래 지역</label>
                    <div class="input-group">
                        <input type="text" id="location" class="form-input" value="서울시 강남구" placeholder="거래 선호 지역">
                        <button type="button" class="btn btn-outline" onclick="getCurrentLocation()">현재 위치</button>
                    </div>
                    <div class="form-hint">주로 거래하는 지역을 설정하세요.</div>
                </div>
            </div>

            <!-- 비밀번호 변경 섹션 -->
            <div class="section">
                <h2 class="section-title">🔒 비밀번호 변경</h2>
                
                <div class="form-group">
                    <label for="currentPassword" class="form-label">현재 비밀번호</label>
                    <input type="password" id="currentPassword" class="form-input" placeholder="현재 비밀번호 입력">
                    <div class="form-error" id="currentPasswordError">현재 비밀번호가 일치하지 않습니다.</div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="newPassword" class="form-label">새 비밀번호</label>
                        <input type="password" id="newPassword" name="password" class="form-input" placeholder="새 비밀번호 입력">
                        <div class="password-strength">
                            <div class="strength-meter" id="passwordStrength"></div>
                        </div>
                        <div class="strength-text" id="strengthText"></div>
                        <div class="form-hint">영문, 숫자, 특수문자를 포함한 8자 이상</div>
                    </div>

                    <div class="form-group">
                        <label for="confirmPassword" class="form-label">비밀번호 확인</label>
                        <input type="password" id="confirmPassword" class="form-input" placeholder="비밀번호 재입력">
                        <div class="form-error" id="confirmPasswordError">비밀번호가 일치하지 않습니다.</div>
                        <div class="form-success" id="confirmPasswordSuccess">비밀번호가 일치합니다.</div>
                    </div>
                </div>
            </div>

            <!-- 알림 설정 섹션 -->
            <div class="section">
                <h2 class="section-title">🔔 알림 설정</h2>
                
                <div class="checkbox-group">
                    <div class="checkbox-item">
                        <input type="checkbox" id="emailNotification" checked>
                        <label for="emailNotification">이메일 알림 받기</label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" id="smsNotification" checked>
                        <label for="smsNotification">SMS 알림 받기</label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" id="pushNotification" checked>
                        <label for="pushNotification">푸시 알림 받기</label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" id="marketingNotification">
                        <label for="marketingNotification">마케팅 정보 수신 동의</label>
                    </div>
                </div>
            </div>

            <!-- 개인정보 공개 설정 -->
            <div class="section">
                <h2 class="section-title">🔐 개인정보 공개 설정</h2>
                
                <div class="checkbox-group">
                    <div class="checkbox-item">
                        <input type="checkbox" id="showProfile" checked>
                        <label for="showProfile">프로필 정보 공개</label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" id="showLocation" checked>
                        <label for="showLocation">거래 지역 공개</label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" id="showActivity">
                        <label for="showActivity">활동 내역 공개</label>
                    </div>
                </div>
            </div>

            <!-- 위험 구역 -->
            <div class="section danger">
                <h2 class="section-title">⚠️ 계정 관리</h2>
                
                <div class="form-group">
                    <label class="form-label">계정 상태</label>
                    <div style="display: flex; gap: 12px; margin-top: 8px;">
                        <button type="button" class="btn btn-secondary" onclick="pauseAccount()">계정 일시 정지</button>
                        <button type="button" class="btn btn-danger" onclick="deleteAccount()">계정 삭제</button>
                    </div>
                    <div class="form-hint">계정 삭제 시 모든 데이터가 영구적으로 삭제되며 복구할 수 없습니다.</div>
                </div>
            </div>

            <!-- 폼 액션 버튼 -->
            <div class="form-actions">
                <div class="action-left">
                    <button type="button" class="btn btn-secondary" onclick="goBack()">취소</button>
                </div>
                <div class="action-right">
                    <button type="button" class="btn btn-outline" onclick="resetForm()">초기화</button>
                    <button type="submit" class="btn btn-primary" id="saveButton">변경사항 저장</button>
                </div>
            </div>
        </form>
    </div>

    <script>
        // 폼 요소들
        const profileForm = document.getElementById('profileForm');
        const profileImageInput = document.getElementById('profileImageInput');
        const profileImg = document.getElementById('profileImg');
        const nicknameInput = document.getElementById('nickname');
        const bioTextarea = document.getElementById('bio');
        const bioCount = document.getElementById('bioCount');
        const newPasswordInput = document.getElementById('newPassword');
        const confirmPasswordInput = document.getElementById('confirmPassword');
        const saveButton = document.getElementById('saveButton');

        // 초기 데이터 저장 (변경사항 감지용)
        let initialData = {};

        // 페이지 로드 시 초기화
        window.addEventListener('load', function() {
            saveInitialData();
            updateCharCount();
        });

        // 초기 데이터 저장
        function saveInitialData() {
            const formData = new FormData(profileForm);
            initialData = Object.fromEntries(formData);
        }

        // 프로필 이미지 변경
        profileImageInput.addEventListener('change', function(e) {
            const file = e.target.files[0];
            if (file) {
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
                    profileImg.src = e.target.result;
                    checkFormChanges();
                }
                reader.readAsDataURL(file);
            }
        });

        // 기본 이미지로 변경
        function removeProfileImage() {
            profileImg.src = '/placeholder.svg?height=120&width=120';
            profileImageInput.value = '';
            checkFormChanges();
        }

        // 닉네임 중복 확인
        document.getElementById('nicknameCheck').addEventListener('click', function() {
            const nickname = nicknameInput.value.trim();
            const errorElement = document.getElementById('nicknameError');
            const successElement = document.getElementById('nicknameSuccess');

            if (!nickname) {
                showError('닉네임을 입력해주세요.');
                return;
            }

            if (nickname.length < 2 || nickname.length > 10) {
                errorElement.textContent = '닉네임은 2~10자로 입력해주세요.';
                errorElement.classList.add('visible');
                successElement.classList.remove('visible');
                nicknameInput.classList.add('error');
                return;
            }

            // 서버 통신 시뮬레이션
            const isAvailable = Math.random() > 0.3; // 70% 확률로 사용 가능

            if (isAvailable) {
                successElement.classList.add('visible');
                errorElement.classList.remove('visible');
                nicknameInput.classList.remove('error');
                nicknameInput.classList.add('success');
            } else {
                errorElement.textContent = '이미 사용 중인 닉네임입니다.';
                errorElement.classList.add('visible');
                successElement.classList.remove('visible');
                nicknameInput.classList.add('error');
                nicknameInput.classList.remove('success');
            }
        });

        // 전화번호 인증
        document.getElementById('phoneVerify').addEventListener('click', function() {
            const phone = document.getElementById('phone').value;
            
            if (!phone) {
                showError('전화번호를 입력해주세요.');
                return;
            }

            const phoneRegex = /^01[016789]\d{7,8}$/;
            if (!phoneRegex.test(phone)) {
                showError('올바른 전화번호 형식이 아닙니다.');
                return;
            }

            showSuccess('인증번호가 발송되었습니다.');
        });

        // 자기소개 글자 수 카운트
        bioTextarea.addEventListener('input', updateCharCount);

        function updateCharCount() {
            const length = bioTextarea.value.length;
            bioCount.textContent = length;
            
            if (length > 200) {
                bioCount.style.color = '#ef4444';
            } else {
                bioCount.style.color = '#6b7280';
            }
            
            checkFormChanges();
        }

        // 현재 위치 가져오기
        function getCurrentLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function(position) {
                    // 실제로는 좌표를 주소로 변환하는 API 사용
                    document.getElementById('location').value = '서울시 강남구 (현재 위치)';
                    showSuccess('현재 위치가 설정되었습니다.');
                    checkFormChanges();
                }, function() {
                    showError('위치 정보를 가져올 수 없습니다.');
                });
            } else {
                showError('이 브라우저는 위치 서비스를 지원하지 않습니다.');
            }
        }

        // 비밀번호 강도 체크
        newPasswordInput.addEventListener('input', function() {
            const password = this.value;
            const strengthMeter = document.getElementById('passwordStrength');
            const strengthText = document.getElementById('strengthText');

            if (!password) {
                strengthMeter.className = 'strength-meter';
                strengthText.textContent = '';
                strengthText.className = 'strength-text';
                return;
            }

            let strength = 0;
            if (password.length >= 8) strength += 1;
            if (/[A-Z]/.test(password)) strength += 1;
            if (/[0-9]/.test(password)) strength += 1;
            if (/[^A-Za-z0-9]/.test(password)) strength += 1;

            strengthMeter.className = 'strength-meter';
            strengthText.className = 'strength-text';

            if (strength <= 2) {
                strengthMeter.classList.add('strength-weak');
                strengthText.classList.add('weak');
                strengthText.textContent = '약함';
            } else if (strength === 3) {
                strengthMeter.classList.add('strength-medium');
                strengthText.classList.add('medium');
                strengthText.textContent = '보통';
            } else {
                strengthMeter.classList.add('strength-strong');
                strengthText.classList.add('strong');
                strengthText.textContent = '강함';
            }

            checkPasswordMatch();
        });

        // 비밀번호 확인
        confirmPasswordInput.addEventListener('input', checkPasswordMatch);

        function checkPasswordMatch() {
            const newPassword = newPasswordInput.value;
            const confirmPassword = confirmPasswordInput.value;
            const errorElement = document.getElementById('confirmPasswordError');
            const successElement = document.getElementById('confirmPasswordSuccess');

            if (!confirmPassword) {
                errorElement.classList.remove('visible');
                successElement.classList.remove('visible');
                confirmPasswordInput.classList.remove('error', 'success');
                return;
            }

            if (newPassword === confirmPassword) {
                successElement.classList.add('visible');
                errorElement.classList.remove('visible');
                confirmPasswordInput.classList.remove('error');
                confirmPasswordInput.classList.add('success');
            } else {
                errorElement.classList.add('visible');
                successElement.classList.remove('visible');
                confirmPasswordInput.classList.add('error');
                confirmPasswordInput.classList.remove('success');
            }
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
        profileForm.addEventListener('submit', function(e) {
            e.preventDefault();

            // 유효성 검사
            if (!validateForm()) {
                return;
            }

            // 저장 처리
            saveButton.disabled = true;
            saveButton.textContent = '저장 중...';

            setTimeout(() => {
                saveButton.disabled = false;
                saveButton.textContent = '변경사항 저장';
                saveInitialData(); // 새로운 초기 데이터로 업데이트
                window.location.href = 'mypage.jsp';
                alert('회원정보가 성공적으로 수정되었습니다.');
            }, 1500);
            
        });

        // 폼 유효성 검사
        function validateForm() {
            let isValid = true;

            // 닉네임 검사
            const nickname = nicknameInput.value.trim();
            if (!nickname || nickname.length < 2 || nickname.length > 10) {
                showError('닉네임은 2~10자로 입력해주세요.');
                isValid = false;
            }

            // 비밀번호 검사 (변경하는 경우)
            const currentPassword = document.getElementById('currentPassword').value;
            const newPassword = newPasswordInput.value;
            const confirmPassword = confirmPasswordInput.value;

            if (newPassword || confirmPassword) {
                if (!currentPassword) {
                    showError('현재 비밀번호를 입력해주세요.');
                    isValid = false;
                }
                if (newPassword !== confirmPassword) {
                    showError('새 비밀번호가 일치하지 않습니다.');
                    isValid = false;
                }
                if (newPassword.length < 8) {
                    showError('새 비밀번호는 8자 이상이어야 합니다.');
                    isValid = false;
                }
            }

            return isValid;
        }

        // 계정 일시 정지
        function pauseAccount() {
            if (confirm('계정을 일시 정지하시겠습니까?\n정지 기간 동안 서비스를 이용할 수 없습니다.')) {
                showSuccess('계정이 일시 정지되었습니다.');
            }
        }

        // 계정 삭제
        function deleteAccount() {
            const confirmation = prompt('계정을 삭제하려면 "삭제"를 입력하세요:');
            if (confirmation === '삭제') {
                if (confirm('정말로 계정을 삭제하시겠습니까?\n이 작업은 되돌릴 수 없습니다.')) {
                    alert('계정이 삭제되었습니다.');
                    // 실제로는 로그인 페이지로 이동
                }
            } else if (confirmation !== null) {
                showError('입력이 올바르지 않습니다.');
            }
        }

        // 폼 초기화
        function resetForm() {
            if (confirm('모든 변경사항을 초기화하시겠습니까?')) {
                profileForm.reset();
                removeProfileImage();
                updateCharCount();
                showSuccess('폼이 초기화되었습니다.');
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
    </script>
</body>
</html>