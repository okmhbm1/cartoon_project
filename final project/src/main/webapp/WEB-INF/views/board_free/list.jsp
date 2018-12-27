<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8"> 
   <title>insert title here</title>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
</head>
<style type="text/css">

   #header{
      position:relative;
      top:0px;
      width:100%;
      height:150px;

   }

   #image,#advertisement{
      position:absolute;
      display:inline-block;
      top:0px;
      width:100%;
      height:100%;

   }
   #image{
      position:relative;
      height:150px;
      width:340px;
      display:inline-block;
   }
   #searchbar{
      top:70px;
      width:270px;

   }
   #advertisement{
      height:150px;
      width:380px;
      display:inline-block;
   }

   .nav-container{
      display:block;
      top:120px;
      width:100%;
      height:50px;
      border:1px solid white;
      padding:0px;

   }

   .body{
      padding:0;
      margin:0;
      width:100%;
      border:10px solid #ffffff;
      height:400px;
   }

   .row{
      width:100%;
   }
   .section{
      position:relative;
      top:30px;
      float:right;
      width:20%;
      height:100%;
      border: 1px solid white;

   }
   .col-xs-2{
      display:block;
      width:142px;
   }
   .left{
      float:left;
      width:80%;
      height:100%;
      border:1px solid white;
   }
   .image{
      width:100%;
      height:100%;
   }
   .advertisement{
      display:inline-block;
      width:100%;
      height:100%;
   }
   .box{
      width:50%;
      height:30%;
   }
   .no-border{
        border-right:none;
        border-left:none;
        border-top:none;
        border-bottom:none;
        border: none;
   }
   left{
    float:left;
   }
   .right{
    float:right;
   }

   .navbar{
    padding-left:190px;
   }

/* borderless table */
.table.table-borderless td, .table.table-borderless th {
    border: 0 !important;
}

.table.table-borderless {
    margin-bottom: 0px;
}

.col-xs-12{
  position:relative;
}

.image-full{
  width:100%;
  height:200px;
}

.display-none{
}

    @media (max-width: 750px){
       .display-none{
        display:none;
        }
    }
</style>
<body>

