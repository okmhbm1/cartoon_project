<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css">

</head>
<style type="text/css">
#header {
	position: relative;
	top: 0px;
	width: 100%;
	height: 150px;
}

#image, #advertisement {
	position: absolute;
	display: inline-block;
	top: 0px;
	width: 100%;
	height: 100%;
}

image {
	width: 100%;
	height: 100%;
}

#image {
	position: relative;
	height: 150px;
	width: 340px;
	display: inline-block;
}

#searchbar {
	top: 70px;
	width: 270px;
}

#advertisement {
	height: 150px;
	width: 380px;
	display: inline-block;
}

.nav-container {
	display: block;
	top: 120px;
	width: 100%;
	height: 50px;
	border: 1px solid white;
	padding: 0px;
}

.body {
	padding: 0;
	margin: 0;
	width: 100%;
	border: 10px solid #ffffff;
	height: 400px;
}

.row {
	width: 100%;
}

.section {
	position: relative;
	top: 30px;
	float: right;
	width: 20%;
	height: 100%;
	border: 1px solid white;
}

.col-xs-2 {
	display: block;
	width: 142px;
	border: 1px solid #B7B5B5;
}

.left {
	float: left;
	width: 80%;
	height: 100%;
	border: 1px solid white;
}

.image {
	width: 100%;
	height: 100%;
}

.advertisement {
	display: inline-block;
	width: 100%;
	height: 100%;
}

.box {
	width: 50%;
	height: 30%;
}

.no-border {
	border-right: none border-left:none border-top:none border-bottom:none
		border: none;
}

.left {
	float: left;
}

.right {
	float: right;
}

.navbar {
	padding-left: 190px;
}

/* borderless table */
.table.table-borderless td, .table.table-borderless th {
	border: 0 !important;
}

.table.table-borderless {
	margin-bottom: 0px;
}

.col-xs-12 {
	position: relative;
}

.image-full {
	width: 100%;
	height: 200px;
}

.display-none {
	
}

@media ( max-width : 750px) {
	.display-none {
		display: none;
	}
}

.match_parent {
	width: 100%;
	margin-top: 8px;
	height: 110px;
}

.up_flag_badge0, .up_flag_badge1, .up_flag_badge2, .up_flag_badge3,
	.up_flag_badge4, .up_flag_badge5, .up_flag_badge6 {
	position: absolute;
	top: 12px;
	display: inline-block;
	width: 16px;
	height: 19px;
	line-height: 15px;
	background: #f54a3d;
	color: #fff;
	font-weight: bold;
	font-size: 13px;
	margin-left: 30px;
	display: none;
}

.weekly_up_badge0, .weekly_up_badge1, .weekly_up_badge2,
	.weekly_up_badge3, .weekly_up_badge4, .weekly_up_badge5,
	.weekly_up_badge6 {
	position: static;
	text-align: center;
	top: -30px;
	height: 23px;
	line-height: 25px;
	background: #f54a3d;
	color: #fff;
	font-weight: bold;
	font-size: 16px;
	width: 100%;
	display: none;
}

.texttext {
	position: relative;
	text-align: left;
	display: block;
	top: 3px;
	font-weight: bold;
	font-size: 14px;
	font-color: #060606;
}

