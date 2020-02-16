<%@ page import="com.atoz_develop.spms.vo.Student" %>
<%@ page import="java.util.*" %><%--
  Created by IntelliJ IDEA.
  User: Yoon
  Date: 2020-02-13
  Time: 오전 9:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>EL</title>
</head>
<body>
문자열 : ${"test"}<br>
문자열 : ${'test'}<br>
정수 : ${20}<br>
부동소수점 : ${3.14}<br>
Boolean : ${true}<br>
null : ${null}<br>
<p></p>
<%
    pageContext.setAttribute("scores", new int[]{90, 80, 70, 100});
%>
${scores[2]}
<p></p>
<%
    List<String> list = new LinkedList<>();
    list.add("가나");
    list.add("다라");
    list.add("마바");

    pageContext.setAttribute("list", list);
%>
${list[1]}
<p></p>
<%
    Map<String, String> map = new HashMap<>();
    map.put("1", "a");
    map.put("2", "b");
    map.put("3", "c");
    pageContext.setAttribute("map", map);
%>
${map["1"]}
<p></p>
<%
    pageContext.setAttribute("student",
            new Student()
                    .setStudentNo("202012121")
                    .setStudentName("홍길동")
    );
%>
${student.studentNo} - ${student.studentName}
<p></p>
<%
    pageContext.setAttribute("myRB", ResourceBundle.getBundle("MyResourceBundle"));
%>
${myRB.OK}
<p></p>
<%
    pageContext.setAttribute("title", "EL 연산자");
%>
${empty title}<br>
${empty title2}
<p></p>
${10 > 20 ? "크다" : "작다"}
<p></p>
<%
    pageContext.setAttribute("ne", "EL 예약 키워드를 Key로 사용");
%>
<%--${ne}--%>
</body>
</html>
