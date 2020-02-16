<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:out value="Hello World" /><br>
<c:out value="${null}">JSTL</c:out><br>
<c:out value="Hello">World</c:out><br>
<c:out value="${null}" />
<p></p>
<%--<c:set> 기본 사용 방법--%>
<c:set var="username1" value="김연아" />
<c:set var="username2">박지성</c:set>
${username1}<br>
${username2}<br>
${pageScope.username1}<br>
${pageScope.username2}<br>
<p></p>

<%--보관소 지정(ServletRequest)--%>
<c:set var="username3" scope="request">마일리 사이러스</c:set>
${pageScope.username3}<br>
${requestScope.username3}<br>
<p></p>

<%--기존 값 덮어씀--%>
<% pageContext.setAttribute("username4", "마고 로비"); %>
기존 username4 : ${username4}<br>
<c:set var="username4" value="레오나르도 디카프리오" />
변경 username4 : ${username4}<br>
<p></p>

<%!
    public static class MyMember {
        int no;
        String name;

        public int getNo() {
            return no;
        }

        public void setNo(int no) {
            this.no = no;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }
    }
%>
<%
    MyMember member = new MyMember();
    member.setNo(100);
    member.setName("김연아");
    pageContext.setAttribute("member", member);
%>
${member.name}<br>
<c:set target="${member}" property="name" value="박지성" />
${member.name}<br>
<p></p>
<% pageContext.setAttribute("username1", "봉준호"); %>
username1 : ${username1}<br>
<c:remove var="username1" />
username1 : ${username1}<br>
<p></p>
<c:if test="${10 > 20}" var="result1">
    10은 20보다 크다.<br>
</c:if>
result1 : ${result1}<br>

<c:if test="${10 < 20}" var="result2">
    20은 10보다 크다.<br>
</c:if>
result2 : ${result2}
<p></p>
<c:set var="userid" value="hello123" />
<c:choose>
    <c:when test="${userid == 'admin'}">
        관리자 페이지
    </c:when>
    <c:otherwise>
        ${userid}님 반갑습니다.
    </c:otherwise>
</c:choose>
<p></p>
<% pageContext.setAttribute("numList", new String[]{"1", "2", "3", "4", "5"}); %>
<ul>
    <c:forEach var="num" items="${numList}" begin="1" end="3">
        <li>${num}</li>
    </c:forEach>
</ul>
<p></p>
<%
    List<String> fruits = new ArrayList<>();
    fruits.add("apple");
    fruits.add("banana");
    fruits.add("pineapple");
    fruits.add("kiwi");
    fruits.add("melon");
    pageContext.setAttribute("fruits", fruits);
%>
<ul>
    <c:forEach var="fruit" items="${fruits}">
        <li>${fruit}</li>
    </c:forEach>
</ul>
<p></p>
<% pageContext.setAttribute("maleActors", "리버 피닉스, 장동윤, 차인표, 남궁민, 공유"); %>
<ul>
    <c:forEach var="name" items="${maleActors}">
        <li>${name}</li>
    </c:forEach>
</ul>
<p></p>
<ul>
    <c:forEach var="no" begin="1" end="10">
        <li>forEach 예제 ${no}</li>
    </c:forEach>
</ul>
<p></p>
<% pageContext.setAttribute("tokens", "v1=20&v2=20&op=+"); %>
<ul>
    <c:forTokens var="item" items="${tokens}" delims="&">
        <li>${item}</li>
    </c:forTokens>
</ul>
<p></p>
<c:url var="calcUrl" value="http://localhost:8080/calc">
    <c:param name="v1" value="10" />
    <c:param name="v2" value="20" />
    <c:param name="op" value="+" />
</c:url>
${calcUrl}
<p></p>
<c:import var="lottoResult" url="https://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=800" />
<textarea rows="10" cols="80">
    ${lottoResult}
</textarea>
<p></p>
<%--<c:redirect url="https://google.com" />--%>
<p></p>
<fmt:parseDate var="date1" value="2020-02-15" pattern="yyyy-MM-dd" />
<fmt:formatDate value="${date1}" pattern="MM/dd/yy" />
</body>
</html>