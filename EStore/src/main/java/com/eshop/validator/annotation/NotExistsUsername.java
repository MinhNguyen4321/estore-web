package com.eshop.validator.annotation;

import com.eshop.validator.NotExistsUsernameValidator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import static java.lang.annotation.ElementType.*;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

@Target({TYPE, FIELD, ANNOTATION_TYPE})
@Retention(RUNTIME)
@Constraint(validatedBy = NotExistsUsernameValidator.class)
@Documented
public @interface NotExistsUsername {
    String message() default "Username already exists!";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}