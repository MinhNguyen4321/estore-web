package com.eshop.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "Verification_Token")
public class VerificationToken {
    public static final int EXPIRATION = 10;
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id", nullable = false)
    private Integer id;

    @Column(name = "Token", nullable = false, length = 30)
    private String token;

    @OneToOne(optional = false)
    @JoinColumn(name = "UserId", nullable = false)
    private User user;

    @Column(name = "ExpiryDate", nullable = false)
    private Date expiryDate;

}