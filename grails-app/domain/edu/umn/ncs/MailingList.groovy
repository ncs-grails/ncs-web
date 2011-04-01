package edu.umn.ncs

class MailingList {

	String name
	String description
	String subjectPrefix

	static hasMany = [ members : MailingListMember ]

	String toString() { name }
	
	String getPreferredName() {
		if ( name == "NCS_UMN_Info" ) {
			return "Info"
		} else if ( name == "NCS_UMN_Operations" ) {
			return "Operations"
		} else {
			return name
		}
	}

	String getEmail() {
		if ( name == "NCS_UMN_Info" ) {
			return "info@ncs.umn.edu"
		} else if ( name == "NCS_UMN_Operations" ) {
			return "operations@ncs.umn.edu"
		} else {
			return "${name}@lists.ncs.umn.edu"
		}
	}

	static transients = [ 'preferredName', 'email' ]

    static constraints = {
		name()
		description(nullable:true)
		subjectPrefix(nullable:true)
    }
}
