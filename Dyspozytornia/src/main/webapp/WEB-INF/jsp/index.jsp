<!DOCTYPE HTML>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">

<title>Task Manager | Home</title>

<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">

<!--[if lt IE 9]>
		<script src="static/js/html5shiv.min.js"></script>
		<script src="static/js/respond.min.js"></script>
	<![endif]-->
</head>
<body>

	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/" class="navbar-brand">Home</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="new-task">Add Task</a></li>
					<li><a href="all-tasks">All Tasks</a></li>
					<li><a href="new-car">Add Car</a>
					<li><a href="all-cars">All cars</a>
					<li><a href="new-worker">Add Worker</a></li>
					<li><a href="all-workers">All Workers</a></li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<li><a href="/info"><span class="glyphicon glyphicon-cog"></span>
							Info</a></li>
				</ul>
			</div>
		</div>
	</div>

	<c:choose>


		<c:when test="${mode == 'MODE_HOME'}">
			<div class="container" id="homeDiv">
				<div class="jumbotron text-center">
					<h1>Witaj w pracy</h1>
				</div>
			</div>
			<center>
			<img src="static/images/UnderConstruction.jpeg" alt="" height="640" width="640">
			</center>
		</c:when>

		<c:when test="${mode == 'MODE_INFO'}">
			<div class="container" id="infoDiv">

			<div class="starter-template text-left">
				<h1>Co dalej do wykonania</h1>
				<p class="lead text-left">
					<ul>
						<li>Logowanie</li>
						<li>Odczyt danych paliwowych</li>
						<li>Odczyt danych systemu GPS</li>
						<li>Kreowanie analiz ekonomicznych</li>
					</ul>
				</p>
			</div>

			</main>
		</c:when>


		<c:when test="${mode == 'MODE_TASKS'}">
			<div class="container text-center" id="tasksDiv">
				<h3>My Tasks</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered text-left">
						<thead>
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>Description</th>
								<th>Date Created</th>
								<th>Finished</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="task" items="${tasks}">
								<tr>
									<td>${task.id}</td>
									<td>${task.name}</td>
									<td>${task.description}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
											value="${task.dateCreated}" /></td>
									<td>${task.finished}</td>
									<td><a href="update-task?id=${task.id}"><span
											class="glyphicon glyphicon-pencil"></span></a></td>
									<td><a href="delete-task?id=${task.id}"><span
											class="glyphicon glyphicon-trash"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_NEW' || mode == 'MODE_UPDATE'}">
			<div class="container text-center">
				<h3>Manage Task</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-task">
					<input type="hidden" name="id" value="${task.id}" />
					<div class="form-group">
						<label class="control-label col-md-3">Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="name"
								value="${task.name}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Description</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="description"
								value="${task.description}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Finished</label>
						<div class="col-md-7">
							<input type="radio" class="col-sm-1" name="finished" value="true" />
							<div class="col-sm-1">Yes</div>
							<input type="radio" class="col-sm-1" name="finished"
								value="false" checked />
							<div class="col-sm-1">No</div>
						</div>
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-primary" value="Save" />
					</div>
				</form>
			</div>
		</c:when>
	</c:choose>

	<c:choose>

		<c:when test="${mode == 'MODE_CARS1'}">
			<div class="container text-center" id="carsDiv">
				<h3>All Cars</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered text-left">
						<thead>
							<tr>
								<th>Id</th>
								<th>Brand</th>
								<th>Model</th>
								<th>Date Created</th>
								<th>Pass</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="car" items="${cars}">
								<tr>
									<td>${car.id}</td>
									<td>${car.brand}</td>
									<td>${car.model}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
											value="${car.dateCreated}" /></td>
									<td>${car.pass}</td>
									<td><a href="update-car?id=${car.id}"><span
											class="glyphicon glyphicon-pencil"></span></a></td>
									<td><a href="delete-car?id=${car.id}"><span
											class="glyphicon glyphicon-trash"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_NEW1' || mode == 'MODE_UPDATE1'}">
			<div class="container text-center">
				<h3>Add Car</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-car">
					<input type="hidden" name="id" value="${car.id}" />
					<div class="form-group">
						<label class="control-label col-md-3">Brand</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="brand"
								value="${car.brand}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Model</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="model"
								value="${car.model}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Pass</label>
						<div class="col-md-7">
							<input type="radio" class="col-sm-1" name="pass" value="true" />
							<div class="col-sm-1">Yes</div>
							<input type="radio" class="col-sm-1" name="pass" value="false"
								checked />
							<div class="col-sm-1">No</div>
						</div>
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-primary" value="Save" />
					</div>
				</form>
			</div>
		</c:when>
	</c:choose>


	<c:choose>

		<c:when test="${mode == 'MODE_WORKERS2'}">
			<div class="container text-center" id="workersDiv">
				<h3>All Workers</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered text-left">
						<thead>
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>Address</th>
								<th>Telephone</th>
								<th>Date Created</th>
								<th>Pass</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="worker" items="${workers}">
								<tr>
									<td>${worker.id}</td>
									<td>${worker.name}</td>
									<td>${worker.address}</td>
									<td>${worker.telephone}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
											value="${worker.dateCreated}" /></td>
									<td>${worker.pass}</td>
									<td><a href="update-worker?id=${worker.id}"><span
											class="glyphicon glyphicon-pencil"></span></a></td>
									<td><a href="delete-worker?id=${worker.id}"><span
											class="glyphicon glyphicon-trash"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>

		<c:when test="${mode == 'MODE_NEW2' || mode == 'MODE_UPDATE2'}">
			<div class="container text-center">
				<h3>Add Worker</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-worker">
					<input type="hidden" name="id" value="${worker.id}" />
					<div class="form-group">
						<label class="control-label col-md-3">Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="name"
								value="${worker.name}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Address</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="address"
								value="${worker.address}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Telephone</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="telephone"
								value="${worker.telephone}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Pass</label>
						<div class="col-md-7">
							<input type="radio" class="col-sm-1" name="pass" value="true" />
							<div class="col-sm-1">Yes</div>
							<input type="radio" class="col-sm-1" name="pass" value="false"
								checked />
							<div class="col-sm-1">No</div>
						</div>
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-primary" value="Save" />
					</div>
				</form>
			</div>
		</c:when>
	</c:choose>



	<script src="static/js/jquery-1.11.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
</body>
</html>