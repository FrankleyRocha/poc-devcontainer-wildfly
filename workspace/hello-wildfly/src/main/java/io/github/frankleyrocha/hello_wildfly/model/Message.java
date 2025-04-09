package io.github.frankleyrocha.hello_wildfly.model;

import java.util.UUID;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

@Entity @Data
public class Message {

    @Id @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    private String title;

    private String description;

}
