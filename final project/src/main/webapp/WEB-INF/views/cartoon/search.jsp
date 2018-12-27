<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	  display: inline-block;
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
    
.weekly_up_badge0, .weekly_up_badge1, .weekly_up_badge2, .weekly_up_badge3 ,.weekly_up_badge4, .weekly_up_badge5,.weekly_up_badge6
{position:static;
text-align:center;
top:-30px;
height:23px;
line-height:25px;
background:#f54a3d;
color:#fff;
font-weight:bold;
font-size:16px;
width:120px;
display: none;
}
.texttext{position:relative;
text-align:left;
display:block;
top:3px;
font-weight:bold;
font-size:14px;
font-color:#060606;
}
.leftleft{
float:left;
margin-right:15px;
}

.match_parent {
	width: 120px;
	margin-top: 8px;
	height: 110px;
}

	a:link {text-decoration: none; color: black;}
	a:visited {text-decoration: none; color: black;}
	a:active {text-decoration: none; color: black;}
	a:hover {text-decoration: underline; color: red;}
</style>
<body>  

  <jsp:include page="/WEB-INF/views/top.jsp" flush="false" />


 
  <!-- 바디 -->
   <div class="container">
   <div class="body">
    <h3>만화 검색</h3>	
    <hr style="border:1px solid black;"></hr>
	 <c:forEach items="${list}" var="tmp" varStatus="count">
            
            <div class="leftleft">
            <div>
            <a href="detail.do?num=${tmp.num}">
            <img class="match_parent" src="${tmp.image_url}"/><span class="weekly_up_badge1">업데이트</span></a>
            </div>
            <div class="texttext"><a href="detail.do?num=${tmp.num}">${tmp.title}</a></div>
            
            </div>
            
      </c:forEach>


   </div><!-- body닫기 -->


	</div><!-- 총 container 닫기 -->

 

<!-- jquery 로딩하기-->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<!-- bootstrap 로딩하기, jquery plugin, jquery 먼저 로딩해야 함-->
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/angular.min.js"></script>

</body>
</html>