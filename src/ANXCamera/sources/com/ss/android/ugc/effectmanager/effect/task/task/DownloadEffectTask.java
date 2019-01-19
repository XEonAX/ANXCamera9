package com.ss.android.ugc.effectmanager.effect.task.task;

import android.accounts.NetworkErrorException;
import android.os.Handler;
import android.text.TextUtils;
import com.android.camera.module.impl.component.FileUtils;
import com.ss.android.ugc.effectmanager.EffectConfiguration;
import com.ss.android.ugc.effectmanager.common.EffectConstants;
import com.ss.android.ugc.effectmanager.common.EffectRequest;
import com.ss.android.ugc.effectmanager.common.ErrorConstants;
import com.ss.android.ugc.effectmanager.common.task.ExceptionResult;
import com.ss.android.ugc.effectmanager.common.task.NormalTask;
import com.ss.android.ugc.effectmanager.common.utils.EffectUtils;
import com.ss.android.ugc.effectmanager.context.EffectContext;
import com.ss.android.ugc.effectmanager.effect.model.Effect;
import com.ss.android.ugc.effectmanager.effect.task.result.EffectTaskResult;
import java.io.File;
import java.io.InputStream;
import java.util.List;

public class DownloadEffectTask extends NormalTask {
    private EffectConfiguration mConfiguration;
    private int mCurCnt;
    private List<String> mDownLoadUrl = EffectUtils.getUrl(this.mEffect.getFileUrl());
    private Effect mEffect;
    private EffectContext mEffectContext;

    public DownloadEffectTask(Effect effect, EffectContext effectContext, String str, Handler handler) {
        super(handler, str, EffectConstants.NETWORK);
        this.mEffect = effect;
        this.mEffectContext = effectContext;
        this.mConfiguration = effectContext.getEffectConfiguration();
        this.mCurCnt = effectContext.getEffectConfiguration().getRetryCount() + 1;
    }

    public void execute() {
        sendMessage(42, new EffectTaskResult(this.mEffect, null));
        if (this.mEffect == null || this.mDownLoadUrl == null || this.mDownLoadUrl.isEmpty() || EffectUtils.isUrlModelEmpty(this.mEffect.getFileUrl())) {
            sendMessage(15, new EffectTaskResult(this.mEffect, new ExceptionResult((int) ErrorConstants.CODE_EFFECT_NULL)));
            return;
        }
        int i = 0;
        int size = this.mDownLoadUrl.size();
        while (i < size) {
            if (isCanceled()) {
                sendMessage(15, new EffectTaskResult(this.mEffect, new ExceptionResult((int) ErrorConstants.CODE_CANCEL_DOWNLOAD)));
                break;
            }
            try {
                Effect effect;
                if (TextUtils.isEmpty(this.mEffect.getZipPath()) || TextUtils.isEmpty(this.mEffect.getUnzipPath())) {
                    effect = this.mEffect;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append(this.mConfiguration.getEffectDir());
                    stringBuilder.append(File.separator);
                    stringBuilder.append(this.mEffect.getId());
                    stringBuilder.append(FileUtils.SUFFIX);
                    effect.setZipPath(stringBuilder.toString());
                    effect = this.mEffect;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append(this.mConfiguration.getEffectDir());
                    stringBuilder.append(File.separator);
                    stringBuilder.append(this.mEffect.getId());
                    effect.setUnzipPath(stringBuilder.toString());
                }
                effect = download((String) this.mDownLoadUrl.get(i), this.mEffect.getZipPath());
                if (effect != null) {
                    com.ss.android.ugc.effectmanager.common.utils.FileUtils.unZip(effect.getZipPath(), effect.getUnzipPath());
                    sendMessage(15, new EffectTaskResult(effect, null));
                    break;
                }
                i++;
            } catch (Exception e) {
                if (i == size - 1) {
                    e.printStackTrace();
                    sendMessage(15, new EffectTaskResult(this.mEffect, new ExceptionResult(e)));
                }
            }
        }
    }

    private Effect download(String str, String str2) throws Exception {
        InputStream execute = this.mEffectContext.getEffectConfiguration().getEffectNetWorker().execute(new EffectRequest("GET", str));
        if (execute != null) {
            EffectUtils.convertStreamToFile(execute, str2);
            return this.mEffect;
        }
        throw new NetworkErrorException(ErrorConstants.EXCEPTION_DOWNLOAD_ERROR);
    }
}
