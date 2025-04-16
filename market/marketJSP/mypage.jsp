<%
/*
날짜:
작성자:
설명:
*/
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="../marketcss/mypage.css">
</head>
<body>
	<nav>
       	<a href="index.jsp" id="icon">JUBJUB</a>
        <div class="navmenu">
            <a href="">BUY</a>
            <a href="">SELL</a>
            <a href="">CHANGE</a>
            <a href="">SHARE</a>
            <a href="">COMMUNITY</a>
        </div>
        <div class="navright">
            <a href="">CHAT</a>
            <a href="mypage.jsp" id="mypage">MYPAGE</a>
        </div>
    </nav>
    <div class="search">
    	<input type="search" class="searchBox" placeholder="검색어를 입력해주세요">
   	    <input type="button" class="searchButton" value="검색">
    </div>
    <h2 class="searchResult">MYPAGE</h2>
    <div class="contentContainer">
        <div class="category">
            <h3>NAME</h3>
            <p>활성도 30%</p>
            <hr>
            <p>찜한상품</p>
            <p>나의거래</p>
            <p>판매내역</p>
            <p>구매내역</p>
            <p>판매후기</p>
            <p>구매후기</p>
            <hr>
            <h3>나의정보</h3>
            <p>나의정보수정</p>
            <p>키워드알람</p>
            <P>받은쿠폰</P>
            <P>회원탈퇴</P>
            <hr>
            <h3>고객지원</h3>
            <p>공지사항</p>
            <p>고객센터</p>
            <p>약관및정책</p>
            <br>
        </div>

        <div class="content">
        </div>
    </div>
</body>
</html>