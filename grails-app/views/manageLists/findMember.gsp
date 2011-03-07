<html>
    <head>
        <title>Mailing List Members</title>
        <meta name="layout" content="ncs" />
        <g:javascript library="jquery" plugin="jquery"/>
        <g:javascript src="manage_list.js" />
    </head>
    <body>
		<h1>National Children's Study - Ramsey County Location</h1>
		<div id="identity">
			<g:isLoggedIn>
				<p>Logged in as <g:loggedInUserInfo field="username" /></p>
			</g:isLoggedIn> <g:isNotLoggedIn>
				<p>You are not logged in</p>
			</g:isNotLoggedIn>
		</div>
		<div class="content-box shadow">

	        <h2>Mailing List Members</h2>
	        <p>Find a Member of a Mailing lists</p>
			<g:form name="showMember" action="showMember"></g:form>
			
			Filter <input class="shadow" style="margin-bottom:1em;" type="text" name="memberFilter" id="memberFilter" />
			
	        <div id="mailingListMemberInstanceList" class="dialog">
	            <ul class="recipientList">
	                <g:each var="m" in="${mailingListMemberInstanceList}">
	                    <li id="li${m.address.hashCode()}">
							${m.display}
	                    	<a href="#li${m.address.hashCode()}" onClick="return showMemberDetail('${m.address}', 'MEM${m.address.hashCode()}');" title="Show Member Detail">${m.address}</a>
	                    	<div id="MEM${m.address.hashCode()}" style="display:none;"></div>
	                    </li>
	                </g:each>
	            </ul>
	        </div>
        </div>
    </body>
</html>
