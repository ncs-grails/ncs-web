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
            <h2>Mailing List Details : ${mailingListInstance?.preferredName}</h2>

			<g:if test='${flash.message}'>
				<div class="whitebox shadow">
					<div class='message'>${flash.message}</div>
				</div>
			</g:if>

			<g:if test="${flash.messages}">
				<div class="whitebox shadow">
					<g:each in="${flash.messages}">
						<div class='message'>${it}</div>
					</g:each>
				</div>
			</g:if>

            <p>The following information is regarding the
			  ${mailingListInstance?.preferredName} mailing list</p>

            <div id="mailingListInstance" class="dialog round">
				<g:ifAnyGranted role="ROLE_LIST_ADMIN">
				<h2>Administration</h2>
					<p>You can access <a href="http://lists.ncs.umn.edu/admin/${mailingListInstance?.name}">the Mailman Administration page
					here.</a></p>
				</g:ifAnyGranted>
				
				<h2>List Authority</h2>
				<p>${mailingListAuthorityInstance?.display} : 
					<a href="mailto:${mailingListAuthorityInstance?.address}">${mailingListAuthorityInstance?.address}</a>
				<g:ifAnyGranted role="ROLE_ASSIGN_LIST_AUTH">
                	<span style="float:right;">
                		<button type="button" name="enableAssign" onclick="return assignListAuthority();">Assign List Authority</button>
                   	</span>
                   	<ul class="recipientList" id="authorityList" style="display:none;">
	                    <g:each var="m" status="i" in="${mailingListInstance.members.sort{ it.address } }">
	                        <li class="${(i % 2) == 0  ? 'odd' : 'even'}">
	                        	<g:form action="assignAuthority" style="display: inline;">
	                        		<g:if test="${ m?.address != mailingListAuthorityInstance?.address }" >
										<button type="submit" name="assign" value="Assign">Assign</button>
									</g:if>
	                        		<g:hiddenField name="list.name" value="${mailingListInstance?.name}" />
									<g:hiddenField name="display" value="${m?.display}" />
									<g:hiddenField name="address" value="${m?.address}" />
									${m?.display} : <strong>${m?.address}</strong>
								</g:form>
	                        </li>
	                    </g:each>
	                </ul>
				</g:ifAnyGranted>
				</p>
				
					
                <h2>${mailingListInstance?.name}</h2>
				<p><strong>Description: </strong> ${mailingListInstance?.description}</p>
				<p><strong>Email Address: </strong> <a href="mailto:${mailingListInstance?.email}">
				${mailingListInstance?.email}</a></p>
				<p><strong>Email Subject: </strong> ${mailingListInstance?.subjectPrefix}</p>
				
				<h2>
					Members: ${mailingListInstance.members.size()}
					<g:ifAnyGranted role="ROLE_ADD_LIST_MEMBER">
						<span class="addMembersSpan">
							<button type="button" class="ro" name="btnAddMembers" onclick="return showAddMembers($(this));">Add Members</button>
						</span>
					</g:ifAnyGranted>
				</h2>
				<g:ifAnyGranted role="ROLE_ADD_LIST_MEMBER">
                	<g:form name="addMembers" action="addMembers" style="display: none;">
                		<g:hiddenField name="list.name" value="${mailingListInstance?.name}"/>
                		<h3 class="i">
                			Example:
                			<div class="example">John Smith &lt;johns@hotmail.com&gt;</div>
                			<div class="example">Angela Davis &lt;adavis@umn.edu&gt;</div>
                			<div class="example">Robert Williams &lt;bwill@gmail.com&gt;</div>
                		</h3>
                		<g:textArea class="textarea-grey shadow" name="addressDisplayList" rows="10" cols="45"/>
                		<div class="subscribeButtons">
		                	<button type="submit" name="subscribe" value="Subscribe" >Subscribe</button>
		                	<button type="button" name="cancelSubscribe" value="Cancel" onclick="return cancelAddMembers();">Cancel</button>
		                </div>                		
                	</g:form>				
				</g:ifAnyGranted>
				
                <ul class="recipientList">
                    <g:each status="i" var="m" in="${mailingListInstance.members.sort{ it.address }}">
                        <li class="${(i % 2) == 0  ? 'odd' : 'even'}">
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
