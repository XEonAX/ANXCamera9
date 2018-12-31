package com.android.camera.data;

import android.content.Context;
import com.android.camera.data.backup.DataBackUp;
import com.android.camera.data.backup.DataBackUpMgr;
import com.android.camera.data.cloud.DataCloud.CloudManager;
import com.android.camera.data.cloud.DataCloudMgr;
import com.android.camera.data.data.config.DataItemConfig;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera.data.provider.DataProvider;
import com.android.camera.data.provider.DataProviderMgr;
import com.android.camera.data.restore.DataRestore;
import com.android.camera.data.restore.DataRestoreMgr;
import com.mi.config.a;

public class DataRepository implements DataProtocol {
    private static DataRepository sInstance;
    private DataBackUpMgr mDataBackUp = new DataBackUpMgr();
    private CloudManager mDataCloudMgr = new DataCloudMgr();
    private DataProviderMgr mDataProvider = new DataProviderMgr(this.mDataCloudMgr);
    private DataRestoreMgr mDataRestore = new DataRestoreMgr();

    public static DataRepository getInstance() {
        if (sInstance == null) {
            synchronized (DataRepository.class) {
                if (sInstance == null) {
                    sInstance = new DataRepository();
                }
            }
        }
        return sInstance;
    }

    public void backUpAll(int i) {
    }

    public void restoreAll(Context context, int i) {
    }

    public DataBackUp backUp() {
        return this.mDataBackUp.backUp();
    }

    public DataRestore restore() {
        return this.mDataRestore.restore();
    }

    public static DataProvider provider() {
        return getInstance().mDataProvider.provider();
    }

    public static DataItemRunning dataItemRunning() {
        return (DataItemRunning) provider().dataRunning();
    }

    public static DataItemGlobal dataItemGlobal() {
        return (DataItemGlobal) provider().dataGlobal();
    }

    public static DataItemConfig dataItemConfig() {
        return (DataItemConfig) provider().dataConfig();
    }

    public static DataItemConfig dataNormalItemConfig() {
        return (DataItemConfig) provider().dataNormalConfig();
    }

    public static CloudManager dataCloudMgr() {
        return getInstance().mDataCloudMgr;
    }

    public static a dataItemFeature() {
        return (a) provider().dataFeature();
    }
}
