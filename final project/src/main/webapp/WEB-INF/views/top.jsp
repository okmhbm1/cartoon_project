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
      	<div class="col-xs-4" id="image"> <a href="${pageContext.request.contextPath}/home.do"><img class="image" src="${pageContext.request.contextPath}/resources/images/banner.png"/></a></div>
		

	  <!--��� ��ġ��-->   
      <div class="col-xs-3 col-xs-offset-1 display-none">         
      	 <form action="${pageContext.request.contextPath}/cartoon/search.do" method="get">
      	<div class="input-group" id="searchbar">
	      
	      
	      <input id="title" name="title" type="text" class="form-control" placeholder="�˻�">
	      <span class="input-group-btn">
	       <button id="click" class="btn btn-default glyphicon glyphicon-search" type="submit"></button>
	    </span>
	   
	      
	      
      	</div><!-- /input-group -->
      	</form>
     </div>


     <!-- ���� -->
   	  <div class="col-xs-3" id="advertisement"><img class="advertisement display-none" src="${pageContext.request.contextPath}/resources/images/advertisement.png"/></div>
   	</div>
   	</div>
   </div>




   <div class="nav-container">
	   <div class="navbar navbar-inverse">
	      <a href="${pageContext.request.contextPath}/cartoon/list.do" class="navbar-brand">����</a>
	      <a  href="${pageContext.request.contextPath}/board_review/list.do" class="navbar-brand">����</a>
	      <a  href="${pageContext.request.contextPath}/board_free/list.do" class="navbar-brand">�����Խ���</a>

      <a  href="${pageContext.request.contextPath}/administer/administer_page.do" class="navbar-brand">������ ������</a>
	   </div>
   </div> <!--�׺�� -->
 
</body>
</html>