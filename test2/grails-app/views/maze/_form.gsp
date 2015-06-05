<%@ page import="test2.Maze" %>



<div class="fieldcontain ${hasErrors(bean: mazeInstance, field: 'x', 'error')} required">
	<label for="x">
		<g:message code="maze.x.label" default="X" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="x" type="number" value="${mazeInstance.x}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: mazeInstance, field: 'y', 'error')} required">
	<label for="y">
		<g:message code="maze.y.label" default="Y" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="y" type="number" value="${mazeInstance.y}" required=""/>

</div>

