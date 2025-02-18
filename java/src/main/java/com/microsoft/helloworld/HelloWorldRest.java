package com.microsoft.helloworld;

import java.text.SimpleDateFormat;
import java.util.Date;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("helloworld")
public class HelloWorldRest {

    /**
     * Method handling HTTP GET requests. The returned object will be sent to
     * the client as "text/plain" media type.
     *
     * @return String that will be returned as a text/plain response.
     */
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String ping() {
        SimpleDateFormat formatter = new SimpleDateFormat("hh:mm:ss zzzz");
        String formattedDate = formatter.format(new Date());
      	return "Hello from your Dockerized API App (written in Java), it's now " + formattedDate;
    }
}
