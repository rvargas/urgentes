<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap"/>
	</head>

	<body>
		<div class="container">
			<div class="hero-unit">
				<h1 class="pagination-centered">Días sin urgentes absurdos</h1>
				<h1 class="pagination-centered"><g:formatNumber number="${dias}" minIntegerDigits="3" /></h1>
			</div>
			
			<sec:ifLoggedIn>
				<div class="row">
					<div class="span12">
						<div class="pagination-centered">
							<g:form class="form-inline" action="createUrgente" controller="home">
								<input type="text" class="input-large" name="cliente" placeholder="Cliente" required>
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
						<h2>Últimos urgentes absurdos</h2>
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>Fecha</th>
									<th>Cliente</th>
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