<ul class="mailingList">
<g:each var="l" in="${mailingListMemberInstance?.lists}">
	<li>
		<g:link action="show" id="${l?.name}">${l?.name}</g:link> 
	</li>
</g:each>
</ul>