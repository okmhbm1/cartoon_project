<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
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
    a{
    color:black;
    }
</style>
<body>
   

  <jsp:include page="/WEB-INF/views/top.jsp" flush="false" />
   
   <!-- 바디 -->
   <div class="container" style="height:200%">
   <div class="body">

    
                                    <h3>관리자 페이지 입니다.</h3>
                                    <hr style="border:1px solid black;"></hr>
    <div class="left col-xs-push-2" style="width:60%;height:150%;position:relative;top:15%;text-align:center"><br><br>
                  <div class="container" style="width:100%">
                          <div class="row" style="background-color:gray">
                                    <div class="col-xs-4">
                                    <a href="crawling.do">
		                                    <img src="${pageContext.request.contextPath}/resources/images/topni.jpg" style="position:relative;width:100%;height:150px">
		                            
		                            
		                                           <div>네이버 크롤링</div>
		                            </a>
		                            </div>
		                            
                                    <div class="col-xs-4">
                                    <a href="crawling2.do">
			                                    <img src="${pageContext.request.contextPath}/resources/images/topni2.jpg" style="position:relative;width:100%;height:150px">    
			                         
			                                     <div>짬툰 크롤링</div>
			                        </a>  
                                    </div>
                                    
                                    <div class="col-xs-4">
                                    <a href="administer_sorting_genre_page.do">
			                                      <img src="${pageContext.request.contextPath}/resources/images/shintop.jpg" style="position:relative;width:100%;height:150px">
			                                            <div>다운받은 만화 장르 설정</div>
                                    </a>
                                    </div>
                                    
                                    <div class="col-xs-4">
                                    <a href="#">
				                                    <img src="${pageContext.request.contextPath}/resources/images/board.jpg" style="position:relative;width:100%;height:150px">
				                                    <div >게시판 관리</div>
				                    </a>
                                    
                                    </div>				                    
                                    <div class="col-xs-4">
                                    <a href="checkcategory.do">
				                                    <img src="${pageContext.request.contextPath}/resources/images/search.jpg" style="position:relative;width:100%;height:150px">
				                                    <div style="">네이버 카테고리 클로링</div>
				                    </a>
                                    
                                  
                                    
                                    </div>
                                    
        
                                    <div class="col-xs-4">
                                    <a href="#">
                                      <img src="${pageContext.request.contextPath}/resources/images/member.jpg" style="position:relative;height:150px">
                                    <div style="position:relative;">회원정보 관리</div>
                                    </a>
                                    </div>        
                                    
                            </div>
                            
                   </div>
              </div>
    </div>
    
   

 
   
</div> <!-- body -->
</div> <!--container-->
      
 

  

<!-- jquery 로딩하기-->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<!-- bootstrap 로딩하기, jquery plugin, jquery 먼저 로딩해야 함-->
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>