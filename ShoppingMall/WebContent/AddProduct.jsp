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
<title>Add Product</title><!-- 관리자가 제품을 추가하는 페이지 -->
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
<base href="<%=basePath %>">
</head>
<body>
<% String id = (String) session.getAttribute("id");%>
<script>

    var product = firebase.database().ref('product');
   
	
    var data = new Array();
    product.on('value', function(snapshot) {
      data.splice(0, data.length);
      snapshot.forEach(function(childSnapshot) {
        var childData = childSnapshot.val();
        data.push(childData.pro_id);
      });
    });
    

    function signup() {//회원가입 형식과 같음
      var id = document.getElementById("id").value;
      var image = document.getElementById("image").value;
      var name = document.getElementById("name").value;
      var info = document.getElementById("info").value;

      var product = firebase.database().ref('product/'+id);
      
      if(document.getElementById("id").disabled){
    	  product.set({
          pro_id: id,
          pro_image: image,
          pro_info: info,
          pro_name:name,
        });
        alert("상품등록이 완료되었습니다");
        history.back();
      } else {
        alert("상품 아이디 중복확인을 눌러주세요");
      }
    }

    function mycheck(){
        var id = document.getElementById("id").value;
        var checked = 0;

        data.forEach(function(tmp) {
          if(tmp==id){
            alert("이미 사용중인 상품 아이디입니다");
            checked = 1;
          }
        });
        if(checked==0){
          alert("사용 가능한  상품 아이디입니다");
          document.getElementById("id").disabled = true;
        }
    }

  </script>
<p style="text-align: center;">
<a href="LoginMain.jsp"><img alt="Main Logo" src="image\main.jpg" width="200" height="100"/></a>
</p>
	<ul>
      <li><a href="Shirts.jsp">Shirts</a></li>
      <li><a href="Pants.jsp">Pants</a></li>
      <li><a href="Introduce.jsp">About</a></li>
      <li><a href="QnA.jsp">Contact</a></li>
   </ul>
   
   <div style="float:left; text-align: left;" id="login"></div>
   <br><hr><br>
   <script>
	var id = "<%=id%>";
	document.getElementById("login").innerHTML = id + "관리자님 환영합니다!";
</script>
<form method="GET" name="inputForm">
<fieldset>
<legend>Add Product</legend>
    <table>
      <tr>
        <td>
          <label for="id">상품아이디
        </td>
        <td>
          <input type="text" name="id" id="id" size="20px" placeholder="id">
          <input type="button" onclick="mycheck()" id="check" value="중복확인">
        </td>
      </tr>
      <tr>
        <td>
          <label for="image">이미지
        </td>
        <td>
          <input type="text" name="image" id="image" size="20px">
        </td>
      </tr>
      <tr>
        <td>
          <label for="name">이름
        </td>
        <td>
          <input type="text" name="name" id="name" size="20px" placeholder="name">
        </td>
      </tr>
      <tr>
        <td>
          <label for="info">상품설명
        </td>
        <td>
          <input type="text" name="info" id="info" size="20px" placeholder="info">
        </td>
      </tr>
    </table>
    <input type="button" onclick="signup()" id="join" value="완료">
    <input type="reset" value="초기화"">
    </fieldset>
  </form>
  <footer>
		<small>고객센터 : Tel. 032 - 8282 - 8282</small>
	</footer>
	<br><hr><br>
</body>
</html>