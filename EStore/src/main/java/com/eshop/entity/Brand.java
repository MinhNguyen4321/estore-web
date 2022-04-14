// Generated with g9.

package com.eshop.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@Entity
public class Brand {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="Id", unique=true, nullable=false, precision=10)
    private int id;

    @Column(name="Name", nullable=false, length=50)
    private String name;

    @Column(name = "Slug", nullable = false, length = 50)
    private String slug;
    
    @JsonIgnore
    @OneToMany(mappedBy = "brand")
    private List<Product> products = new ArrayList<>();

}