<jsp:include page="/WEB-INF/views/top.jsp" flush="false" />
   
   <!-- 바디 -->
   <div class="container">
  	 <div class="body">
   		<div class="container left">
				
			
					<h3>자유게시판</h3> 
					<hr style="border:1px solid #B7B5B5;"></hr>
		<table class="table table-hover" >
	<tbody>
		<tr align="center">
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
	</tbody>
	<tbody>
						<c:forEach items="${list }" var="tmp">
							<tr align="center">
								<td>${tmp.num }</td>
								<td><a href="detail.do?num=${tmp.num }&condition=${condition}&keyword=${encodedKeyword}">${tmp.title }</a></td>
								<td>${tmp.writer }</td>
								<td>${tmp.regdate }</td>
								<td>${tmp.viewCount }</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<a href="insertform.do" class ="btn btn-default">글 작성</a>
					<div class="page-display">
						<ul class="pagination">
						<c:choose>
							<c:when test="${startPageNum ne 1}">
								<li>
									<a href="list.do?pageNum=${startPageNum-1 }&condition=${condition}&keyword=${encodedKeyword}">&laquo;</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="disabled">
									<a href="javascript:">&laquo;</a>
								</li>
							</c:otherwise>
						</c:choose>
						<c:forEach var="i" begin="${startPageNum}" end="${endPageNum }" >
							<c:choose>
								<c:when test="${pageNum eq i }">
									<li class="active">
										<a href="list.do?pageNum=${i }&condition=${condition}&keyword=${encodedKeyword}">${i }</a>
									</li>
								</c:when>
								<c:otherwise>
									<li>
										<a href="list.do?pageNum=${i }&condition=${condition}&keyword=${encodedKeyword}">${i }</a>
									</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<c:choose>
							<c:when test="${endPageNum lt totalPageCount }">
								<li>
									<a href="list.do?pageNum=${endPageNum+1 }&condition=${condition}&keyword=${encodedKeyword}">&raquo;</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="disabled">
									<a href="javascript:">&raquo;</a>
								</li>
							</c:otherwise>
						</c:choose>
						</ul>
					</div>
					<form action="list.do" method="get" class="form-horizontal">
						<label for="condition">검색조건</label>
						<select name="condition" id="condition">
							<option value="titlecontent" <c:if test="${condition eq 'titlecontent' }">selected</c:if>>제목+내용</option>
							<option value="title" <c:if test="${condition eq 'title' }">selected</c:if>>제목</option>
							<option value="writer" <c:if test="${condition eq 'writer' }">selected</c:if>>작성자</option>
						</select>
						<input value="${keyword }" type="text" name="keyword" placeholder="검색"/>
						<button type="submit" class ="btn btn-default">검색</button>
					</form>
					<c:if test="${not empty keyword }">
						<p> <strong>${keyword }</strong> 라는 키워드로 
							<strong>${totalRow }</strong> 개의 글이 검색되었습니다.</p>
					</c:if>	
   		</div> <!-- container left-->


  <!-- 로그인 -->
   <div class="section right">
    <c:choose>
   <c:when test="${empty sessionScope.userid }">
    <br/>
           <form class="form-signin" action="${pageContext.request.contextPath}/member/login.do?url=${param.url }" method="post">
      <label for="userid" class="sr-only">Your ID</label>
        <input type="text" id="userid" name="userid" class="form-control" placeholder="아이디" required autofocus><BR>
        <label for="pwd" class="sr-only">Password</label>
        <input type="password" id="pwd" name="pwd" class="form-control" placeholder="비밀번호" required><br>
        <button id="btn-Yes" class="btn btn-sm btn-default btn-block" type="submit">로 그 인</button>
        <div class="checkbox">
          <label>
            <input type="checkbox"> 기억하기 
          </label>
          <a href="${pageContext.request.contextPath}/member/signup_form.do">회원가입</a>
        </div>
      </form>
   </c:when>
   <c:otherwise>
   
   <table>
   	<tr>
   		<td><h3>${userid }님</h3><br /></td>
   	</tr>
   	<tr>
   		<td><a href="${pageContext.request.contextPath}/member/info.do">정보수정</a> / <a href="${pageContext.request.contextPath}/cartoon/link_detail.do">즐겨찾기 목록</a></td>
   	</tr>
   </table>
   <br />
	<a href="${pageContext.request.contextPath}/member/logout.do"><button class="btn btn-sm btn-default btn-block">로그아웃</button></a>
   </c:otherwise>
   </c:choose>


     <!--주간/월간 순위-->
    <h3>주간/월간 순위</h3>
  <table class="table table-striped table-condensed">
    <tbody>
      <tr>
        <td>1등</td><td>드래곤볼</td>
      </tr>
            <tr>
        <td>2등</td><td>드래곤볼</td>
      </tr>
            <tr>
        <td>3등</td><td>드래곤볼</td>
      </tr>
            <tr>
        <td>4등</td><td>드래곤볼</td>
      </tr>
            <tr>
        <td>5등</td><td>드래곤볼</td>
      </tr>
            <tr>
        <td>6등</td><td>드래곤볼</td>
      </tr>
            <tr>
        <td>7등</td><td>드래곤볼</td>
      </tr>
            <tr>
        <td>8등</td><td>드래곤볼</td>
      </tr>
            <tr>
        <td>9등</td><td>드래곤볼</td>
      </tr>
            <tr>
        <td>10등</td><td>드래곤볼</td>
      </tr>
    </tbody>
  </table>
   	</div> <!-- section--> 
   
   </div>  <!-- container-->
  	 </div><!--body-->

<!-- jquery 로딩하기-->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<!-- bootstrap 로딩하기, jquery plugin, jquery 먼저 로딩해야 함-->
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>