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
<title>Introduce</title>
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
	<br><hr><br>
	<h1>QnA 자주 묻는 질문 모음</h1>
	<details>
		<summary>Q. 주문은 어떻게 하나요?</summary>
		<p>주문은 '회원가입'을 통해 로그인을 한 후 각 섹션 페이지에 가면 가능합니다!</p>
	</details>
	<details>
		<summary>Q. 회원탈퇴는 어떻게 하나요?</summary>
		<p>홈페이지 하단의 번호로 연락을 주셔야지 회원탈퇴가 가능합니다!</p>
	</details><br><hr><br>
	<script>
	var id = "<%=id%>";
	document.getElementById("login").innerHTML = id + "님 환영합니다!";
</script>
	<footer>
		<small>고객센터 : Tel. 032 - 8282 - 8282</small>
	</footer>
</body>
</html>