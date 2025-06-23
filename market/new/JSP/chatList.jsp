<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%
    // 세션에서 사용자 정보 확인, 없으면 로그인 페이지로 이동
    String userId = (String) session.getAttribute("userid");
    if (userId == null) {
        response.sendRedirect("login.jsp?redirectURL=chatList.jsp");
        return;
    }
    String username = (String) session.getAttribute("username");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>채팅 목록</title>
<style>
    body { font-family: 'Malgun Gothic', sans-serif; background-color: #f4f4f4; margin: 0; padding: 20px; }
    .container { max-width: 800px; margin: 0 auto; background-color: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
    h1 { color: #333; border-bottom: 2px solid #eee; padding-bottom: 10px; }
    #chatRoomList ul { list-style: none; padding: 0; margin: 0; }
    #chatRoomList li { border-bottom: 1px solid #eee; }
    #chatRoomList li:last-child { border-bottom: none; }
    #chatRoomList a { display: block; padding: 15px 10px; text-decoration: none; color: #333; transition: background-color 0.2s; }
    #chatRoomList a:hover { background-color: #f9f9f9; }
    #chatRoomList .room-info { display: flex; justify-content: space-between; align-items: center; }
    #chatRoomList .room-info strong { font-size: 1.1em; color: #007bff; }
    #chatRoomList .post-title { font-size: 0.9em; color: #666; margin: 5px 0; }
    #chatRoomList .last-message { color: #555; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 70%;}
    #chatRoomList .message-time { font-size: 0.8em; color: #999; }
    .no-chat { color: #777; text-align: center; padding: 40px 0; }
</style>
</head>
<body>
    <div class="container">
        <h1>내 채팅 목록</h1>
        <div id="chatRoomList">
            <p>채팅 목록을 불러오는 중입니다...</p>
        </div>
    </div>

<script>
document.addEventListener("DOMContentLoaded", function() {
    fetchChatRooms();
    // 10초마다 자동으로 목록을 갱신
    setInterval(fetchChatRooms, 10000);
});

function fetchChatRooms() {
    const chatRoomListDiv = document.getElementById('chatRoomList');
    // chatAction.jsp 경로 수정
    fetch('../chatAction.jsp?action=getChatRooms')
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            if (data.success && data.rooms) {
                if (data.rooms.length > 0) {
                    let html = '<ul>';
                    data.rooms.forEach(room => {
                        html += `<li>
                            <a href="chat_room.jsp?roomId=${room.roomId}&postType=${room.postType}&postId=${room.postId}">
                                <div class="room-info">
                                    <strong>${room.otherUserName}</strong>
                                    <span class="message-time">${room.lastMessageTime || ''}</span>
                                </div>
                                <p class="post-title">관련 게시물: ${room.postTitle}</p>
                                <p class="last-message">${room.lastMessage || '대화를 시작해보세요.'}</p>
                            </a>
                        </li>`;
                    });
                    html += '</ul>';
                    chatRoomListDiv.innerHTML = html;
                } else {
                    chatRoomListDiv.innerHTML = '<p class="no-chat">진행중인 채팅이 없습니다.</p>';
                }
            } else {
                chatRoomListDiv.innerHTML = `<p class="no-chat">채팅 목록을 불러오는데 실패했습니다: ${data.message || '알 수 없는 오류'}</p>`;
            }
        })
        .catch(error => {
            console.error('Error fetching chat rooms:', error);
            chatRoomListDiv.innerHTML = '<p class="no-chat">채팅 목록을 불러오는 중 오류가 발생했습니다.</p>';
        });
}
</script>
</body>
</html> 