package com.jobportal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LogTest {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(LogTest.class);

	public static void main(String[] args) {

		LOGGER.trace("This is the simplest debug statement");
		LOGGER.debug("This is the simplest debug statement");
		LOGGER.info("This is the simplest debug statement");
		LOGGER.warn("asdasdasd`");
		LOGGER.error("This is the simplest debug statement");
		
	}

}