#weekmain {
	text-align: center;
	border-bottom: 1px solid #B7B5B5;
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
			<div class="row">
				<div class="col-xs-4">
					<br /> 
				<h3>요일별 웹툰보기 </h3>
				<hr style="border:1px solid black;"></hr>
				</div>
				<div class="col-xs-3"></div>
				<div class="col-xs-4">
					<br /> <br />
					<div style="float: right;">
						<div class="checkbox1">


							<label> <input type="checkbox" id="naver" name="site"
								value="${param.naver}"
								<c:if test="${param.naver  eq 'true'}" > checked </c:if>>
								네이버
							</label> <label> <input type="checkbox" id="toomics" name="site"
								value="${param.toomics}"
								<c:if test="${param.toomics eq 'true'}" > checked </c:if>>
								투믹스
							</label>


						</div>

						<div class="checkbox2">

							<label> <input type="radio" name="filter2" value="days"
								checked> 요일별
							</label> <label> <input type="radio" name="filter2" id="category"
								value="category"> 장르
							</label> <label> <input type="radio" name="filter2"
								id="recommend" value="recommend"> 추천
							</label> 
							<label> <input type="radio" name="filter2" id="gender"
								value="gender"> 성별
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

					</div>
					<!--div묶은거-->
				</div>
			</div>







			<div class="row">
				<div class="col-xs-2">
					<div id="weekmain">
						<h4>월요일</h4>
						<span class="up_flag_badge1" id="up_flag_badge1">N</span>
					</div>
					<c:forEach items="${list }" var="tmp">
						<c:if test="${tmp.days eq 'mon' or tmp.days eq '월'}">
							<div>
								<a href="detail.do?num=${tmp.num}"> <img
									class="match_parent" src="${tmp.image_url}" /><span
									class="weekly_up_badge1">업데이트</span></a>
							</div>
							<div class="texttext">
								<a href="detail.do?num=${tmp.num}">${tmp.title}</a>
							</div>
						</c:if>
					</c:forEach>
				</div>


				<div class="col-xs-2">
					<div id="weekmain">
						<h4>화요일</h4>
						<span class="up_flag_badge2" id="up_flag_badge2">N</span>
					</div>
					<c:forEach items="${list }" var="tmp">
						<c:if test="${tmp.days eq 'tue' or tmp.days eq '화' }">
							<div>
								<a href="detail.do?num=${tmp.num}"><img class="match_parent"
									src="${tmp.image_url}" /><span class="weekly_up_badge2">업데이트</span></a>
							</div>


							<div class="texttext">
								<a href="detail.do?num=${tmp.num}">${tmp.title}</a>
							</div>
							<div style="display: none">${tmp.days }</div>
						</c:if>
					</c:forEach>
				</div>


				<div class="col-xs-2">
					<div id="weekmain">
						<h4>수요일</h4>
						<span class="up_flag_badge3" id="up_flag_badge3">N</span>
					</div>
					<c:forEach items="${list }" var="tmp">
						<c:if test="${tmp.days eq 'wed' or tmp.days eq '수' }">
							<div>
								<a href="detail.do?num=${tmp.num}"><img class="match_parent"
									src="${tmp.image_url}" /><span class="weekly_up_badge3">업데이트</span></a>
							</div>
							<div class="texttext">
								<a href="detail.do?num=${tmp.num}">${tmp.title}</a>
							</div>
							<div style="display: none">${tmp.days }</div>
						</c:if>
					</c:forEach>
				</div>

				<div class="col-xs-2">
					<div id="weekmain">
						<h4>목요일</h4>
						<span class="up_flag_badge4" id="up_flag_badge4">N</span>
					</div>
					<c:forEach items="${list }" var="tmp">
						<c:if test="${tmp.days eq 'thu' or tmp.days eq '목' }">
							<div>
								<a href="detail.do?num=${tmp.num}"><img class="match_parent"
									src="${tmp.image_url}" /><span class="weekly_up_badge4">업데이트</span></a>
							</div>
							<div class="texttext">
								<a href="detail.do?num=${tmp.num}">${tmp.title}</a>
							</div>
							<div style="display: none">${tmp.days }</div>
						</c:if>
					</c:forEach>
				</div>

				<div class="col-xs-2">
					<div id="weekmain">
						<h4>금요일</h4>
						<span class="up_flag_badge5" id="up_flag_badge5">N</span>
					</div>
					<c:forEach items="${list }" var="tmp">
						<c:if test="${tmp.days eq 'fri' or tmp.days eq '금'}">
							<div>
								<a href="detail.do?num=${tmp.num}"><img class="match_parent"
									src="${tmp.image_url}" /><span class="weekly_up_badge5">업데이트</span></a>
							</div>
							<div class="texttext">
								<a href="detail.do?num=${tmp.num}">${tmp.title}</a>
							</div>
							<div style="display: none">${tmp.days }</div>
						</c:if>
					</c:forEach>
				</div>

				<div class="col-xs-2">
					<div id="weekmain">
						<h4>토요일</h4>
						<span class="up_flag_badge6" id="up_flag_badge6">N</span>
					</div>
					<c:forEach items="${list }" var="tmp">
						<c:if test="${tmp.days eq 'sat' or tmp.days eq '토'}">
							<div>
								<a href="detail.do?num=${tmp.num}"><img class="match_parent"
									src="${tmp.image_url}" /><span class="weekly_up_badge6">업데이트</span></a>
							</div>
							<div class="texttext">
								<a href="detail.do?num=${tmp.num}">${tmp.title}</a>
							</div>
							<div style="display: none">${tmp.days }</div>
						</c:if>
					</c:forEach>
				</div>

				<div class="col-xs-2">
					<div id="weekmain">
						<h4>일요일</h4>
						<span class="up_flag_badge0" id="up_flag_badge0">N</span>
					</div>
					<c:forEach items="${list }" var="tmp">
						<c:if test="${tmp.days eq 'sun' or tmp.days eq '일'}">
							<div>
								<a href="detail.do?num=${tmp.num}"><img class="match_parent"
									src="${tmp.image_url}" /><span class="weekly_up_badge0">업데이트</span></a>
							</div>
							<div class="texttext">
								<a href="detail.do?num=${tmp.num}">${tmp.title}</a>
							</div>
							<div style="display: none">${tmp.days }</div>
						</c:if>
					</c:forEach>
				</div>


			</div>
			<!--row-->




		</div>
		<!--body 끝-->
	</div>
	<!--container-->






	<!-- jquery 로딩하기-->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
	<!-- bootstrap 로딩하기, jquery plugin, jquery 먼저 로딩해야 함-->
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script>
		$(document).ready(function() {
			var date = new Date();
			var week = date.getDay();

			if (week == 0) {
				$("#up_flag_badge0").show();
				$(".weekly_up_badge0").each(function() {
					$(".weekly_up_badge0").css("display", "block");
				});
			}
			if (week == 1) {
				$("#up_flag_badge1").show();
				$(".weekly_up_badge1").each(function() {
					$(".weekly_up_badge1").css("display", "block");
				});
			}
			if (week == 2) {
				$("#up_flag_badge2").show();
				$(".weekly_up_badge2").each(function() {
					$(".weekly_up_badge2").css("display", "block");
				});
			}
			if (week == 3) {
				$("#up_flag_badge3").show();
				$(".weekly_up_badge3").each(function() {
					$(".weekly_up_badge3").css("display", "block");
				});
			}
			if (week == 4) {
				$("#up_flag_badge4").show();
				$(".weekly_up_badge4").each(function() {
					$(".weekly_up_badge4").css("display", "block");
				});
			}
			if (week == 5) {
				$("#up_flag_badge5").show();
				$(".weekly_up_badge5").each(function() {
					$(".weekly_up_badge5").css("display", "block");
				});
			}
			if (week == 6) {
				$("#up_flag_badge6").show();
				$(".weekly_up_badge6").each(function() {
					$(".weekly_up_badge6").css("display", "block");
				});
			}
		});
	</script>

	<script>
		$(document).ready(function() {

			$('#category').on('click', function() {
				// getter
				var radioVal = $('input[name="filter2"]:checked').val();
				if (radioVal == 'category') {
					//alert("카테고리로 정렬");
					location.href = "list_sort_by_category.do";
				}
				alert(radioVal);
			});

			$('#recommend').on('click', function() {
				// getter
				var radioVal = $('input[name="filter2"]:checked').val();
				if (radioVal == 'recommend') {
					//alert("카테고리로 정렬");
					location.href = "list_sort_by_recommend.do";
				}
				alert(radioVal);
			});

			$('#gender').on('click', function() {
				// getter
				var radioVal = $('input[name="filter2"]:checked').val();
				if (radioVal == 'gender') {
					//alert("카테고리로 정렬");
					location.href = "list_sort_by_gender.do";
				}
				alert(radioVal);
			});

		});
	</script>
	<script>
		var query = "?";

		$(document).ready(
				function() {

					$("#category").on('click', function() {
						location.href = "list_sort_by_category.do";
					});

					$("#naver").on(
							"click",
							function() {

								if ($("input:checkbox[id='naver']").is(
										":checked") == true) {

									if (!query.includes("naver"))
										query += "naver=true&";

									if ($("input:checkbox[id='toomics']").is(
											":checked") == true) {
										if (!query.includes("toomics"))
											query += "toomics=true&";

									}
									alert("쿼리" + query);

									location.href = "list.do" + query;
								} else {
									if (query.includes("naver")) {
										query.replace("naver=true", "");

									}

									if ($("input:checkbox[id='toomics']").is(
											":checked") == true) {
										if (!query.includes("toomics"))
											query += "toomics=true&";

									}

									alert("false");
									alert(query)
									location.href = "list.do" + query;
								}

							});
					$("#toomics").on(
							"click",
							function() {
								if ($("input:checkbox[id='toomics']").is(
										":checked") == true) {
									if (!query.includes("toomics"))
										query += "toomics=true&";

									if ($("input:checkbox[id='naver']").is(
											":checked") == true) {
										if (!query.includes("naver"))
											query += "naver=true&";

									}

									alert("쿼리" + query);
									location.href = "list.do" + query;
								} else {

									if ($("input:checkbox[id='naver']").is(
											":checked") == true) {
										if (!query.includes("naver"))
											query += "naver=true&";

									}
									if (query.includes("toomics"))
										query.replace("toomics=true", "");
									alert('false');
									location.href = "list.do" + query;
								}

							});

				});
	</script>

</body>
</html>