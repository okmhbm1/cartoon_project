<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
   image{
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
.match_parent{
   max-width:100%
}

.genre{
   font-size:25px;
   color:blue;
}
</style>
<body>
   

   <div class="container">
      <div id="header">
      <!-- 메인배너 -->
      <div class="row">
         <div class="col-xs-4" id="image"> <img class="image" src="${pageContext.request.contextPath}/resources/images/banner.jpg"/></div>
      

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
         <a  href="#" class="navbar-brand">업데이트</a>
         <a href="#" class="navbar-brand">웹툰</a>
         <a  href="#" class="navbar-brand">게시판</a>
         <a  href="#" class="navbar-brand">리뷰</a>
      </div>
   </div> <!--네비바 -->


   <!-- 바디 -->
   <div class="container">
   <div class="body">
      <div class="row">
      <div class="col-xs-4">
         <br/>
         <br/>
         <br/>
         <button class="btn btn-default">연재</button>
            <button class="btn btn-default">미연재</button>
      </div>
      <div class="col-xs-4"></div>
      <div class="col-xs-4">
         <br/>
         <br/>
         <div style="float:right;">
            <div class="checkbox1"    >
            
            
         <label>
                <input type="checkbox" id="naver" name="site" value="${param.naver}" <c:if test="${param.naver  eq 'true'}" > checked </c:if> >
                네이버
              </label>
            
         
            
            
              <label>
                <input type="checkbox" id="toomics" name="site" value="${param.toomics}" <c:if test="${param.toomics eq 'true'}" > checked </c:if> >
                투믹스
              </label>
            
  			
            </div>
   
            <div class="checkbox2" >
              
              <label>
                <input type="radio" name="filter2" id="days" value="days">
               요일별
              </label>
              
             
              <label>
                <input type="radio" name="filter2" id="category" value="category">
                장르
              </label>
             
              
              <label>
                <input type="radio" name="filter2" id="recommend" value="recommend" checked>
                추천
              </label>
    	<label>
                <input type="radio" name="filter2" id="gender" value="gender">
                성별
              </label>

            
            </div>
<!--           
            <div class="checkbox3" >
               <label>
                <input type="checkbox" value="">
                10대
              </label>
               <label>
                <input type="checkbox" value="">
                20대
              </label>
              <input type="checkbox" value="">
                30대
              </label>
            </div>
            
                  보류  -->
                  
         </div><!--div묶은거-->
      </div>
   </div>








      <div class="row">      
      <div class="recomm">종합 추천 순위</div>
      <c:forEach items="${list }" var="tmp">
            
               <div class="col-xs-2">
                  <a href="detail.do?num=${tmp.num}"><img class="match_parent" src="${tmp.image_url}"/></a>
                  <div><a href="detail.do?num=${tmp.num}">${tmp.title}</a></div>
                  <div>종합점수 : ${tmp.grades }점</div>
               </div>
            
      </c:forEach>
      </div><!--row-->   
      


  </div><!--body 끝-->
</div> <!--container-->
      
 

   
   
   
<!-- jquery 로딩하기-->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<!-- bootstrap 로딩하기, jquery plugin, jquery 먼저 로딩해야 함-->
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script>


var query="?";
$(document).ready(function () {
    
         $("#days").on('click',function(){
            
            location.href="list.do";
         });

         
     	$('#category').on('click',function () {
     	      // getter
     	      var radioVal = $('input[name="filter2"]:checked').val();
     	      if(radioVal=='category'){
     	         //alert("카테고리로 정렬");
     	       location.href="list_sort_by_category.do";  
     	      }
     	      alert(radioVal);
     	    });

  	
  	$('#gender').on('click',function () {
  	      // getter
  	      var radioVal = $('input[name="filter2"]:checked').val();
  	      if(radioVal=='gender'){
  	         //alert("카테고리로 정렬");
  	       location.href="list_sort_by_gender.do";  
  	      }
  	      alert(radioVal);
  	    });
  	
         
         
         
         $("#naver").on("click",function(){

     		if($("input:checkbox[id='naver']").is(":checked")==true ){
     			
     			if(! query.includes("naver"))
     				query+="naver=true&";
     			
     			if($("input:checkbox[id='toomics']").is(":checked")==true)
     			{	
     				if(! query.includes("toomics"))
     					query+="toomics=true&";
     			
     			}			
     			alert("쿼리"+query);
     			
     			location.href="list_sort_by_category.do"+query;
     		}
     		else
     		{	
     			if(query.includes("naver"))
     			{	query.replace("naver=true","");
     			
     			}
     			
     			if($("input:checkbox[id='toomics']").is(":checked")==true)
     			{	
     				if(! query.includes("toomics"))
     					query+="toomics=true&";
     			
     			}
     			
     			alert("false");
     			alert(query)
     			location.href="list_sort_by_category.do"+query;			
     		}
     		
     	});
     	$("#toomics").on("click",function(){
     		if($("input:checkbox[id='toomics']").is(":checked")==true ){
     			if(! query.includes("toomics"))
     				query+="toomics=true&";
     			
     			if($("input:checkbox[id='naver']").is(":checked")==true)
     			{	
     				if(! query.includes("naver"))
     					query+="naver=true&";
     			
     			}
     			
     			alert("쿼리"+query);
     			location.href="list_sort_by_category.do"+query;
     		}else
     		{	
     			
     			if($("input:checkbox[id='naver']").is(":checked")==true)
     			{	
     				if(! query.includes("naver"))
     					query+="naver=true&";
     			
     			}
     			if(query.includes("toomics"))
     				query.replace("toomics=true","");
     			alert('false');
     			location.href="list_sort_by_category.do"+query;
     		}
     		
     	});


  });
</script>
</body>
</html>