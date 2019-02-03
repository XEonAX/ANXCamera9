package com.ss.android.ugc.effectmanager.effect.repository;

import android.os.Handler;
import android.os.Message;
import com.ss.android.ugc.effectmanager.common.WeakHandler;
import com.ss.android.ugc.effectmanager.common.WeakHandler.IHandler;
import com.ss.android.ugc.effectmanager.common.task.ExceptionResult;
import com.ss.android.ugc.effectmanager.common.utils.LogUtils;
import com.ss.android.ugc.effectmanager.common.utils.ValueConvertUtil;
import com.ss.android.ugc.effectmanager.context.EffectContext;
import com.ss.android.ugc.effectmanager.effect.listener.IIsTagNeedUpdatedListener;
import com.ss.android.ugc.effectmanager.effect.listener.IReadUpdateTagListener;
import com.ss.android.ugc.effectmanager.effect.listener.IUpdateTagListener;
import com.ss.android.ugc.effectmanager.effect.listener.IWriteUpdateTagListener;
import com.ss.android.ugc.effectmanager.effect.task.result.ReadTagTaskResult;
import com.ss.android.ugc.effectmanager.effect.task.result.WriteTagTaskResult;
import com.ss.android.ugc.effectmanager.effect.task.task.ReadUpdateTagTask;
import com.ss.android.ugc.effectmanager.effect.task.task.WriteUpdateTagTask;
import java.util.HashMap;

public class UpdateTagRepository implements IHandler {
    private final String TAG = "UpdateTagRepository";
    private EffectContext mEffectContext;
    private Handler mHandler;
    private HashMap<String, String> mTagsCachedMap;

    public UpdateTagRepository(EffectContext effectContext) {
        this.mEffectContext = effectContext;
        this.mHandler = new WeakHandler(this);
    }

    private void requestWriteTask(String str, String str2, String str3, final IUpdateTagListener iUpdateTagListener) {
        if (this.mEffectContext == null) {
            if (iUpdateTagListener != null) {
                iUpdateTagListener.onFinally();
            }
            return;
        }
        if (this.mTagsCachedMap == null) {
            iUpdateTagListener.onFinally();
        }
        this.mTagsCachedMap.put(str2, str3);
        this.mEffectContext.getEffectConfiguration().getListenerManger().setWriteUpdateTagListener(str, new IWriteUpdateTagListener() {
            public void onFinally() {
                if (iUpdateTagListener != null) {
                    iUpdateTagListener.onFinally();
                }
            }
        });
        this.mEffectContext.getEffectConfiguration().getTaskManager().commit(new WriteUpdateTagTask(this.mHandler, this.mEffectContext, str, this.mTagsCachedMap));
    }

    public void updateTag(String str, String str2, String str3, IUpdateTagListener iUpdateTagListener) {
        if (this.mTagsCachedMap != null) {
            requestWriteTask(str, str2, str3, iUpdateTagListener);
        } else if (this.mEffectContext == null) {
            if (iUpdateTagListener != null) {
                iUpdateTagListener.onFinally();
            }
        } else {
            final String str4 = str;
            final String str5 = str2;
            final String str6 = str3;
            final IUpdateTagListener iUpdateTagListener2 = iUpdateTagListener;
            this.mEffectContext.getEffectConfiguration().getListenerManger().setReadUpdateTagListener(str, new IReadUpdateTagListener() {
                public void onSuccess() {
                }

                public void onFailed(ExceptionResult exceptionResult) {
                }

                public void onFinally() {
                    UpdateTagRepository.this.requestWriteTask(str4, str5, str6, iUpdateTagListener2);
                }
            });
            this.mEffectContext.getEffectConfiguration().getTaskManager().commit(new ReadUpdateTagTask(this.mHandler, this.mEffectContext, str4, str5, str6));
        }
    }

    private void checkedTagInHashMap(String str, String str2, IIsTagNeedUpdatedListener iIsTagNeedUpdatedListener) {
        if (this.mTagsCachedMap == null) {
            iIsTagNeedUpdatedListener.onTagNeedUpdate();
            return;
        }
        if (!this.mTagsCachedMap.containsKey(str)) {
            iIsTagNeedUpdatedListener.onTagNeedUpdate();
        } else if (ValueConvertUtil.ConvertStringToLong(str2, -1) > ValueConvertUtil.ConvertStringToLong((String) this.mTagsCachedMap.get(str), -1)) {
            iIsTagNeedUpdatedListener.onTagNeedUpdate();
        } else {
            iIsTagNeedUpdatedListener.onTagNeedNotUpdate();
        }
    }

    public void isTagUpdated(String str, final String str2, final String str3, final IIsTagNeedUpdatedListener iIsTagNeedUpdatedListener) {
        if (this.mTagsCachedMap != null) {
            checkedTagInHashMap(str2, str3, iIsTagNeedUpdatedListener);
        } else if (this.mEffectContext == null) {
            if (iIsTagNeedUpdatedListener != null) {
                iIsTagNeedUpdatedListener.onTagNeedNotUpdate();
            }
        } else {
            this.mEffectContext.getEffectConfiguration().getListenerManger().setReadUpdateTagListener(str, new IReadUpdateTagListener() {
                public void onSuccess() {
                    UpdateTagRepository.this.checkedTagInHashMap(str2, str3, iIsTagNeedUpdatedListener);
                }

                public void onFailed(ExceptionResult exceptionResult) {
                    iIsTagNeedUpdatedListener.onTagNeedUpdate();
                }

                public void onFinally() {
                }
            });
            this.mEffectContext.getEffectConfiguration().getTaskManager().commit(new ReadUpdateTagTask(this.mHandler, this.mEffectContext, str, str2, str3));
        }
    }

    public void handleMsg(Message message) {
        switch (message.what) {
            case 51:
                if (message.obj instanceof WriteTagTaskResult) {
                    WriteTagTaskResult writeTagTaskResult = (WriteTagTaskResult) message.obj;
                    if (this.mEffectContext != null) {
                        IWriteUpdateTagListener writeUpdateTagListener = this.mEffectContext.getEffectConfiguration().getListenerManger().getWriteUpdateTagListener(writeTagTaskResult.getTaskID());
                        if (writeUpdateTagListener != null) {
                            writeUpdateTagListener.onFinally();
                            break;
                        }
                    }
                    return;
                }
                break;
            case 52:
                if (message.obj instanceof ReadTagTaskResult) {
                    ReadTagTaskResult readTagTaskResult = (ReadTagTaskResult) message.obj;
                    if (this.mEffectContext != null) {
                        IReadUpdateTagListener readUpdateTagListener = this.mEffectContext.getEffectConfiguration().getListenerManger().getReadUpdateTagListener(readTagTaskResult.getTaskID());
                        if (this.mTagsCachedMap == null) {
                            this.mTagsCachedMap = new HashMap();
                        }
                        if (readTagTaskResult.getException() == null) {
                            this.mTagsCachedMap.putAll(readTagTaskResult.getTagsCachedMap());
                            if (readUpdateTagListener != null) {
                                readUpdateTagListener.onSuccess();
                            }
                        } else if (readUpdateTagListener != null) {
                            readUpdateTagListener.onFailed(readTagTaskResult.getException());
                        }
                        if (readUpdateTagListener != null) {
                            readUpdateTagListener.onFinally();
                            break;
                        }
                    }
                    return;
                }
                break;
            default:
                LogUtils.e("UpdateTagRepository", "未知错误");
                break;
        }
    }
}
