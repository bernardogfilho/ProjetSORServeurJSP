<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/shared/header.jsp"></jsp:include>
<div class="container">
	<div class="row">
		<div class="col-md-4 centered-column">
			<c:if test="${message!= null}">
				<div class="alert alert-warning" role="alert">
					${message}
				</div>
			</c:if>
			<div class="panel panel-default">
			  <div class="panel-heading">
			    <h2 class="panel-title"><i class="fa fa-lock"></i> Authentification</h2>
			  </div>
			  <div class="panel-body">
			    <form action="authentifier" method="post">
			    	<div class="form-group">
			    		<label for="nomUtilisateur">Nom d'utilisateur</label>
			    		<input type="text" name="nomUtilisateur" class="form-control" id="nomUtilisateur"/>
			    	</div>
			    	<div class="form-group">
			    		<label for="motPasse">Mot de passe</label>
			    		<input type="password" name="motPasse" class="form-control" id="motPasse"/>
			    	</div>
			    	<input type="submit" class="btn btn-primary btn-block" value="Connecter"/>
			    </form>
			  </div>
			</div>	
		</div>
	</div>
</div>

<jsp:include page="/shared/footer.jsp"></jsp:include>