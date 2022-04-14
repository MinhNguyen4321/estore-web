package com.eshop.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.eshop.service.RoleService;

@RestController
@RequestMapping("/api/roles")
public class RoleRestController {
    @Autowired
    RoleService roleService;

    @GetMapping
    public ResponseEntity<?> getAll() {
        return ResponseEntity.ok(roleService.getAll());
    }
}
