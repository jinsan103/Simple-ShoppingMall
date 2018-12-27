<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Introduce</title><!-- 앞에 로그인이 붙은 페이지는 로그인한 후 들어가는 페이지 -->
<base href="<%=basePath %>">
<style>
	ul { 	list-style:none; 
		text-align:center; 
        		border-top:1px solid red; border-bottom:1px solid red; padding:10px 0; 

	}
	ul li { 	display:inline; 
		text-transform:uppercase; 
            	padding:0 10px; letter-spacing:10px; 

	}
	ul li a { text-decoration:none; color:black; }
	ul li a:hover { text-decoration:underline; }
	
</style>
</head>

<body>
<% String id = (String) session.getAttribute("id");%>
<p style="text-align: center;">
<a href="Main.jsp"><img alt="Main Logo" src="image\main.jpg" width="200" height="100"/></a>
</p>
	<ul>
      <li><a href="LoginShirts.jsp">Shirts</a></li>
      <li><a href="LoginPants.jsp">Pants</a></li>
      <li><a href="LoginIntro.jsp">About</a></li>
      <li><a href="LoginQnA.jsp">Contact</a></li>
   </ul>
   
   <div style="float:left; text-align: left;" id="login"></div>
   <div style="float:right;"><a href="Cart.jsp" style="text-align: right;">장바구니</a></div>
	<br>
	<hr>
	<br>
	<h1>모두가 인정할 수 밖에 없는 글로벌 의류 회사</h1>
	<img src="image\film.jpg" alt="building" width="500" height="300"/>
	<p>저희 인정 회사는 2018년 12월 01일에 설립한 신생 회사로서 의류 사업에 종사하는 이들이라면 누구든지 인정할 수 있는 품질을 위해 노력합니다.
	</p><br><hr><br>
	<script>
	var id = "<%=id%>";
	document.getElementById("login").innerHTML = id + "님 환영합니다!";
</script>
	<footer>
		<small>고객센터 : Tel. 032 - 8282 - 8282</small>
	</footer>
</body>
</html>