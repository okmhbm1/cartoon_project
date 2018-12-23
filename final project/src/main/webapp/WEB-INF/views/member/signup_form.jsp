<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html ng-app="myApp">
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
</style>
<body ng-controller="myCtrl">
   

  <jsp:include page="/WEB-INF/views/top.jsp" flush="false" />


   
   <!-- 바디 -->
   <div class="container">
   <div class="body">
	<h3>회원가입 </h3>
	<!-- novalidate 는 웹브라우저의 기본 validate 를 막는다 -->
	<form action="signup.do" method="post" name="f" id="signupForm" novalidate>

		<div class="form-group has-feedback"
			ng-class="{'has-success': canUseId ,'has-error': !canUseId && f.userid.$dirty}">
			<label class="control-label" for="userid">아이디</label>
			<input class="form-control" type="text" name="userid" id="userid"
				ng-model="userid" ng-blur="idCheck()" ng-pattern="/^[a-zA-Z0-9]{5,12}$/" ng-required="true"/>
			<span ng-show="f.userid.$valid && canUseId" class="glyphicon glyphicon-ok form-control-feedback"></span>
			<span ng-show="(f.userid.$invalid || !canUseId) && f.id.$dirty" class="glyphicon glyphicon-remove form-control-feedback"></span>
			<p ng-show="f.userid.$error.required && f.userid.$dirty" class="help-block">반드시 입력해야 합니다.</p>
			<p ng-show="!canUseId && f.userid.$dirty" class="help-block">이미 등록된 아이디 입니다.</p>
			<p ng-show="f.userid.$invalid && f.userid.$dirty" class="help-block">특수문자 제외 5자 이상 12자 내로 입력하세요.</p>
		</div>
		
		<div class="form-group has-feedback"
			ng-class="{'has-success':f.pwd.$valid,'has-error':f.pwd.$invalid && f.pwd.$dirty}">
			<label class="control-label" for="pwd">비밀번호</label>
			<input ng-keyup="isPwdEqual()" ng-required="true" ng-model="pwd" ng-pattern="/^[a-zA-Z0-9]{5,10}$/" class="form-control" type="password" name="pwd" id="pwd"/>
			<span ng-show="f.pwd.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
			<span ng-show="f.pwd.$invalid && f.pwd.$dirty" class="glyphicon glyphicon-remove form-control-feedback"></span>
			<p ng-show="f.pwd.$invalid && f.pwd.$dirty" class="help-block">특수문자 제외 5자 이상 10자 내로 입력하세요.</p>
			<p ng-show="!pwdEqual && f.pwd.$dirty" class="help-block">비밀번호를 아래와 같게 입력하세요.</p>
		</div>
		<div class="form-group">
			<label for="pwd2">비밀번호 확인</label>
			<input ng-keyup="isPwdEqual()" class="form-control" type="password" id="pwd2" name="pwd2" ng-model="pwd2"/>
		</div>
		
		<div class="form-group has-feedback" 
			ng-class="{'has-success':f.email.$valid,'has-error':f.email.$invalid && f.email.$dirty}">
			<label class="control-label" for="email">이메일</label>
			<input ng-model="email" ng-required="true" ng-pattern="/@/" class="form-control" type="text" name="email" id="email" />
			<span ng-show="f.email.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
			<span ng-show="f.email.$invalid && f.email.$dirty" class="glyphicon glyphicon-remove form-control-feedback"></span>
			<p ng-show="f.email.$invalid && f.email.$dirty" class="help-block">이메일 형식에 맞게 입력하세요.</p>
		</div>
		
		<div class="form-group has-feedback"
		ng-class="{'has-success':f.name.$valid,'has-error':f.name.$invalid && f.name.$dirty}">
		<label class="control-label" for="name">이름</label>
		<input ng-model="name" ng-required="true" ng-pattern="/^[가-힣]{2,4}$/" class="form-control" type="text" name="name" id="name" />
		<p ng-show="f.name.$invalid && f.name.$dirty" class="help-block">이름을 알맞게 입력하세요(2글자~4글자)</p>
		</div>
		
		
		<div class="checkbox" >
               <label>
                <input  type="checkbox" id="gender" name="gender" value="man" onclick="doOpenCheck(this);"/>
               	 남	
              </label>
               <label>
                <input  type="checkbox" id="gender" name="gender" value="woman"onclick="doOpenCheck(this);"/>
                      여
              </label>
         </div>
         
		<div class="checkbox" >
               <label>
                <input  type="checkbox" id="age" name="age" value="10" onclick="doOpenCheck(this);"/>
               	 10대	
              </label>
               <label>
                <input  type="checkbox" id="age" name="age" value="20"onclick="doOpenCheck(this);"/>
                 20대
              </label>
              <label>
                <input  type="checkbox" id="age" name="age" value="30"onclick="doOpenCheck(this);"/>
                 30대
              </label>
         </div>
		<button ng-disabled="f.$invalid || !canUseId || !pwdEqual" class="btn btn-default" type="submit">가입</button>
		<button class="btn btn-default" type="reset">취소</button>
	</form>
   </div><!-- body닫기 -->


	</div><!-- 총 container 닫기 -->

 


<!-- jquery 로딩하기-->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<!-- bootstrap 로딩하기, jquery plugin, jquery 먼저 로딩해야 함-->
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/angular.min.js"></script>
<script>
	// "myApp" 이라는 이름의 모듈 만들기 
	angular.module("myApp", [])
	.controller("myCtrl", function($scope, $http){//"myCtrl" 이라는 이름의 컨트롤러 만들기
		//id 사용 가능여부를 관리할 모델
		$scope.canUseId=false;
		//두개의 비밀번호 일치여부를 관리할 모델
		$scope.pwdEqual=false;
		//비밀번호 입력란에 입력할때 마다 호출되는 함수 
		$scope.isPwdEqual=function(){
			//비밀번호가 일치하는지여부를 pwdEqual 에 대입한다. 
			$scope.pwdEqual = $scope.pwd == $scope.pwd2;
		};
	
		//id 입력란이 포커스를 잃었을때 호출되는 함수
		$scope.idCheck=function(){
			//입력한 아이디를 ajax 요청을 통해서 서버에 보내기 
			$http({
				url:"checkid.do",
				method:"get",
				params:{inputId:$scope.userid}
			})
			.success(function(responseData){
				//responseData 는 {canUse:true} or {canUse:false}
				$scope.canUseId=responseData.canUse;
				alert($scope.canUseId);
			});
		};
	});
	
	function doOpenCheck(chk){
	    var obj = document.getElementsByName("gender");
	    for(var i=0; i<obj.length; i++){
	        if(obj[i] != chk){
	            obj[i].checked = false;
	        }
	    }
	}

	function doOpenCheck(chk){
	    var obj = document.getElementsByName("age");
	    for(var i=0; i<obj.length; i++){
	        if(obj[i] != chk){
	            obj[i].checked = false;
	        }
	    }
	}
</script>
</body>
</html>