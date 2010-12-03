package edu.umn.ncs

import org.codehaus.groovy.grails.plugins.springsecurity.Secured
import grails.converters.*
import edu.umn.auth.User
import edu.umn.auth.Role

@Secured(['ROLE_ADMIN'])
class ManageAccessController {

    def index = { redirect(action:list,params:params) }
    
    def list = {
    	def userInstanceList = User.list(sort:"userRealName")
    	[ userInstanceList: userInstanceList ]
    }
    
    def edit = {

    	def userInstanceList = User.list(sort:"userRealName")
    	def roleInstanceList = Role.list(sort:"description")
    	def userInstance = User.get( params.id )
    	if ( ! userInstance ) {
    	    flash.message = "User Not Found! ( id : ${params.id} )"
            redirect(action:list)
        }
        else {
            return [ userInstance : userInstance, 
            	userInstanceList: userInstanceList,
            	roleInstanceList: roleInstanceList ]
        }
    }
    
    // The following are used as AJAX calls, and return JSON 
    def add = {
    	addRemove( params, 'add' )
    }
    
    def remove = {
    	addRemove( params, 'remove' )
    }
    
    private def addRemove = { params, doWhat -> 
    	def userInstance = User.get( params?.user?.id )
    	def roleInstance = Role.get( params?.role?.id )
    	
    	def success = false
    	def errors = []
    
    	if ( !userInstance ) {
			errors.add("User ${params?.user?.id} not found")
    	} else if ( !roleInstance ) {
			errors.add("Role ${params?.role?.id} not found")
    	} else {
			if (doWhat == 'remove') {
				userInstance.removeFromAuthorities(roleInstance)
			} else if ( doWhat == 'add' ) {
				userInstance.addToAuthorities(roleInstance)
			}
			
			if( !userInstance.hasErrors() && userInstance.save(flush:true) ) {
				success = true
            } else {
				userInstance.errors.each{ err ->
					errors.add("${err}")
				}
            }
	    }
	    def output = [success: success, errors: errors]
		render output as JSON
    }
    
}
