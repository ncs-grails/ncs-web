<html>
    <head>
        <title>Manage User Access</title>
        <meta name="layout" content="umn" />
        <g:javascript library="jquery" plugin="jquery"/>
        <g:javascript src="show_list.js" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'ncs.css')}" />
    </head>
    <body>
    	<!-- Breadcrumbs -->
    	<g:link url="/ncs" >Home</g:link> &gt; 
    	<g:link action="list" >Mailing Lists</g:link> &gt;
    	${mailingListInstance?.name}
    	
        <div id="pageBody">
            <h1>Mailing List Details : ${mailingListInstance?.name}</h1>
            <p>The following information is regarding the
			  ${mailingListInstance?.name} mailing list</p>

			<g:isLoggedIn>
				<p>You appear to be: <g:loggedInUserInfo field="username"/></p>
				
			</g:isLoggedIn>

			  <div id="mailingListInstanceList" class="dialog round">
				  <h2>Lists:</h2>
				  <ul>
					  <g:each var="l" in="${mailingListInstanceList}">
						  <li><g:link action="show" id="${l.name}">${l.name}</g:link></li>
					  </g:each>
				  </ul>
			  </div>
            
            <div id="mailingListInstance" class="dialog round">
                <h2>${mailingListInstance?.name}</h2>
				<p><strong>Description: </strong> ${mailingListInstance?.description}</p>
				<p><strong>Email Subject: </strong> ${mailingListInstance?.subjectPrefix}</p>
				<h2>Members:</h2>
                <ul>
                    <g:each var="m" in="${mailingListInstance.members}">
                        <li>
							${m?.display} :
							<strong>${m?.address}</strong>
                        </li>
                    </g:each>
                </ul>
            </div>
        </div>
    </body>
</html>
