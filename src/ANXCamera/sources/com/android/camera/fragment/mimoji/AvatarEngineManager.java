package com.android.camera.fragment.mimoji;

import com.arcsoft.avatar.AvatarConfig.c;
import com.arcsoft.avatar.AvatarConfig.d;
import com.arcsoft.avatar.AvatarConfig.e;
import com.arcsoft.avatar.AvatarEngine;
import java.util.ArrayList;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class AvatarEngineManager {
    private static AvatarEngineManager mInstance;
    private e mASAvatarConfigValue;
    private e mASAvatarConfigValueTemp;
    private AvatarEngine mAvatar;
    private int mAvatarRef = 0;
    private Map<Integer, ArrayList<c>> mConfigMap = new ConcurrentHashMap();
    private int mSelectTabIndex = 0;
    private int mSelectType = 0;
    private ArrayList<d> mTypeList = new ArrayList();

    public static AvatarEngineManager getInstance() {
        if (mInstance == null) {
            mInstance = new AvatarEngineManager();
        }
        return mInstance;
    }

    public e getASAvatarConfigValue() {
        return this.mASAvatarConfigValue;
    }

    public e getASAvatarConfigValueTemp() {
        return this.mASAvatarConfigValueTemp;
    }

    public ArrayList<c> getConfigList(int i) {
        return this.mConfigMap.size() <= 0 ? null : (ArrayList) this.mConfigMap.get(Integer.valueOf(i));
    }

    public d getConfigTypeForIndex(int i) {
        return (this.mTypeList == null || this.mTypeList.size() <= 0) ? null : (d) this.mTypeList.get(i);
    }

    public ArrayList<d> getConfigTypeList() {
        return this.mTypeList;
    }

    public ArrayList<c> getSelectConfigList() {
        return this.mConfigMap.size() <= 0 ? null : (ArrayList) this.mConfigMap.get(Integer.valueOf(this.mSelectType));
    }

    public int getSelectType() {
        return this.mSelectType;
    }

    public int getSelectTypeIndex() {
        return this.mSelectTabIndex;
    }

    public void putConfigList(int i, ArrayList<c> arrayList) {
        if (!this.mConfigMap.containsKey(Integer.valueOf(i))) {
            this.mConfigMap.put(Integer.valueOf(i), arrayList);
        }
    }

    public synchronized AvatarEngine queryAvatar() {
        if (this.mAvatar == null) {
            this.mAvatar = new AvatarEngine();
        }
        this.mAvatarRef++;
        return this.mAvatar;
    }

    /* JADX WARNING: Missing block: B:13:0x001e, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized void releaseAvatar() {
        if (this.mAvatarRef > 0) {
            this.mAvatarRef--;
            if (this.mAvatarRef <= 0 && this.mAvatar != null) {
                this.mAvatar.destroy();
                this.mAvatar = null;
            }
        }
    }

    public void setASAvatarConfigValue(e eVar) {
        this.mASAvatarConfigValue = eVar;
    }

    public void setASAvatarConfigValueTemp(e eVar) {
        this.mASAvatarConfigValueTemp = (e) eVar.clone();
    }

    public void setConfigTypeList(ArrayList<d> arrayList) {
        this.mTypeList = arrayList;
    }

    public void setSelectType(int i) {
        this.mSelectType = i;
    }

    public void setSelectTypeIndex(int i) {
        this.mSelectTabIndex = i;
    }
}
