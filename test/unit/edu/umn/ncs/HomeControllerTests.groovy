package edu.umn.ncs

import grails.test.*

class HomeControllerTests extends ControllerUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testIndex() {
		def c = new HomeController()

		assert c.index

    }
}
