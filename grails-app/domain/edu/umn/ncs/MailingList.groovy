package edu.umn.ncs

class MailingList {

	String name
	String description
	String subjectPrefix

	static hasMany = [ members : MailingListMember ]

	String toString() { name }

    static constraints = {
		name()
		description(nullable:true)
		subjectPrefix(nullable:true)
    }
}
