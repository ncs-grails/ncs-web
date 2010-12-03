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
		// TODO:
	}

	def getMember = { address ->
		// load a member
		// load their lists
		// TODO:
	}

	def updateMember = { address, display ->
		// update a member's display name
		// from their email address
		// TODO:
	}

	def addMember = { list, member ->
		// Add a member to a list
		// TODO:
	}

	def removeMember = { list, member ->
		// Add a member to a list
		// TODO:
	}
}
