package com.eshop.controller.api;

import java.util.Map;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.eshop.entity.Order;
import com.eshop.service.OrderService;
import com.eshop.utils.MessageUtils;

@RestController
@CrossOrigin("*")
@RequestMapping("/api/orders")
public class OrderRestController {
    @Autowired
    OrderService orderService;
    @Autowired
    MessageUtils messageUtils;
    @Autowired
    ModelMapper mapper;

	@PostMapping
    public ResponseEntity<Order> addOrder(@RequestBody Map<String, Object> data) {

        String fullname = (String) data.get("fullname");
        String phoneNumber = (String) data.get("phoneNumber");
        String address = (String) data.get("address");
        String email = (String) data.get("email");

        Order result = orderService.createOrder(fullname, email, address, phoneNumber);
        return result != null ? ResponseEntity.ok(result) : ResponseEntity.badRequest().build();
    }
}
