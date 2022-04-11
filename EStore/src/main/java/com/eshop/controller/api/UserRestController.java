package com.eshop.controller.api;

import com.eshop.dto.UserDTO;
import com.eshop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/users")
public class UserRestController {
    @Autowired
    private UserService userService;

    @RequestMapping("/{id}/{status}")
    public ResponseEntity<?> updateStatus(@PathVariable Integer id, @PathVariable Boolean status) {
        userService.updateStatus(id, status);
        return ResponseEntity.ok().build();
    }

    @GetMapping
    public ResponseEntity<?> getAll() {
        List<UserDTO> users = userService.getAll();
        return ResponseEntity.ok(users);
    }

   @PutMapping("/{id}")
    public ResponseEntity<?> update(@PathVariable Integer id, @ModelAttribute UserDTO userDTO) {
        return ResponseEntity.ok(userService.save(userDTO));
    }

    @PostMapping
    public ResponseEntity<?> save(@ModelAttribute UserDTO userDTO) {
        return ResponseEntity.ok(userService.save(userDTO));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> delete(@PathVariable Integer id) {
        userService.delete(id);
        return ResponseEntity.ok().build();
    }
}
