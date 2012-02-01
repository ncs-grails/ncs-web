<html>
<head>
<title>National Children's Study - University of Minnesota</title>
<meta name="layout" content="ncs" />
</head>
<body>
<h1>Ramsey County National Children's Study</h1>

<div id="identity">
	<sec:ifLoggedIn>
		<p>Logged in as 
			<span title="${rolesList}">
				<sec:username/>
			</span>
		</p>
	</sec:ifLoggedIn> <sec:ifNotLoggedIn>
		<p>You are not logged in</p>
	</sec:ifNotLoggedIn>
</div>
 
	<div class="content-box">
		<sec:ifAnyGranted roles="ROLE_LIST_VIEWER">
	 	<div class="useful-link">
	 		<p><g:link controller="manageLists" action="list">NCS Email Lists</g:link></p>
	 	</div>
		</sec:ifAnyGranted>
		
		<sec:ifAnyGranted roles="ROLE_NCS">
		 	<div class="useful-link">
		 		<p><a href="https://secure.ncs.umn.edu/ncs-case-management">Case Management</a></p>
		 	</div>
		</sec:ifAnyGranted>
		
		<div class="useful-link">
			<p><a href="https://www.ncsportal.org/" title="NCS Secure Access Gateway">NCS Portal</a> - NCS Secure Access Gateway</p>
		</div>
		
		<div class="useful-link">
			<p><a href="http://hilo.lau-schumann.com/" title="NCS Hi/Lo Collaborative Improvement Network">COIN</a> - NCS Hi/Lo Collaborative Improvement Network</p>
		</div>		
		<div class="useful-link">
			<p><a href="http://www.sph.umn.edu/enhs/research/ncs/" title="The National Childrens Study Speakers' Series Ramsey County Location">Speakers&#39; Series</a> - The NCS Speakers&#39; Series Ramsey County Location</p>
		</div>
		
		<div class="useful-link">
			<p><a href="http://RamseyKids.nationalchildrensstudy.gov/" title="National Institute of Child Health and Human Development">NCS at NICHD</a> - National Institute of Child Health and Human Development</p>
		</div>
	</div>
 
	<div class="content-box">
		<h3>Contact Information</h3>
		<p>
			<ul>
				<li>National Website: <a href="http://RamseyKids.nationalchildrensstudy.gov/">http://RamseyKids.nationalchildrensstudy.gov/</a></li>
				<li>Email: <a href="mailto:info@ncs.umn.edu">info@ncs.umn.edu</a></li>
			</ul>
		</p>
		<div class="readmore">
			<g:link controller="info" action="contact" title="More Information">&gt; more</g:link>
		</div>
	</div>

</body>
</html>
