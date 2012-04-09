package edu.umn.ncs

class MailingListAuthority {
	String listName
	String address
	String display
	
	
	Date lastUpdated = new Date()
	String userUpdated
	
	String toString() { "${display} &lt;${address}&gt;" }
	
    static constraints = {
		listName(unique:true)
		address(email:true)
		display(nullable:true)
		lastUpdated(nullable:true)
		userUpdated(nullable:true)
    }
}
