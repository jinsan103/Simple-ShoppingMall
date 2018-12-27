<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signin</title><!-- 회원가입 페이지 -->
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
<script>

    var user_data = firebase.database().ref('user_data');
    var d = new Date();
	
    var data = new Array();
    user_data.on('value', function(snapshot) {
      data.splice(0, data.length);
      snapshot.forEach(function(childSnapshot) {
        var childData = childSnapshot.val();
        data.push(childData.user_id);
      });
    });
    

    function signup() {
      var id = document.getElementById("id").value;
      var pw = document.getElementById("pw").value;
      var gender = document.getElementById("gender").value;
      var IDnum = document.getElementById("idnum").value;
      var name = document.getElementById("name").value;
      var adress = document.getElementById("adress").value;
      var signDate = d.getFullYear() + "-" + d.getMonth() + "-" + d.getDate();

      var user_data = firebase.database().ref('user_data/'+id);
      
      if(document.getElementById("id").disabled){
        user_data.set({
          user_id: id,
          user_pwd: pw,
        });
        profile(id,IDnum,name,adress,signDate,gender);
        alert("회원가입이 완료되었습니다");
        history.back();
      } else {
        alert("아이디 중복확인을 눌러주세요");
      }
    }

    function profile(id,IDnum,name,adress,signDate,gender){
    	var user_ref = firebase.database().ref('user_profile/'+id);
      	user_ref.set({
            name: name,
            gender: gender,
            adress: adress,
            IDnum: IDnum,
            signDate: signDate
          });
    }
    function mycheck(){
        var id = document.getElementById("id").value;
        var checked = 0;

        data.forEach(function(tmp) {
          if(tmp==id){
            alert("이미 사용중인 아이디입니다");
            checked = 1;
          }
        });
        if(checked==0){
          alert("사용 가능한 아이디입니다");
          document.getElementById("id").disabled = true;
        }
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
<form method="GET" name="inputForm">
<fieldset>
<legend>Signin</legend>
    <table>
      <tr>
        <td>
          <label for="id">아이디
        </td>
        <td>
          <input type="text" name="id" id="id" size="20px" placeholder="id">
          <input type="button" onclick="mycheck()" id="check" value="중복확인">
        </td>
      </tr>
      <tr>
        <td>
          <label for="pw">비밀번호
        </td>
        <td>
          <input type="password" name="pw" id="pw" size="20px" placeholder="pwd">
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
          <label for="idnum">주민번호
        </td>
        <td>
          <input type="text" name="idnum" id="idnum" size="20px" placeholder="123456-1234567">
        </td>
      </tr>
      <tr>
        <td>
          <label for="adress">주소
        </td>
        <td>
          <input type="text" name="adress" id="adress" size="20px" placeholder="adress">
        </td>
      </tr>
      <tr>
        <td>
          <label for="gender">성별
        </td>
        <td>
          <input type="text" name="gender" id="gender" size="20px" placeholder="sex">
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