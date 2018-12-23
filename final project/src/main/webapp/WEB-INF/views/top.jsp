<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
   <div class="container">
      <div id="header">
      <!-- 메인배너 -->
      <div class="row">
      	<div class="col-xs-4" id="image"> <a href="${pageContext.request.contextPath}/home.do"><img class="image" src="${pageContext.request.contextPath}/resources/images/banner.jpg"/></a></div>
		

	  <!--헤더 서치바-->   
      <div class="col-xs-3 col-xs-offset-1 display-none">         
      	<div class="input-group" id="searchbar">
	      <input type="text" class="form-control" placeholder="Search for...">
	      <span class="input-group-btn">
	        <button class="btn btn-default glyphicon glyphicon-search" type="button"></button>
	      </span>
      	</div><!-- /input-group -->
     </div>


     <!-- 광고 -->
   	  <div class="col-xs-3" id="advertisement"><img class="advertisement display-none" src="${pageContext.request.contextPath}/resources/images/advertisement.jpg"/></div>
   	</div>
   	</div>
   </div>




   <div class="nav-container">
	   <div class="navbar navbar-inverse">
	      <a href="${pageContext.request.contextPath}/cartoon/list.do" class="navbar-brand">웹툰</a>
	      <a  href="${pageContext.request.contextPath}/board_review/list.do" class="navbar-brand">리뷰</a>
      <ul class="nav navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">게시판<b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="#">유저게시판</a></li>
            <li><a href="#">익명게시판</a></li>
            <li><a href="#">질문게시판</a></li>
          </ul>
        </li>
      </ul>
	   </div>
   </div> <!--네비바 -->
   
   
</body>
</html>