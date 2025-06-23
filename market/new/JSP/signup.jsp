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
            background-color: transparent;
            color: #3b82f6;
            border: 1px solid #3b82f6;
        }

        .btn-outline:hover {
            background-color: #3b82f6;
            color: white;
        }

        .btn-block {
            display: block;
            width: 100%;
        }

        .btn-disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }

        /* 약관 동의 */
        .terms-container {
            margin: 32px 0;
            padding: 20px;
            background-color: #f9fafb;
            border-radius: 8px;
            border: 1px solid #e5e7eb;
        }

        .terms-title {
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 16px;
            color: #1f2937;
        }

        .terms-group {
            margin-bottom: 16px;
        }

        .terms-group:last-child {
            margin-bottom: 0;
        }

        .terms-check {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 8px;
        }

        .terms-check input[type="checkbox"] {
            width: 16px;
            height: 16px;
            accent-color: #3b82f6;
        }

        .terms-check label {
            flex: 1;
            font-size: 14px;
            color: #4b5563;
            cursor: pointer;
        }

        .terms-link {
            font-size: 12px;
            color: #3b82f6;
            cursor: pointer;
            text-decoration: underline;
        }

        .sub-terms {
            margin-left: 24px;
            padding-left: 16px;
            border-left: 2px solid #e5e7eb;
        }

        /* 소셜 회원가입 */
        .social-signup {
            margin-top: 32px;
            text-align: center;
        }

        .social-title {
            position: relative;
            margin-bottom: 20px;
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
            font-size: 20px;
            cursor: pointer;
            transition: all 0.2s;
        }

        .social-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
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
            padding-top: 24px;
            border-top: 1px solid #e5e7eb;
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
            <form action="signupPro.jsp" method="post" class="signup-form">
                <!-- 이메일 -->
                <div class="form-group">
                    <label for="userid" class="form-label">이메일<span class="required">*</span></label>
                    <input type="email" id="userid" name="userid" class="form-input" placeholder="example@email.com" required>
                    <div class="form-error" id="emailError">이미 사용 중인 이메일입니다.</div>
                    <div class="form-hint">이메일은 로그인 아이디로 사용됩니다.</div>
                </div>
                
                <!-- 비밀번호 -->
                <div class="form-group">
                    <label for="password" class="form-label">비밀번호<span class="required">*</span></label>
                    <input type="password" id="password" name="password" class="form-input" placeholder="비밀번호 입력 (8자 이상)" required>
                    <div class="form-hint">영문, 숫자, 특수문자를 포함한 8자 이상</div>
                </div>
                
                <!-- 비밀번호 확인 -->
                <div class="form-group">
                    <label for="passwordConfirm" class="form-label">비밀번호 확인<span class="required">*</span></label>
                    <input type="password" id="passwordConfirm" class="form-input" placeholder="비밀번호 재입력" required>
                    <div class="form-error" id="passwordConfirmError">비밀번호가 일치하지 않습니다.</div>
                </div>
                
                <!-- 이름 -->
                <div class="form-group">
                    <label for="username" class="form-label">이름<span class="required">*</span></label>
                    <input type="text" id="username" name="username" class="form-input" placeholder="이름을 입력하세요" required>
                </div>
                
                <!-- 전화번호 -->
                <div class="form-group">
                    <label for="phone" class="form-label">전화번호<span class="required">*</span></label>
                    <input type="tel" id="phone" name="phone" class="form-input" placeholder="'-' 없이 입력" required>
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
                    이미 계정이 있으신가요? <a href="login.jsp">로그인</a>
                </div>
            </form>
        </div>
    </div>

    <script>
        // 비밀번호 확인
        document.getElementById('passwordConfirm').addEventListener('input', function() {
            const password = document.getElementById('password').value;
            const passwordConfirm = this.value;
            const errorElement = document.getElementById('passwordConfirmError');
            
            if (passwordConfirm && password !== passwordConfirm) {
                this.classList.add('error');
                errorElement.classList.add('visible');
            } else {
                this.classList.remove('error');
                errorElement.classList.remove('visible');
            }
        });
        
        // 전체 동의 체크박스
        document.getElementById('termsAll').addEventListener('change', function() {
            const checkboxes = document.querySelectorAll('.terms-checkbox');
            checkboxes.forEach(checkbox => {
                checkbox.checked = this.checked;
            });
        });
        
        // 개별 약관 체크박스
        document.querySelectorAll('.terms-checkbox').forEach(checkbox => {
            checkbox.addEventListener('change', function() {
                const allCheckboxes = document.querySelectorAll('.terms-checkbox');
                const checkedCheckboxes = document.querySelectorAll('.terms-checkbox:checked');
                const termsAll = document.getElementById('termsAll');
                
                termsAll.checked = allCheckboxes.length === checkedCheckboxes.length;
            });
        });
        
        // 약관 보기
        function showTerms(type) {
            let title = '';
            let content = '';
            
            switch(type) {
                case 'service':
                    title = '서비스 이용약관';
                    content = '서비스 이용약관 내용입니다...';
                    break;
                case 'privacy':
                    title = '개인정보 수집 및 이용';
                    content = '개인정보 수집 및 이용 약관 내용입니다...';
                    break;
                case 'marketing':
                    title = '마케팅 정보 수신 동의';
                    content = '마케팅 정보 수신 동의 약관 내용입니다...';
                    break;
            }
            
            alert(title + '\n\n' + content);
        }
        
        // 소셜 회원가입
        function socialSignup(provider) {
            alert('소셜 회원가입 기능은 추후 구현 예정입니다.');
        }
        
        // 폼 제출 시 유효성 검사
        document.querySelector('form').addEventListener('submit', function(e) {
            const requiredCheckboxes = document.querySelectorAll('.terms-checkbox[required]');
            let allChecked = true;
            
            requiredCheckboxes.forEach(checkbox => {
                if (!checkbox.checked) {
                    allChecked = false;
                }
            });
            
            if (!allChecked) {
                e.preventDefault();
                alert('필수 약관에 동의해주세요.');
                return false;
            }
            
            const password = document.getElementById('password').value;
            const passwordConfirm = document.getElementById('passwordConfirm').value;
            
            if (password !== passwordConfirm) {
                e.preventDefault();
                alert('비밀번호가 일치하지 않습니다.');
                return false;
            }
        });
    </script>
</body>
</html>