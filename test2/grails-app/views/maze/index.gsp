
<%@ page import="test2.Maze" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'maze.label', default: 'Maze')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-maze" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-maze" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="x" title="${message(code: 'maze.x.label', default: 'X')}" />
					
						<g:sortableColumn property="y" title="${message(code: 'maze.y.label', default: 'Y')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${mazeInstanceList}" status="i" var="mazeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${mazeInstance.id}">${fieldValue(bean: mazeInstance, field: "x")}</g:link></td>
					
						<td>${fieldValue(bean: mazeInstance, field: "y")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${mazeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
