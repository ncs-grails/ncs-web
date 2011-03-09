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

			<g:if test='${flash.message}'>
				<div class="whitebox shadow">
					<div class='message'>${flash.message}</div>
				</div>
			</g:if>

            <p>The following information is regarding the
			  ${mailingListInstance?.name} mailing list</p>

            <div id="mailingListInstance" class="dialog round">
				<g:ifAnyGranted role="ROLE_LIST_ADMIN">
				<h2>Administration</h2>
					<p>You can access <a href="http://lists.ncs.umn.edu/admin/${mailingListInstance?.name}">the Mailman Administration page
					here.</a></p>
				</g:ifAnyGranted>
				
				<h2>List Authority</h2>
				<p>TODO</p>
				<g:ifAnyGranted role="ROLE_ASSIGN_LIST_AUTH">
					<p>TODO: Assign List Authority</p>
				</g:ifAnyGranted>
				
					
                <h2>${mailingListInstance?.name}</h2>
				<p><strong>Description: </strong> ${mailingListInstance?.description}</p>
				<p><strong>Email Address: </strong> <a href="mailto:${mailingListInstance?.name}@lists.ncs.umn.edu">
				${mailingListInstance?.name}@lists.ncs.umn.edu</a></p>
				<p><strong>Email Subject: </strong> ${mailingListInstance?.subjectPrefix}</p>
				
				<h2>Members: ${mailingListInstance.members.size()}</h2>
                <ul class="recipientList">
                    <g:each var="m" in="${mailingListInstance.members.sort{ it.address }}">
                        <li>
                        	<g:form action="updateMember" style="display: inline;">
                        		<g:hiddenField name="list.name" value="${mailingListInstance?.name}" />
								<span class="readOnly fullName">${m?.display}</span>
								<g:textField class="editable" name="display" value="${m?.display}" style="display:none;"/>								
								<g:hiddenField name="displayOriginal" value="${m?.display}" />
								:
								<span class="readOnly"><strong>${m?.address}</strong></span>
								<g:textField class="editable" name="address" value="${m?.address}" style="display:none;"/>
								<g:hiddenField name="addressOriginal" value="${m?.address}" />
								<span style="float:right;">
									<g:ifAnyGranted role="ROLE_EDIT_LIST_MEMBER">
									<button type="button" class="readOnly" name="edit" onclick="return showMemberEdit($(this));">Edit</button>
									<button type="submit" style="display:none;" class="editable" name="save" value="Save">Save</button>
									</g:ifAnyGranted>
									<g:ifAnyGranted role="ROLE_REMOVE_LIST_MEMBER">
										<button type="submit" class="readOnly" name="remove" value="Remove" onclick="return removeMemberConfirm($(this));">Remove</button>
									</g:ifAnyGranted>
									<button type="button" style="display:none;" class="editable" name="cancel" onclick="return cancelMemberEdit($(this));">Cancel</button>
								</span>
							</g:form>
                        </li>
                    </g:each>
                </ul>
                
                <g:ifAnyGranted role="ROLE_ADD_LIST_MEMBER">
	                <p style="padding-right: 0;">	&nbsp;
	                	<span style="float:right;">
	                		<button type="button" class="readOnly" name="add" onclick="return showAddMember($(this));">Add New Member</button>
	                   	</span>
	                	<g:form name="addMember" action="addMember" style="display:none;">
	                		&nbsp;
	    	            	<span style="float:right;">
		                		<g:hiddenField name="list.name" value="${mailingListInstance?.name}" />
		                		Name:
		                		<g:textField class="maroon-border" name="display" value="${memberInstance?.display}" />
		                		Email:
		                		<g:textField class="maroon-border" name="address" value="${memberInstance?.address}" />
		                		<button style="submit" name="add" >Add Member</button>
		                	</span>
	                	</g:form>
	                </p>
                </g:ifAnyGranted>
            </div>
        </div>
    </body>
</html>
