package com.bytedance.frameworks.core.monitor.model;

import android.text.TextUtils;

public class LocalVersionInfo {
    public long id;
    public String manifestVersionCode;
    public String updateVersionCode;
    public String versionCode;
    public String versionName;

    public LocalVersionInfo(long j, String str, String str2, String str3, String str4) {
        this.id = j;
        this.versionCode = str;
        this.versionName = str2;
        this.manifestVersionCode = str3;
        this.updateVersionCode = str4;
    }

    public LocalVersionInfo(String str, String str2, String str3, String str4) {
        this.versionCode = str;
        this.versionName = str2;
        this.manifestVersionCode = str3;
        this.updateVersionCode = str4;
    }

    public boolean equals(Object obj) {
        boolean z = true;
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        LocalVersionInfo localVersionInfo = (LocalVersionInfo) obj;
        if (!(TextUtils.equals(this.versionCode, localVersionInfo.versionCode) && TextUtils.equals(this.versionName, localVersionInfo.versionName) && TextUtils.equals(this.manifestVersionCode, localVersionInfo.manifestVersionCode) && TextUtils.equals(this.updateVersionCode, localVersionInfo.updateVersionCode))) {
            z = false;
        }
        return z;
    }

    public int hashCode() {
        return ((hashCode(this.versionCode) + hashCode(this.versionName)) + hashCode(this.manifestVersionCode)) + hashCode(this.updateVersionCode);
    }

    private static int hashCode(Object obj) {
        return obj != null ? obj.hashCode() : 0;
    }
}
