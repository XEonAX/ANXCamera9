package com.ss.android.ugc.effectmanager.effect.task.result;

import com.ss.android.ugc.effectmanager.common.task.BaseTaskResult;
import com.ss.android.ugc.effectmanager.common.task.ExceptionResult;
import java.util.HashMap;

public class ReadTagTaskResult extends BaseTaskResult {
    private ExceptionResult exception;
    private String mId;
    private HashMap<String, String> mTagsCachedMap;
    private String mUpdateTime;

    public ReadTagTaskResult(String str, String str2, HashMap<String, String> hashMap, ExceptionResult exceptionResult) {
        this.mTagsCachedMap = hashMap;
        this.exception = exceptionResult;
        this.mId = str;
        this.mUpdateTime = str2;
    }

    public HashMap<String, String> getTagsCachedMap() {
        return this.mTagsCachedMap;
    }

    public void setTagsCachedMap(HashMap<String, String> hashMap) {
        this.mTagsCachedMap = hashMap;
    }

    public ExceptionResult getException() {
        return this.exception;
    }

    public void setException(ExceptionResult exceptionResult) {
        this.exception = exceptionResult;
    }

    public String getId() {
        return this.mId;
    }

    public void setId(String str) {
        this.mId = str;
    }

    public String getUpdateTime() {
        return this.mUpdateTime;
    }

    public void setUpdateTime(String str) {
        this.mUpdateTime = str;
    }
}
