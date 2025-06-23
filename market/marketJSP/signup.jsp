<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 - 중고마켓</title>
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

        /* 회원가입 컨테이너 */
        .signup-container {
            max-width: 600px;
            margin: 40px auto;
            background: white;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        /* 헤더 */
        .signup-header {
            padding: 24px;
            text-align: center;
            border-bottom: 1px solid #e5e7eb;
        }

        .signup-title {
            font-size: 24px;
            font-weight: 700;
            color: #1f2937;
        }

        .signup-subtitle {
            font-size: 14px;
            color: #6b7280;
            margin-top: 8px;
        }

        /* 폼 */
        .signup-form {
            padding: 24px;
        }

        .form-group {
            margin-bottom: 20px;
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

        /* 비밀번호 강도 표시 */
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

        /* 인풋 그룹 (버튼이 있는 인풋) */
        .input-group {
            display: flex;
            gap: 8px;
        }

        .input-group .form-input {
            flex: 1;
        }

        .input-group .btn {
            white-space: nowrap;
        }

        /* 프로필 이미지 업로드 */
        .profile-upload {
            display: flex;
            align-items: center;
            gap: 16px;
            margin-bottom: 20px;
        }

        .profile-image {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background-color: #f3f4f6;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            position: relative;
        }

        .profile-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .profile-image .placeholder {
            font-size: 36px;
            color: #9ca3af;
        }

        .profile-upload-btn {
            background-color: #f3f4f6;
            color: #4b5563;
            border: 1px dashed #d1d5db;
            border-radius: 8px;
            padding: 12px 16px;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.2s;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            flex: 1;
            height: 100px;
        }

        .profile-upload-btn:hover {
            background-color: #e5e7eb;
        }

        .profile-upload-btn span {
            margin-top: 8px;
        }

        .profile-upload input[type="file"] {
            display: none;
        }

        /* 약관 동의 */
        .terms-container {
            margin-top: 32px;
            margin-bottom: 24px;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            padding: 16px;
        }

        .terms-title {
            font-size: 16px;
            font-weight: 600;
            color: #4b5563;
            margin-bottom: 12px;
        }

        .terms-group {
            margin-bottom: 12px;
        }

        .terms-check {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 8px;
        }

        .terms-check input[type="checkbox"] {
            width: 18px;
            height: 18px;
            accent-color: #3b82f6;
        }

        .terms-check label {
            font-size: 14px;
            color: #4b5563;
        }

        .terms-check .required {
            color: #ef4444;
            margin-left: 4px;
        }

        .terms-check .terms-link {
            margin-left: auto;
            font-size: 12px;
            color: #6b7280;
            text-decoration: underline;
            cursor: pointer;
        }

        .sub-terms {
            margin-left: 26px;
        }

        /* 버튼 */
        .btn {
            padding: 12px 16px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s;
            border: none;
        }

        .btn-primary {
            background-color: #3b82f6;
            color: white;
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

        .btn-block {
            display: block;
            width: 100%;
        }

        .btn-disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }

        /* 소셜 로그인 */
        .social-signup {
            margin-top: 32px;
            text-align: center;
        }

        .social-title {
            position: relative;
            margin-bottom: 16px;
            font-size: 14px;
            color: #6b7280;
        }

        .social-title::before,
        .social-title::after {
            content: "";
            position: absolute;
            top: 50%;
            width: 40%;
            height: 1px;
            background-color: #e5e7eb;
        }

        .social-title::before {
            left: 0;
        }

        .social-title::after {
            right: 0;
        }

        .social-buttons {
            display: flex;
            justify-content: center;
            gap: 16px;
            margin-bottom: 24px;
        }

        .social-btn {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            cursor: pointer;
            transition: all 0.2s;
        }

        .social-btn:hover {
            transform: translateY(-2px);
        }

        .social-google {
            background-color: #fff;
            color: #ea4335;
            border: 1px solid #e5e7eb;
        }

        .social-kakao {
            background-color: #fee500;
            color: #000;
        }

        .social-naver {
            background-color: #03c75a;
            color: #fff;
        }

        /* 로그인 링크 */
        .login-link {
            text-align: center;
            margin-top: 24px;
            font-size: 14px;
            color: #6b7280;
        }

        .login-link a {
            color: #3b82f6;
            text-decoration: none;
            font-weight: 500;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        /* 반응형 */
        @media (max-width: 768px) {
            .signup-container {
                margin: 20px auto;
                border-radius: 8px;
            }

            .signup-header {
                padding: 16px;
            }

            .signup-form {
                padding: 16px;
            }

            .profile-upload {
                flex-direction: column;
                align-items: flex-start;
            }

            .profile-image {
                margin: 0 auto;
            }

            .profile-upload-btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="signup-container">
            <!-- 회원가입 헤더 -->
            <div class="signup-header">
                <h1 class="signup-title">회원가입</h1>
                <p class="signup-subtitle">중고마켓에 오신 것을 환영합니다!</p>
            </div>
            
            <!-- 회원가입 폼 -->
            <form action="signupPro.jsp" method="post"> 
                <!-- 프로필 이미지 업로드 -->
                <div class="profile-upload">
                    <div class="profile-image" id="profilePreview">
                        <div class="placeholder">👤</div>
                    </div>
                    <label class="profile-upload-btn" for="profileImage">
                        <span>📷</span>
                        <span>프로필 이미지 업로드</span>
                        <input type="file" id="profileImage" accept="image/*">
                    </label>
                </div>
                
                <!-- 이메일 -->
                <div class="form-group">
                    <label for="email" class="form-label">이메일<span class="required">*</span></label>
                    <div class="input-group">
                        <input type="email" id="email" name="email" class="form-input" placeholder="example@email.com" required>
                        <button type="button" class="btn btn-outline" id="emailCheck">중복확인</button>
                    </div>
                    <div class="form-error" id="emailError">이미 사용 중인 이메일입니다.</div>
                    <div class="form-hint">이메일은 로그인 아이디로 사용됩니다.</div>
                </div>
                
                <!-- 비밀번호 -->
                <div class="form-group">
                    <label for="password" class="form-label">비밀번호<span class="required">*</span></label>
                    <input type="password" id="password" name="password" class="form-input" placeholder="비밀번호 입력 (8자 이상)" required>
                    <div class="password-strength">
                        <div class="strength-meter" id="passwordStrength"></div>
                    </div>
                    <div class="form-hint">영문, 숫자, 특수문자를 포함한 8자 이상</div>
                </div>
                
                <!-- 비밀번호 확인 -->
                <div class="form-group">
                    <label for="passwordConfirm" class="form-label">비밀번호 확인<span class="required">*</span></label>
                    <input type="password" id="passwordConfirm" class="form-input" placeholder="비밀번호 재입력" required>
                    <div class="form-error" id="passwordConfirmError">비밀번호가 일치하지 않습니다.</div>
                </div>
                
                <!-- 닉네임 -->
                <div class="form-group">
                    <label for="nickname" class="form-label">닉네임<span class="required">*</span></label>
                    <div class="input-group">
                        <input type="text" id="nickname" name="nickname" class="form-input" placeholder="닉네임 입력 (2~10자)" required>
                        <button type="button" class="btn btn-outline" id="nicknameCheck">중복확인</button>
                    </div>
                    <div class="form-error" id="nicknameError">이미 사용 중인 닉네임입니다.</div>
                </div>
                
                <!-- 전화번호 -->
                <div class="form-group">
                    <label for="phone" class="form-label">전화번호<span class="required">*</span></label>
                    <div class="input-group">
                        <input type="tel" id="phone" name="phone" class="form-input" placeholder="'-' 없이 입력" required>
                        <button type="button" class="btn btn-outline" id="sendVerification">인증번호 발송</button>
                    </div>
                </div>
                
                <!-- 인증번호 -->
                <div class="form-group" id="verificationGroup" style="display: none;">
                    <label for="verification" class="form-label">인증번호<span class="required">*</span></label>
                    <div class="input-group">
                        <input type="text" id="verification" class="form-input" placeholder="인증번호 6자리">
                        <button type="button" class="btn btn-outline" id="verifyCode">확인</button>
                    </div>
                    <div class="form-hint">인증번호가 발송되었습니다. (유효시간: 3분)</div>
                </div>
                
                <!-- 약관 동의 -->
                <div class="terms-container">
                    <h3 class="terms-title">약관 동의</h3>
                    
                    <div class="terms-group">
                        <div class="terms-check">
                            <input type="checkbox" id="termsAll">
                            <label for="termsAll"><strong>전체 동의</strong></label>
                        </div>
                    </div>
                    
                    <div class="terms-group">
                        <div class="terms-check">
                            <input type="checkbox" id="termsService" class="terms-checkbox" required>
                            <label for="termsService">서비스 이용약관 동의<span class="required">*</span></label>
                            <span class="terms-link" onclick="showTerms('service')">보기</span>
                        </div>
                        
                        <div class="terms-check">
                            <input type="checkbox" id="termsPrivacy" class="terms-checkbox" required>
                            <label for="termsPrivacy">개인정보 수집 및 이용 동의<span class="required">*</span></label>
                            <span class="terms-link" onclick="showTerms('privacy')">보기</span>
                        </div>
                        
                        <div class="terms-check">
                            <input type="checkbox" id="termsAge" class="terms-checkbox" required>
                            <label for="termsAge">만 14세 이상입니다<span class="required">*</span></label>
                        </div>
                    </div>
                    
                    <div class="terms-group">
                        <div class="terms-check">
                            <input type="checkbox" id="termsMarketing" class="terms-checkbox">
                            <label for="termsMarketing">마케팅 정보 수신 동의 (선택)</label>
                            <span class="terms-link" onclick="showTerms('marketing')">보기</span>
                        </div>
                        
                        <div class="sub-terms">
                            <div class="terms-check">
                                <input type="checkbox" id="termsEmail" class="terms-checkbox sub-checkbox">
                                <label for="termsEmail">이메일 수신 동의</label>
                            </div>
                            
                            <div class="terms-check">
                                <input type="checkbox" id="termsSMS" class="terms-checkbox sub-checkbox">
                                <label for="termsSMS">SMS 수신 동의</label>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- 회원가입 버튼 -->
                <button type="submit" class="btn btn-primary btn-block" id="signupButton">회원가입</button>
                
                <!-- 소셜 회원가입 -->
                <div class="social-signup">
                    <div class="social-title">간편 회원가입</div>
                    <div class="social-buttons">
                        <div class="social-btn social-google" onclick="socialSignup('google')">G</div>
                        <div class="social-btn social-kakao" onclick="socialSignup('kakao')">K</div>
                        <div class="social-btn social-naver" onclick="socialSignup('naver')">N</div>
                    </div>
                </div>
                
                <!-- 로그인 링크 -->
                <div class="login-link">
                    이미 계정이 있으신가요? <a href="#" onclick="goToLogin()">로그인</a>
                </div>
            </form>
        </div>
    </div>

    <script>
        // 프로필 이미지 미리보기
        document.getElementById('profileImage').addEventListener('change', function(e) {
            const file = e.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    const preview = document.getElementById('profilePreview');
                    preview.innerHTML = `<img src="${e.target.result}" alt="프로필 이미지">`;
                }
                reader.readAsDataURL(file);
            }
        });
        
        // 비밀번호 강도 체크
        document.getElementById('password').addEventListener('input', function(e) {
            const password = e.target.value;
            const strengthMeter = document.getElementById('passwordStrength');
            
            // 비밀번호 강도 계산 (간단한 예시)
            let strength = 0;
            
            if (password.length >= 8) strength += 1;
            if (/[A-Z]/.test(password)) strength += 1;
            if (/[0-9]/.test(password)) strength += 1;
            if (/[^A-Za-z0-9]/.test(password)) strength += 1;
            
            // 강도에 따른 시각적 표시
            strengthMeter.className = 'strength-meter';
            if (password.length === 0) {
                strengthMeter.style.width = '0';
            } else if (strength <= 2) {
                strengthMeter.classList.add('strength-weak');
            } else if (strength === 3) {
                strengthMeter.classList.add('strength-medium');
            } else {
                strengthMeter.classList.add('strength-strong');
            }
        });
        
        // 비밀번호 확인 체크
        document.getElementById('passwordConfirm').addEventListener('input', function(e) {
            const password = document.getElementById('password').value;
            const confirmPassword = e.target.value;
            const errorElement = document.getElementById('passwordConfirmError');
            
            if (confirmPassword && password !== confirmPassword) {
                errorElement.classList.add('visible');
            } else {
                errorElement.classList.remove('visible');
            }
        });
        
        // 이메일 중복 확인
        document.getElementById('emailCheck').addEventListener('click', function() {
            const email = document.getElementById('email').value;
            const errorElement = document.getElementById('emailError');
            
            if (!email) {
                alert('이메일을 입력해주세요.');
                return;
            }
            
            // 이메일 형식 검사
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                errorElement.textContent = '올바른 이메일 형식이 아닙니다.';
                errorElement.classList.add('visible');
                return;
            }
            
            // 서버 통신 대신 임시로 사용할 검증 (실제로는 서버에 중복 확인 요청)
            const isAvailable = Math.random() > 0.3; // 70% 확률로 사용 가능
            
            if (isAvailable) {
                alert('사용 가능한 이메일입니다.');
                errorElement.classList.remove('visible');
            } else {
                errorElement.textContent = '이미 사용 중인 이메일입니다.';
                errorElement.classList.add('visible');
            }
        });
        
        // 닉네임 중복 확인
        document.getElementById('nicknameCheck').addEventListener('click', function() {
            const nickname = document.getElementById('nickname').value;
            const errorElement = document.getElementById('nicknameError');
            
            if (!nickname) {
                alert('닉네임을 입력해주세요.');
                return;
            }
            
            if (nickname.length < 2 || nickname.length > 10) {
                errorElement.textContent = '닉네임은 2~10자로 입력해주세요.';
                errorElement.classList.add('visible');
                return;
            }
            
            // 서버 통신 대신 임시로 사용할 검증
            const isAvailable = Math.random() > 0.3; // 70% 확률로 사용 가능
            
            if (isAvailable) {
                alert('사용 가능한 닉네임입니다.');
                errorElement.classList.remove('visible');
            } else {
                errorElement.textContent = '이미 사용 중인 닉네임입니다.';
                errorElement.classList.add('visible');
            }
        });
        
        // 인증번호 발송
        document.getElementById('sendVerification').addEventListener('click', function() {
            const phone = document.getElementById('phone').value;
            
            if (!phone) {
                alert('전화번호를 입력해주세요.');
                return;
            }
            
            // 전화번호 형식 검사
            const phoneRegex = /^01[016789]\d{7,8}$/;
            if (!phoneRegex.test(phone)) {
                alert('올바른 전화번호 형식이 아닙니다.');
                return;
            }
            
            // 인증번호 입력 필드 표시
            document.getElementById('verificationGroup').style.display = 'block';
            
            // 인증번호 발송 버튼 비활성화 및 텍스트 변경
            const sendButton = document.getElementById('sendVerification');
            sendButton.textContent = '재발송';
            
            alert('인증번호가 발송되었습니다.');
        });
        
        // 인증번호 확인
        document.getElementById('verifyCode').addEventListener('click', function() {
            const code = document.getElementById('verification').value;
            
            if (!code) {
                alert('인증번호를 입력해주세요.');
                return;
            }
            
            // 임시로 123456을 올바른 인증번호로 설정
            if (code === '123456') {
                alert('인증이 완료되었습니다.');
                document.getElementById('verification').disabled = true;
                document.getElementById('verifyCode').disabled = true;
                document.getElementById('verifyCode').classList.add('btn-disabled');
                document.getElementById('verifyCode').textContent = '인증완료';
            } else {
                alert('인증번호가 일치하지 않습니다.');
            }
        });
        
        // 약관 전체 동의
        document.getElementById('termsAll').addEventListener('change', function(e) {
            const isChecked = e.target.checked;
            document.querySelectorAll('.terms-checkbox').forEach(checkbox => {
                checkbox.checked = isChecked;
            });
        });
        
        // 개별 약관 체크 시 전체 동의 상태 업데이트
        document.querySelectorAll('.terms-checkbox').forEach(checkbox => {
            checkbox.addEventListener('change', function() {
                const allChecked = Array.from(document.querySelectorAll('.terms-checkbox:not(.sub-checkbox)')).every(cb => cb.checked);
                document.getElementById('termsAll').checked = allChecked;
            });
        });
        
        // 마케팅 수신 동의 체크 시 하위 항목 자동 체크
        document.getElementById('termsMarketing').addEventListener('change', function(e) {
            const isChecked = e.target.checked;
            document.querySelectorAll('.sub-checkbox').forEach(checkbox => {
                checkbox.checked = isChecked;
            });
        });
        
        // 하위 항목 체크 시 상위 항목 자동 체크
        document.querySelectorAll('.sub-checkbox').forEach(checkbox => {
            checkbox.addEventListener('change', function() {
                if (this.checked) {
                    document.getElementById('termsMarketing').checked = true;
                } else {
                    const anyChecked = Array.from(document.querySelectorAll('.sub-checkbox')).some(cb => cb.checked);
                    document.getElementById('termsMarketing').checked = anyChecked;
                }
            });
        });
        
        // 약관 보기
        function showTerms(type) {
            let title, content;
            
            switch (type) {
                case 'service':
                    title = '서비스 이용약관';
                    content = '서비스 이용약관 내용이 여기에 표시됩니다.';
                    break;
                case 'privacy':
                    title = '개인정보 수집 및 이용 동의';
                    content = '개인정보 수집 및 이용에 관한 내용이 여기에 표시됩니다.';
                    break;
                case 'marketing':
                    title = '마케팅 정보 수신 동의';
                    content = '마케팅 정보 수신에 관한 내용이 여기에 표시됩니다.';
                    break;
                default:
                    return;
            }
            
            alert(`${title}\n\n${content}`);
        }
        
        // 소셜 회원가입
        function socialSignup(provider) {
            alert(`${provider} 계정으로 회원가입을 진행합니다.`);
        }
        
        // 로그인 페이지로 이동
        function goToLogin() {
            alert('로그인 페이지로 이동합니다.');
        }
        
        // 폼 제출
        document.getElementById('signupForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            // 필수 약관 동의 확인
            const requiredTerms = ['termsService', 'termsPrivacy', 'termsAge'];
            const allAgreed = requiredTerms.every(term => document.getElementById(term).checked);
            
            if (!allAgreed) {
                alert('필수 약관에 모두 동의해주세요.');
                return;
            }
            
            // 여기에 실제 회원가입 로직 추가
            alert('회원가입이 완료되었습니다!');
        });
    </script>
</body>
</html>