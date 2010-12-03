package edu.umn.auth

import edu.umn.auth.Role

/**
 * User domain class.
 */
class User {
	static transients = ['pass']
	static hasMany = [authorities: Role]
	static belongsTo = Role

	/** Username */
	String username
	/** User Real Name*/
	String userRealName
	/** MD5 Password */
	String passwd = null
	/** enabled */
	boolean enabled = true

	String email
	boolean emailShow = false

	/** description */
	String description = ''

	/** plain password to create a MD5 password */
	String pass = '[secret]'

	String toString() { username }

	static constraints = {
		username(blank: false, unique: true)
		userRealName(blank: false)
		passwd(nullable: true)
		enabled()
	}
}
