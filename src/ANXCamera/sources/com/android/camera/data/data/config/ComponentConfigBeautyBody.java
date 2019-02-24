package com.android.camera.data.data.config;

import android.support.annotation.NonNull;
import android.text.TextUtils;
import com.android.camera.CameraSettings;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.data.provider.DataProvider.ProviderEditor;
import java.util.List;

public class ComponentConfigBeautyBody extends ComponentData {
    private static final int DEF_BEAUTY_BODY_VALUE = 0;
    private boolean mIsClosed;

    public ComponentConfigBeautyBody(DataItemConfig dataItemConfig) {
        super(dataItemConfig);
    }

    public int getDisplayTitleString() {
        return 0;
    }

    public String getKey(int i) {
        switch (i) {
            case 161:
            case 162:
                return "_video";
            default:
                return null;
        }
    }

    @NonNull
    public String getDefaultValue(int i) {
        return null;
    }

    public List<ComponentDataItem> getItems() {
        return null;
    }

    public void setBeautyBodyValue(String str, int i) {
        setClosed(false);
        this.mParentDataItem.putInt(str, i).apply();
    }

    public int getBeautyBodyValue(String str, int i) {
        if (isClosed()) {
            return i;
        }
        return this.mParentDataItem.getInt(str, i);
    }

    public boolean isClosed() {
        return this.mIsClosed;
    }

    public void setClosed(boolean z) {
        this.mIsClosed = z;
    }

    /* JADX WARNING: Removed duplicated region for block: B:25:0x004f A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:29:0x0053 A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:28:0x0052 A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x0051 A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:26:0x0050 A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:25:0x004f A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:29:0x0053 A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:28:0x0052 A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x0051 A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:26:0x0050 A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:25:0x004f A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:29:0x0053 A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:28:0x0052 A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x0051 A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:26:0x0050 A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:25:0x004f A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:29:0x0053 A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:28:0x0052 A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x0051 A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:26:0x0050 A:{RETURN} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean isBeautyBodyKey(String str) {
        if (!TextUtils.isEmpty(str)) {
            boolean z;
            int hashCode = str.hashCode();
            if (hashCode == -1735290593) {
                if (str.equals(CameraSettings.KEY_BEAUTY_BODY_SLIM_RATIO)) {
                    z = true;
                    switch (z) {
                        case false:
                            break;
                        case true:
                            break;
                        case true:
                            break;
                        case true:
                            break;
                        default:
                            break;
                    }
                }
            } else if (hashCode == -146567779) {
                if (str.equals(CameraSettings.KEY_BEAUTY_LEG_SLIM_RATIO)) {
                    z = true;
                    switch (z) {
                        case false:
                            break;
                        case true:
                            break;
                        case true:
                            break;
                        case true:
                            break;
                        default:
                            break;
                    }
                }
            } else if (hashCode == 1709402593) {
                if (str.equals(CameraSettings.KEY_BEAUTY_SHOULDER_SLIM_RATIO)) {
                    z = true;
                    switch (z) {
                        case false:
                            break;
                        case true:
                            break;
                        case true:
                            break;
                        case true:
                            break;
                        default:
                            break;
                    }
                }
            } else if (hashCode == 1945143841 && str.equals(CameraSettings.KEY_BEAUTY_HEAD_SLIM_RATIO)) {
                z = false;
                switch (z) {
                    case false:
                        return true;
                    case true:
                        return true;
                    case true:
                        return true;
                    case true:
                        return true;
                    default:
                        return false;
                }
            }
            z = true;
            switch (z) {
                case false:
                    break;
                case true:
                    break;
                case true:
                    break;
                case true:
                    break;
                default:
                    break;
            }
        }
        return false;
    }

    public void resetBeautyBody(int i, ProviderEditor providerEditor) {
        String str = CameraSettings.KEY_BEAUTY_HEAD_SLIM_RATIO;
        String str2 = CameraSettings.KEY_BEAUTY_BODY_SLIM_RATIO;
        String str3 = CameraSettings.KEY_BEAUTY_SHOULDER_SLIM_RATIO;
        String str4 = CameraSettings.KEY_BEAUTY_LEG_SLIM_RATIO;
        if (this.mParentDataItem.getInt(str, 0) > 0) {
            providerEditor.putInt(str, 0);
        }
        if (this.mParentDataItem.getInt(str2, 0) > 0) {
            providerEditor.putInt(str2, 0);
        }
        if (this.mParentDataItem.getInt(str3, 0) > 0) {
            providerEditor.putInt(str3, 0);
        }
        if (this.mParentDataItem.getInt(str4, 0) > 0) {
            providerEditor.putInt(str4, 0);
        }
    }
}
