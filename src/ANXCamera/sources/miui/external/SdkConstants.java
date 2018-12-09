package miui.external;

interface SdkConstants {
    public static final String LOG_TAG = "miuisdk";

    public enum SdkError {
        GENERIC,
        NO_SDK,
        LOW_SDK_VERSION;
        
        public static final String INTENT_EXTRA_KEY = "com.miui.sdk.error";
    }

    public interface SdkReturnCode {
        public static final int LOW_SDK_VERSION = 1;
        public static final int SUCCESS = 0;
    }
}
