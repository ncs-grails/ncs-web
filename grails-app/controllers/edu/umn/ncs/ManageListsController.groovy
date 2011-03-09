package edu.umn.ncs

import org.codehaus.groovy.grails.plugins.springsecurity.Secured

@Secured(['ROLE_LIST_VIEWER'])
class ManageListsController {

	def mailingListService
	def authenticateService

    def index = { redirect(action:list, params:params) }

	def list = {
		def mailingListInstanceList = mailingListService.getLists()
		
		def breadCrumb = [ [ name:'NCS Email Lists' ] ]
		
		[ mailingListInstanceList: mailingListInstanceList
			, breadCrumb: breadCrumb ]
	}

	def show = {
		def mailingListInstance = mailingListService.getList(params.id)
		def mailingListAuthorityInstance = MailingListAuthority.findByListName(mailingListInstance.name)

		def breadCrumb = [ [ name:'NCS Email Lists', controller: 'manageLists']
			, [name:mailingListInstance.name] ]
		
		if ( ! mailingListInstance ) {
    	    flash.message = "List Not Found! ( id : ${params.id} )"
            redirect(action:list)
		} else {
			if (mailingListAuthorityInstance) {
				def listAuthority = mailingListInstance.members
					.find{ it.address == mailingListAuthorityInstance?.address }
				if (listAuthority) {
					mailingListAuthorityInstance.display = listAuthority.display
				}
			}
		}
		
		[ mailingListInstance: mailingListInstance
			, mailingListAuthorityInstance: mailingListAuthorityInstance
			, breadCrumb: breadCrumb ]
	}

	def memberList = {
		def mailingListInstance = mailingListService.getList(params.id)
		
		if ( ! mailingListInstance ) {
			flash.message = "List Not Found! ( id : ${params.id} )"
			redirect(action:list)
		}
		
		[ mailingListInstance: mailingListInstance ]
	}
	
	def findMember = {
		def mailingListMemberInstanceList = mailingListService.getMembers()
		
		[ mailingListMemberInstanceList: mailingListMemberInstanceList ]
	}
	
	def showMember = {
		def mailingListMemberInstance = mailingListService.getMember(params.id)
		
		[ mailingListMemberInstance: mailingListMemberInstance ]
	}
	
	@Secured(['ROLE_REMOVE_LIST_MEMBER'])
	def deleteMember = {
		def address = params.address
		def listName = params.list.name
		
		mailingListService.removeMember(listName, address)
		
		flash.message = "Removed ${address} from ${listName}"
		
		redirect(action:show, id:listName)
	}
	
	@Secured(['ROLE_EDIT_LIST_MEMBER'])
	def updateMember = {
		def address = params.address
		def display = params.display
		def listName = params.list.name
		
		def newMember = new MailingListMember(address:address, 
			display:display,
			isGroup: false)
		
		if (! newMember.validate() ) {
			flash.message = "Sorry, invalid email address: ${address}."
		} else {
			def addressOriginal = params.addressOriginal
			def displayOriginal = params.displayOriginal
			
			if (address != addressOriginal) {
				mailingListService.changeEmailAddress(listName, addressOriginal, address, display)
				flash.message = "Changed ${display}'s address from ${addressOriginal} to ${address}"
			} else if (display != displayOriginal) {
				mailingListService.updateMember(addressOriginal, display)
				flash.message = "Updated ${address}'s name to ${display}"
			} else {
				flash.message = "Nothing to update for ${address}."
			}
		}
		redirect(action:show, id:listName)
		
	}

	@Secured(['ROLE_ADD_LIST_MEMBER'])
	def addMember = {
		def address = params.address
		def display = params.display
		def listName = params.list.name
		
		mailingListService.addMember(listName, address, display)
		flash.message = "Added ${display} &lt;${address}&gt; to ${listName}"
		
		redirect(action:show, id:listName)
	}
	
	@Secured(['ROLE_ASSIGN_LIST_AUTH'])
	def assignAuthority = {
		
		def username = authenticateService.principal()
		
		def address = params.address
		def display = params.display
		def listName = params.list.name
		
		if (listName && address) {
			def mailingListAuthorityInstance = MailingListAuthority.findByListName(listName)
			if (! mailingListAuthorityInstance) {
				mailingListAuthorityInstance = new MailingListAuthority( 
					listName:listName , address: address)
			} else {
				mailingListAuthorityInstance.address = address
			}
			mailingListAuthorityInstance.display = display
			
			mailingListAuthorityInstance.lastUpdated = new Date()
			mailingListAuthorityInstance.userUpdated = username
			
			mailingListAuthorityInstance.save(flush:true)
		}
		
		flash.message = "Assigned ${address} as list authority for ${listName}"
		
		redirect(action:show, id:listName)
	}
}
