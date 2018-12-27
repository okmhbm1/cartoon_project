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
   .form-control{
      width:60%;
      display:inline-block;
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
.star{
}

    @media (max-width: 750px){
       .display-none{
        display:none;
        
      }
     
    }

.commentid{
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
   <div class="container left">
      <h3>${dto.title }</h3>
      <hr style="border:1px solid black;"></hr>
      <div class="row ">
         <div class="col-xs-6"><img class="image-full" src="${dto.image_url}"/></div>
         <br>
         <div class="col-xs-6">
         <p><b>작가</b> : ${dto.painter }</p>
         <p><b>줄거리</b> : ${dto.description}</p>
         <p><b>조회수</b> : ${hit }</p>
         <div class="right"><h4 style="color:red; font-weight: bold">평점 : ${dto.avg }</h4></div>
         <div style="display:none">${dto.days }</div>
         </div> <!--첫번째 row-->
         <button class="btn btn-default right link"> 즐겨찾기</button>          
         <button class="btn btn-default right" onclick = "location.href = '${dto.detail_url}' " style="margin-right:4px">보러가기</button><br><br>
        
           <button style="margin-right:4px" class="right btn btn-default" id="recomm">추천 : ${dto.likes }</button>   
         
      </div>
      <br/>
         <hr style="border:1px solid #B7B5B5;">
    <div class="row" style="text-align: center">
          
         <div class="star" class="col-xs-5" style="color:red;">
            <span  id="star1">☆</span>
            <span  id="star2">☆</span>
            <span  id="star3">☆</span>
            <span  id="star4">☆</span>
            <span  id="star5">☆</span>
            <span  id="star6">☆</span>
            <span  id="star7">☆</span>
            <span  id="star8">☆</span>
            <span  id="star9">☆</span>
            <span id="star10">☆</span>
            
            
                           <c:if test="${userid ne null }">
                           <form>
                           <input type="hidden" id="num" name="num" value="${num }"/>
                              <input type="hidden" id="userid" name="userid" value="${userid }"/>
                              <input type="hidden" id="point" name="point"/>
                               <input type="text" class="form-control" id="comment" placeholder="평가를 써주세요. 문장 길이 제한 : 한글 140자" maxlength="140"/>
                                <button id="submitbtn" class="btn btn-default "type="submit">전송</button>
                            </form>
                            </c:if>   
         </div>
      

         <br/>
         <hr>
         
      
          <div class="col-xs-5">
           <button id="recommend" class="btn btn-default">추천순</button>
           <button id="not_recommend" class="btn btn-default">비추천순</button>
            <button id="latest" class="btn btn-default">최신순</button>
          </div>

          <div class="col-xs-5">
          </div>
    </div><!--row 끝-->
            
         <hr style="border:1px solid #B7B5B5;">




      

      
       <c:if test="${list ne null }">            
         <c:forEach items="${list }" var="tmp" varStatus="theCount">
               
               <div class="row">
               
            
                  <div class="col-xs-5 printpoint" style="text-align:center " >${tmp.point }</div>
         		<div style="text-align:left ">
                  <div div="commend_div" class="col-xs-7">${tmp.comment } 
                  <br/>
                  <br/>
                  <span class="commentid" style="font-weight: bold">아이디 : ${tmp.userid }</span>
                   날짜 :<span>${tmp.regdate}</span>	
                   <br/>
                  <button class="good btn btn-primary btn-xs">공감 : <span>${tmp.good }</span></button><button class="notgood btn btn-danger btn-xs">비공감 : <span>${tmp.notgood }</span></button></div>
                </div>
                <c:set var="i" value="${theCount.count}"/>
               </div><!--row2 끝-->
         
               <br/>
               <hr>
         </c:forEach>
      </c:if>
     
      






    <br/>
    <hr/>


   </div> <!-- container left-->



   <!-- 로그인 -->
   <div class="section right">
      



 <jsp:include page="/WEB-INF/views/rank.jsp" flush="false" />
   </div> <!--container-->


      
 

   
   
   
<!-- jquery 로딩하기-->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<!-- bootstrap 로딩하기, jquery plugin, jquery 먼저 로딩해야 함-->
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script>
$("#recommend").on('click',function(){
   location.href="detail.do?param=recommend&num="+$("#num").val();
});
$("#not_recommend").on('click',function(){
   location.href="detail.do?param=not_recommend&num="+$("#num").val();         
});
$("#latest").on('click',function(){
   location.href="detail.do?param=latest&num="+$("#num").val();
});

$(".link").on('click',function(){


   var cartoon_num=$("#num").val();
   var userid=$("#userid").val();
   var detail_url=location.href
   var days = '${dto.days }';
      $.ajax({
         method:'POST',
         url:'link.do',
         traditional:true,
         data : {
            "cartoon_num":cartoon_num,
            "userid":userid,
            "detail_url":detail_url,
            "days" : days
            
         
         },
         success : function(success){
            
            
            if(userid!=null && userid!=undefined ){
               var result = confirm("즐겨찾기 게시판으로 가시겠습니까?");
               if(result==true)
               location.href="link_detail.do"
            }
         }
      
      });

   });
   //alert($("#num").val());
   $("#recomm").on('click',function(){
      var cartoon_num=$("#num").val();
      var userid=$("#userid").val();
      //alert(userid);
      $.ajax({
         method:'POST',
         url:'recommend.do',
         traditional:true,
         data : {
            "cartoon_num":cartoon_num,
            "userid":userid,
         
         },
         success : function(success){
             if(success == "success")
               location.reload();
         }
      
      });
      //alert("끝");
      
   })

   
   $(".good").each(function(){
      
      $(this).on('click',function(){

            var cartoon_num=$("#num").val();
            var userid=$("#userid").val();
            var uploaderid=   $(this).parent().find(".commentid").text();

            //alert(uploaderid);
            
            //alert($(this).text());
            //alert(cartoon_num);
            //alert(userid);
            $.ajax({
               method:'POST',
               url:'good.do',
               traditional:true,
               data : {
                  "cartoon_num":cartoon_num,
                  "userid":userid,
                  "uploaderid":uploaderid
               
               },
               success : function(success){
                   alert(success);
                     location.reload();
               }
            
            });               
                        
      });
      
   });
   
   

      $(".notgood").each(function(){
      
      $(this).on('click',function(){

            var cartoon_num=$("#num").val();
            var userid=$("#userid").val();
            var uploaderid=   $(this).parent().find(".commentid").text();

            //alert(uploaderid);
            
            //alert($(this).text());
            //alert(cartoon_num);
            //alert(userid);
            $.ajax({
               method:'POST',
               url:'notgood.do',
               traditional:true,
               data : {
                  "cartoon_num":cartoon_num,
                  "userid":userid,
                  "uploaderid":uploaderid
               
               },
               success : function(success){
                   //alert(success);
                     location.reload();
               }
            
            });               
                        
      });
      
   });



$("#submitbtn").on('click',function(){
   var point = $("#point").val(star_value).val();
   var cartoon_num=$("#num").val();
   var userid=$("#userid").val();
   var comment=$("#comment").val();
   
      //alert("point:"+point+"cartoon_num"+cartoon_num+"userid:"+userid+"comment:"+comment);
                  
      
         $.ajax({
            method:'POST',
            url:'savepoint.do',
            traditional:true,
            data : {
               'point':point,
               'cartoon_num':cartoon_num,
               'userid':userid,
               'comment':comment
            },
            success : function(success){
                alert(success);
                  location.reload();
            }
            
         });
   
   });


var is_select=false;
var star_value=0;
$("#star1").mouseover(function(){
var i=1;
if(is_select==false)
   for(var j=1;j<=i;j++)
      $("#star"+j).text("★");
});
$("#star2").mouseover(function(){
var i=2;
if(is_select==false)
for(var j=1;j<=i;j++)
   $("#star"+j).text("★");
});
$("#star3").mouseover(function(){
var i=3;
if(is_select==false)
   for(var j=1;j<=i;j++)
      $("#star"+j).text("★");
});
$("#star4").mouseover(function(){
var i=4;
if(is_select==false)
for(var j=1;j<=i;j++)
   $("#star"+j).text("★");
});
$("#star5").mouseover(function(){
var i=5;
if(is_select==false)
for(var j=1;j<=i;j++)
   $("#star"+j).text("★");
});
$("#star6").mouseover(function(){
var i=6;
if(is_select==false)
for(var j=1;j<=i;j++)
   $("#star"+j).text("★");
});
$("#star7").mouseover(function(){
var i=7;
if(is_select==false)
for(var j=1;j<=i;j++)
   $("#star"+j).text("★");
});
$("#star8").mouseover(function(){
var i=8;
if(is_select==false)
for(var j=1;j<=i;j++)
   $("#star"+j).text("★");
});
$("#star9").mouseover(function(){
var i=9;
if(is_select==false)
for(var j=1;j<=i;j++)
   $("#star"+j).text("★");
});
$("#star10").mouseover(function(){
var i=10;
if(is_select==false)
for(var j=1;j<=i;j++)
   $("#star"+j).text("★");
});
$(".star").mouseout(function(){

if(is_select ==false){
$("#star1").text("☆");
$("#star2").text("☆");
$("#star3").text("☆");
$("#star4").text("☆");
$("#star5").text("☆");
$("#star6").text("☆");
$("#star7").text("☆");
$("#star8").text("☆");
$("#star9").text("☆");
$("#star10").text("☆");
}
});


$("#star1").on('click',function(){
   star_value=1;
   is_select=true;
   $("#star1").text("★");
   if(is_select){
      $("#star2").text("☆");
      $("#star3").text("☆");
      $("#star4").text("☆");
      $("#star5").text("☆");
      $("#star6").text("☆");
      $("#star7").text("☆");
      $("#star8").text("☆");
      $("#star9").text("☆");
      $("#star10").text("☆");
   }
});
$("#star2").on('click',function(){
   star_value=2;
   is_select=true;
   $("#star1").text("★");
   $("#star2").text("★");
   if(is_select){
      $("#star3").text("☆");
      $("#star4").text("☆");
      $("#star5").text("☆");
      $("#star6").text("☆");
      $("#star7").text("☆");
      $("#star8").text("☆");
      $("#star9").text("☆");
      $("#star10").text("☆");
   }
});
$("#star3").on('click',function(){
   star_value=3;
   is_select=true;
   $("#star1").text("★");
   $("#star2").text("★");
   $("#star3").text("★");
   if(is_select){
      $("#star4").text("☆");
      $("#star5").text("☆");
      $("#star6").text("☆");
      $("#star7").text("☆");
      $("#star8").text("☆");
      $("#star9").text("☆");
      $("#star10").text("☆");
      
   }
});
$("#star4").on('click',function(){
   star_value=4;
   is_select=true;
   
   $("#star1").text("★");
   $("#star2").text("★");
   $("#star3").text("★");
   $("#star4").text("★");
   if(is_select){
      $("#star5").text("☆");
      $("#star6").text("☆");
      $("#star7").text("☆");
      $("#star8").text("☆");
      $("#star9").text("☆");
      $("#star10").text("☆");
   }
});
$("#star5").on('click',function(){
   star_value=5;
   is_select=true;
   $("#star1").text("★");
   $("#star2").text("★");
   $("#star3").text("★");
   $("#star4").text("★");
   $("#star5").text("★");
   if(is_select){
      $("#star6").text("☆");
      $("#star7").text("☆");
      $("#star8").text("☆");
      $("#star9").text("☆");
      $("#star10").text("☆");
   }
});
$("#star6").on('click',function(){
   star_value=6;
   is_select=true;
   $("#star1").text("★");
   $("#star2").text("★");
   $("#star3").text("★");
   $("#star4").text("★");
   $("#star5").text("★");
   $("#star6").text("★");
   if(is_select){
      $("#star7").text("☆");
      $("#star8").text("☆");
      $("#star9").text("☆");
      $("#star10").text("☆");
   }
});
$("#star7").on('click',function(){
   star_value=7;
   is_select=true;
   $("#star1").text("★");
   $("#star2").text("★");
   $("#star3").text("★");
   $("#star4").text("★");
   $("#star5").text("★");
   $("#star6").text("★");
   $("#star7").text("★");
   if(is_select){
      $("#star8").text("☆");
      $("#star9").text("☆");
      $("#star10").text("☆");

   }
});
$("#star8").on('click',function(){
   star_value=8;
   is_select=true;
   $("#star1").text("★");
   $("#star2").text("★");
   $("#star3").text("★");
   $("#star4").text("★");
   $("#star5").text("★");
   $("#star6").text("★");
   $("#star7").text("★");
   $("#star8").text("★");
   if(is_select){
      $("#star9").text("☆");
      $("#star10").text("☆");
   }
});
$("#star9").on('click',function(){
   star_value=9;
   is_select=true;
   $("#star1").text("★");
   $("#star2").text("★");
   $("#star3").text("★");
   $("#star4").text("★");
   $("#star5").text("★");
   $("#star6").text("★");
   $("#star8").text("★");
   $("#star9").text("★");
   if(is_select){
      $("#star10").text("☆");
   }
});

$("#star10").on('click',function(){
   star_value=10;
   is_select=true;
   $("#star1").text("★");
   $("#star2").text("★");
   $("#star3").text("★");
   $("#star4").text("★");
   $("#star5").text("★");
   $("#star6").text("★");
   $("#star8").text("★");
   $("#star9").text("★");
   $("#star10").text("★");
});





   
   
   $(".printpoint").each(function(){
      if($(this).text()=="0")
         $(this).text("☆");
      if($(this).text()=="1")
         $(this).text("★");
      if($(this).text()=="2")
         $(this).text("★★");
      if($(this).text()=="3")
         $(this).text("★★★");
      if($(this).text()=="4")
         $(this).text("★★★★");
      if($(this).text()=="5")
         $(this).text("★★★★★");
      if($(this).text()=="6")
         $(this).text("★★★★★★");
      if($(this).text()=="7")
         $(this).text("★★★★★★★");
      if($(this).text()=="8")
         $(this).text("★★★★★★★★");
      if($(this).text()=="9")
         $(this).text("★★★★★★★★★");
      if($(this).text()=="10")
         $(this).text("★★★★★★★★★★");
   
   });   
   
   
   

</script>
</body>
</html>