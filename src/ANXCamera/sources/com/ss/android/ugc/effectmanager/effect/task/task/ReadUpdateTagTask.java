package com.ss.android.ugc.effectmanager.effect.task.task;

import android.os.Handler;
import com.ss.android.ugc.effectmanager.common.EffectConstants;
import com.ss.android.ugc.effectmanager.common.ErrorConstants;
import com.ss.android.ugc.effectmanager.common.listener.ICache;
import com.ss.android.ugc.effectmanager.common.listener.IJsonConverter;
import com.ss.android.ugc.effectmanager.common.task.ExceptionResult;
import com.ss.android.ugc.effectmanager.common.task.NormalTask;
import com.ss.android.ugc.effectmanager.context.EffectContext;
import com.ss.android.ugc.effectmanager.effect.task.result.ReadTagTaskResult;
import java.io.InputStream;
import java.util.HashMap;

public class ReadUpdateTagTask extends NormalTask {
    private ICache mCache;
    private String mId;
    private IJsonConverter mJsonConverter;
    private String mUpdateTime;

    public ReadUpdateTagTask(Handler handler, EffectContext effectContext, String str, String str2, String str3) {
        super(handler, str);
        this.mCache = effectContext.getEffectConfiguration().getCache();
        this.mJsonConverter = effectContext.getEffectConfiguration().getJsonConverter();
        this.mId = str2;
        this.mUpdateTime = str3;
    }

    public void execute() {
        InputStream queryToStream = this.mCache.queryToStream(EffectConstants.KEY_EFFECT_UPDATE_TIME);
        if (queryToStream == null) {
            sendMessage(52, new ReadTagTaskResult(this.mId, this.mUpdateTime, null, new ExceptionResult((int) ErrorConstants.CODE_NO_LOCAL_TAG)));
            return;
        }
        try {
            HashMap hashMap = (HashMap) this.mJsonConverter.convertJsonToObj(queryToStream, HashMap.class);
            if (hashMap != null) {
                sendMessage(52, new ReadTagTaskResult(this.mId, this.mUpdateTime, hashMap, null));
            } else {
                sendMessage(52, new ReadTagTaskResult(this.mId, this.mUpdateTime, null, new ExceptionResult(new IllegalStateException("local file destroy"))));
            }
        } catch (Exception e) {
            sendMessage(52, new ReadTagTaskResult(this.mId, this.mUpdateTime, null, new ExceptionResult(e)));
        }
    }
}
