package com.ss.android.ugc.effectmanager.link;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Handler;
import android.os.Message;
import com.ss.android.ugc.effectmanager.common.WeakHandler;
import com.ss.android.ugc.effectmanager.common.WeakHandler.IHandler;
import com.ss.android.ugc.effectmanager.common.task.ExceptionResult;
import com.ss.android.ugc.effectmanager.common.utils.LogUtils;
import com.ss.android.ugc.effectmanager.context.EffectContext;
import com.ss.android.ugc.effectmanager.link.model.blackRoom.BlackRoom;
import com.ss.android.ugc.effectmanager.link.model.configuration.LinkSelectorConfiguration;
import com.ss.android.ugc.effectmanager.link.model.host.Host;
import com.ss.android.ugc.effectmanager.link.task.result.HostListStatusUpdateTaskResult;
import com.ss.android.ugc.effectmanager.link.task.task.HostListStatusUpdateTask;
import java.net.URI;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.jetbrains.annotations.NotNull;

public class LinkSelector implements IHandler {
    private static final String TAG = "HostSelector";
    private static final String TASK_FLAG = "SpeedMeasure";
    private volatile boolean isRun = false;
    private String mBestHostUrl;
    private BlackRoom mBlackRoom;
    private Context mContext;
    private EffectContext mEffectContext;
    private Handler mHandler = new WeakHandler(this);
    private boolean mIsEnableLinkSelector;
    private boolean mIsLazy;
    private boolean mIsNetworkChangeMonitor;
    private List<Host> mOptedHosts = new ArrayList();
    private List<Host> mOriginHosts = new ArrayList();
    private NetworkChangeReceiver mReceiver;
    private int mRepeatTime;
    private String mSpeedApi;
    private int mSpeedTimeOut;

    class NetworkChangeReceiver extends BroadcastReceiver {
        NetworkChangeReceiver() {
        }

        public void onReceive(Context context, Intent intent) {
            if (LinkSelector.this.mIsEnableLinkSelector) {
                LogUtils.e(LinkSelector.TAG, "network state change");
                if (!LinkSelector.this.mOptedHosts.isEmpty() || !LinkSelector.this.mIsLazy) {
                    LinkSelector.this.startOptHosts();
                }
            }
        }
    }

    public LinkSelector(EffectContext effectContext) {
        this.mOptedHosts.clear();
        this.mBlackRoom = new BlackRoom();
        this.mEffectContext = effectContext;
        this.mReceiver = null;
    }

    public void linkSelectorConfigure(@NotNull LinkSelectorConfiguration linkSelectorConfiguration) {
        this.mSpeedTimeOut = linkSelectorConfiguration.getSpeedTimeOut();
        this.mRepeatTime = linkSelectorConfiguration.getRepeatTime();
        this.mIsEnableLinkSelector = linkSelectorConfiguration.isEnableLinkSelector();
        this.mContext = linkSelectorConfiguration.getContext();
        this.mSpeedApi = linkSelectorConfiguration.getSpeedApi();
        this.mOriginHosts.clear();
        this.mOriginHosts.addAll(linkSelectorConfiguration.getOriginHosts());
        this.mBestHostUrl = ((Host) this.mOriginHosts.get(0)).getItemName();
        this.mIsNetworkChangeMonitor = linkSelectorConfiguration.isNetworkChangeMonitor();
        this.mIsLazy = linkSelectorConfiguration.isLazy();
        LogUtils.e(TAG, "link selector configure");
        setNetworkChangeOpt();
    }

    public int getSpeedTimeOut() {
        return this.mSpeedTimeOut;
    }

    public int getRepeatTime() {
        return this.mRepeatTime;
    }

    public boolean isLinkSelectorAvilable() {
        return this.mIsEnableLinkSelector && this.mOriginHosts.size() > 1;
    }

    public Context getContext() {
        return this.mContext;
    }

    public String getSpeedApi() {
        return this.mSpeedApi;
    }

    public List<Host> getOriginHosts() {
        return this.mOriginHosts;
    }

