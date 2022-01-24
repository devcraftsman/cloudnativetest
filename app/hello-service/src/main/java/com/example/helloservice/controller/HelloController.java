package com.example.helloservice.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by devcraftsman on 1/24/22.
 * ----------------------------------------------------
 * This software is licensed under the Apache 2 license
 * see: [http://www.apache.org/licenses/LICENSE-2.0]
 **/

@RestController
public class HelloController {

    @GetMapping("/hello")
    public String index() {
        return "Hello Kubernetes!";
    }


}