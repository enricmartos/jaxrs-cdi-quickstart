package service;

import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/sayHello")
public class HelloWorldServlet {

    @Inject
    HelloWorldService injectee;

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String sayHello() {
        return "Injected service says: " + injectee.sayHi();
    }

}