    public String getBestHostUrl() {
        return this.mBestHostUrl;
    }

    public boolean isLazy() {
        return this.mIsLazy;
    }

    public void updateHosts(List<Host> list, boolean z) {
        if (z) {
            this.mOriginHosts.clear();
            this.mOriginHosts.addAll(list);
            return;
        }
        this.mOriginHosts.addAll(list);
    }

    public void updateBestHost() {
        if (isLinkSelectorAvilable()) {
            Host host = null;
            for (int i = 0; i < this.mOptedHosts.size(); i++) {
                Host host2 = (Host) this.mOptedHosts.get(i);
                if (this.mBlackRoom.checkHostAvailable(host2)) {
                    host = host2;
                    break;
                }
            }
            if (host == null) {
                host = (Host) getOriginHosts().get(0);
                startOptHosts();
            }
            this.mBestHostUrl = host.getItemName();
            return;
        }
        this.mBestHostUrl = ((Host) getOriginHosts().get(0)).getItemName();
    }

    private void lockToBlackRoom(String str) {
        try {
            URI toURI = new URL(str.replace(" ", "%20")).toURI();
            Host host = new Host(toURI.getHost(), toURI.getScheme());
            for (Host host2 : this.mOptedHosts) {
                if (host.hostEquals(host2)) {
                    this.mBlackRoom.lock(host2);
                    updateBestHost();
                    return;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void startOptHosts() {
        if (isLinkSelectorAvilable() && !this.isRun && isNetworkAvailable()) {
            LogUtils.e(TAG, "hosts measure start");
            this.mEffectContext.getEffectConfiguration().getTaskManager().commit(new HostListStatusUpdateTask(this, this.mHandler, TASK_FLAG));
            this.isRun = true;
        }
    }

    private void setNetworkChangeOpt() {
        if (this.mIsNetworkChangeMonitor && this.mReceiver == null && isLinkSelectorAvilable()) {
            this.mReceiver = new NetworkChangeReceiver();
            this.mContext.registerReceiver(this.mReceiver, new IntentFilter("android.net.conn.CONNECTIVITY_CHANGE"));
        }
    }

    public void handleMsg(Message message) {
        if (message.what == 31 && (message.obj instanceof HostListStatusUpdateTaskResult)) {
            HostListStatusUpdateTaskResult hostListStatusUpdateTaskResult = (HostListStatusUpdateTaskResult) message.obj;
            ExceptionResult exceptionResult = hostListStatusUpdateTaskResult.getExceptionResult();
            Collection hosts = hostListStatusUpdateTaskResult.getHosts();
            if (exceptionResult == null) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("on sort done = ");
                stringBuilder.append(hosts.size());
                stringBuilder.append(" selector:");
                stringBuilder.append(this);
                stringBuilder.append(" thread:");
                stringBuilder.append(Thread.currentThread());
                LogUtils.d(str, stringBuilder.toString());
                this.mOptedHosts.clear();
                this.mOptedHosts.addAll(hosts);
                updateBestHost();
            }
            this.isRun = false;
        }
    }

    public boolean isNetworkAvailable() {
        boolean z = false;
        if (getContext() == null) {
            return false;
        }
        try {
            NetworkInfo activeNetworkInfo = ((ConnectivityManager) getContext().getSystemService("connectivity")).getActiveNetworkInfo();
            if (activeNetworkInfo != null && activeNetworkInfo.isAvailable()) {
                z = true;
            }
            return z;
        } catch (Exception e) {
            return false;
        }
    }

    public void onApiError(String str) {
        if (isNetworkAvailable()) {
            String str2 = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("on link api error:");
            stringBuilder.append(str);
            LogUtils.e(str2, stringBuilder.toString());
            lockToBlackRoom(str);
        }
    }

    public void onApiSuccess(String str) {
        String str2 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("on link api success:");
        stringBuilder.append(str);
        LogUtils.d(str2, stringBuilder.toString());
    }

    public void destory() {
        if (this.mReceiver != null && this.mContext != null) {
            this.mContext.unregisterReceiver(this.mReceiver);
        }
    }
}
