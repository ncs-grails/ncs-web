package edu.umn.ncs

import org.codehaus.groovy.grails.plugins.springsecurity.Secured

@Secured(['ROLE_ASSIGN_LIST_AUTH','ROLE_ADD_MEMBER','ROLE_REMOVE_MEMBER','ROLE_EDIT_MEMBER','ROLE_VIEW_MAILMAN_ADMIN_PAGE'])
class ManageListsController {

	def mailingListService

    def index = { redirect(action:list, params:params) }

	def list = {
		def mailingListInstanceList = mailingListService.getLists()
		
		[ mailingListInstanceList: mailingListInstanceList ]
	}

	def show = {
		def mailingListInstance = mailingListService.getList(params.id)
		def mailingListInstanceList = null
		
		if ( ! mailingListInstance ) {
    	    flash.message = "List Not Found! ( id : ${params.id} )"
            redirect(action:list)
		} else {
			mailingListInstanceList = mailingListService.getLists()
		}
		
		[ mailingListInstance: mailingListInstance, mailingListInstanceList: mailingListInstanceList ]
	}
}
