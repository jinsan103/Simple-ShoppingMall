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
<title>Pants</title>
<base href="<%=basePath %>">
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
	
	form{ margin:0 auto; width:400px;}
</style>
</head>
<body>
<% String id = (String) session.getAttribute("id");%>
<p style="text-align: center;">
<a href="LoginMain.jsp"><img alt="Main Logo" src="image\main.jpg" width="200" height="100" /></a>
</p>
	<ul>
      <li><a href="LoginShirts.jsp">Shirts</a></li>
      <li><a href="LoginPants.jsp">Pants</a></li>
      <li><a href="LoginIntro.jsp">About</a></li>
      <li><a href="LoginQnA.jsp">Contact</a></li>
   </ul>
   
   <div style="float:left; text-align: left;" id="login"></div>
    <div style="float:right;"><a href="Cart.jsp" style="text-align: right;">장바구니</a></div>
   <script>
	var id = "<%=id%>";
	document.getElementById("login").innerHTML = id + "님 환영합니다!";
	
	var pro_data = firebase.database().ref('user_cart');
	
	var data = new Array();
    pro_data.on('value', function(snapshot) {
      data.splice(0, data.length);
      snapshot.forEach(function(childSnapshot) {
        var childData = childSnapshot.val();
        data.push(childData.user_id);
      });
    });
    
	function addCart(){
		var user_id = id;
		var proid = "adidasP1";
		var info = "기숙사 및 집, 정석학술도서관에서 입고 다니기 좋은 트랙팬츠. 색상도 검은색이라 한달 내내 입고 다니더라도 시각적으로 티가 나진 않는다. 단, 냄새는 책임지지 않음";
	    var name = "아디다스 트랙팬츠";
	    
	    var cart_data = firebase.database().ref('user_cart/'+id);
	    
	        cart_data.set({
	          user_id: id,
	          pro_id: proid,
	          pro_info: info,
	          pro_name: name,
	    });
	    alert("카트에 추가완료되었습니다");
	}
</script>
   <br><hr><br>


<table>
	<tr>
		<td>이미지</td>
		<td>상품명</td>
	</tr>
	<tr>
		<td><img src="image\pants.jpg"/></td>
		<td>아디다스 트랙팬츠</td>
	</tr>
	<tr>
		<td>정석 학술도서관의 상징이자 교복. 일주일동안 입어도 세탁을 한지 안한지 티가 안난다</td>
		<td><input type="button" value="장바구니에 추가하기" onclick="addCart()"></td>
	</tr>
</table>
  <footer>
		<small>고객센터 : Tel. 032 - 8282 - 8282</small>
	</footer>
	<br><hr><br>
</body>
</html>