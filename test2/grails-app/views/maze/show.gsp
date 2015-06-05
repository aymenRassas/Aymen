
<%@ page import="test2.Maze" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'maze.label', default: 'Maze')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-maze" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-maze" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list maze">
			
				<g:if test="${mazeInstance?.x}">
				<li class="fieldcontain">
					<span id="x-label" class="property-label"><g:message code="maze.x.label" default="X" /></span>
					
						<span class="property-value" aria-labelledby="x-label"><g:fieldValue bean="${mazeInstance}" field="x"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${mazeInstance?.y}">
				<li class="fieldcontain">
					<span id="y-label" class="property-label"><g:message code="maze.y.label" default="Y" /></span>
					
						<span class="property-value" aria-labelledby="y-label"><g:fieldValue bean="${mazeInstance}" field="y"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:mazeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${mazeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
