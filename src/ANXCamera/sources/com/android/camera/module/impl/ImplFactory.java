package com.android.camera.module.impl;

import com.android.camera.ActivityBase;
import com.android.camera.module.impl.component.BackStackImpl;
import com.android.camera.module.impl.component.BeautyRecordingImpl;
import com.android.camera.module.impl.component.ConfigChangeImpl;
import com.android.camera.module.impl.component.LiveConfigChangeTTImpl;
import com.android.camera.module.impl.component.LiveVideoEditorTTImpl;
import com.android.camera.module.impl.component.ManuallyValueChangeImpl;
import com.android.camera.protocol.ModeProtocol.BaseProtocol;
import java.util.ArrayList;
import java.util.List;

public class ImplFactory {
    private List<BaseProtocol> mAdditionalProtocolList;
    private List<BaseProtocol> mBaseProtocolList;
    private List<BaseProtocol> mPersistentProtocolList;
    private boolean mReleased;

    public void initBase(ActivityBase activityBase, int... iArr) {
        if (this.mBaseProtocolList == null) {
            this.mBaseProtocolList = new ArrayList();
        }
        initTypes(activityBase, this.mBaseProtocolList, iArr);
    }

    public void initAdditional(ActivityBase activityBase, int... iArr) {
        if (this.mAdditionalProtocolList == null) {
            this.mAdditionalProtocolList = new ArrayList();
        }
        initTypes(activityBase, this.mAdditionalProtocolList, iArr);
    }

    public void initModulePersistent(ActivityBase activityBase, int... iArr) {
        if (this.mPersistentProtocolList == null) {
            this.mPersistentProtocolList = new ArrayList();
        }
        initTypes(activityBase, this.mPersistentProtocolList, iArr);
    }

    private void initTypes(ActivityBase activityBase, List<BaseProtocol> list, int... iArr) {
        if (!this.mReleased) {
            for (int i : iArr) {
                BaseProtocol baseProtocol = null;
                if (i == 164) {
                    baseProtocol = ConfigChangeImpl.create(activityBase);
                } else if (i == 171) {
                    baseProtocol = BackStackImpl.create(activityBase);
                } else if (i == 201) {
                    baseProtocol = LiveConfigChangeTTImpl.create(activityBase);
                } else if (i != 209) {
                    switch (i) {
                        case 173:
                            baseProtocol = BeautyRecordingImpl.create();
                            break;
                        case 174:
                            baseProtocol = ManuallyValueChangeImpl.create(activityBase);
                            break;
                        default:
                            break;
                    }
                } else {
                    baseProtocol = LiveVideoEditorTTImpl.create(activityBase);
                }
                baseProtocol.registerProtocol();
                list.add(baseProtocol);
            }
        }
    }

    public void detachAdditional() {
        detach(this.mAdditionalProtocolList);
    }

    public void detachModulePersistent() {
        detach(this.mPersistentProtocolList);
    }

    private void detachBase() {
        detach(this.mBaseProtocolList);
    }

    private void detach(List<BaseProtocol> list) {
        if (!this.mReleased && list != null) {
            for (BaseProtocol unRegisterProtocol : list) {
                unRegisterProtocol.unRegisterProtocol();
            }
            list.clear();
        }
    }

    public void release() {
        if (!this.mReleased) {
            detachAdditional();
            detachModulePersistent();
            detachBase();
            this.mReleased = true;
        }
    }
}
