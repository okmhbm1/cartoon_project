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
      <!-- ���ι�� -->
      <div class="row">
      	<div class="col-xs-4" id="image"> <a href="${pageContext.request.contextPath}/home.do"><img class="image" src="${pageContext.request.contextPath}/resources/images/banner.jpg"/></a></div>
		

	  <!--��� ��ġ��-->   
      <div class="col-xs-3 col-xs-offset-1 display-none">         
      	<div class="input-group" id="searchbar">
	      <input type="text" class="form-control" placeholder="Search for...">
	      <span class="input-group-btn">
	        <button class="btn btn-default glyphicon glyphicon-search" type="button"></button>
	      </span>
      	</div><!-- /input-group -->
     </div>


     <!-- ���� -->
   	  <div class="col-xs-3" id="advertisement"><img class="advertisement display-none" src="${pageContext.request.contextPath}/resources/images/advertisement.jpg"/></div>
   	</div>
   	</div>
   </div>




   <div class="nav-container">
	   <div class="navbar navbar-inverse">
	      <a href="${pageContext.request.contextPath}/cartoon/list.do" class="navbar-brand">����</a>
	      <a  href="${pageContext.request.contextPath}/board_review/list.do" class="navbar-brand">����</a>
      <ul class="nav navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">�Խ���<b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="#">�����Խ���</a></li>
            <li><a href="#">�͸�Խ���</a></li>
            <li><a href="#">�����Խ���</a></li>
          </ul>
        </li>
      </ul>
	   </div>
   </div> <!--�׺�� -->
   
   
</body>
</html>