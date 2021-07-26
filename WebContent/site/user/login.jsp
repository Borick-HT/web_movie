<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<div class="offset-4 col-4">
	<form action="Login" method="post">
		<div class="card">
			<div class="card-header">
				<b>Login</b>
			</div>
			<div class="card-body">
			<jsp:include page="/common/inform.jsp"></jsp:include>
				   <div class="input-group mb-3">
                                <div class="input-group-append">
                                    <span class="input-group-text"><i class="fa fa-user"></i></span>
                                </div>
                                <input type="text" name="username" class="form-control input_user" value="" placeholder="username">
                            </div>
			

				 
                            <div class="input-group mb-2">
                                <div class="input-group-append">
                                    <span class="input-group-text"><i class="fa fa-key"></i></span>
                                </div>
                                <input type="password" name="password" class="form-control input_pass" value="" placeholder="password">
                            </div>
				

				
				
				<div class="form-group ">
							<div class="custom-control custom-checkbox ">
								<label class="custom-control-label" for="customControlInline"><input type="checkbox"  name="remember" class="custom-control-input" id="customControlInline">
								 Remember me</label>
							</div>
						</div>
				
				
				
			</div>
			<div class="card-footer text-muted">
				<button class="btn btn-success">Login</button>
				<label ><a class="nav-link" href="Registration"> Registration	</a></label> 
								
					
			</div>
		</div>

	</form>
</div>