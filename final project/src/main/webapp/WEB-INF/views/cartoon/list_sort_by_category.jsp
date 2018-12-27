<%@page import="java.util.List"%>
<%@page import="com.bob.please.cartoon.dto.CartoonDto"%>
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
   
   
   #aaaa{

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

    @media (max-width: 650px){
       .display-none{
        display:none;
        
      }
     
    }
    .match_parent {
	width: 100px;
	margin-top: 8px;
	height: 110px;
}

.genre{
   font-size:25px;
   color:blue;
}
</style>
<body>
   

  <jsp:include page="/WEB-INF/views/top.jsp" flush="false" />




   <!-- 바디 -->
   <div class="container">
   <div class="body">
      <div class="row">
      <div class="col-xs-4">
         <br/>
         <br/>
         <br/>
      </div>
				<div class="col-xs-3"></div>
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
                <input type="radio" name="filter2" id="days" value="days" checked>
               요일별
              </label>
              
             
              <label>
                <input type="radio" name="filter2" id="category" value="category" checked>
                장르
              </label>
             
              
              <label>
                <input type="radio" name="filter2" id="recommend" value="recommend">
                추천
              </label>
    	<label>

		<input type="radio" name="filter2" id="gender" value="gender"> 성별
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







   <div class="container left">
   
   <div>
      <%List<CartoonDto> list = (List<CartoonDto>)request.getAttribute("list1");
        for(int i=0;i<(Integer)list.size();i++)
        {	if(list.get(i).getCategory()!=null &&list.get(i).getCategory().equals("에피소드")){ %>      
      		<div class="genre">에피소드</div>
      	<%   break;} 
      	}%>
      	<%int num=0; %>
      <c:forEach items="${list1 }" var="tmp">
            <%if (num%6==0){ %>
            <div class="row">
            <%}%>
            <c:if test="${tmp.category eq '에피소드' }">
               <div class="col-xs-4" id="aaaa">
                  <a href="detail.do?num=${tmp.num}"><img class="match_parent" src="${tmp.image_url}"/></a>
                  <div><a href="detail.do?num=${tmp.num}">${tmp.title}</a></div>
               </div>
               <% num++; %>
            </c:if>
            <%if (num%6==0) {%>
            </div><% } %>      
      </c:forEach>
      </div>   
      
      <div>  
     <%List<CartoonDto> list2 = (List<CartoonDto>)request.getAttribute("list1");
        for(int i=0;i<(Integer)list2.size();i++)
        {	if(list2.get(i).getCategory()!=null &&list2.get(i).getCategory().equals("스토리")){ %>      
      		<div class="genre">스토리</div>
      	<%   break;} 
      	}%>
      	<%int num2=0; %>
      <c:forEach items="${list1 }" var="tmp">
      		<%if (num2%6==0){  %>
            <div class="row">
            <%}%>
            <c:if test="${tmp.category eq '스토리' }">
               <div class="col-xs-3" id="aaaa">
                  <a href="detail.do?num=${tmp.num}"><img class="match_parent" src="${tmp.image_url}"/></a>
                  <div><a href="detail.do?num=${tmp.num}">${tmp.title}</a></div>
               </div>
               <% num2++; %>
            </c:if>
            <%if (num2%6==0) {%>
            </div><%} %>       
      </c:forEach>
      </div> 
             
      <div>   
      <%List<CartoonDto> list3 = (List<CartoonDto>)request.getAttribute("list1");
        for(int i=0;i<(Integer)list3.size();i++)
        {	if(list3.get(i).getCategory()!=null && list3.get(i).getCategory().equals("일상")){ %>      
      		<div class="genre">일상</div>
      	<%   break;} 
      	}%>
      	<%int num3=0; %>
      <c:forEach items="${list1 }" var="tmp">
		      <%if (num3%6==0){ %>
		            <div class="row">
		            <%}%>
            <c:if test="${tmp.category eq '일상' }">
               <div class="col-xs-3" id="aaaa">
                  <a href="detail.do?num=${tmp.num}"><img class="match_parent" src="${tmp.image_url}"/></a>
                  <div><a href="detail.do?num=${tmp.num}">${tmp.title}</a></div>
               		<%num3++; %>
               </div>
            </c:if>
            <%if (num3%6==0) {%>
            </div><%} %>        
      </c:forEach>
      </div>
            
            
      <div>       
      <%List<CartoonDto> list4 = (List<CartoonDto>)request.getAttribute("list1");
        for(int i=0;i<(Integer)list4.size();i++)
        {	if(list4.get(i).getCategory()!=null&&list4.get(i).getCategory().equals("개그")){ %>      
      		<div class="genre">개그</div>
      	<%   break;} 
      	}%>
      	<%int num4=0; %>
      <c:forEach items="${list1 }" var="tmp">
		      <%if (num4%6==0){ %>
				            <div class="row">
				            <%}%>
            <c:if test="${tmp.category eq '개그' }">
               <div class="col-xs-3" id="aaaa">
                  <a href="detail.do?num=${tmp.num}"><img class="match_parent" src="${tmp.image_url}"/></a>
                  <div><a href="detail.do?num=${tmp.num}">${tmp.title}</a></div>
               </div>
               <% num4++; %>
            </c:if>
            <%if (num4%6==0) {%>
            </div><%} %>        
      </c:forEach>
      </div> 
      
      
      
       <div>	    
      <%List<CartoonDto> list5 = (List<CartoonDto>)request.getAttribute("list1");
        for(int i=0;i<(Integer)list5.size();i++)
        {	if(list5.get(i).getCategory()!=null && list5.get(i).getCategory().equals("판타지")){ %>      
      		<div class="genre">판타지</div>
      	<%   break;} 
      	}%>
      	<%int num5=0; %>  
      <c:forEach items="${list1 }" var="tmp">
      		<%if (num5%6==0){ %>
				            <div class="row">
				            <%}%>
            <c:if test="${tmp.category eq '판타지' }">
               <div class="col-xs-3" id="aaaa">
                  <a href="detail.do?num=${tmp.num}"><img class="match_parent" src="${tmp.image_url}"/></a>
                  <div><a href="detail.do?num=${tmp.num}">${tmp.title}</a></div>
               </div>
               <% num5++; %>
            </c:if> 
            <%if (num5%6==0) {%>
            </div><%} %>        
      </c:forEach>
      </div>
      
      
       <div>
      <%List<CartoonDto> list6 = (List<CartoonDto>)request.getAttribute("list1");
        for(int i=0;i<(Integer)list6.size();i++)
        {	if(list6.get(i).getCategory()!=null && list6.get(i).getCategory().equals("액션")){ %>      
      		<div class="genre">액션</div>
      	<%   break;} 
      	}%>
      	<%int num6=0; %>  
      <c:forEach items="${list1 }" var="tmp">
      			<%if (num6%6==0){ %>
				  <div class="row">
				            <%}%>
            <c:if test="${tmp.category eq '액션' }">
               <div class="col-xs-3" id="aaaa">
                  <a href="detail.do?num=${tmp.num}"><img class="match_parent" src="${tmp.image_url}"/></a>
                  <div><a href="detail.do?num=${tmp.num}">${tmp.title}</a></div>
               </div>
               <% num6++;%>
            </c:if>
            <%if (num6%6==0) {%>
            </div><%} %>          
      </c:forEach>
      </div>  
      
      <div>      
      <%List<CartoonDto> list7= (List<CartoonDto>)request.getAttribute("list1");
        for(int i=0;i<(Integer)list6.size();i++)
        {	if(list7.get(i).getCategory()!=null && list7.get(i).getCategory().equals("드라마")){ %>      
      		<div class="genre">드라마</div>
      	<%   break;} 
      	}%>
      	<%int num7=0; %>
      <c:forEach items="${list1 }" var="tmp">
      		<%if (num7%6==0){ %>
				  <div class="row">
		    <%}%>
            <c:if test="${tmp.category eq '드라마' }">
               <div class="col-xs-3" id="aaaa">
                  <a href="detail.do?num=${tmp.num}"><img class="match_parent" src="${tmp.image_url}"/></a>
                  <div><a href="detail.do?num=${tmp.num}">${tmp.title}</a></div>
               </div>
               <%num7++; %>
            </c:if>
            <%if (num7%6==0) {%>
            </div>
            <%} %>       
      </c:forEach>
      </div>
        
        
       
      <div>
        <%List<CartoonDto> list8 = (List<CartoonDto>)request.getAttribute("list1");
        for(int i=0;i<(Integer)list8.size();i++)
        {	if(list8.get(i).getCategory()!=null && list8.get(i).getCategory().equals("순정")){ %>      
      		<div class="genre">순정</div>
      	<%   break;} 
      	}%>
      	<%int num8=0; %>
      <c:forEach items="${list1 }" var="tmp">
      	<%if (num8%6==0){ %>
				  <div class="row">
		    <%} %>
            <c:if test="${tmp.category eq '순정' }">
               <div class="col-xs-3" id="aaaa">
                  <a href="detail.do?num=${tmp.num}"><img class="match_parent" src="${tmp.image_url}"/></a>
                  <div><a href="detail.do?num=${tmp.num}">${tmp.title}</a></div>
               </div>
               <% num8++; %>
            </c:if> 
            <%if (num8%6==0) {%>
            </div><%}  %>       
      </c:forEach>
     </div> 
      
       <div>
      <%List<CartoonDto> list9 = (List<CartoonDto>)request.getAttribute("list1");
        for(int i=0;i<(Integer)list9.size();i++)
        {	if(list9.get(i).getCategory()!=null && list9.get(i).getCategory().equals("감성")){ %>      
      		<div class="genre">감성</div>
      	<%   break;} 
      	}%>
      	<%int num9=0; %>
      <c:forEach items="${list1 }" var="tmp">
		      <%if (num9%6==0){ %>
						  <div class="row">
				    <%}%>
            <c:if test="${tmp.category eq '감성' }">
               <div class="col-xs-3" id="aaaa">
                  <a href="detail.do?num=${tmp.num}"><img class="match_parent" src="${tmp.image_url}"/></a>
                  <div><a href="detail.do?num=${tmp.num}">${tmp.title}</a></div>
               </div>
               <% num9++; %>
            </c:if>
            <%if (num9%6==0) {%>
            </div><%} %>      
      </c:forEach>
      </div>
        
        
       <div>
        <%List<CartoonDto> list10 = (List<CartoonDto>)request.getAttribute("list1");
        for(int i=0;i<(Integer)list10.size();i++)
        {	if(list10.get(i).getCategory()!=null && list10.get(i).getCategory().equals("스릴러")){ %>      
      		<div class="genre">스릴러</div>
      	<%   break;} 
      	}%>
      	<%int num10=0; %>      
      <c:forEach items="${list1 }" var="tmp">
      		<%if (num10%6==0){ %>
						  <div class="row">
				    <%}%>
            <c:if test="${tmp.category eq '스릴러' }">
               <div class="col-xs-3" id="aaaa">
                  <a href="detail.do?num=${tmp.num}"><img class="match_parent" src="${tmp.image_url}"/></a>
                  <div><a href="detail.do?num=${tmp.num}">${tmp.title}</a></div>
               </div>
               <% num10++; %>
            </c:if> 
            <%if (num10%6==0) {%>
            </div><%}  %>      
      </c:forEach>
       </div> 
      
      <div>
      <%List<CartoonDto> list11 = (List<CartoonDto>)request.getAttribute("list1");
        for(int i=0;i<(Integer)list11.size();i++)
        {	if(list11.get(i).getCategory()!=null && list11.get(i).getCategory().equals("시대극")){ %>      
      		<div class="genre">시대극</div>
      	<%   break;} 
      	}%>
      	<%int num11=0; %>      
      <c:forEach items="${list1 }" var="tmp">
		      <%if (num11%6==0){ %>
								  <div class="row">
						    <%} %>
            <c:if test="${tmp.category eq '시대극' }">
               <div class="col-xs-3" id="aaaa">
                  <a href="detail.do?num=${tmp.num}"><img class="match_parent" src="${tmp.image_url}"/></a>
                  <div><a href="detail.do?num=${tmp.num}">${tmp.title}</a></div>
               </div>
               <% num11++; %>
            </c:if>
            <%if (num11%6==0) {%>
            </div><%}  %>       
      </c:forEach>
      </div>
      <div>
		<%List<CartoonDto> list12 = (List<CartoonDto>)request.getAttribute("list1");
        for(int i=0;i<(Integer)list12.size();i++)
        {	if(list12.get(i).getCategory()!=null && list12.get(i).getCategory().equals("스포츠")){ %>      
      		<div class="genre">스포츠</div>
      	<%   break;} 
      	}%>
      	<%int num12=0; %>
      <c:forEach items="${list1 }" var="tmp">
      				<%if (num12%6==0){ %>
								  <div class="row">
						    <%} %>
            <c:if test="${tmp.category eq '스포츠' }">
               <div class="col-xs-3" id="aaaa">
                  <a href="detail.do?num=${tmp.num}"><img class="match_parent" src="${tmp.image_url}"/></a>
                  <div><a href="detail.do?num=${tmp.num}">${tmp.title}</a></div>
               </div>
               <% num12++; %>
            </c:if>
            <%if (num12%6==0) {%>
            </div><%} %>         
      </c:forEach>
      </div>
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
         $('#recommend').on('click',function () {
    	      // getter
    	      var radioVal = $('input[name="filter2"]:checked').val();
    	      if(radioVal=='recommend'){
    	         //alert("카테고리로 정렬");
    	       location.href="list_sort_by_recommend.do";  
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