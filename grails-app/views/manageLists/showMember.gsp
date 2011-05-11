<ul class="mailingList">
<g:each var="l" in="${mailingListMemberInstance?.lists}">
	<li>
		<g:link action="show" id="${l?.name}">${l?.preferredName}</g:link>
		<g:if test="${mailingListMemberInstance.address == l?.listAuthority?.address}" >
			<span class="r">- List Authority</span>
		</g:if>
	</li>
</g:each>
</ul>