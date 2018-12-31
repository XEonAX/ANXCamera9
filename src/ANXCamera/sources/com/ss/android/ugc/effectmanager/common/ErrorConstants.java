package com.ss.android.ugc.effectmanager.common;

import com.android.camera.network.net.base.Method;

public class ErrorConstants {
    public static final int APP_NEED_UPGRADE = 2006;
    public static final int CODE_CANCEL_DOWNLOAD = 10001;
    public static final int CODE_DOWNLOAD_ERROR = 10002;
    public static final int CODE_EFFECT_NULL = 10003;
    public static final int CODE_INVALID_EFFECT_CACHE = 10004;
    public static final int CODE_INVALID_EFFECT_ID = 10014;
    public static final int CODE_IO_FAIL = 10012;
    public static final int CODE_JSON_CONVERT_ERROR = 10008;
    public static final int CODE_MD5_ERROR = 10010;
    public static final int CODE_NO_DOWNLOADED_EFFECTS = 10006;
    public static final int CODE_NO_LOCAL_TAG = 10009;
    public static final int CODE_NO_NETWORK = 10011;
    public static final int CODE_PANEL_NULL = 10007;
    public static final int CODE_SDK_ERROR = 10005;
    public static final int CODE_UNKNOW = 1;
    public static final int CODE_UNZIP_FAIL = 10013;
    public static final int EFFECT_NOT_FOUND = 2004;
    public static final int EFFECT_NOT_IN_WHITE_LIST = 2005;
    public static final int EFFECT_NOT_SUPPORT = 2003;
    public static final int EFFECT_UNAVAILABLE = 2002;
    public static final String EXCEPTION_CANCEL_DOWNLOAD = "Cancel download";
    public static final String EXCEPTION_DOWNLOAD_ERROR = "Download error";
    public static final String EXCEPTION_EFFECT_NULL = "Sticker is null";
    public static final String EXCEPTION_INVALID_EFFECT_CACHE = "Invalid effect list cache !!!";
    public static final String EXCEPTION_JSON_CONVERT = "Json convert fail";
    public static final String EXCEPTION_MD5_ERROR = "MD5 error";
    public static final String EXCEPTION_NO_DOWNLOADED_EFFECTS = "No Downloaded Effects";
    public static final String EXCEPTION_NO_NETWORK = "network unavailable";
    public static final String EXCEPTION_PANEL_NULL = "panel is null";
    public static final String EXCEPTION_SDK_ERROR = "SDK error";
    public static final String LOG_CACHE_DIR_NOT_SET = "Cache directory error";
    public static final String LOG_CONFIGURATION_NOT_SET = "Not set configuration";
    public static final String LOG_CONTEXT_NOT_SET = "Not set net context";
    public static final String LOG_HOST_NOT_SET = "Not set host !!!";
    public static final String LOG_JSON_CONCERT_NOT_SET = "Not set json convert";
    public static final String LOG_NET_WORKER_NOT_SET = "Not set net worker";

    public static String APIErrorHandle(int i) {
        if (i == 1) {
            return "未知错误";
        }
        if (i == CODE_INVALID_EFFECT_ID) {
            return "无效的effect id";
        }
        switch (i) {
            case 1000:
                return "参数不合法（参数缺失或者错误）";
            case 1001:
                return "access_key不合法";
            case Method.SECURE_POST /*1002*/:
                return "app_version不合法";
            case 1003:
                return "sdk_version不合法";
            case 1004:
                return "device_id不合法";
            case 1005:
                return "device_platform不合法";
            case 1006:
                return "device_type不合法";
            case 1007:
                return "channel不合法";
            case 1008:
                return "app_channel不合法";
            default:
                switch (i) {
                    case 1100:
                        return "当前应用不是测试应用";
                    case 1101:
                        return "access_key不存在";
                    default:
                        switch (i) {
                            case 2001:
                                return "内容没有发生变化";
                            case EFFECT_UNAVAILABLE /*2002*/:
                                return "Effect已下线";
                            case EFFECT_NOT_SUPPORT /*2003*/:
                                return "不支持当前设备";
                            case EFFECT_NOT_FOUND /*2004*/:
                                return "当前特效id不存在";
                            case EFFECT_NOT_IN_WHITE_LIST /*2005*/:
                                return "不在白名单";
                            case APP_NEED_UPGRADE /*2006*/:
                                return "需要更新app";
                            default:
                                switch (i) {
                                    case CODE_CANCEL_DOWNLOAD /*10001*/:
                                        return EXCEPTION_CANCEL_DOWNLOAD;
                                    case CODE_DOWNLOAD_ERROR /*10002*/:
                                        return EXCEPTION_DOWNLOAD_ERROR;
                                    case CODE_EFFECT_NULL /*10003*/:
                                        return EXCEPTION_EFFECT_NULL;
                                    case CODE_INVALID_EFFECT_CACHE /*10004*/:
                                        return EXCEPTION_INVALID_EFFECT_CACHE;
                                    case CODE_SDK_ERROR /*10005*/:
                                        return EXCEPTION_SDK_ERROR;
                                    case CODE_NO_DOWNLOADED_EFFECTS /*10006*/:
                                        return EXCEPTION_NO_DOWNLOADED_EFFECTS;
                                    case CODE_PANEL_NULL /*10007*/:
                                        return EXCEPTION_PANEL_NULL;
                                    default:
                                        switch (i) {
                                            case CODE_NO_LOCAL_TAG /*10009*/:
                                                return "没有本地 TAG 缓存";
                                            case CODE_MD5_ERROR /*10010*/:
                                                return EXCEPTION_MD5_ERROR;
                                            case CODE_NO_NETWORK /*10011*/:
                                                return "无网络";
                                            case CODE_IO_FAIL /*10012*/:
                                                return "io 错误";
                                            default:
                                                return "未知错误";
                                        }
                                }
                        }
                }
        }
    }
}
