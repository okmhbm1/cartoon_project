<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8"> 
   <title>insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<script src="${pageContext.request.contextPath }/SmartEditor/js/HuskyEZCreator.js"></script>
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
				<h3>글작성</h3> 
				<hr style="border:1px solid black;"></hr>
	<form action="insert.do" method="post">
	<table class="table">
	<tr>
		<th>작성자</th>
		<td>
		<input type="hidden" name="writer" value="${userid}" />
		<input type="text" id="writer" value="${userid}" disabled/>
		</td>
	</tr>
	<tr>
	<th>제목</th>
			<td><input size="97" type="text" name="title" id="title" width="120"/></td>
	</tr>
	<tr>
</table>
		<label for="content">내용</label>
		<textarea name="content" id="content" style="width:100%;height:400px;display:none;"></textarea>
		<div>
			<input type="button" onclick="submitContents(this);" value="확인" class="btn btn-default" />
			<button type="reset" class="btn btn-default">취소</button>
		</div>	
</form>
   		</div> <!-- container left-->


   <!-- 로그인 -->
   <div class="section right">
   <div class="loginmargin">
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
   </div>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
 <jsp:include page="/WEB-INF/views/rank.jsp" flush="false" />
<script>
	var oEditors = [];

	//추가 글꼴 목록
	//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "content",
		sSkinURI: "${pageContext.request.contextPath}/SmartEditor/SmartEditor2Skin.html",	
		htParams : {
			bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
			fOnBeforeUnload : function(){
				//alert("완료!");
			}
		}, //boolean
		fOnAppLoad : function(){
			//예제 코드
			//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		},
		fCreator: "createSEditor2"
	});

	function pasteHTML() {
		var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
		oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
	}

	function showHTML() {
		var sHTML = oEditors.getById["content"].getIR();
		alert(sHTML);
	}
		
	function submitContents(elClickedObj) {
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
		
		// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
		
		try {
			elClickedObj.form.submit();
		} catch(e) {}
	}

	function setDefaultFont() {
		var sDefaultFont = '궁서';
		var nFontSize = 24;
		oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
	}
</script>
<!-- jquery 로딩하기-->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<!-- bootstrap 로딩하기, jquery plugin, jquery 먼저 로딩해야 함-->
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

</body>
</html>