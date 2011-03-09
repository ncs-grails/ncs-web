package edu.umn.ncs

class MailingListMember {
	String display
	String address
	Boolean isGroup

	static belongsTo = MailingList
	static hasMany = [ lists : MailingList ]

	String toString() { address }

    static constraints = {
		display(nullable:true)
		address(email:true)
		isGroup()
    }
}
