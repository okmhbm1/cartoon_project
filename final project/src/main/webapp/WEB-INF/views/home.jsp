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
      	margin-bottom: 5px;
   }
   .no-border{
            border-right:none

        border-left:none

        border-top:none

        border-bottom:none
        border: none;
   }
   .left{
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
    
    .match_parent {
	width: 100px;
	margin-top: 8px;
	height: 110px;
}

</style>
<body>
   

  <jsp:include page="/WEB-INF/views/top.jsp" flush="false" />


   
   <!-- 바디 -->
   <div class="container">
   <div class="body">
   <div class="box">
   <div class="container left">
      <h3>종합 인기순</h3>
      <hr style="border:1px solid #B7B5B5;"></hr>
          <%int num=0; %>
         <c:forEach items="${recommendlist }" var="tmp">
            <% if(num%6==0){ %>
              <div class="row">
            <%} num++; %>    
         
               <div class="col-xs-2">
                  <a href="cartoon/detail.do?num=${tmp.num}"><img class="match_parent" src="${tmp.image_url}"/></a>
                  <div><a href="cartoon/detail.do?num=${tmp.num}">${tmp.title}</a></div>
                  <div>추천수 : ${tmp.likes }</div>
               </div>
            <% if(num%6==0){%>
              </div>
            <%} %>
          </c:forEach>
   </div> <!-- container left-->
   </div>



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
    <h3>주간TOP10</h3>
        <%int num10=1; %>
<c:forEach items="${recommendoneweeklist }" var="tmp">
            
               <div class="col-xs-2">
                  
                  <div><a href="cartoon/detail.do?num=${tmp.num}"><%=num10 %>${tmp.title}</a></div>
                  
               </div>
               <%num10++; %>
          </c:forEach>
   	</div> <!-- section--> 
   </div><!-- body닫기 -->


   	<!--게시판 모음-->
      <div class="body">
   <div class="container left">
  <hr style="border:1px solid #B7B5B5;"></hr>
      <div class="row ">

         <div class="col-xs-6"><h4>자유게시판</h4>
          <hr>
     <table class="table table-borderless">
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
  </table>       

	</div><!--자유게시판 끝-->


     <div class="col-xs-6"><h4>익명게시판</h4>
          <hr>
  <table class="table table-borderless">
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
       </div> <!--익명게시판 끝-->
       </div><!-- row 닫기 -->
         
      

      <div class="row ">
         <div class="col-xs-6"><h4>리뷰</h4>
          <hr>
  		<table class="table table-borderless ">

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
   </div>
  <!--리뷰 게시판 끝-->

  
  <div class="col-xs-6">
  	<h4>질문게시판</h4>
          <hr>
  <table class="table table-borderless">

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

	</div> <!--질문 게시판 끝-->
	</div><!-- row 닫기 -->
	</div><!-- conleft 닫기 -->
	</div><!-- body 닫기 -->
	</div><!-- 총 container 닫기 -->

 


<!-- jquery 로딩하기-->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<!-- bootstrap 로딩하기, jquery plugin, jquery 먼저 로딩해야 함-->
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>