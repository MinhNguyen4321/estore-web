package com.eshop.service;

import com.eshop.entity.Authority;

import java.util.List;

public interface AuthorityService {
    List<Authority> getAll();
    Authority save(Authority authority);
    void delete(Long authorityId);
}
