<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String roomId   = request.getParameter("roomId");
    String postType = request.getParameter("postType");
    String postId   = request.getParameter("postId");
    String senderId = (String) session.getAttribute("userid");
    String senderNm = (String) session.getAttribute("username");
    if (senderId == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>1:1 채팅</title>
<style>
body{margin:0;font-family:sans-serif;background:#f5f6fa}
#wrap{max-width:600px;margin:20px auto;background:#fff;border:1px solid #ddd;border-radius:8px;display:flex;flex-direction:column;height:80vh}
#log{flex:1;overflow-y:auto;padding:15px}
.msg{margin:6px 0;padding:8px 12px;border-radius:12px;max-width:70%}
.me{background:#3b82f6;color:#fff;margin-left:auto}
.other{background:#e5e7eb;color:#374151}
#inputBar{display:flex;border-top:1px solid #ddd}
#msg{flex:1;padding:10px;border:none;font-size:14px}
#sendBtn{padding:0 18px;border:none;background:#3b82f6;color:#fff;font-weight:600;cursor:pointer}
</style>
</head>
<body>
<div id="wrap">
    <div id="log"></div>
    <div id="inputBar">
        <input id="msg" autocomplete="off" placeholder="메시지 입력" />
        <button id="sendBtn">전송</button>
    </div>
</div>
<script>
const ctx    = "<%=request.getContextPath()%>";
const roomId = "<%=roomId%>";
const postType = "<%=postType%>";
const postId   = "<%=postId%>";
const meId   = "<%=senderId%>";
const meNm   = "<%=senderNm%>";

// 메시지 렌더링 함수
function draw(sender, msg) {
    const div = document.createElement('div');
    div.className = 'msg ' + (sender === meNm ? 'me' : 'other');
    div.textContent = sender + ': ' + msg;
    log.append(div);
    log.scrollTop = log.scrollHeight;
}

// 서버에서 메시지 목록 받아오기 (AJAX polling)
let lastCount = 0;
function fetchMessages() {
    fetch(`${ctx}/chatAction.jsp?action=getRoomMessages&roomId=${roomId}`)
        .then(res => res.json())
        .then(data => {
            if (!data.success) return;
            const list = data.messages || [];
            if (list.length === lastCount) return; // 변동없음
            log.innerHTML = '';
            list.forEach(m => draw(m.senderName, m.content));
            lastCount = list.length;
        })
        .catch(err => console.error('fetchMessages error', err));
}

// 2초 마다 신규 메시지 확인
setInterval(fetchMessages, 2000);
fetchMessages(); // 최초 호출

// 메시지 전송
function send() {
    const content = msg.value.trim();
    if (!content) return;
    const params = new URLSearchParams();
    params.append('action', 'sendRoomMessage');
    params.append('roomId', roomId);
    params.append('postType', postType);
    params.append('postId', postId);
    params.append('content', content);

    fetch(`${ctx}/chatAction.jsp`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: params.toString()
    })
    .then(res => res.json())
    .then(data => {
        if (data.success) {
            msg.value = '';
            fetchMessages();
        } else {
            alert(data.message || '전송 실패');
        }
    })
    .catch(err => console.error('send error', err));
}

sendBtn.onclick = send;
msg.onkeypress = e => { if (e.key === 'Enter') send(); };
</script>
</body>
</html> 