package com.ss.android.ugc.effectmanager.common.listener;

import java.io.InputStream;

public interface IJsonConverter {
    <T> T convertJsonToObj(InputStream inputStream, Class<T> cls);

    <T> String convertObjToJson(T t);
}
