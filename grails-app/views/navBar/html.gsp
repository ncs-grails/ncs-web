<!-- BEGIN OPTIONAL HORIZONTAL NAV-->
<div id="header_sub">
<div class="unit">
<g:link controller="info" action="index">Home</g:link>
<g:each var="bc" in="${breadCrumb}">
	&gt;
	<g:if test="${bc?.controller}">
		<g:link controller="${bc?.controller}" action="${bc?.action}" id="${bc?.id}">${bc?.name}</g:link>
	</g:if>
	<g:else>
		${bc?.name}
	</g:else>
</g:each>
</div>
<ul id="header_sub_nav">
	<sec:ifAnyGranted roles="ROLE_NCS_LIST_VIEWER,ROLE_NCS_SEGMENT_LOOKUP">
		<li class="tl_menu"><a href="#">NCS Links</a>
			<div id="nav_cat1" class="dd_menu_top">
				<ul class="dd_menu">
					<sec:ifAnyGranted roles="ROLE_NCS_LIST_VIEWER">
						<li><g:link controller="manageLists" action="list">NCS Email Lists</g:link></li>
					</sec:ifAnyGranted>
					<sec:ifAnyGranted roles="ROLE_NCS_ALL">
						<li><a href="https://www.cccs.umn.edu/ncs">NCS Labor Reporting</a></li>
					</sec:ifAnyGranted>
					<sec:ifAnyGranted roles="ROLE_NCS_ALL">
						<li><a href="https://secure.ncs.umn.edu/ncs-case-management">NCS Case Management</a></li>
					</sec:ifAnyGranted>
					<sec:ifAnyGranted roles="ROLE_NCS_LIST_VIEWER">
						<li><g:link controller="manageLists" action="list">NCS Email Lists</g:link></li>
					</sec:ifAnyGranted>
					<sec:ifAnyGranted roles="ROLE_NCS_SEGMENT_LOOKUP">
						<li>
							<a href="https://secure.ncs.umn.edu/ncs-segment-lookup/" title="Segment Lookup Tool">Segment Lookup</a>
						</li>
					</sec:ifAnyGranted>
					<li><a href="https://secure.ncs.umn.edu/secure-mail/" title="Secure Messaging">Secure Messaging</a></li>
				</ul>
			</div>
		</li>
		<li class="tl_menu">|</li>
	</sec:ifAnyGranted>
	
	<sec:ifAnyGranted roles="ROLE_NCS_LIST_VIEWER">
		<li class="tl_menu"><a href="#">Instructions</a>
			<div id="nav_cat2" class="dd_menu_top">
				<ul class="dd_menu">
					<li class="first"><g:link controller="instructions" action="listChanges">Request
					List Changes</g:link></li>
					<li class="last"><g:link controller="instructions" action="newList">Request
					New List</g:link></li>
				</ul>
			</div>
		</li>
		<li class="tl_menu">|</li>
	</sec:ifAnyGranted>
	
	<li class="tl_menu"><a
		href="https://www.ncsportal.org/"
		title="NCS Secure Access Gateway">NCS Portal</a></li>
	<li class="tl_menu">
</ul>

<br class="clearabove">
</div>
