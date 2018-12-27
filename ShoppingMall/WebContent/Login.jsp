<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login / Signin</title><!-- 로그인 페이지 -->
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
<body>
<script>

    var user_data = firebase.database().ref('user_data');
	var admin = firebase.database().ref('admin');
    function gosignup() {
        location.href="Signin.jsp";
    }

    function mylogin() {
      var id = document.getElementById("id").value;
      var pwd = document.getElementById("pwd").value;
	  var form = document.getElementById("login");
      var mycheck = 0;
      user_data.once('value', function(snapshot) {
        snapshot.forEach(function(childSnapshot) {
          var tmp = childSnapshot.val();
          if(tmp.user_id==id){
            if(tmp.user_pwd==pwd){
              alert(id+"님 환영합니다!");
              form.setAttribute("action", "./LoginServlet?id="+id+"&&pwd="+pwd+"");//서블릿으로 데이터 전달
              form.submit();
              mycheck = 1;
            } else {
              alert("잘못된 비밀번호입니다");
              mycheck = 1;
            }
          }
          
        });
        
      });
      
     admin.once('value', function(snapshot) {
          snapshot.forEach(function(childSnapshot) {
            var tmp = childSnapshot.val();
            if(tmp.admin_id==id){
              if(tmp.admin_pwd==pwd){
                alert("관리자님 환영합니다!");
                form.setAttribute("action", "./LoginServlet?id="+id+"&&pwd="+pwd+"");//관리자 페이지 관련
                form.submit();
                mycheck = 1;
              } else {
                alert("잘못된 비밀번호입니다");
                mycheck = 1;
              }
            }
          });
          if(mycheck==0){
              alert("존재하지 않는 회원 아이디입니다");
            }
        });
    }

  </script>
<p style="text-align: center;">
<a href="Main.jsp"><img alt="Main Logo" src="image\main.jpg" width="200" height="100"/></a>
</p>
	<ul>
      <li><a href="Shirts.jsp">Shirts</a></li>
      <li><a href="Pants.jsp">Pants</a></li>
      <li><a href="Introduce.jsp">About</a></li>
      <li><a href="QnA.jsp">Contact</a></li>
   </ul>
   <br><hr><br>
   <h1>Login / Signin</h1>
<form id="login" method="POST">
	<fieldset>
		<legend>Login</legend>
		<table>
      <tr>
        <td>
          <label for="id">아이디
        </td>
        <td>
          <input type="text" name="id" id="id" size="20px">
        </td>
      </tr>
      <tr>
        <td>
          <label for="pwd">비밀번호
        </td>
        <td>
          <input type="password" name="pwd" id="pwd" size="20px">
        </td>
      </tr>
    </table>
    <input type="button" onclick="mylogin()" id="login" value="로그인">
    <input type="button" onclick="gosignup()" id="join" value="회원가입">
	</fieldset>
	<br><hr><br>
	<footer>
		<small>고객센터 : Tel. 032 - 8282 - 8282</small>
	</footer>
	
</form>
</body>
</html>