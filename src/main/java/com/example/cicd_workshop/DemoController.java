package com.example.cicd_workshop;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1")
public class DemoController {




    @GetMapping("")
    ResponseEntity<String> get(){
        return new ResponseEntity<>("App deployed!", HttpStatus.OK);
    }
}
