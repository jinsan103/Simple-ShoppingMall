<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome To Shopping Mall</title>
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
	
</style>
</head>

<body>
<p style="text-align: center;">
<a href="Main.jsp"><img alt="Main Logo" src="image/main.jpg" width="200" height="100" /></a>
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

<table id="productable" border=1><!-- 전체 상품 테이블을 보여줌 -->
<tr>
	<td>사진</td>
	<td>이름</td>
	<td>제품설명</td>
</tr>
</table>
<script>
allUserdata();

function allUserdata(){
	var pro_data = firebase.database().ref('product');
	pro_data.once('value', function(snapshot) {
	    snapshot.forEach(function(childSnapshot) {
	      var tmp = childSnapshot.val();
	      allUserProfile(tmp.pro_id);
	    });
	  });
}
function allUserProfile(id){
	table = document.getElementById("productable");
	var pro_data = firebase.database().ref('product/'+id);
	pro_data.once('value', function(snapshot) {
	      var tmp = snapshot.val();
	      
	      new_tr = document.createElement("tr");
	      
	      td_img = document.createElement("td");
	      td_img.innerHTML = tmp.image;
	      new_tr.appendChild(td_img);
	      
	      td_name = document.createElement("td");
	      td_name.innerHTML = tmp.pro_name;
	      new_tr.appendChild(td_name);
	      
	      td_info = document.createElement("td");
	      td_info.innerHTML = tmp.pro_info;
	      new_tr.appendChild(td_info);
	      
	      table.appendChild(new_tr);
	  });
}

function goCart(){//로그인하지 않을 시 장바구니에 접근하지 못하게 함
	alert("로그인하세요!");
}
</script>

<br><hr><br>
	<footer>
		<small>고객센터 : Tel. 032 - 8282 - 8282</small>
	</footer>
</body>
</html>