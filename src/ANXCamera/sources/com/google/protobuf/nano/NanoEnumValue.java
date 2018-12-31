package com.google.protobuf.nano;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Retention(RetentionPolicy.CLASS)
public @interface NanoEnumValue {
    boolean keepAsInt() default false;

    boolean legacy() default false;

    Class<?> value();
}
