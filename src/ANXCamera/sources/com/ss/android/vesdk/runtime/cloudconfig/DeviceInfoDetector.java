package com.ss.android.vesdk.runtime.cloudconfig;

import android.content.Context;
import android.os.Build;
import android.os.Build.VERSION;
import android.text.TextUtils;
import com.ss.android.ttve.BuildConfig;
import com.ss.android.vesdk.runtime.cloudconfig.GPUModelDetector.ENvGpuSubModel;
import com.ss.android.vesdk.runtime.cloudconfig.GPUModelDetector.GPUModelInfo;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

public class DeviceInfoDetector {
    private static String abi;
    private static String appid;
    private static String cpu;
    private static String cpu_core;
    private static String cpu_freq;
    private static String device_brand;
    private static String external_storage;
    private static String gpu;
    private static String gpu_ver;
    private static boolean inited = false;
    private static String locale;
    private static String memory;
    private static String model;
    private static boolean nativeInited = false;
    private static String opengl_version;
    private static String os_sdk_int;
    public static List<String> sNumberKeys = new ArrayList<String>() {
        {
            add("os_sdk_int");
            add("external_storage");
            add("screen_height");
            add("screen_width");
            add("storage");
            add("memory");
            add("cpu_core");
            add("cpu_freq");
        }
    };
    private static String screen_height;
    private static String screen_width;
    private static String sim_operator;
    private static String storage;
    private static String ve_version;

    public static void init(Context context) {
        if (!inited) {
            synchronized (DeviceInfoDetector.class) {
                if (!inited) {
                    initInternal(context.getApplicationContext());
                    inited = true;
                }
            }
        }
    }

    private static void initInternal(Context context) {
        String str;
        StringBuilder stringBuilder;
        String language = Locale.getDefault().getLanguage();
        Object country = Locale.getDefault().getCountry();
        if (TextUtils.isEmpty(country)) {
            str = "";
        } else {
            stringBuilder = new StringBuilder();
            stringBuilder.append("_");
            stringBuilder.append(country.toUpperCase());
            str = stringBuilder.toString();
        }
        model = Build.MODEL;
        cpu = DeviceInfoUtils.readCpuHardware();
        cpu_freq = DeviceInfoUtils.getMaxCpuFreq();
        cpu_core = String.valueOf(DeviceInfoUtils.getNumOfCores());
        memory = String.valueOf(DeviceInfoUtils.getTotalMemory());
        storage = String.valueOf(DeviceInfoUtils.getInternalStorage());
        external_storage = String.valueOf(DeviceInfoUtils.getExternalStorage(context));
        os_sdk_int = String.valueOf(VERSION.SDK_INT);
        screen_width = String.valueOf(DeviceInfoUtils.getScreenWidth(context));
        screen_height = String.valueOf(DeviceInfoUtils.getRealScreenHeight(context));
        appid = context.getPackageName();
        abi = getCpuAbi();
        stringBuilder = new StringBuilder();
        stringBuilder.append(language);
        stringBuilder.append(str);
        locale = stringBuilder.toString();
        sim_operator = DeviceInfoUtils.getSimOperator(context);
        device_brand = Build.BRAND;
    }

    private static String getCpuAbi() {
        StringBuilder stringBuilder;
        if (VERSION.SDK_INT >= 21) {
            stringBuilder = new StringBuilder();
            String[] strArr = Build.SUPPORTED_ABIS;
            if (strArr != null) {
                for (int i = 0; i < strArr.length; i++) {
                    stringBuilder.append(strArr[i]);
                    if (i != strArr.length - 1) {
                        stringBuilder.append(",");
                    }
                }
            }
            return stringBuilder.toString();
        }
        stringBuilder = new StringBuilder();
        stringBuilder.append(Build.CPU_ABI);
        stringBuilder.append(",");
        stringBuilder.append(Build.CPU_ABI2);
        return stringBuilder.toString();
    }

    public static Map<String, String> toMap() {
        Map<String, String> hashMap = new HashMap();
        hashMap.put("model", model);
        hashMap.put("cpu", cpu);
        hashMap.put("cpu_freq", cpu_freq);
        hashMap.put("cpu_core", cpu_core);
        hashMap.put("memory", memory);
        hashMap.put("storage", storage);
        hashMap.put("external_storage", external_storage);
        hashMap.put("screen_width", screen_width);
        hashMap.put("screen_height", screen_height);
        hashMap.put("os_sdk_int", os_sdk_int);
        hashMap.put("appid", appid);
        hashMap.put("abi", abi);
        hashMap.put("locale", locale);
        hashMap.put("sim_operator", sim_operator);
        hashMap.put("brand", device_brand);
        if (!nativeInited) {
            GPUModelInfo gPUModel = GPUModelDetector.getInstance().getGPUModel();
            ENvGpuSubModel gPUSubModel = gPUModel.getGPUSubModel();
            int gPUModelNumber = gPUModel.getGPUModelNumber();
            gpu = gPUSubModel.name();
            gpu_ver = String.valueOf(gPUModelNumber);
            opengl_version = GPUModelDetector.getInstance().getGLVersion();
            ve_version = BuildConfig.AAR_VERSION_NAME;
            nativeInited = true;
        }
        hashMap.put("gpu", gpu);
        hashMap.put("gpu_ver", gpu_ver);
        hashMap.put("opengl_version", opengl_version);
        hashMap.put("ve_version", ve_version);
        return hashMap;
    }

    public static String get(String str) {
        return (String) toMap().get(str);
    }
}
