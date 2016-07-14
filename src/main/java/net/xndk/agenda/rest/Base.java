package net.xndk.agenda.rest;


import static javax.ws.rs.core.MediaType.TEXT_PLAIN;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;;

@Path("base")
public class Base {
	@GET
	@Produces(TEXT_PLAIN)
	public String helloWorld() {
		return "Hello, World.";
	}

}
