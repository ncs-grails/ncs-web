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
	<g:ifAnyGranted role="ROLE_LIST_VIEWER,ROLE_SEGMENT_LOOKUP">
		<li class="tl_menu"><a href="#">NCS Links</a>
			<div id="nav_cat1" class="dd_menu_top">
				<ul class="dd_menu">
					<g:ifAnyGranted role="ROLE_LIST_VIEWER">
						<li><g:link controller="manageLists" action="list">NCS Email Lists</g:link></li>
					</g:ifAnyGranted>
					<g:ifAnyGranted role="ROLE_ALL">
						<li><a href="https://www.cccs.umn.edu/ncs">NCS Labor Reporting</a></li>
					</g:ifAnyGranted>
					<g:ifAnyGranted role="ROLE_ALL">
						<li><a href="https://secure.ncs.umn.edu/ncs-case-management">NCS Case Management</a></li>
					</g:ifAnyGranted>
					<g:ifAnyGranted role="ROLE_LIST_VIEWER">
						<li><g:link controller="manageLists" action="list">NCS Email Lists</g:link></li>
					</g:ifAnyGranted>
					<g:ifAnyGranted role="ROLE_SEGMENT_LOOKUP">
						<li>
							<a href="https://secure.ncs.umn.edu/ncs-segment-lookup" title="Address Lookup Tool">Address Lookup</a>
						</li>
					</g:ifAnyGranted>
				</ul>
			</div>
		</li>
		<li class="tl_menu">|</li>
	</g:ifAnyGranted>
	
	<g:ifAnyGranted role="ROLE_LIST_VIEWER">
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
	</g:ifAnyGranted>
	
	<li class="tl_menu"><a
		href="https://ncsportal.org/dana/home/index.cgi"
		title="NCS Secure Access Gateway">NCS Portal</a></li>
	<li class="tl_menu">|</li>
	<li class="tl_menu"><a href="#">Quick Links</a>
	<div id="nav_cat3" class="dd_menu_top">
	<ul class="dd_menu">
		<li class="first"><a href="http://hilo.lau-schumann.com/"
			title="NCS Hi/Lo Collaborative Improvement Network">COIN</a></li>
		<li><a href="http://www.sph.umn.edu/enhs/research/ncs/"
			title="The National Childrens Study Speakers' Series Ramsey County Location">Speakers'
		Series</a></li>
		<li><a
			href="https://ncsportal.org/dana/home/index.cgi"
			title="NCS Secure Access Gateway">NCS Portal</a></li>
		<li><a href="http://RamseyKids.nationalchildrensstudy.gov/"
			title="National Institute of Child Health and Human Development">NCS at NICHD</a></li>
		<li><a href="http://enhs.umn.edu/"
			title="Environmental Health Sciences">EnHS</a></li>
		<li><a href="http://www.sph.umn.edu/"
			title="School of Public Health">SPH</a></li>
		<li class="last"><a href="http://www.umn.edu/"
			title="University of Minnesota">UMN</a></li>
	</ul>
	</div>
	</li>


	<li class="tl_menu">|</li>
	<li class="tl_menu">
	<g:isLoggedIn>
		<g:link controller="logout">Logout</g:link>
	</g:isLoggedIn> <g:isNotLoggedIn>
		<g:link controller="info">Login</g:link>
	</g:isNotLoggedIn>
	</li>

</ul>

<br class="clearabove">
</div>