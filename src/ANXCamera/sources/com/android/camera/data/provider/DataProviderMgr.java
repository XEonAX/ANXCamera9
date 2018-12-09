package com.android.camera.data.provider;

import android.util.SparseArray;
import com.android.camera.data.cloud.DataCloud.CloudManager;
import com.android.camera.data.data.config.DataItemConfig;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.data.data.runing.DataItemRunning;
import com.mi.config.a;

public class DataProviderMgr {
    private DataProvider mDataProvider;

    private final class DataProviderImpl implements DataProvider {
        private CloudManager mDataCloudManager;
        private DataItemGlobal mDataGlobal = new DataItemGlobal();
        private SparseArray<DataItemConfig> mDataItemConfigs;
        private a mDataItemFeature;
        private DataItemRunning mDataRunning;

        public DataProviderImpl(CloudManager cloudManager) {
            this.mDataCloudManager = cloudManager;
            this.mDataGlobal.injectCloud(cloudManager.provideDataCloudGlobal());
            this.mDataItemConfigs = new SparseArray(4);
            this.mDataRunning = new DataItemRunning();
            this.mDataItemFeature = new a();
        }

        public DataItemConfig dataConfig(int i, int i2) {
            int provideLocalId = DataItemConfig.provideLocalId(i, i2);
            DataItemConfig dataItemConfig = (DataItemConfig) this.mDataItemConfigs.get(provideLocalId);
            if (dataItemConfig != null) {
                return dataItemConfig;
            }
            dataItemConfig = new DataItemConfig(i, i2);
            dataItemConfig.injectCloud(this.mDataCloudManager.provideDataCloudConfig(i));
            this.mDataItemConfigs.put(provideLocalId, dataItemConfig);
            return dataItemConfig;
        }

        public DataItemGlobal dataGlobal() {
            return this.mDataGlobal;
        }

        public DataItemConfig dataConfig() {
            return dataConfig(dataGlobal().getCurrentCameraId(), dataGlobal().getIntentType());
        }

        public DataItemConfig dataNormalConfig() {
            return dataConfig(dataGlobal().getCurrentCameraId(), 0);
        }

        public DataItemRunning dataRunning() {
            return this.mDataRunning;
        }

        public DataItemConfig dataConfig(int i) {
            return dataConfig(i, dataGlobal().getIntentType());
        }

        public a dataFeature() {
            return this.mDataItemFeature;
        }
    }

    public DataProviderMgr(CloudManager cloudManager) {
        this.mDataProvider = new DataProviderImpl(cloudManager);
    }

    public DataProvider provider() {
        return this.mDataProvider;
    }
}
