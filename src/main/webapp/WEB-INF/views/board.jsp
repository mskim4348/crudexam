<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap 5 Example</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<script src="/resources/js/bootstrap.bundle.min.js"></script>
<!-- <script src="/resources/js/jquery-3.6.0.js"></script> -->
<!-- <script src="/resources/js/jquery-3.6.0.min.js"></script> -->
</head>
<body onload="doonload()">
	<div class="container mt-3">
		<h2>Button Styles</h2>
		<button type="button" class="btn btn-primary" id="btn1">테스트</button>
		<button type="button" class="btn btn-secondary" onclick="btnclick2()" id="btn2">board_read</button>
		<button type="button" class="btn btn-secondary" onclick="btnclick3()" id="btn3">hashMap_read</button>
		<button type="button" class="btn btn-secondary" onclick="btnclick4()" id="btn4">ajax_post</button>
		<button type="button" class="btn btn-secondary">Info</button>
		<button type="button" class="btn btn-secondary">Warning</button>
		<button type="button" class="btn btn-secondary">Danger</button>
		<button type="button" class="btn btn-secondary">Dark</button>
		<button type="button" class="btn btn-secondary">Light</button>
		<button type="button" class="btn btn-secondary">Link</button>
	</div>
	<div class="container mt-5" id="btn_read" name="btn_read"></div>
	
	<form id="postSend" >
		<input id='title' type="hidden" value="2"/><br> 
		<input id='content' type='hidden' value="4"/><br> 
		<input id='writer' type='hidden' value="2"/><br> 
		<input id='viewcnt' type='hidden' value="4"/><br> 
	</form>
	
</body>
</html>

<script type="text/javascript">
	function doonload() {
		let out = "";
		out += '<table class="table">';
		out += '<thead>';
		out += '<tr>';
		out += '<th>bno</th>';
		out += '<th>write</th>';
		out += '<th>title</th>';
		out += '<th>content</th>';
		out += '<th>viewcnt</th>';
		out += '</tr>';
		out += '<tbody>';
		out += '<tr>';
		out += '<td>John</td>';
		out += '<td>Doe</td>';
		out += '<td>john@example.com</td>';
		out += '<td>john@example.com</td>';
		out += '<td>john@example.com</td>';
		out += '</tr>';
		out += '</tbody>';
		out += '</table>';

		document.getElementById('btn_read').innerHTML = out;
		console.log(document.getElementById('btn_read'));
	}

// 	function btnclick() {
// 		$.ajax({
// 			  type: "GET",
// 			  url: "/test",  
// 			  dataType: "application/json; chareset=uft-8", 
// 			  dataType: "text", 
// 			  success: function(data){
// 	            },error : function(xhr,status,er) {
// 					console.log(er);
// 				},  
// 			});  
// 	}
		function btnclick2() {
			fetch('/Ajaxlist')
// 			  .then((response) => response.text())
			  .then((response) => response.json())
			  .then((data) => jsondata(data))
// 			  .then((data) => console.log(data))
			  .catch((error) => console.log("error:", error));
		}
		function btnclick3() {
// 			{fetch("http://192.168.90.53:4000/game/?email=" + encodeURIComponent('adicool2294@gmail.com')
			fetch('/jointest?seq='+encodeURIComponent('2'),{method:"GET"})
			  .then((response) => response.json())
// 			  .then((data) => console.log(data))
			  .then((data) => test(data))
			  .catch((error) => console.log("error:", error));
		}
		function btnclick4() {
			let form=document.getElementById("postSend");
// 			console.log(test.length);
// 			console.log(test.elements[0].id);
// 			console.log(test.elements[0].value);
			let formdata =new FormData();
			
			//document form 이용해서 form데이터 key,value값 추출
			for(let i=0;i<form.length;i++){
				formdata.append(""+form.elements[i].id, ""+form.elements[i].value);
			}
			
			fetch('/postsend',{
				method:"POST",
			    cache: 'no-cache',
			    body: formdata})
			  .then((response) => response.json())
			  .then((data) => {
				 if(data==1){
					 alert("insert 성공");
				}else{
					alert("실패");
				}
			  })
// 			  .then((data) => test(data))
			  .catch((error) => console.log("error:", error));
		}

		function jsondata(data){
// 			console.log(Object.keys(data).length);
// 			console.log('key:' + key + ' / ' + 'value:' + data[key].title);
			let out = "";
			out += '<table class="table">';
			out += '<thead>';
			out += '<tr>';
			out += '<th>bno</th>';
			out += '<th>writer</th>';
			out += '<th>title</th>';
			out += '<th>content</th>';
			out += '<th>viewcnt</th>';
			out += '</tr>';
			out += '<tbody>';
			for(key in data) {
				out += '<tr>';
				out += '<td>'+key+'</td>';
				out += '<td>'+data[key].writer+'</td>';
				out += '<td>'+data[key].title+'</td>';
				out += '<td>'+data[key].content+'</td>';
				out += '<td>'+data[key].viewcnt+'</td>';
				out += '</tr>';
			}
			out += '</tbody>';
			out += '</table>';
			
			document.getElementById('btn_read').innerHTML = out;
			document.getElementById('btn2').className = "btn btn-primary";
		}
		
		function test(data){
			let key1=Object.values(data);
			let key2=Object.keys(key1[0]);
			let out = "";
			out += '<table class="table">';
			out += '<thead>';
			out += '<tr>';
			//HashMap 테이블 컬럼 숫자만큼 반복
			for(let i=0;i<key2.length;i++){
				out += '<th>'+key2[i]+'</th>';
			}
			out += '</tr>';
			out += '<tbody>';
			//HashMap 테이블 데이터 숫자만큼 반복
			for(let i=0;i<key1.length;i++){//저장된 map 개수
			out += '<tr>';
				key2=Object.values(key1[i]);
				for(let j=0;j<Object.keys(key1[i]).length;j++){//저장된 map에서 value값 개수
// 					console.log("i:"+i+" "+key2[j]);				
					out += '<td>'+key2[j]+'</td>';
				}
			}
			out += '</tr>';
			out += '</tbody>';
			out += '</table>';
			
			document.getElementById('btn_read').innerHTML = out;
			document.getElementById('btn3').className = "btn btn-primary";
// 			let key2=Object.getOwnPropertyNames(data);
		}
		
</script>
