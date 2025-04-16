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
    <link rel="stylesheet" href="../marketcss/index.css">
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
    <h2 class="searchResult">검색결과</h2>
    <div class="contentContainer">
        <div class="filter">
            <h3>필터</h3>
            <label for="able"><input type="checkbox" name="able" id="able" value="able">거래가능만 보기</label>
            <hr>
            <p>가격</p>
            <input type="text" id="minPrice" placeholder="최소가격"> ~
            <input type="text" id="maxPrice" placeholder="최대가격"><br>
            <hr>
            <p>상태</p>
            <label for="status"><input type="radio" name="status" value="s" id="status" >S</label>
            <label for="status"><input type="radio" name="status" value="a" id="status" >A</label>
            <label for="status"><input type="radio" name="status" value="b" id="status" >B</label>
            <label for="status"><input type="radio" name="status" value="c" id="status" >C</label>
            <label for="status"><input type="radio" name="status" value="d" id="status" >D</label>
            <hr>
            <p>거래방법</p>
            <label for="method"><input type="checkbox" name="method" value="meet" id="method" >직거래</label>
            <label for="method"><input type="checkbox" name="method" value="meet" id="method" >택배거래</label>
        </div>

        <div class="content">
            
        </div>
    </div>
</body>
</html>