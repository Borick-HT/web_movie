<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="col-8 offset-2">
	<form action="" method="post">
		<div class="card">
			<div class="card-header">
				<b>Registration</b>
			</div>
			<div class="card-body">
				<jsp:include page="/common/inform.jsp"></jsp:include>
				<div class="row">
					<div class="col">
						<div class="form-group">
							<label for=" username ">Username</label> <input type="text"
								class="form-control" name="username" id="username"
								value="${user.username }" aria-describedby="usernameHid "
								placeholder="username"> <small id="usernameHid  "
								class="form-text text-muted">Username is required</small>
						</div>
						<div class="form-group">
							<label for="fullname">Fullname </label> <input type="text"
								class="form-control" name="fullname" id="fullname"
								aria-describedby="fullnameHid" placeholder="Fullname"
								value="${user.fullname }"> <small id="fullnameHid"
								class="form-text text-muted">Fullname is required</small>
						</div>
					</div>
					<div class="col">
						<div class="form-group pb-4">
							<label for="password">password</label> <input type="password"
								class="form-control" name="password" id="password"
								placeholder="Password">
						</div>
						<div class="form-group">
							<label for="email">Email</label> <input type="text"
								class="form-control" name="email" id="email"
								aria-describedby="emailHid" placeholder="Email"
								value="${user.email }"> <small id="emailHid"
								class="form-text text-muted">Email is required</small>
						</div>
					</div>
				</div>
			</div>
			<div class="card-footer text-muted">
				<button class="btn btn-success">sign up</button>
			</div>
		</div>
	</form>
</div>