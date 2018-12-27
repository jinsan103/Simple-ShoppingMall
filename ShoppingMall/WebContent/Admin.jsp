<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html><!-- 관리자페이지 -->
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
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
<p style="text-align: center;">
<a href="LoginMain.jsp"><img alt="Main Logo" src="image\main.jpg" width="200" height="100"/></a>
</p>
	<ul>
      <li><a href="LoginShirts.jsp">Shirts</a></li>
      <li><a href="LoginPants.jsp">Pants</a></li>
      <li><a href="LoginIntro.jsp">About</a></li>
      <li><a href="LoginQnA.jsp">Contact</a></li>
   </ul>
   
   <div style="float:left; text-align: left;" id="login"></div>
   <div style="float:right; text-align: right;"><a href="AddProduct.jsp">상품추가</a></div>
   <br><hr><br>
	
<script>
	var id = "<%=id%>";
	document.getElementById("login").innerHTML = id + "관리자님 환영합니다!";
</script>
<h1>회원관리</h1>
<table id="infotable" border=1><!-- 회원관리 테이블 -->
<tr>
	<td>ID</td>
	<td>이름</td>
	<td>주소</td>
	<td>성별</td>
	<td>주민번호</td>
	<td>관리</td>
</tr>
</table>
<br><hr><br>
<h1>상품관리</h1>
<table id="productable" border=1><!-- 상품테이블 -->
<tr>
	<td>ID</td>
	<td>이름</td>
	<td>이미지</td>
	<td>관리</td>
</tr>
</table>

<script>
allUserdata();
allProdata();

function del_click(id){//회원 테이블 삭제 버튼 
	alert("id:"+ id);
	var user_data = firebase.database().ref('user_data/'+id);
	user_data.remove();
	var user_prof = firebase.database().ref('user_profile/'+id);
	user_prof.remove();
	alert("변경 완료");
	location.reload();
}
function allUserdata(){
	var user_data = firebase.database().ref('user_data');
	user_data.once('value', function(snapshot) {
	    snapshot.forEach(function(childSnapshot) {
	      var tmp = childSnapshot.val();
	      allUserProfile(tmp.user_id);
	    });
	  });
}
function allUserProfile(id){//회원 테이블
	
	var user_data = firebase.database().ref('user_profile/'+id);
	user_data.once('value', function(snapshot) {
	      var tmp = snapshot.val();
	      table = document.getElementById("infotable");
	      new_tr = document.createElement("tr");
	      
	      td_id = document.createElement("td");
	      td_id.innerHTML = id;
	      new_tr.appendChild(td_id);
	      
	      td_name = document.createElement("td");
	      td_name.innerHTML = tmp.name;
	      new_tr.appendChild(td_name);
	      
	      td_IDnum = document.createElement("td");
	      td_IDnum.innerHTML = tmp.IDnum;
	      new_tr.appendChild(td_IDnum);

	      td_adress = document.createElement("td");
	      td_adress.innerHTML = tmp.adress;
	      new_tr.appendChild(td_adress);

	      td_gender = document.createElement("td");
	      td_gender.innerHTML = tmp.gender;
	      new_tr.appendChild(td_gender);
	      
	      del_btn = document.createElement("input");
	      del_btn.setAttribute("type", "button");
	      del_btn.setAttribute("onclick", "del_click('"+id+"')");
	      del_btn.setAttribute("value", "삭제");
	      new_tr.appendChild(del_btn);
	      
	      table.appendChild(new_tr);
	  });
}
function allProdata(){
	var pro_data = firebase.database().ref('product');
	pro_data.once('value', function(snapshot) {
	    snapshot.forEach(function(childSnapshot) {
	      var tmp = childSnapshot.val();
	      allProTable(tmp.pro_id);
	    });
	  });
}
function allProTable(id){//상품 테이블
	
	var pro_data = firebase.database().ref('product/'+id);
	pro_data.once('value', function(snapshot) {
	    var tmp = snapshot.val();
	    pro_table = document.getElementById("productable");
	      new_tr = document.createElement("tr");
	      
	      td_id = document.createElement("td");
	      td_id.innerHTML = id;
	      new_tr.appendChild(td_id);
	      
	      td_name = document.createElement("td");
	      td_name.innerHTML = tmp.pro_name;
	      new_tr.appendChild(td_name);
	      
	      td_image = document.createElement("td");
	      td_image.innerHTML = tmp.image;
	      new_tr.appendChild(td_image);
	      
	      del_btn = document.createElement("input");
	      del_btn.setAttribute("type", "button");
	      del_btn.setAttribute("onclick", "del_click_pro('"+id+"')");
	      del_btn.setAttribute("value", "삭제");
	      new_tr.appendChild(del_btn);
	      
	      pro_table.appendChild(new_tr);
	  });
}
function del_click_pro(id){
	alert("id:"+ id);
	var pro_data = firebase.database().ref('product/'+id);
	pro_data.remove();
	alert("변경 완료");
	location.reload();
}
</script>
<br><hr><br>
	<footer>
		<small>고객센터 : Tel. 032 - 8282 - 8282</small>
	</footer>
</body>
</html>