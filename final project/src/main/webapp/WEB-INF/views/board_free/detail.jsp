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
	<a href="list.do"><button class="btn btn-default">글 목록보기</button></a>
	<c:if test="${not empty keyword }">
		<p> <strong>${keyword }</strong> 검색어로 검색된 결과 입니다.</p>
	</c:if>
	<h3>상세 보기</h3>
	<c:if test="${dto.prevNum ne 0 }">
	<%-- 	<a href="detail.do?num=${dto.prevNum }&condition=${condition}&keyword=${encodedKeyword}"><button class="btn btn-primary btn-xs">이전글</button></a> --%>
	</c:if>
	<c:if test="${dto.nextNum ne 0 }">
	<%-- 	<a href="detail.do?num=${dto.nextNum }&condition=${condition}&keyword=${encodedKeyword}"><button class="btn btn-danger btn-xs">다음글</button></a> --%>
	</c:if>

	<table class="table">
	<tr>
		<th>글번호</th>
		<td>${dto.num }</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${dto.writer }</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${dto.title }</td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea  cols="100" rows="13" disabled>${dto.content}</textarea></td>
	</tr>
	<tr>
	<td colspan="2">	<!-- 로그인된 아이디와 글작성자가 같을때만 수정, 삭제 링크 제공 -->
	<c:if test="${ sessionScope.userid eq dto.writer }">
		<a href="updateform.do?num=${dto.num }" class="btn btn-default">수정</a>
		<a href="javascript:deleteConfirm(${dto.num })" class="btn btn-default">삭제</a>
	</c:if>
	</td>
	</tr>
	<tr>
		<th>등록일</th>
		<td>${dto.regdate}</td>
	</tr>
	</table>
	<!-- 댓글 목록 -->
	<div class="comments">
		<ul>
		<c:forEach items="${commentList }" var="tmp">
			<c:choose>
				<c:when test="${tmp.deleted ne 'yes' }">
					<li class="comment" id="comment${tmp.num }" <c:if test="${tmp.num ne tmp.comment_group }">style="padding-left:50px;"</c:if> >
						<c:if test="${tmp.num ne tmp.comment_group }">
							<img class="reply_icon" src="${pageContext.request.contextPath}/resources/images/re.gif"/>
						</c:if>
						<dl>
							<dt>
								<img src="${pageContext.request.contextPath}/resources/images/user.png"/>
								<span>${tmp.writer }</span>
								<c:if test="${tmp.num ne tmp.comment_group }" >
									to <strong>${tmp.target_id }</strong>
								</c:if>
								<span>${tmp.regdate }</span>
								<a href="javascript:" class="reply_link">답글</a> |
								<c:choose>
									<c:when test="${id eq tmp.writer }">
										<a href="javascript:" class="comment-update-link">수정</a>&nbsp;&nbsp;
										<a href="javascript:deleteComment(${tmp.num })">삭제</a>
									</c:when>
									<c:otherwise>
										<a href="javascript:">신고</a>
									</c:otherwise>
								</c:choose>
							</dt>
							<dd>
								<pre>${tmp.content }</pre>
							</dd>
						</dl>
						<form class="comment-insert-form" action="comment_insert.do" method="post">
							<!-- 덧글 그룹 -->
							<input type="hidden" name="ref_group" value="${dto.num }" />
							<!-- 덧글 대상 -->
							<input type="hidden" name="target_id" value="${tmp.writer }" />
							<input type="hidden" name="comment_group" value="${tmp.comment_group }" />
							<textarea name="content" placeholder="로그인이 필요합니다." style="resize:none; width:100%; height:100%;" ></textarea>
							<button type="submit">등록</button> <%-- <c:if test="${empty id }"> </c:if> --%>
						</form>	
						<!-- 로그인한 아이디와 댓글의 작성자와 같으면 수정폼 출력 -->				
						<c:if test="${id eq tmp.writer }">
							<form class="comment-update-form" action="comment_update.do">
								<input type="hidden" name="num" value="${tmp.num }" />
								<textarea name="content" placeholder="로그인이 필요합니다." style="resize:none; width:100%; height:100%;">${tmp.content }</textarea>
								<button type="submit">수정</button>
							</form>
						</c:if>
					</li>				
				</c:when>
				<c:otherwise>
					<li>삭제된 댓글 입니다.</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		</ul>
		<div class="clearfix"></div>
		<!-- 원글에 댓글을 작성할수 있는 폼 -->
		<div class="comment_form">
			<form action="comment_insert.do" method="post">
				<!-- 댓글의 그룹번호는 원글의 글번호 -->
				<input type="hidden" name="ref_group" value="${dto.num }"/>
				<!-- 댓글의 대상자는 원글의 작성자 -->
				<input type="hidden" name="target_id" value="${dto.writer }"/>
				<textarea name="content" style="resize:none; width:100%; height:100%;" <c:if test="${empty id }"  > placeholder="로그인이 필요합니다."</c:if> ></textarea>
				<button type="submit">등록</button>
			</form>
		</div>
	</div>
