<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채팅 - WSB마켓</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif;
            background-color: #f8f9fa;
            height: 100vh;
            overflow: hidden;
        }

        .header {
            background-color: #4a90e2;
            padding: 12px 0;
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .header-content {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 20px;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            color: white;
            text-decoration: none;
        }

        .back-btn {
            color: white;
            text-decoration: none;
            font-size: 18px;
            margin-right: 20px;
        }

        .chat-container {
            display: flex;
            height: calc(100vh - 60px);
            max-width: 1200px;
            margin: 0 auto;
        }

        .chat-list {
            width: 300px;
            background-color: white;
            border-right: 1px solid #eee;
            overflow-y: auto;
        }

        .chat-list-header {
            padding: 20px;
            border-bottom: 1px solid #eee;
            background-color: #f8f9fa;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .chat-list-title {
            font-size: 18px;
            font-weight: bold;
            color: #333;
        }

        .chat-search {
            padding: 10px 20px;
            border-bottom: 1px solid #eee;
        }

        .chat-search input {
            width: 100%;
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 20px;
            font-size: 14px;
        }

        .chat-item {
            display: flex;
            padding: 15px 20px;
            border-bottom: 1px solid #f0f0f0;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .chat-item:hover {
            background-color: #f8f9fa;
        }

        .chat-item.active {
            background-color: #e6f3ff;
            border-right: 3px solid #4a90e2;
        }

        .chat-avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background-color: #4a90e2;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 18px;
            margin-right: 12px;
            flex-shrink: 0;
        }

        .chat-info {
            flex: 1;
            min-width: 0;
        }

        .chat-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 4px;
        }

        .chat-name {
            font-size: 16px;
            font-weight: 600;
            color: #333;
        }

        .chat-time {
            font-size: 12px;
            color: #999;
        }

        .chat-preview {
            font-size: 14px;
            color: #666;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .chat-badge {
            background-color: #4a90e2;
            color: white;
            border-radius: 10px;
            padding: 2px 6px;
            font-size: 11px;
            margin-left: 8px;
        }

        .chat-main {
            flex: 1;
            display: flex;
            flex-direction: column;
            background-color: white;
        }

        .chat-header-main {
            padding: 20px;
            border-bottom: 1px solid #eee;
            background-color: #f8f9fa;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .chat-user-info {
            display: flex;
            align-items: center;
        }

        .chat-user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: #4a90e2;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            margin-right: 12px;
        }

        .chat-user-details {
            display: flex;
            flex-direction: column;
        }

        .chat-user-name {
            font-size: 18px;
            font-weight: bold;
            color: #333;
        }

        .chat-user-status {
            font-size: 14px;
            color: #666;
        }

        .chat-actions {
            display: flex;
            gap: 10px;
        }

        .action-btn {
            padding: 8px 16px;
            border: 1px solid #ddd;
            border-radius: 6px;
            background: white;
            color: #666;
            cursor: pointer;
            font-size: 14px;
            text-decoration: none;
        }

        .action-btn:hover {
            background-color: #f8f9fa;
        }

        .action-btn.primary {
            background-color: #4a90e2;
            color: white;
            border-color: #4a90e2;
        }

        .chat-messages {
            flex: 1;
            padding: 20px;
            overflow-y: auto;
            background: linear-gradient(to bottom, #fafafa, #ffffff);
        }

        .message {
            display: flex;
            margin-bottom: 15px;
            align-items: flex-end;
        }

        .message.sent {
            justify-content: flex-end;
        }

        .message.received {
            justify-content: flex-start;
        }

        .message-avatar {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background-color: #e0e0e0;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            margin: 0 8px;
        }

        .message.sent .message-avatar {
            order: 2;
            background-color: #4a90e2;
            color: white;
        }

        .message-content {
            max-width: 60%;
            display: flex;
            flex-direction: column;
        }

        .message-bubble {
            padding: 12px 16px;
            border-radius: 18px;
            font-size: 14px;
            line-height: 1.4;
            word-wrap: break-word;
        }

        .message.sent .message-bubble {
            background-color: #4a90e2;
            color: white;
            border-bottom-right-radius: 6px;
        }

        .message.received .message-bubble {
            background-color: #f0f0f0;
            color: #333;
            border-bottom-left-radius: 6px;
        }

        .message-time {
            font-size: 11px;
            color: #999;
            margin-top: 4px;
            padding: 0 4px;
        }

        .message.sent .message-time {
            text-align: right;
        }

        .message.received .message-time {
            text-align: left;
        }

        .chat-input-container {
            padding: 15px 20px;
            border-top: 1px solid #eee;
            background-color: white;
        }

        .chat-input-wrapper {
            display: flex;
            gap: 10px;
            align-items: flex-end;
        }

        .chat-input {
            flex: 1;
            min-height: 40px;
            max-height: 120px;
            padding: 12px 16px;
            border: 2px solid #e0e0e0;
            border-radius: 20px;
            font-size: 14px;
            font-family: inherit;
            resize: none;
            outline: none;
            transition: border-color 0.3s ease;
        }

        .chat-input:focus {
            border-color: #4a90e2;
        }

        .send-btn {
            width: 40px;
            height: 40px;
            border: none;
            border-radius: 50%;
            background-color: #4a90e2;
            color: white;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            transition: background-color 0.2s;
        }

        .send-btn:hover {
            background-color: #357abd;
        }

        .send-btn:disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }

        .no-chat-selected {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100%;
            color: #666;
            background: linear-gradient(135deg, #f8f9fa 0%, #ffffff 100%);
        }

        .no-chat-icon {
            font-size: 64px;
            margin-bottom: 20px;
            opacity: 0.5;
        }

        .no-chat-text {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .no-chat-subtext {
            font-size: 14px;
            opacity: 0.7;
        }

        .product-info-card {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 20px;
            display: flex;
            gap: 12px;
        }

        .product-image {
            width: 60px;
            height: 60px;
            border-radius: 8px;
            overflow: hidden;
            flex-shrink: 0;
        }

        .product-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .product-details {
            flex: 1;
        }

        .product-title {
            font-size: 16px;
            font-weight: 600;
            color: #333;
            margin-bottom: 4px;
        }

        .product-price {
            font-size: 18px;
            font-weight: bold;
            color: #4a90e2;
        }

        /* 추가된 스타일 */
        .chat-tools {
            display: flex;
            gap: 10px;
            margin-bottom: 10px;
        }

        .tool-btn {
            padding: 6px 10px;
            border: 1px solid #ddd;
            border-radius: 20px;
            background: white;
            color: #666;
            cursor: pointer;
            font-size: 13px;
            display: flex;
            align-items: center;
            gap: 4px;
        }

        .tool-btn:hover {
            background-color: #f8f9fa;
        }

        .emoji-panel {
            display: grid;
            grid-template-columns: repeat(8, 1fr);
            gap: 8px;
            padding: 10px;
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            margin-bottom: 10px;
        }

        .emoji-btn {
            width: 30px;
            height: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            cursor: pointer;
            border-radius: 4px;
        }

        .emoji-btn:hover {
            background-color: #f0f0f0;
        }

        .quick-replies {
            display: flex;
            gap: 8px;
            overflow-x: auto;
            padding-bottom: 10px;
            margin-bottom: 10px;
        }

        .quick-reply {
            padding: 8px 12px;
            background-color: #f0f0f0;
            border-radius: 16px;
            font-size: 13px;
            white-space: nowrap;
            cursor: pointer;
        }

        .quick-reply:hover {
            background-color: #e0e0e0;
        }

        .image-preview {
            margin-bottom: 10px;
            position: relative;
            display: inline-block;
        }

        .image-preview img {
            max-height: 100px;
            border-radius: 8px;
        }

        .remove-image {
            position: absolute;
            top: -8px;
            right: -8px;
            width: 20px;
            height: 20px;
            background-color: #ff4d4f;
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            font-size: 12px;
        }

        .attachment-btn {
            width: 40px;
            height: 40px;
            border: none;
            border-radius: 50%;
            background-color: #f0f0f0;
            color: #666;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
        }

        .attachment-btn:hover {
            background-color: #e0e0e0;
        }

        .emoji-btn-toggle {
            width: 40px;
            height: 40px;
            border: none;
            border-radius: 50%;
            background-color: #f0f0f0;
            color: #666;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
        }

        .emoji-btn-toggle:hover {
            background-color: #e0e0e0;
        }

        /* 모달 스타일 */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1000;
            align-items: center;
            justify-content: center;
        }

        .modal.show {
            display: flex;
        }

        .modal-content {
            background-color: white;
            border-radius: 12px;
            padding: 24px;
            width: 90%;
            max-width: 500px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .modal-title {
            font-size: 20px;
            font-weight: bold;
            color: #333;
        }

        .modal-close {
            background: none;
            border: none;
            font-size: 24px;
            cursor: pointer;
            color: #999;
        }

        .modal-body {
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 16px;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            font-size: 14px;
            font-weight: 600;
            color: #333;
        }

        .form-input {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 14px;
        }

        .modal-footer {
            display: flex;
            justify-content: flex-end;
            gap: 12px;
        }

        .btn {
            padding: 10px 16px;
            border-radius: 6px;
            font-size: 14px;
            cursor: pointer;
            border: none;
        }

        .btn-secondary {
            background-color: #f0f0f0;
            color: #666;
        }

        .btn-primary {
            background-color: #4a90e2;
            color: white;
        }

        .location-preview {
            width: 100%;
            height: 200px;
            background-color: #f0f0f0;
            border-radius: 8px;
            margin-top: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #666;
        }

        /* 파일 입력 숨기기 */
        .file-input {
            display: none;
        }
    </style>
</head>
<body>
    <header class="header">
        <div class="header-content">
            <div style="display: flex; align-items: center;">
                <a href="index.jsp" class="back-btn">←</a>
                <a href="index.jsp" class="logo">WSB마켓</a>
            </div>
        </div>
    </header>

    <div class="chat-container">
        <!-- 채팅 목록 -->
        <div class="chat-list">
            <div class="chat-list-header">
                <div class="chat-list-title">채팅</div>
                <button class="action-btn" onclick="showNewChatModal()">+ 새 채팅</button>
            </div>

            <div class="chat-search">
                <input type="text" placeholder="채팅방 검색..." onkeyup="searchChats(this.value)">
            </div>

            <div class="chat-item active" onclick="selectChat(1)">
                <div class="chat-avatar">👤</div>
                <div class="chat-info">
                    <div class="chat-header">
                        <div class="chat-name">축구팬</div>
                        <div class="chat-time">10:30</div>
                    </div>
                    <div class="chat-preview">네, 직거래로 가능합니다!</div>
                </div>
                <div class="chat-badge">2</div>
            </div>

            <div class="chat-item" onclick="selectChat(2)">
                <div class="chat-avatar">👩</div>
                <div class="chat-info">
                    <div class="chat-header">
                        <div class="chat-name">엄마표요리</div>
                        <div class="chat-time">어제</div>
                    </div>
                    <div class="chat-preview">전기밥솥 상태가 어떤가요?</div>
                </div>
            </div>

            <div class="chat-item" onclick="selectChat(3)">
                <div class="chat-avatar">👨</div>
                <div class="chat-info">
                    <div class="chat-header">
                        <div class="chat-name">독서광</div>
                        <div class="chat-time">2일전</div>
                    </div>
                    <div class="chat-preview">책 아직 있나요?</div>
                </div>
            </div>
        </div>

        <!-- 메인 채팅 영역 -->
        <div class="chat-main">
            <div class="chat-header-main">
                <div class="chat-user-info">
                    <div class="chat-user-avatar">👤</div>
                    <div class="chat-user-details">
                        <div class="chat-user-name">축구팬</div>
                        <div class="chat-user-status">부산 남구 대연동</div>
                    </div>
                </div>
                <div class="chat-actions">
                    <a href="detail.jsp?id=1" class="action-btn">상품보기</a>
                    <button class="action-btn" onclick="showReportModal()">신고하기</button>
                    <button class="action-btn primary" onclick="showDealModal()">거래 제안</button>
                </div>
            </div>

            <!-- 상품 정보 카드 -->
            <div style="padding: 0 20px;">
                <div class="product-info-card">
                    <div class="product-image">
                        <img src="https://via.placeholder.com/60x60" alt="축구 유니폼">
                    </div>
                    <div class="product-details">
                        <div class="product-title">축구 유니폼 새것처럼 깨끗한 FC바르셀로나 120</div>
                        <div class="product-price">60,000원</div>
                    </div>
                </div>
            </div>

            <!-- 빠른 응답 버튼 -->
            <div style="padding: 0 20px;">
                <div class="quick-replies">
                    <div class="quick-reply" onclick="sendQuickReply('네, 있습니다!')">네, 있습니다!</div>
                    <div class="quick-reply" onclick="sendQuickReply('가격 흥정 가능할까요?')">가격 흥정 가능할까요?</div>
                    <div class="quick-reply" onclick="sendQuickReply('직거래 가능한가요?')">직거래 가능한가요?</div>
                    <div class="quick-reply" onclick="sendQuickReply('택배 거래도 가능한가요?')">택배 거래도 가능한가요?</div>
                    <div class="quick-reply" onclick="sendQuickReply('상태가 어떤가요?')">상태가 어떤가요?</div>
                </div>
            </div>

            <!-- 채팅 메시지 -->
            <div class="chat-messages" id="chatMessages">
                <div class="message received">
                    <div class="message-avatar">👤</div>
                    <div class="message-content">
                        <div class="message-bubble">안녕하세요! 축구 유니폼 관심있어서 문의드립니다.</div>
                        <div class="message-time">오전 10:15</div>
                    </div>
                </div>

                <div class="message sent">
                    <div class="message-content">
                        <div class="message-bubble">안녕하세요! 문의해주셔서 감사합니다 😊</div>
                        <div class="message-time">오전 10:16</div>
                    </div>
                    <div class="message-avatar">🏠</div>
                </div>

                <div class="message received">
                    <div class="message-avatar">👤</div>
                    <div class="message-content">
                        <div class="message-bubble">혹시 직거래 가능한가요? 대연동 근처에 살고 있어서요.</div>
                        <div class="message-time">오전 10:20</div>
                    </div>
                </div>

                <div class="message sent">
                    <div class="message-content">
                        <div class="message-bubble">네, 직거래로 가능합니다! 언제 시간 되세요?</div>
                        <div class="message-time">오전 10:30</div>
                    </div>
                    <div class="message-avatar">🏠</div>
                </div>

                <div class="message received">
                    <div class="message-avatar">👤</div>
                    <div class="message-content">
                        <div class="message-bubble">오늘 저녁 7시 정도 어떠신가요?</div>
                        <div class="message-time">오전 10:32</div>
                    </div>
                </div>

                <!-- 이미지 메시지 예시 -->
                <div class="message sent">
                    <div class="message-content">
                        <div class="message-bubble" style="padding: 8px;">
                            <img src="https://via.placeholder.com/300x200" alt="상품 상세 이미지" style="width: 100%; border-radius: 8px;">
                        </div>
                        <div class="message-bubble" style="margin-top: 8px;">
                            상품 상세 사진입니다. 상태 확인해보세요!
                        </div>
                        <div class="message-time">오전 10:35</div>
                    </div>
                    <div class="message-avatar">🏠</div>
                </div>

                <!-- 위치 공유 메시지 예시 -->
                <div class="message received">
                    <div class="message-avatar">👤</div>
                    <div class="message-content">
                        <div class="message-bubble" style="padding: 8px;">
                            <div style="width: 100%; height: 150px; background-color: #e9ecef; border-radius: 8px; display: flex; align-items: center; justify-content: center;">
                                📍 위치: 부산 남구 대연동 우체국 앞
                            </div>
                        </div>
                        <div class="message-bubble" style="margin-top: 8px;">
                            여기서 만나면 될까요?
                        </div>
                        <div class="message-time">오전 10:40</div>
                    </div>
                </div>

                <!-- 거래 제안 메시지 예시 -->
                <div class="message sent">
                    <div class="message-content">
                        <div class="message-bubble" style="background-color: #e3f2fd; color: #333;">
                            <div style="font-weight: bold; margin-bottom: 5px;">💰 거래 제안</div>
                            <div>가격: 55,000원</div>
                            <div>장소: 부산 남구 대연동 우체국 앞</div>
                            <div>시간: 오늘 저녁 7시</div>
                        </div>
                        <div class="message-time">오전 10:45</div>
                    </div>
                    <div class="message-avatar">🏠</div>
                </div>
            </div>

            <!-- 이미지 미리보기 영역 -->
            <div id="imagePreviewContainer" style="padding: 0 20px; display: none;">
                <div class="image-preview">
                    <img id="imagePreview" src="/placeholder.svg" alt="이미지 미리보기">
                    <div class="remove-image" onclick="removeImage()">×</div>
                </div>
            </div>

            <!-- 이모티콘 패널 -->
            <div id="emojiPanel" style="padding: 0 20px; display: none;">
                <div class="emoji-panel">
                    <div class="emoji-btn" onclick="addEmoji('😊')">😊</div>
                    <div class="emoji-btn" onclick="addEmoji('👍')">👍</div>
                    <div class="emoji-btn" onclick="addEmoji('❤️')">❤️</div>
                    <div class="emoji-btn" onclick="addEmoji('😂')">😂</div>
                    <div class="emoji-btn" onclick="addEmoji('🙏')">🙏</div>
                    <div class="emoji-btn" onclick="addEmoji('👏')">👏</div>
                    <div class="emoji-btn" onclick="addEmoji('🎉')">🎉</div>
                    <div class="emoji-btn" onclick="addEmoji('🤔')">🤔</div>
                    <div class="emoji-btn" onclick="addEmoji('😍')">😍</div>
                    <div class="emoji-btn" onclick="addEmoji('🥰')">🥰</div>
                    <div class="emoji-btn" onclick="addEmoji('😭')">😭</div>
                    <div class="emoji-btn" onclick="addEmoji('😢')">😢</div>
                    <div class="emoji-btn" onclick="addEmoji('🤣')">🤣</div>
                    <div class="emoji-btn" onclick="addEmoji('😅')">😅</div>
                    <div class="emoji-btn" onclick="addEmoji('😁')">😁</div>
                    <div class="emoji-btn" onclick="addEmoji('👌')">👌</div>
                </div>
            </div>

            <!-- 메시지 입력 -->
            <div class="chat-input-container">
                <div class="chat-tools">
                    <button class="tool-btn" onclick="showLocationModal()">📍 위치 공유</button>
                    <button class="tool-btn" onclick="showDealModal()">💰 거래 제안</button>
                </div>
                <div class="chat-input-wrapper">
                    <button class="emoji-btn-toggle" onclick="toggleEmojiPanel()">😊</button>
                    <textarea class="chat-input" placeholder="메시지를 입력하세요..." rows="1" onkeydown="handleKeyDown(event)" oninput="autoResize(this)" id="messageInput"></textarea>
                    <input type="file" id="fileInput" class="file-input" accept="image/*" onchange="handleImageUpload(event)">
                    <button class="attachment-btn" onclick="document.getElementById('fileInput').click()">📎</button>
                    <button class="send-btn" onclick="sendMessage()" id="sendButton">📤</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 거래 제안 모달 -->
    <div class="modal" id="dealModal">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title">거래 제안하기</div>
                <button class="modal-close" onclick="closeModal('dealModal')">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label class="form-label">제안 가격</label>
                    <input type="number" class="form-input" id="dealPrice" placeholder="가격을 입력하세요" value="60000">
                </div>
                <div class="form-group">
                    <label class="form-label">거래 장소</label>
                    <input type="text" class="form-input" id="dealLocation" placeholder="거래 장소를 입력하세요" value="부산 남구 대연동 우체국 앞">
                </div>
                <div class="form-group">
                    <label class="form-label">거래 시간</label>
                    <input type="text" class="form-input" id="dealTime" placeholder="거래 시간을 입력하세요" value="오늘 저녁 7시">
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" onclick="closeModal('dealModal')">취소</button>
                <button class="btn btn-primary" onclick="sendDealProposal()">제안 보내기</button>
            </div>
        </div>
    </div>

    <!-- 위치 공유 모달 -->
    <div class="modal" id="locationModal">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title">위치 공유하기</div>
                <button class="modal-close" onclick="closeModal('locationModal')">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label class="form-label">위치 설명</label>
                    <input type="text" class="form-input" id="locationDescription" placeholder="위치에 대한 설명을 입력하세요">
                </div>
                <div class="location-preview">
                    지도 미리보기 영역
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" onclick="closeModal('locationModal')">취소</button>
                <button class="btn btn-primary" onclick="sendLocation()">위치 공유하기</button>
            </div>
        </div>
    </div>

    <!-- 신고하기 모달 -->
    <div class="modal" id="reportModal">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title">사용자 신고하기</div>
                <button class="modal-close" onclick="closeModal('reportModal')">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label class="form-label">신고 사유</label>
                    <select class="form-input" id="reportReason">
                        <option value="">신고 사유 선택</option>
                        <option value="spam">스팸/광고</option>
                        <option value="inappropriate">부적절한 콘텐츠</option>
                        <option value="fraud">사기/기만</option>
                        <option value="harassment">괴롭힘/모욕</option>
                        <option value="other">기타</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label">상세 내용</label>
                    <textarea class="form-input" id="reportDetail" rows="4" placeholder="신고 내용을 자세히 적어주세요"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" onclick="closeModal('reportModal')">취소</button>
                <button class="btn btn-primary" onclick="submitReport()">신고하기</button>
            </div>
        </div>
    </div>

    <!-- 새 채팅 모달 -->
    <div class="modal" id="newChatModal">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title">새 채팅 시작하기</div>
                <button class="modal-close" onclick="closeModal('newChatModal')">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label class="form-label">상품 검색</label>
                    <input type="text" class="form-input" id="productSearch" placeholder="채팅을 시작할 상품을 검색하세요">
                </div>
                <div style="margin-top: 15px;">
                    <div style="font-weight: 600; margin-bottom: 10px;">검색 결과</div>
                    <div style="display: flex; flex-direction: column; gap: 10px;">
                        <div style="display: flex; padding: 10px; border: 1px solid #eee; border-radius: 8px; cursor: pointer;" onclick="startNewChat(1)">
                            <div style="width: 50px; height: 50px; background-color: #f0f0f0; border-radius: 4px; margin-right: 10px;"></div>
                            <div>
                                <div style="font-weight: 500;">아이폰 14 Pro 판매합니다</div>
                                <div style="font-size: 14px; color: #666;">950,000원</div>
                            </div>
                        </div>
                        <div style="display: flex; padding: 10px; border: 1px solid #eee; border-radius: 8px; cursor: pointer;" onclick="startNewChat(2)">
                            <div style="width: 50px; height: 50px; background-color: #f0f0f0; border-radius: 4px; margin-right: 10px;"></div>
                            <div>
                                <div style="font-weight: 500;">맥북 에어 M2 팝니다</div>
                                <div style="font-size: 14px; color: #666;">1,200,000원</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" onclick="closeModal('newChatModal')">취소</button>
            </div>
        </div>
    </div>

    <script>
        // 채팅 선택
        function selectChat(chatId) {
            // 채팅 아이템 활성화
            document.querySelectorAll('.chat-item').forEach(item => {
                item.classList.remove('active');
            });
            event.currentTarget.classList.add('active');

            // 채팅 내용 로드 (실제로는 서버에서 가져와야 함)
            console.log('채팅 선택:', chatId);
        }

        // 키 입력 처리
        function handleKeyDown(event) {
            if (event.key === 'Enter' && !event.shiftKey) {
                event.preventDefault();
                sendMessage();
            }
        }

        // 텍스트 영역 자동 크기 조절
        function autoResize(textarea) {
            textarea.style.height = 'auto';
            textarea.style.height = Math.min(textarea.scrollHeight, 120) + 'px';
            
            // 전송 버튼 활성화/비활성화
            const sendBtn = document.getElementById('sendButton');
            sendBtn.disabled = !textarea.value.trim();
        }

        // 메시지 전송
        function sendMessage() {
            const input = document.getElementById('messageInput');
            const message = input.value.trim();
            
            if (!message && !document.getElementById('imagePreviewContainer').style.display === 'block') return;

            // 메시지 추가
            const messagesContainer = document.getElementById('chatMessages');
            const messageElement = document.createElement('div');
            messageElement.className = 'message sent';
            
            const now = new Date();
            const timeString = now.toLocaleTimeString('ko-KR', { 
                hour: '2-digit', 
                minute: '2-digit' 
            });

            // 이미지가 있는 경우
            let messageContent = '';
            const imagePreviewContainer = document.getElementById('imagePreviewContainer');
            if (imagePreviewContainer.style.display === 'block') {
                const imagePreview = document.getElementById('imagePreview');
                messageContent += `
                    <div class="message-bubble" style="padding: 8px;">
                        <img src="${imagePreview.src}" alt="이미지" style="width: 100%; border-radius: 8px;">
                    </div>
                `;
                // 이미지 미리보기 초기화
                imagePreviewContainer.style.display = 'none';
            }

            // 텍스트 메시지가 있는 경우
            if (message) {
                messageContent += `
                    <div class="message-bubble">${message}</div>
                `;
            }

            messageElement.innerHTML = `
                <div class="message-content">
                    ${messageContent}
                    <div class="message-time">${timeString}</div>
                </div>
                <div class="message-avatar">🏠</div>
            `;

            messagesContainer.appendChild(messageElement);
            messagesContainer.scrollTop = messagesContainer.scrollHeight;

            // 입력창 초기화
            input.value = '';
            input.style.height = 'auto';
            document.getElementById('sendButton').disabled = true;

            // 자동 응답 시뮬레이션 (3초 후)
            setTimeout(() => {
                const autoReply = document.createElement('div');
                autoReply.className = 'message received';
                autoReply.innerHTML = `
                    <div class="message-avatar">👤</div>
                    <div class="message-content">
                        <div class="message-bubble">네, 알겠습니다!</div>
                        <div class="message-time">${timeString}</div>
                    </div>
                `;
                messagesContainer.appendChild(autoReply);
                messagesContainer.scrollTop = messagesContainer.scrollHeight;
            }, 3000);
        }

        // 이미지 업로드 처리
        function handleImageUpload(event) {
            const file = event.target.files[0];
            if (!file) return;

            const reader = new FileReader();
            reader.onload = function(e) {
                const imagePreviewContainer = document.getElementById('imagePreviewContainer');
                const imagePreview = document.getElementById('imagePreview');
                
                imagePreview.src = e.target.result;
                imagePreviewContainer.style.display = 'block';
                
                // 이모티콘 패널 닫기
                document.getElementById('emojiPanel').style.display = 'none';
            };
            reader.readAsDataURL(file);
        }

        // 이미지 제거
        function removeImage() {
            const imagePreviewContainer = document.getElementById('imagePreviewContainer');
            imagePreviewContainer.style.display = 'none';
            document.getElementById('fileInput').value = '';
        }

        // 이모티콘 패널 토글
        function toggleEmojiPanel() {
            const emojiPanel = document.getElementById('emojiPanel');
            if (emojiPanel.style.display === 'none' || emojiPanel.style.display === '') {
                emojiPanel.style.display = 'block';
                // 이미지 미리보기 닫기
                document.getElementById('imagePreviewContainer').style.display = 'none';
            } else {
                emojiPanel.style.display = 'none';
            }
        }

        // 이모티콘 추가
        function addEmoji(emoji) {
            const input = document.getElementById('messageInput');
            input.value += emoji;
            document.getElementById('sendButton').disabled = false;
        }

        // 빠른 응답 전송
        function sendQuickReply(text) {
            const input = document.getElementById('messageInput');
            input.value = text;
            sendMessage();
        }

        // 모달 표시
        function showModal(modalId) {
            document.getElementById(modalId).classList.add('show');
        }

        // 모달 닫기
        function closeModal(modalId) {
            document.getElementById(modalId).classList.remove('show');
        }

        // 거래 제안 모달 표시
        function showDealModal() {
            showModal('dealModal');
        }

        // 위치 공유 모달 표시
        function showLocationModal() {
            showModal('locationModal');
        }

        // 신고하기 모달 표시
        function showReportModal() {
            showModal('reportModal');
        }

        // 새 채팅 모달 표시
        function showNewChatModal() {
            showModal('newChatModal');
        }

        // 거래 제안 전송
        function sendDealProposal() {
            const price = document.getElementById('dealPrice').value;
            const location = document.getElementById('dealLocation').value;
            const time = document.getElementById('dealTime').value;

            if (!price || !location || !time) {
                alert('모든 필드를 입력해주세요.');
                return;
            }

            // 메시지 추가
            const messagesContainer = document.getElementById('chatMessages');
            const messageElement = document.createElement('div');
            messageElement.className = 'message sent';
            
            const now = new Date();
            const timeString = now.toLocaleTimeString('ko-KR', { 
                hour: '2-digit', 
                minute: '2-digit' 
            });

            messageElement.innerHTML = `
                <div class="message-content">
                    <div class="message-bubble" style="background-color: #e3f2fd; color: #333;">
                        <div style="font-weight: bold; margin-bottom: 5px;">💰 거래 제안</div>
                        <div>가격: ${Number(price).toLocaleString()}원</div>
                        <div>장소: ${location}</div>
                        <div>시간: ${time}</div>
                    </div>
                    <div class="message-time">${timeString}</div>
                </div>
                <div class="message-avatar">🏠</div>
            `;

            messagesContainer.appendChild(messageElement);
            messagesContainer.scrollTop = messagesContainer.scrollHeight;

            // 모달 닫기
            closeModal('dealModal');

            // 자동 응답 시뮬레이션 (3초 후)
            setTimeout(() => {
                const autoReply = document.createElement('div');
                autoReply.className = 'message received';
                autoReply.innerHTML = `
                    <div class="message-avatar">👤</div>
                    <div class="message-content">
                        <div class="message-bubble">제안해주신 조건으로 거래 가능합니다!</div>
                        <div class="message-time">${timeString}</div>
                    </div>
                `;
                messagesContainer.appendChild(autoReply);
                messagesContainer.scrollTop = messagesContainer.scrollHeight;
            }, 3000);
        }

        // 위치 공유
        function sendLocation() {
            const description = document.getElementById('locationDescription').value || '위치를 공유했습니다.';

            // 메시지 추가
            const messagesContainer = document.getElementById('chatMessages');
            const messageElement = document.createElement('div');
            messageElement.className = 'message sent';
            
            const now = new Date();
            const timeString = now.toLocaleTimeString('ko-KR', { 
                hour: '2-digit', 
                minute: '2-digit' 
            });

            messageElement.innerHTML = `
                <div class="message-content">
                    <div class="message-bubble" style="padding: 8px;">
                        <div style="width: 100%; height: 150px; background-color: #e9ecef; border-radius: 8px; display: flex; align-items: center; justify-content: center;">
                            📍 위치: ${description}
                        </div>
                    </div>
                    <div class="message-time">${timeString}</div>
                </div>
                <div class="message-avatar">🏠</div>
            `;

            messagesContainer.appendChild(messageElement);
            messagesContainer.scrollTop = messagesContainer.scrollHeight;

            // 모달 닫기
            closeModal('locationModal');
        }

        // 신고 제출
        function submitReport() {
            const reason = document.getElementById('reportReason').value;
            const detail = document.getElementById('reportDetail').value;

            if (!reason) {
                alert('신고 사유를 선택해주세요.');
                return;
            }

            alert('신고가 접수되었습니다. 검토 후 조치하겠습니다.');
            closeModal('reportModal');
        }

        // 새 채팅 시작
        function startNewChat(productId) {
            alert(`상품 ID ${productId}에 대한 새 채팅을 시작합니다.`);
            closeModal('newChatModal');
        }

        // 채팅방 검색
        function searchChats(keyword) {
            console.log('채팅방 검색:', keyword);
            // 실제로는 채팅방 목록을 필터링하는 로직 구현
        }

        // 페이지 로드시 메시지 영역을 아래로 스크롤
        window.addEventListener('load', function() {
            const messagesContainer = document.getElementById('chatMessages');
            messagesContainer.scrollTop = messagesContainer.scrollHeight;
        });
    </script>
</body>
</html>