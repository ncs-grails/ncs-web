package edu.umn.ncs

import grails.test.*

class InfoControllerTests extends ControllerUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testSomething() {
		def c = new InfoController()

		assert c.index

    }
}
