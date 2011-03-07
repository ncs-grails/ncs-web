<html>
    <head>
        <title>Manage Mailing List</title>
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
            <h2>Mailing List Details : ${mailingListInstance?.name}</h2>
            <p>The following information is regarding the
			  ${mailingListInstance?.name} mailing list</p>

            <div id="mailingListInstance" class="dialog round">
				<h2>Administration</h2>
					<p>You can access <a href="http://lists.ncs.umn.edu/admin/${mailingListInstance?.name}">the Mailman Administration page
					here.</a></p>
				
				<h2>List Authority</h2>
					<p>TODO</p>
					
                <h2>${mailingListInstance?.name}</h2>
				<p><strong>Description: </strong> ${mailingListInstance?.description}</p>
				<p><strong>Email Address: </strong> <a href="mailto:${mailingListInstance?.name}@lists.ncs.umn.edu">
				${mailingListInstance?.name}@lists.ncs.umn.edu</a></p>
				<p><strong>Email Subject: </strong> ${mailingListInstance?.subjectPrefix}</p>
				
				<h2>Members: ${mailingListInstance.members.size()}</h2>
                <ul class="recipientList">
                    <g:each var="m" in="${mailingListInstance.members}">
                        <li>
							<span class="readOnly fullName">${m?.display}</span>
							<g:textField class="editable" name="display" value="${m?.display}" style="display:none;"/>
							:
							<span class="readOnly"><strong>${m?.address}</strong></span>
							<g:textField class="editable" name="address" value="${m?.address}" style="display:none;"/>
							
							<span style="float:right;">
								<a class="readOnly" href="#" onclick="return showMemberEdit($(this));">Edit</a>
								<a style="display:none;" class="editable" href="#">Save</a>
								|
								<a class="readOnly" href="#" onclick="return removeMemberConfirm($(this));">Remove</a>
								<a style="display:none;" class="editable" href="#" onclick="return cancelMemberEdit($(this));">Cancel</a>
							</span> 
							
                        </li>
                    </g:each>
                </ul>
                <p>	&nbsp;
                	<span style="float:right;">
                	<g:link action="addMembers">Add New Members</g:link>
                	</span>
                </p>
                
            </div>
        </div>
    </body>
</html>
