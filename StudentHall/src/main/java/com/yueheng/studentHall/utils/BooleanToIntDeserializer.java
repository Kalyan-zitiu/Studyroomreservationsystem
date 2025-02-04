package com.yueheng.studentHall.utils;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;

import java.io.IOException;

public class BooleanToIntDeserializer extends JsonDeserializer<Integer> {
    @Override
    public Integer deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException {
        boolean value = jsonParser.getBooleanValue();
        return value ? 1 : 0;
    }
}