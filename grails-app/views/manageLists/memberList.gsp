<ul class="recipientList">
<g:each var="m" in="${mailingListInstance?.members}">
	<li>
		${m?.display} &lt;
		<strong>${m?.address}</strong>
		&gt;
	</li>
</g:each>
</ul>