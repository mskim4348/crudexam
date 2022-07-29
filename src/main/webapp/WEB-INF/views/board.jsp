<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap 5 Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<script src="/resources/js/bootstrap.bundle.min.js"></script>
<!-- <script src="/resources/js/jquery-3.6.0.js"></script> -->
<!-- <script src="/resources/js/jquery-3.6.0.min.js"></script> -->
</head>
<body onload="doonload()">
	<div class="container mt-3">
		<h2>Button Styles</h2>
		<button type="button" class="btn btn-primary" id="btn1">Basic</button>
		<button type="button" class="btn btn-secondary" onclick="btnclick2()" id="btn2">Primary</button>
		<button type="button" class="btn btn-secondary" onclick="btnclick3()">Secondary</button>
		<button type="button" class="btn btn-secondary">Success</button>
		<button type="button" class="btn btn-secondary">Info</button>
		<button type="button" class="btn btn-secondary">Warning</button>
		<button type="button" class="btn btn-secondary">Danger</button>
		<button type="button" class="btn btn-secondary">Dark</button>
		<button type="button" class="btn btn-secondary">Light</button>
		<button type="button" class="btn btn-secondary">Link</button>
	</div>
	<div class="container mt-5" id="btn_read" name="btn_read"></div>
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
			  .catch((error) => console.log("error:", error));
		}
		function btnclick3() {
// 			let formData = new FormData(); 
// 			formData.append('seq', 1);
// 			let number={seq:1};
			let number=1;
			fetch('/jointest?seq='+number)
			  .then((response) => response.json())
			  .then((data) => console.log(data))
			  .catch((error) => console.log("error:", error));
		}
		function jsondata(data){
// 			console.log(Object.keys(data).length);
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
// 			    console.log('key:' + key + ' / ' + 'value:' + data[key].title);
			out += '</tbody>';
			out += '</table>';
			document.getElementById('btn_read').innerHTML = out;
			document.getElementById('btn2').className = "btn btn-primary";
		}
</script>
