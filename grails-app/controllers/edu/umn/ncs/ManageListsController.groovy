package edu.umn.ncs

import grails.plugins.springsecurity.Secured
import org.joda.time.LocalDate;


@Secured(['ROLE_NCS_LIST_VIEWER'])
class ManageListsController {
	
	def mailingListService
	def springSecurityService
	
	static def debug = false
	
    def index = { redirect(action:list, params:params) }

	def list = {
		def mailingListInstanceList = mailingListService.getLists()
		
		
		
		/*def mailingListAuthorityInstanceList = []
		def mailingListAuthorityInstance = null
		
		mailingListInstanceList.each {
			mailingListAuthorityInstance = MailingListAuthority.findByListName(it.preferredName)
			if (mailingListAuthorityInstance?.allowLyris) {
				mailingListAuthorityInstanceList << mailingListAuthorityInstance
			}
			
		}*/
		
		def breadCrumb = [ [ name:'NCS Email Lists' ] ]
		
		/*if (debug) {
			println "mailingListInstanceList: ${mailingListInstanceList} ${mailingListAuthorityInstanceList}"
			
		}*/
	
		[ mailingListInstanceList: mailingListInstanceList.sort{it.preferredName}
			, breadCrumb: breadCrumb
			/*, mailingListAuthorityInstanceList: mailingListAuthorityInstanceList*/ ]
	}

	def show = {
		def mailingListInstance = mailingListService.getList(params.id)
		def mailingListAuthorityInstance = MailingListAuthority.findByListName(mailingListInstance.name)

		if (debug) {
			println " mailingListAuthorityInstance: ${mailingListAuthorityInstance}"
			println " mailingListInstance: ${mailingListInstance}"
		}
		
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

	// this will export all members of a list in CSV format
	def exportCsv = {
		
		def mailingListInstance = mailingListService.getList(params.id)
		//def mailingListAuthorityInstance = MailingListAuthority.findByListName(mailingListInstance.name)
		
		if (debug) {
			println "mailingListInstance: ${mailingListInstance}" 
			println "params.id: ${params.id}"
		}
			
		if (mailingListInstance) {
			def jodaRefDate = new LocalDate()
			def now = new Date()
			def datestamp = g.formatDate(date:now, format:"yyyy-MM-dd")
			def fileName = "${mailingListInstance.name}-members-${datestamp}.csv"
			def segment = "${jodaRefDate.monthOfYear}:${jodaRefDate.year}" // needed for Lyris segment criterion 
				
			response.setHeader("Content-disposition", "attachment; filename=${fileName}")
			response.contentType = "application/vnd.ms-excel"
	
			def out = response.outputStream
	
			// header per Lyris specs
			out << '"FullName_","EmailAddr_","Generic_01","Generic_02"'
			out << "\n"
			
			mailingListInstance.members.each{ m ->
				
				out << '"' + m.display + '",'
				out << '"' + m.address + '",'
				out << '"' + mailingListInstance.name + '",'
				out << '"' + segment + '"'
				out << '\n'
				
				if (debug) {
						println "out: ${m.display} ${m.address}"
				}
				
		
			}
			out.flush()
			out.close()
		} else {
			render "Invalid Mailing List passed."
		}
		
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
		
		
		def breadCrumb = [ [ name:'NCS Email Lists', controller:'manageLists', action:'list' ],[ name:'Find List Member' ] ]
		
		[ mailingListMemberInstanceList: mailingListMemberInstanceList.sort{it.display}
			, breadCrumb: breadCrumb ]
	}
	
	def showMember = {
		def mailingListMemberInstance = mailingListService.getMember(params.id)
		
		[ mailingListMemberInstance: mailingListMemberInstance ]
	}
	
	@Secured(['ROLE_NCS_REMOVE_LIST_MEMBER'])
	def deleteMember = {
		def address = params.address
		def listName = params.list.name
		
		mailingListService.removeMember(listName, address)
		
		flash.message = "Removed ${address} from ${listName}"
		
		redirect(action:show, id:listName)
	}
	
	@Secured(['ROLE_NCS_EDIT_LIST_MEMBER'])
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
				if (mailingListService.changeEmailAddress(listName, addressOriginal, address, display)) {
					flash.message = "Changed ${display}'s address from ${addressOriginal} to ${address}"
				} else {
					flash.message = "Failed to changed ${display}'s address from ${addressOriginal} to ${address}"
				}
			} else if (display != displayOriginal) {
				if (mailingListService.updateMember(addressOriginal, display)) {
					flash.message = "Updated ${address}'s name to ${display}"
				} else {
				flash.message = "Failed to updated ${address}'s name to ${display}"
				}
			} else {
				flash.message = "Nothing to update for ${address}."
			}
		}
		redirect(action:show, id:listName)
		
	}

	@Secured(['ROLE_NCS_ADD_LIST_MEMBER'])
	def addMember = {
		def address = params.address
		def display = params.display
		def listName = params.list.name
		
		def newMember = new MailingListMember(address:address, 
			display:display, 
			isGroup: false)
		println "addMember: ${listName} b*${address}*e b*${display}*e"
		if (!newMember.validate()) {
			if (address.indexOf('<') || address.indexOf('>')) {
				flash.message = "Sorry, invalid email address: ${address.encodeAsHTML()}.Try removing brackets around email."
			} else {
			flash.message = "Sorry, invalid email address: ${address.encodeAsHTML()}."
			}
		} else {
			if (mailingListService.addMember(listName, address, display)) {
				flash.message = "Added ${display} &lt;${address}&gt; to ${listName}"
			} else {
				flash.message = "Failed to add ${display} &lt;${address}&gt; to ${listName}. First, check if ${address} already on ${listName} list. Brackets around email or other punctuation may also be the problem."
			}
		}
		
		redirect(action:show, id:listName)
	}
	
	@Secured(['ROLE_NCS_ADD_LIST_MEMBER'])
	def addMembers = {

		def listName = params.list.name
		String[] members = params.addressDisplayList.split('\n')
		String flashMessage = "";
		def messages = []
		
		members.each{
			if (it.indexOf('<') > -1 && it.indexOf('>') > -1) {
				def display = it.substring(0,it.indexOf('<') - 1)
				def address = it.substring(it.indexOf('<') + 1, it.indexOf('>'))
	
				def newMember = new MailingListMember(address:address,
					display:display,
					isGroup: false)
				
				if (!newMember.validate()){
					messages << "Sorry, invalid email address: ${address} for ${display}."
				} else {
					if (mailingListService.addMember(listName, address, display)) {
						messages << "Added ${display} &lt;${address}&gt; to ${listName}"
					} else {
						messages << "Failed to add ${display} &lt;${address}&gt; to ${listName}. First, check if ${address} already on ${listName} list. Conflicting punctuation in the email may be the problem."
					}
				}
			} else {
				messages << "Failed to add ${it.encodeAsHTML()} to ${listName}. Missing bracket(s) around email."
			}
			
		}
		flash.messages = messages
		
		redirect(action:show, id:listName)
	}
	
	@Secured(['ROLE_NCS_ASSIGN_LIST_AUTH'])
	def assignAuthority = {
		
		def username = springSecurityService.principal?.username
		
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