</div>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script>
	//댓글 수정 링크를 눌렀을때 호출되는 함수 등록
	$(".comment-update-link").click(function(){
		$(this)
		.parent().parent().parent()
		.find(".comment-update-form")
		.slideToggle(200);
	});
	
	//댓글 수정 폼에 submit 이벤트가 일어났을때 호출되는 함수 등록
	$(".comment-update-form").on("submit", function(){
		// "comment_update.do"
		var url=$(this).attr("action");
		//폼에 작성된 내용을 query 문자열로 읽어온다.
		// num=댓글번호&content=댓글내용
		var data=$(this).serialize();
		//이벤트가 일어난 폼을 선택해서 변수에 담아 놓는다.
		var $this=$(this);
		$.ajax({
			url:url,
			method:"post",
			data:data,
			success:function(responseData){
				// responseData : {isSuccess:true}
				if(responseData.isSuccess){
					//폼을 안보이게 한다 
					$this.slideUp(200);
					//폼에 입력한 내용 읽어오기
					var content=$this.find("textarea").val();
					//pre 요소에 수정 반영하기 
					$this.parent().find("pre").text(content);
				}
			}
		});
		//폼 제출 막기 
		return false;
	});
	
	//댓글 삭제를 눌렀을때 호출되는 함수
	function deleteComment(num){
		var isDelete=confirm("확인을 누르면 댓글이 삭제 됩니다.");
		if(isDelete){
			$.ajax({
				url:"comment_delete.do",
				method:"post",
				data:{"num":num},
				success:function(responseData){
					if(responseData.isSuccess){
						var sel="#comment"+num;
						$(sel).text("삭제된 댓글 입니다.");
					}
				}
			});
		}
	}
	
	//폼에 submit 이벤트가 일어 났을때 실행할 함수 등록 
/* 	$(".comments form").on("submit", function(){
		//로그인 여부
		 var isLogin=${not empty id};
		if(isLogin==false){
			alert("로그인 페이지로 이동 합니다.");
			location.href="${pageContext.request.contextPath}/users/loginform.do?url=${pageContext.request.contextPath}/cafe/detail.do?num=${dto.num}"; 
			return true;//폼 전송 막기 
		}
	});  */

	//답글 달기 링크를 클릭했을때 실행할 함수 등록
	$(".comment .reply_link").click(function(){
		$(this)
		.parent().parent().parent()
		.find(".comment-insert-form")
		.slideToggle(200);
		
		if($(this).text()=="답글"){
			$(this).text("취소");
		}else{
			$(this).text("답글");
		}
	});

	function deleteConfirm(num){
		var isDelete=confirm(num+" 번 글을 삭제 하시겠습니까?");
		if(isDelete){
			location.href="delete.do?num="+num;
		}
	}
</script>
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
