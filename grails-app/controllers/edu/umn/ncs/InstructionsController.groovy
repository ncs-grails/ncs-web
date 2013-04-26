package edu.umn.ncs

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_NCS_IT'])
class InstructionsController {

    def index = { redirect(controller:"info") }
	
	def listChanges = {
		def breadCrumb = [ [ name:'Instructions' ]
			,[ name:'Request List Changes' ] ]
		
		[ breadCrumb: breadCrumb ]
	}
	def newList = {
		def breadCrumb = [ [ name:'Instructions' ]
			, [ name:'Request New List' ] ]
		
		[ breadCrumb: breadCrumb ]
	}
}
