package com.ss.android.ugc.effectmanager.link.model.configuration;

import android.content.Context;
import android.support.annotation.NonNull;
import com.ss.android.ugc.effectmanager.link.model.host.Host;
import java.util.List;

public class LinkSelectorConfiguration {
    public static final int MS_OF_ONE_MIN = 60000;
    public static final int MS_OF_ONE_SEC = 1000;
    private Context mContext = null;
    private boolean mEnableLinkSelector = false;
    private boolean mIsLazy = false;
    private boolean mIsNetworkChangeMonitor = true;
    private List<Host> mOriginHosts;
    private int mRepeatTime = 2;
    private String mSpeedApi = "/ies/speed/";
    private int mSpeedTimeOut = 2000;

    public String getSpeedApi() {
        return this.mSpeedApi;
    }

    public int getSpeedTimeOut() {
        return this.mSpeedTimeOut;
    }

    public int getRepeatTime() {
        return this.mRepeatTime;
    }

    public boolean isEnableLinkSelector() {
        return this.mEnableLinkSelector;
    }

    public List<Host> getOriginHosts() {
        return this.mOriginHosts;
    }

    public Context getContext() {
        return this.mContext;
    }

    public boolean isLazy() {
        return this.mIsLazy;
    }

    public void setLazy(boolean z) {
        this.mEnableLinkSelector = true;
        this.mIsLazy = z;
    }

    public boolean isNetworkChangeMonitor() {
        return this.mIsNetworkChangeMonitor;
    }

    public void setNetworkChangeMonitor(boolean z) {
        this.mEnableLinkSelector = true;
        this.mIsNetworkChangeMonitor = z;
    }

    public void setSpeedTimeOut(int i) {
        this.mEnableLinkSelector = true;
        this.mSpeedTimeOut = i;
    }

    public void setRepeatTime(int i) {
        this.mEnableLinkSelector = true;
        this.mRepeatTime = i;
    }

    public void setContext(@NonNull Context context) {
        this.mContext = context.getApplicationContext();
    }

    public void setSpeedApi(@NonNull String str) {
        this.mEnableLinkSelector = true;
        this.mSpeedApi = str;
    }

    public void setOriginHosts(@NonNull List<Host> list) {
        boolean z = true;
        if (list.size() <= 1) {
            z = false;
        }
        this.mEnableLinkSelector = z;
        this.mOriginHosts = list;
    }
}
