<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/shared/header.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-md-6 centered-column">
				<div class="well bs-component">
					<form action="enregister_utilisateur" method="post" class="form-horizontal">
						<fieldset>
							<legend><i class="fa fa-pencil-square-o"></i> Enregistrer</legend>
							<div class="form-group">
								<label for="nomUtilisateur" class="col-lg-3 control-label">Nom d'utilisateur</label>
								<div class="col-lg-9">
									<input type="text" name="nomUtilisateur" class="form-control" id="nomUtilisateur" />
								</div>
							</div>
							<div class="form-group">
								<label for="motPasse" class="col-lg-3 control-label">Mot de passe</label>
								<div class="col-lg-9">
									<input type="password" name="motPasse" class="form-control" id="motPasse" />
								</div>
							</div>
							<div class="form-group">
								<label for="confirmerMotPasse" class="col-lg-3 control-label">Confirmer mot de passe</label>
								<div class="col-lg-9">
									<input type="password" name="confirmerMotPasse" class="form-control" id="confirmerMotPasse" />
								</div>
							</div>
							<input type="submit" class="btn btn-block btn-primary" value="Enregistrer"/>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="/shared/footer.jsp"></jsp:include>