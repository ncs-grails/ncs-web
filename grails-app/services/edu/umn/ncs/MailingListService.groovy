package edu.umn.ncs

import grails.converters.*

class MailingListService {

    static transactional = true

	private def urlBase = 'http://lists.ncs.umn.edu/rest/'

	// NOTE:
	// Because the lists are NOT stored in a database,
	// all the list actions have to be performed through this
	// service, rather than via GORM routines.

    def getLists = {
		def lists = []

		// returns all mailing lists
		def url = new URL("${urlBase}lists/")

		def conn = url.openConnection()
		conn.doOutput = true
		conn.connect()
		if (conn.responseCode == 200) {
			def json = conn.content.text
			def response = JSON.parse(json)
			response.each{
				def list = new MailingList(it)
				lists.add(list)
			}
		}
		return lists
    }

	def getListNoMembers = { listname ->
		// Get a list, but not the members of the list
		def list = null
		
		def url = new URL("${urlBase}lists/${listname}")
		def conn = url.openConnection()
		conn.doOutput = true
		conn.connect()
		if (conn.responseCode == 200) {
			def json = conn.content.text
			def response = JSON.parse(json)
			list = new MailingList(response)
		}
		
		return list
	}
	
	def getList = { listname ->

		def list = null

		// Part 1, get list details

		def url = new URL("${urlBase}lists/${listname}")
		def conn = url.openConnection()
		conn.doOutput = true
		conn.connect()
		if (conn.responseCode == 200) {
			def json = conn.content.text
			def response = JSON.parse(json)
			list = new MailingList(response)
		}

		// Part 2, get list members
		if (list) {
			list.members = []
			
			url = new URL("${urlBase}members/${listname}")
			conn = url.openConnection()
			conn.doOutput = true
			conn.connect()
			if (conn.responseCode == 200) {
				def json = conn.content.text
				def response = JSON.parse(json)
				response.each{
					def member = new MailingListMember(it)
					list.members.add(member)
				}
			}
		}

		return list
	}

	def getMembers = {
		// list all members

		def members = []
		
		// returns all mailing list members
		def url = new URL("${urlBase}members/")

		def conn = url.openConnection()
		conn.doOutput = true
		conn.connect()
		if (conn.responseCode == 200) {
			def json = conn.content.text
			def response = JSON.parse(json)
			response.each{
				def list = new MailingListMember(it)
				members.add(list)
			}
		}
		return members
	}

	def getMember = { address ->
		// load a member's lists
		def url = new URL("${urlBase}members/${address}")
		def lastList = ""
		def member = new MailingListMember(address:address, isGroup:false)
		
		member.lists = []
		
		def conn = url.openConnection()
		conn.doOutput = true
		conn.connect()
		if (conn.responseCode == 200) {
			def json = conn.content.text
			def response = JSON.parse(json)
			response.each{
				lastList = it
				def list = getListNoMembers(it)
				member.lists.add(list)
			}
		}
		
		// If a user is a member of a list..
		if (lastList) {
			def firstList = getList( lastList )
			// ... and find them in the list
			def selfInstance = firstList.members.find{ it.address == address }
			// and copy the display information to the local member variable
			if (selfInstance ) {
				member.display = selfInstance.display
				member.isGroup = selfInstance.isGroup
			}
		}
		return member
	}

	def updateMember = { address, display ->
		// update a member's display name
		// from their email address

		def url = new URL("${urlBase}members/${address}/${display.encodeAsURL()}")

		def conn = url.openConnection()
		conn.setRequestMethod("PUT")
		conn.connect()
		if (conn.responseCode != 200) {
			return false
		} else {
			return true
		}
	}

	def changeEmailAddress = { list, old_address, new_address, display ->
		// update a member's display name
		// from their email address

		def url = new URL("${urlBase}members/${list}/${old_address}/${new_address}/${display.encodeAsURL()}")

		def conn = url.openConnection()
		conn.setRequestMethod("PUT")
		conn.connect()
		if (conn.responseCode != 200) {
			return false
		} else {
			return true
		}
	}

	def addMember = { list, address, display ->
		// Add a member to a list
		def url = new URL("${urlBase}members/${list}/${address}/${display.encodeAsURL()}")

		def conn = url.openConnection()
		conn.setRequestMethod("POST")
		conn.connect()
		if (conn.responseCode != 200) {
			return false
		} else {
			return true
		}
	}

	def removeMember = { list, address ->
		// Remove a member from a list
		def url = new URL("${urlBase}members/${list}/${address}")

		def conn = url.openConnection()
		conn.setRequestMethod("DELETE")
		conn.connect()
		if (conn.responseCode != 200) {
			return false
		} else {
			return true
		}
	}
}
