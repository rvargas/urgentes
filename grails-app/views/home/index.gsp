<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap"/>
	</head>

	<body>
		<div class="container">
			<div class="hero-unit">
				<h1 class="pagination-centered">Días sin peticiones absurdas</h1>
				<h1 class="pagination-centered">${dias}</h1>
			</div>
			
			<sec:ifLoggedIn>
				<div class="row">
					<div class="span12">
						<div class="pagination-centered">
							<g:form class="form-inline" action="createUrgente" controller="home">
								<input type="text" class="input-large" name="cliente" placeholder="Usuario" required>
								<input type="text" class="input-large" name="motivo" placeholder="Motivo" required>
								<button type="submit" class="btn btn-primary">Nuevo urgente</button>
							</g:form>
						</div>
					</div>
				</div>
			</sec:ifLoggedIn>
			
			<g:if test="${urgentes}">
				<div class="row">				
					<div class="span12">
						<h2>Últimas peticiones absurdas</h2>
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>Fecha</th>
									<th>Usuario</th>
									<th>Motivo</th>
								</tr>
							</thead>
							<tbody>
								<g:each in="${urgentes}">
									<tr>
										<td><g:formatDate format="dd-MM-yyyy" date="${it.dateCreated}"/></td>
										<td>${fieldValue(bean: it, field: "cliente")}</td>
										<td>${fieldValue(bean: it, field: "motivo")}</td>
									</tr>
								</g:each>
							</tbody>
						</table>
					</div>
				</div>
			</g:if>
		</div>
	</body>
</html>