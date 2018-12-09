package com.ss.android.ugc.effectmanager.effect.task.task;

import android.os.Handler;
import com.ss.android.ugc.effectmanager.common.EffectConstants;
import com.ss.android.ugc.effectmanager.common.listener.ICache;
import com.ss.android.ugc.effectmanager.common.listener.IJsonConverter;
import com.ss.android.ugc.effectmanager.common.task.NormalTask;
import com.ss.android.ugc.effectmanager.context.EffectContext;
import com.ss.android.ugc.effectmanager.effect.task.result.WriteTagTaskResult;
import java.util.HashMap;

public class WriteUpdateTagTask extends NormalTask {
    private ICache mCache;
    private IJsonConverter mJsonConverter;
    private HashMap<String, String> mTagsCachedMap = new HashMap();
    private String mTaskId;

    public WriteUpdateTagTask(Handler handler, EffectContext effectContext, String str, HashMap<String, String> hashMap) {
        super(handler, str);
        this.mCache = effectContext.getEffectConfiguration().getCache();
        this.mJsonConverter = effectContext.getEffectConfiguration().getJsonConverter();
        this.mTagsCachedMap.putAll(hashMap);
        this.mTaskId = str;
    }

    public void execute() {
        this.mCache.save(EffectConstants.KEY_EFFECT_UPDATE_TIME, this.mJsonConverter.convertObjToJson(this.mTagsCachedMap));
        sendMessage(51, new WriteTagTaskResult(this.mTaskId, null));
    }
}
