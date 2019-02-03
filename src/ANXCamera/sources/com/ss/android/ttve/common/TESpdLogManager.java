package com.ss.android.ttve.common;

import android.util.Log;
import com.ss.android.medialib.SpdLogInvoker;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class TESpdLogManager {
    private static volatile TESpdLogManager mTESpdManager = null;
    private SpdLogInvoker mEditor1SpdLogInvoker = new SpdLogInvoker();
    private TESpdLogInvoker mTESpdLogInvoker = new TESpdLogInvoker();

    public enum InfoLevel {
        LEVEL1,
        LEVEL2,
        LEVEL3
    }

    public static TESpdLogManager getInstance() {
        if (mTESpdManager == null) {
            synchronized (TESpdLogManager.class) {
                if (mTESpdManager == null) {
                    mTESpdManager = new TESpdLogManager();
                }
            }
        }
        return mTESpdManager;
    }

    public static String[] getLogFiles(String str) {
        String str2 = ".txt";
        if (str.isEmpty()) {
            return new String[0];
        }
        File file = new File(str);
        if (!file.isDirectory()) {
            return new String[0];
        }
        String[] list = file.list();
        List arrayList = new ArrayList();
        for (int i = 0; i < list.length; i++) {
            if (list[i].endsWith(str2)) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append(str);
                stringBuilder.append(File.separator);
                stringBuilder.append(list[i]);
                arrayList.add(stringBuilder.toString());
            }
        }
        return (String[]) arrayList.toArray(new String[0]);
    }

    private TESpdLogManager() {
    }

    public int initSpdLog(String str, int i, int i2) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("logDir: ");
        stringBuilder.append(str);
        Log.e("TESpdLogManager", stringBuilder.toString());
        int initSpdLog = this.mTESpdLogInvoker.initSpdLog(str, i, i2);
        int initSpdLog2 = this.mEditor1SpdLogInvoker.initSpdLog(str, i, i2);
        if (initSpdLog < 0) {
            return initSpdLog;
        }
        if (initSpdLog2 < 0) {
            return initSpdLog2;
        }
        return 0;
    }

    public void close() {
        this.mTESpdLogInvoker.close();
        this.mEditor1SpdLogInvoker.close();
    }

    public void info(InfoLevel infoLevel, String str) {
        switch (infoLevel) {
            case LEVEL1:
                this.mTESpdLogInvoker.info(1, str);
                return;
            case LEVEL2:
                this.mTESpdLogInvoker.info(2, str);
                return;
            case LEVEL3:
                this.mTESpdLogInvoker.info(3, str);
                return;
            default:
                Log.e("TESpdLogManager", "错误的等级");
                return;
        }
    }

    public void setLevel(InfoLevel infoLevel) {
        switch (infoLevel) {
            case LEVEL1:
                this.mTESpdLogInvoker.setLevel(1);
                this.mEditor1SpdLogInvoker.setLevel(1);
                return;
            case LEVEL2:
                this.mTESpdLogInvoker.setLevel(2);
                this.mEditor1SpdLogInvoker.setLevel(2);
                return;
            case LEVEL3:
                this.mTESpdLogInvoker.setLevel(3);
                this.mEditor1SpdLogInvoker.setLevel(3);
                return;
            default:
                Log.e("TESpdLogManager", "错误的等级");
                return;
        }
    }

    public void error(String str) {
        this.mTESpdLogInvoker.error(str);
    }

    public void warn(String str) {
        this.mTESpdLogInvoker.warn(str);
    }
}
