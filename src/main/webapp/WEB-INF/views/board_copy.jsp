<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap 5 Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<script src="/resources/js/bootstrap.bundle.min.js"></script>
</head>
<body>

	<div class="container-fluid p-5 bg-primary text-white text-center">
		<h1>My First Bootstrap Page</h1>
		<p>Resize this responsive page to see the effect!</p>
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

	<!-- Or let Bootstrap automatically handle the layout -->
	<div class="container-fluid mt-3">
		<h1>Three equal width columns</h1>
		<p>Note: Try to add a new div with class="col" inside the row
			class - this will create four equal-width columns.</p>
		<div class="row">
			<div class="col p-3 bg-primary text-white">1</div>
			<div class="col p-3 bg-dark text-white">2</div>
			<div class="col p-3 bg-primary text-white">3</div>
		</div>

		<div class="container mt-5">
			<h2>Basic Table</h2>
			<p>The .table class adds basic styling (light padding and
				horizontal dividers) to a table:</p>
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
					<tr>
						<td>John</td>
						<td>Doe</td>
						<td>john@example.com</td>
						<td>john@example.com</td>
						<td>john@example.com</td>
					</tr>
					<tr>
						<td>Mary</td>
						<td>Moe</td>
						<td>mary@example.com</td>
						<td>mary@example.com</td>
						<td>mary@example.com</td>
					</tr>
					<tr>
						<td>July</td>
						<td>Dooley</td>
						<td>july@example.com</td>
						<td>july@example.com</td>
						<td>july@example.com</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<div class="container mt-3">
		<h2>Button Styles</h2>
		<button type="button" class="btn">Basic</button>
		<button type="button" class="btn btn-primary">Primary</button>
		<button type="button" class="btn btn-secondary">Secondary</button>
		<button type="button" class="btn btn-success">Success</button>
		<button type="button" class="btn btn-info">Info</button>
		<button type="button" class="btn btn-warning">Warning</button>
		<button type="button" class="btn btn-danger">Danger</button>
		<button type="button" class="btn btn-dark">Dark</button>
		<button type="button" class="btn btn-light">Light</button>
		<button type="button" class="btn btn-link">Link</button>
	</div>
</body>
</html>
