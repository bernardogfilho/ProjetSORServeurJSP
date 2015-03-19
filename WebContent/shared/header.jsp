<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/master.css" media="screen" title="no title" charset="utf-8">
<link rel="stylesheet" href="css/base.css" />
<script src="scripts/jquery.min.js"></script>
<script src="scripts/jspdf.min.js"></script>
<title>Menu</title>
</head>
<body>

  <nav class="navbar navbar-default">
    <div class="container">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="index.jsp"><i><strong>foo</strong>display</i></a>
      </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <c:if test="${admin}">
	      <ul class="nav navbar-nav navbar-left">
	      	<li><a href="create_element.jsp">Créer element</a></li>
	      </ul>
      </c:if>
        <ul class="nav navbar-nav navbar-right">
       		<c:if test="${utilisateur == null}">
       				<li><a href="sign_up.jsp"><i class="fa fa-pencil-square-o"></i> Enregistrer</a></li>
       		          <li><a href="sign_in.jsp"><i class="fa fa-sign-in"></i> Connecter</a></li>
       		</c:if>
       		<c:if test="${utilisateur != null }">
       			<li><a>
       				Bienvenue, ${utilisateur.getNomUtilisateur()}! <c:if test="${admin}">(Administrateur)</c:if>
    			</a></li>
       			<li><a href="deconnection"><i class="fa fa-sign-out"></i> Déconnecter</a></li>
       		</c:if>
        </ul>
      </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
  </nav>