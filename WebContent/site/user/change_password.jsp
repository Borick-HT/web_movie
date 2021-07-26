<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="offset-3 col-6 mt-4">
	<form action="ChangePass" method="post">
		<div class="card">
			<div class="card-header">
				<b>change password</b>

			</div>
			<div class="card-body">
			<jsp:include page="/common/inform.jsp"></jsp:include>
				<div class="row">
					<div class="col">
						<div class="form-group">
							<label for="username">Username</label> <input type="text"
								class="form-control" name="username" id="username" value="${username }"
								aria-describedby="usernameHid" placeholder="Username"> <small
								id="usernameHid" class="form-text text-muted">Username
								is required</small>
						</div>
						<div class="form-group">
							<label for="password">Password</label> <input type="password"
								class="form-control" name="password" id="password"
								placeholder="Password">
						</div>
					</div>
					<div class="col">
						<div class="form-group pb-4">
							<label for="currentpassword">Current password</label> <input
								type="password" class="form-control" name="currentpassword"
								id="currentpassword" placeholder="Current password">
						</div>
						<div class="form-group">
							<label for="confirmpassword">Confirm password</label> <input
								type="password" class="form-control" name="confirmpassword"
								id="confirmpassword" placeholder="Confirm password">
						</div>
					</div>
				</div>
			</div>
			<div class="card-footer text-muted">
				<button class="btn btn-success">Change password</button>
			</div>
		</div>
	</form>
</div>