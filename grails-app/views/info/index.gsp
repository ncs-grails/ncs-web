<html>
<head>
<title>National Children's Study - University of Minnesota</title>
<meta name="layout" content="ncs" />
</head>
<body>
<h1>Ramsey County National Children's Study</h1>

<div id="identity">
	<g:isLoggedIn>
		<p>Logged in as 
			<span title="${rolesList}">
				<g:loggedInUserInfo field="username" />
			</span>
		</p>
	</g:isLoggedIn> <g:isNotLoggedIn>
		<p>You are not logged in</p>
	</g:isNotLoggedIn>
</div>
 
	<div class="content-box">
		<g:ifAnyGranted role="ROLE_LIST_VIEWER">
	 	<div class="useful-link">
	 		<p><g:link controller="manageLists" action="list">NCS Email Lists</g:link></p>
	 	</div>
		</g:ifAnyGranted>
		
		<g:ifAnyGranted role="ROLE_SEGMENT_LOOKUP">
		 	<div class="useful-link">
		 		<p><a href="https://secure.ncs.umn.edu/ncs-segment-lookup">Address Lookup</a></p>
		 	</div>
		</g:ifAnyGranted>
		
		<div class="useful-link">
			<p><a href="https://ncsportal.org/dana/home/index.cgi" title="NCS Secure Access Gateway">NCS Portal</a> - NCS Secure Access Gateway</p>
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
				<li>Email: <a href="info@ncs.umn.edu">info@ncs.umn.edu</a></li>
			</ul>
		</p>
		<div class="readmore">
			<g:link controller="info" action="contact" title="More Information">&gt; more</g:link>
		</div>
	</div>

</body>
</html>
