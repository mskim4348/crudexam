<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page session="false"%>
<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap 5 Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<script src="/resources/js/bootstrap.bundle.min.js"></script>
</head>
<body>

	<div class="container-fluid p-5 bg-primary text-white text-center">
		<h1>My First Bootstrap Page</h1>
		<p>Resize this responsive page to see the effect!</p>
	</div>

	<!-- Control the column width, and how they should appear on different devices -->
	<div class="row">
		<div class="col-*-*"></div>
		<div class="col-*-*"></div>
	</div>
	<div class="row">
		<div class="col-*-*"></div>
		<div class="col-*-*"></div>
		<div class="col-*-*"></div>
	</div>

	<div class="container mt-5">
		<h2>데이터 테이블</h2>
		<p></p>
		<table class="table">
			<thead>
				<tr>
					<th>bno</th>
					<th>write</th>
					<th>title</th>
					<th>content</th>
					<th>viewcnt</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach items="${board}" var="board" varStatus="status">
					<tr id="tableID${board.bno}">
						<th>${status.count}</th>
<%-- 						<th><input type="text" id=writer${status.count} value=${board.writer} onchange="change(${status.count},['${board.bno},${board.writer}','${board.title}','${board.content}','${board.viewcnt}'])"></th> --%>
<!-- 						<th><input type="text" id=title${status.count} value=${board.title} onchange="change()"></th> -->
<!-- 						<th><input type="text" id=content${status.count} value=${board.content} onchange="change()"></th> -->
<!-- 						<th><input type="text" id=viewcnt${status.count} value=${board.viewcnt} onchange="change()"></th> -->
						<th><input type="text" name=writer[] value=${board.writer} onchange="change(${status.count},['${board.bno}','${board.writer}','${board.title}','${board.content}','${board.viewcnt}'])"></th>
						<th><input type="text" name=title[] value=${board.title} onchange="change(${status.count},['${board.bno}','${board.writer}','${board.title}','${board.content}','${board.viewcnt}'])"></th>
						<th><input type="text" name=content[] value=${board.content} onchange="change(${status.count},['${board.bno}','${board.writer}','${board.title}','${board.content}','${board.viewcnt}'])"></th>
						<th><input type="text" name=viewcnt[] value=${board.viewcnt} onchange="change(${status.count},['${board.bno}','${board.writer}','${board.title}','${board.content}','${board.viewcnt}'])"></th>
					</tr>
						<input type="hidden" name=hidden[] value=0>
						<input type="hidden" name=bno[] value=${board.bno}>
				</c:forEach>
			</tbody>
		</table>
	 	<button type="button"  style="float: right;" class="btn btn-primary" onclick="updateForm()">update</button>
	</div>
	<div class="container mt-5">
		<div class="row">
			<div class="col-sm-4">
				<h3>Column 1</h3>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
				<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco
					laboris...</p>
			</div>
			<div class="col-sm-4">
				<h3>Column 2</h3>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
				<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco
					laboris...</p>
			</div>
			<div class="col-sm-4">
				<h3>Column 3</h3>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
				<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco
					laboris...</p>
			</div>
		</div>
	</div>
</body>
</html>

<script type="text/javascript">
// 	function change(writer,title,content,viewcnt) {
	function change(seq,array) {
		let writer=document.getElementsByName("writer[]")[seq-1].value;
		let title=document.getElementsByName("title[]")[seq-1].value;
		let content=document.getElementsByName("content[]")[seq-1].value;
		let viewcnt=document.getElementsByName("viewcnt[]")[seq-1].value;
		
		if(writer==array[1]&&title==array[2]&&content==array[3]&&viewcnt==array[4]){
			document.getElementById('tableID'+array[0]).style.backgroundColor='';
			document.getElementsByName("hidden[]")[seq-1].value=0
		}else{
			document.getElementById('tableID'+array[0]).style.backgroundColor='#D9E5FF';
			document.getElementsByName("hidden[]")[seq-1].value=1;
		}
// 		let item=document.getElementsByName("writer[]");
// 		for(var i=0; i<item.length; i++){
// 			console.log("i의값:"+i+" item:"+item[i].value);
// 		}
	}
	function formarray(array){
		let form = document.createElement("form");
        form.setAttribute("id", "form");
        form.setAttribute("method", "Post");  //Post 방식
        form.setAttribute("action", "/array"); //요청 보낼 주소
        let hiddenField='';
        for(let i=0;i<array.length;i++){
			console.log("i의값");
        }
        hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "bno[]");
//         hiddenField.setAttribute("value", mName);
        form.appendChild(hiddenField);

	}
	function updateForm(){
// 		let out='';
// 		out+="<form id='postSend'>";
// 		out+="<input name='bno[]' type='text'/>" 
// 		out+="<input name='writer[]' type='text'/>" 
// 		out+="<input name='title[]' type='text'/>" 
// 		out+="<input name='content[]' type='text'/>" 
// 		out+="<input name='viewcnt[]' type='text'/>" 
// 		out+="</form>"
		
        
		form=formarray(['bno','writer','title','content','viewcnt']);
        let hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "bno[]");
//         hiddenField.setAttribute("value", mName);
        form.appendChild(hiddenField);

        hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "title[]");
//         hiddenField.setAttribute("value", mEmail);
        form.appendChild(hiddenField);
        
        hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "content[]");
//         hiddenField.setAttribute("value", mEmail);
        form.appendChild(hiddenField);

        document.body.appendChild(form);

//         form.submit();
// 		console.log(out);
		let item=document.getElementsByName("hidden[]");
		for(var i=0; i<item.length; i++){
			if(item[i].value==1){
				console.log(document.getElementsByName("bno[]")[i].value);
				console.log(document.getElementsByName("writer[]")[i].value);
				console.log(document.getElementsByName("title[]")[i].value);
				console.log(document.getElementsByName("content[]")[i].value);
				console.log(document.getElementsByName("viewcnt[]")[i].value);
// 				console.log("i의값:"+i+" hidden:"+item[i].value);
			}
		}
	}
	function jsondata(data) {
		//		console.log(Object.keys(data).length);
		//		console.log('key:' + key + ' / ' + 'value:' + data[key].title);
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
		for (key in data) {
			out += '<tr>';
			out += '<td>' + key + '</td>';
			out += '<td>' + data[key].writer + '</td>';
			out += '<td>' + data[key].title + '</td>';
			out += '<td>' + data[key].content + '</td>';
			out += '<td>' + data[key].viewcnt + '</td>';
			out += '</tr>';
		}
		out += '</tbody>';
		out += '</table>';

		document.getElementById('btn_read').innerHTML = out;
	}
</script>
