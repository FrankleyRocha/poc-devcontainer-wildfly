package io.github.frankleyrocha.hello_wildfly.config;

import jakarta.ws.rs.ApplicationPath;
import jakarta.ws.rs.core.Application;

@ApplicationPath("/api")
public class JakartaRestConfig extends Application {
    // Classe de configuração do JAX-RS
}