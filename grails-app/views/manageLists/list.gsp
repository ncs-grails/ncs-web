<html>
    <head>
        <title>Mailing Lists</title>
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

	        <h2>Mailing Lists</h2>
	        <p>Mailing lists for the National Children's Study at the University of Minnesota</p>
	
			<g:form name="memberList" action="memberList"></g:form>
			
			<!--   <div class="whitebox shadow">
				Looking for a particular list member?
				<g:link action="findMember">Try searching for them here!</g:link>
			</div>
			 -->
			
	        <div id="mailingListInstanceList" class="dialog">
	            <ul class="mailingList">
	            	<g:set var="counter" value="${1}"/>
	                <g:each var="l" in="${mailingListInstanceList}">
	                	<g:set var="counter" value="${counter + 1}" />
	                	<g:if test="${counter == 3}">
	                		<span id="membersSearchLink">
	                			<g:link action="findMember" >Members Search</g:link>
	                		</span>
	                	</g:if>
	                	<g:if test="${l.name == 'NCS_UMN_Test'}">
							<g:ifAnyGranted role="ROLE_LIST_TESTER">
			                    <li>
			                    	<a href="#" onClick="return toggleListMembers('${l.name}');" title="Show Members">${l.preferredName}</a>
			                    	(<g:link action="show" id="${l.name}" title="View Details">List Details</g:link>)
			                    	(<a style="font-size:0.9em;" href="mailto:${l.email}">Email This List</a>)
		                    		<div id="${l.name}-members" style="display:none;"></div>
		                    		
			                    </li>
							</g:ifAnyGranted>
	                	</g:if>
	              		<g:else>
		              		<g:if test="${mailingListAuthorityInstance?.allowLyris} == 1"> 
								<g:ifAnyGranted role="ROLE_HS_LYRIS">
				                    <li>
				                    	<a href="#" onClick="return toggleListMembers('${l.name}');" title="Show Members">${l.preferredName}</a>
				                    	(<g:link action="show" id="${l.name}" title="View Details">List Details</g:link>)
				                    	(<g:link action="eportCsv" id="${l.name}" title="Export to CSV">Export</g:link>)
				                    	(<a style="font-size:0.9em;" href="mailto:${l.email}">Email This List</a>)
			                    		<div id="${l.name}-members" style="display:none;"></div>
			                    		
				                    </li>
								</g:ifAnyGranted>
		                	</g:if> 
	                		<g:else>
			                    <li>
			                    	<a href="#" onClick="return toggleListMembers('${l.name}');" title="Show Members">${l.preferredName}</a>
			                    	(<g:link action="show" id="${l.name}" title="View Details">List Details</g:link>)
			                    	(<a style="font-size:0.9em;" href="mailto:${l.email}">Email This List</a>)
		                    		<div id="${l.name}-members" style="display:none;"></div>
			                    </li>
			                </g:else>
	                    </g:else>
	                </g:each>
	            </ul>
	        </div>
        </div>
    </body>
</html>
