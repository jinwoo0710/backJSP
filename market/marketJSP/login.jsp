<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 - 중고마켓</title>
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
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        /* 로그인 컨테이너 */
        .login-container {
            max-width: 400px;
            width: 100%;
            background: white;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        /* 헤더 */
        .login-header {
            padding: 32px 24px 24px;
            text-align: center;
            border-bottom: 1px solid #e5e7eb;
        }

        .login-title {
            font-size: 28px;
            font-weight: 700;
            color: #1f2937;
            margin-bottom: 8px;
        }

        .login-subtitle {
            font-size: 14px;
            color: #6b7280;
        }

        /* 폼 */
        .login-form {
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

        /* 로그인 옵션 */
        .login-options {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 24px;
        }

        .remember-me {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .remember-me input[type="checkbox"] {
            width: 16px;
            height: 16px;
            accent-color: #3b82f6;
        }

        .remember-me label {
            font-size: 14px;
            color: #4b5563;
            cursor: pointer;
        }

        .forgot-password {
            font-size: 14px;
            color: #3b82f6;
            text-decoration: none;
            cursor: pointer;
        }

        .forgot-password:hover {
            text-decoration: underline;
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

        .btn-block {
            display: block;
            width: 100%;
        }

        .btn-disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }

        /* 소셜 로그인 */
        .social-login {
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
            text-decoration: none;
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

        /* 회원가입 링크 */
        .signup-link {
            text-align: center;
            margin-top: 24px;
            padding-top: 24px;
            border-top: 1px solid #e5e7eb;
            font-size: 14px;
            color: #6b7280;
        }

        .signup-link a {
            color: #3b82f6;
            text-decoration: none;
            font-weight: 500;
        }

        .signup-link a:hover {
            text-decoration: underline;
        }

        /* 로딩 스피너 */
        .loading-spinner {
            display: none;
            width: 20px;
            height: 20px;
            border: 2px solid #ffffff;
            border-top: 2px solid transparent;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            margin-right: 8px;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        /* 알림 메시지 */
        .alert {
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 14px;
            display: none;
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

        /* 반응형 */
        @media (max-width: 768px) {
            body {
                padding: 20px;
                align-items: flex-start;
                padding-top: 60px;
            }

            .login-container {
                border-radius: 8px;
            }

            .login-header {
                padding: 24px 16px 16px;
            }

            .login-form {
                padding: 16px;
            }

            .login-title {
                font-size: 24px;
            }

            .social-buttons {
                gap: 12px;
            }

            .social-btn {
                width: 44px;
                height: 44px;
                font-size: 18px;
            }
        }

        /* 다크모드 지원 (선택사항) */
        @media (prefers-color-scheme: dark) {
            body {
                background-color: #111827;
                color: #f9fafb;
            }

            .login-container {
                background: #1f2937;
                border: 1px solid #374151;
            }

            .login-header {
                border-bottom-color: #374151;
            }

            .login-title {
                color: #f9fafb;
            }

            .form-input {
                background-color: #374151;
                border-color: #4b5563;
                color: #f9fafb;
            }

            .form-input:focus {
                border-color: #3b82f6;
            }

            .signup-link {
                border-top-color: #374151;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="login-container">
            <!-- 로그인 헤더 -->
            <div class="login-header">
                <h1 class="login-title">로그인</h1>
                <p class="login-subtitle">중고마켓에 오신 것을 환영합니다!</p>
            </div>
            
            <!-- 로그인 폼 -->
            <form class="login-form" id="loginForm">
                <!-- 알림 메시지 -->
                <div class="alert alert-error" id="errorAlert">
                    이메일 또는 비밀번호가 올바르지 않습니다.
                </div>
                
                <div class="alert alert-success" id="successAlert">
                    로그인이 완료되었습니다.
                </div>
                
                <!-- 이메일 -->
                <div class="form-group">
                    <label for="email" class="form-label">이메일</label>
                    <input type="email" id="email" class="form-input" placeholder="이메일을 입력하세요" required>
                    <div class="form-error" id="emailError">올바른 이메일 형식이 아닙니다.</div>
                </div>
                
                <!-- 비밀번호 -->
                <div class="form-group">
                    <label for="password" class="form-label">비밀번호</label>
                    <input type="password" id="password" class="form-input" placeholder="비밀번호를 입력하세요" required>
                    <div class="form-error" id="passwordError">비밀번호를 입력해주세요.</div>
                </div>
                
                <!-- 로그인 옵션 -->
                <div class="login-options">
                    <div class="remember-me">
                        <input type="checkbox" id="rememberMe">
                        <label for="rememberMe">로그인 상태 유지</label>
                    </div>
                    <a href="#" class="forgot-password" onclick="forgotPassword()">비밀번호 찾기</a>
                </div>
                
                <!-- 로그인 버튼 -->
                <button type="submit" class="btn btn-primary btn-block" id="loginButton">
                    <div class="loading-spinner" id="loadingSpinner"></div>
                    <span id="loginButtonText">로그인</span>
                </button>
                
                <!-- 소셜 로그인 -->
                <div class="social-login">
                    <div class="social-title">간편 로그인</div>
                    <div class="social-buttons">
                        <a href="#" class="social-btn social-google" onclick="socialLogin('google')">
                            <span>G</span>
                        </a>
                        <a href="#" class="social-btn social-kakao" onclick="socialLogin('kakao')">
                            <span>K</span>
                        </a>
                        <a href="#" class="social-btn social-naver" onclick="socialLogin('naver')">
                            <span>N</span>
                        </a>
                    </div>
                </div>
                
                <!-- 회원가입 링크 -->
                <div class="signup-link">
                    아직 계정이 없으신가요? <a href="#" onclick="goToSignup()">회원가입</a>
                </div>
            </form>
        </div>
    </div>

    <script>
        // 폼 요소들
        const loginForm = document.getElementById('loginForm');
        const emailInput = document.getElementById('email');
        const passwordInput = document.getElementById('password');
        const loginButton = document.getElementById('loginButton');
        const loadingSpinner = document.getElementById('loadingSpinner');
        const loginButtonText = document.getElementById('loginButtonText');
        const errorAlert = document.getElementById('errorAlert');
        const successAlert = document.getElementById('successAlert');
        
        // 이메일 유효성 검사
        emailInput.addEventListener('blur', function() {
            const email = this.value;
            const emailError = document.getElementById('emailError');
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            
            if (email && !emailRegex.test(email)) {
                this.classList.add('error');
                emailError.classList.add('visible');
            } else {
                this.classList.remove('error');
                emailError.classList.remove('visible');
            }
        });
        
        // 비밀번호 입력 시 에러 제거
        passwordInput.addEventListener('input', function() {
            if (this.value) {
                this.classList.remove('error');
                document.getElementById('passwordError').classList.remove('visible');
            }
        });
        
        // 로그인 폼 제출
        loginForm.addEventListener('submit', function(e) {
            e.preventDefault();
            
            const email = emailInput.value;
            const password = passwordInput.value;
            const rememberMe = document.getElementById('rememberMe').checked;
            
            // 기본 유효성 검사
            if (!email || !password) {
                showError('이메일과 비밀번호를 모두 입력해주세요.');
                return;
            }
            
            // 이메일 형식 검사
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                showError('올바른 이메일 형식이 아닙니다.');
                emailInput.classList.add('error');
                return;
            }
            
            // 로딩 상태 시작
            startLoading();
            
            // 실제 로그인 처리 (서버 통신)
            // 여기서는 시뮬레이션을 위해 setTimeout 사용
            setTimeout(() => {
                // 임시 로그인 검증 (실제로는 서버에서 처리)
                const isValidLogin = simulateLogin(email, password);
                
                if (isValidLogin) {
                    // 로그인 성공
                    showSuccess('로그인이 완료되었습니다.');
                    
                    // 로그인 상태 유지 처리
                    if (rememberMe) {
                        localStorage.setItem('rememberLogin', 'true');
                        localStorage.setItem('userEmail', email);
                    }
                    
                    // 메인 페이지로 이동 (2초 후)
                    setTimeout(() => {
                        goToMainPage();
                    }, 2000);
                    
                } else {
                    // 로그인 실패
                    showError('이메일 또는 비밀번호가 올바르지 않습니다.');
                }
                
                stopLoading();
            }, 1500); // 1.5초 로딩 시뮬레이션
        });
        
        // 로딩 상태 시작
        function startLoading() {
            loginButton.disabled = true;
            loginButton.classList.add('btn-disabled');
            loadingSpinner.style.display = 'inline-block';
            loginButtonText.textContent = '로그인 중...';
        }
        
        // 로딩 상태 종료
        function stopLoading() {
            loginButton.disabled = false;
            loginButton.classList.remove('btn-disabled');
            loadingSpinner.style.display = 'none';
            loginButtonText.textContent = '로그인';
        }
        
        // 에러 메시지 표시
        function showError(message) {
            errorAlert.textContent = message;
            errorAlert.style.display = 'block';
            successAlert.style.display = 'none';
            
            // 3초 후 자동 숨김
            setTimeout(() => {
                errorAlert.style.display = 'none';
            }, 3000);
        }
        
        // 성공 메시지 표시
        function showSuccess(message) {
            successAlert.textContent = message;
            successAlert.style.display = 'block';
            errorAlert.style.display = 'none';
        }
        
        // 로그인 시뮬레이션 (실제로는 서버에서 처리)
        function simulateLogin(email, password) {
            // 테스트용 계정들
            const testAccounts = [
                { email: 'test@example.com', password: '123456' },
                { email: 'user@test.com', password: 'password' },
                { email: 'admin@market.com', password: 'admin123' }
            ];
            
            return testAccounts.some(account => 
                account.email === email && account.password === password
            );

            
        }
        
        // 소셜 로그인
        function socialLogin(provider) {
            startLoading();
            
            setTimeout(() => {
                showSuccess(`${provider} 계정으로 로그인되었습니다.`);
                setTimeout(() => {
                    goToMainPage();
                }, 2000);
                stopLoading();
            }, 1000);
        }
        
        // 비밀번호 찾기
        function forgotPassword() {
            const email = prompt('비밀번호를 재설정할 이메일을 입력하세요:');
            if (email) {
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (emailRegex.test(email)) {
                    alert(`${email}로 비밀번호 재설정 링크를 발송했습니다.`);
                } else {
                    alert('올바른 이메일 형식이 아닙니다.');
                }
            }
        }
        
        // 회원가입 페이지로 이동
        function goToSignup() {
            alert('회원가입 페이지로 이동합니다.');
            window.location.href = 'signup.jsp';
        }
        
        // 메인 페이지로 이동
        function goToMainPage() {
            alert('메인 페이지로 이동합니다.');
            window.location.href = 'index.jsp';
        }
        
        // 페이지 로드 시 로그인 상태 확인
        window.addEventListener('load', function() {
            const rememberLogin = localStorage.getItem('rememberLogin');
            const userEmail = localStorage.getItem('userEmail');
            
            if (rememberLogin === 'true' && userEmail) {
                emailInput.value = userEmail;
                document.getElementById('rememberMe').checked = true;
            }
        });
        
        // Enter 키로 로그인
        document.addEventListener('keypress', function(e) {
            if (e.key === 'Enter' && !loginButton.disabled) {
                loginForm.dispatchEvent(new Event('submit'));
            }
        });
    </script>
</body>
</html>
