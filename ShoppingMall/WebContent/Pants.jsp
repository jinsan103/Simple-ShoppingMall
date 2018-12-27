<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pants</title>
<script src="https://www.gstatic.com/firebasejs/5.5.9/firebase.js"></script>
<script>
  // Initialize Firebase
  var config = {
    apiKey: "AIzaSyD_1uQo20G5epXwJnsz6WwGEUTBO0o5VLQ",
    authDomain: "shoppingmall-318b0.firebaseapp.com",
    databaseURL: "https://shoppingmall-318b0.firebaseio.com",
    projectId: "shoppingmall-318b0",
    storageBucket: "shoppingmall-318b0.appspot.com",
    messagingSenderId: "911521990819"
  };
  firebase.initializeApp(config);
  
  function goCart(){
		alert("로그인하세요!");
	}
</script>
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
<p style="text-align: center;">
<a href="Main.jsp"><img alt="Main Logo" src="image\main.jpg" width="200" height="100"/></a>
</p>
	<ul>
     <li><a href="Shirts.jsp">Shirts</a></li>
      <li><a href="Pants.jsp">Pants</a></li>
      <li><a href="Introduce.jsp">About</a></li>
      <li><a href="QnA.jsp">Contact</a></li>
   </ul>
   
   <div style="float:left;"><a href="Login.jsp" style="text-align: left;">로그인/회원가입</a></div>
    <div style="float:right;"><a href="javascript:void(0);" onclick="goCart()" style="text-align: right;">장바구니</a></div>
<br><hr><br>
<form>
	<table border="1">
      <tr>
        <td>
          <img src="image\pants.jpg" alt="pants"/>
        </td>
        <td>
         기숙사 및 집, 정석학술도서관에서 입고 다니기 좋은 트랙팬츠. 색상도 검은색이라 한달 내내 입고 다니더라도 시각적으로 티가 나진 않는다. 단, 냄새는 책임지지 않음
        </td>
      </tr>
    </table>
    </form>
    <br><hr><br>
    <footer>
		<small>고객센터 : Tel. 032 - 8282 - 8282</small>
	</footer>
	</body>
</html>