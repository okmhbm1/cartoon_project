<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
     <!--주간top10 순위-->
     <div class="juganmargin" style="color:black; text-align:left;">
    <span style="font-weight:bold; font-size:18px;">주간랭킹TOP10</span>
     <hr style="border:1px solid black;"></hr>
        <%int num10=1; %>
<c:forEach items="${recommendoneweeklist }" var="tmp">
                  <div style="margin-bottom:5px; font-size:15px;"><a href="${pageContext.request.contextPath}/cartoon/detail.do?num=${tmp.num}"><%=num10 %>.&nbsp ${tmp.title}</a></div>
               <%num10++; %>
          </c:forEach>
          <hr style="border:1px solid black;"></hr>
       </div>
   	</div> <!-- section--> 
   </div><!-- body닫기 -->