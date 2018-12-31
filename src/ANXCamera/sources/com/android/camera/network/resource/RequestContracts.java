package com.android.camera.network.resource;

interface RequestContracts {
    public static final String HOST = "http://micloudweb.preview.n.xiaomi.com";

    public interface Download {
        public static final String JSON_KEY_SHA1 = "sha1Base16";
        public static final String JSON_KEY_URL = "url";
        public static final String PARAM_ID = "id";
        public static final String URL = "http://micloudweb.preview.n.xiaomi.com/gallery/public/resource/download";
    }

    public interface Info {
        public static final String EXPIRE_AT = "expireAt";
        public static final String JSON_KEY_EXTRA = "extraInfo";
        public static final String JSON_KEY_ICON = "icon";
        public static final String JSON_KEY_ID = "id";
        public static final String JSON_KEY_ITEMS = "galleryResourceInfoList";
        public static final String JSON_KEY_LAST_PAGE = "lastPage";
        public static final String JSON_KEY_SYNC_TOKEN = "syncToken";
        public static final String PARAM_ID = "id";
        public static final String PARAM_SYNC_TOKEN = "syncToken";
        public static final String URL = "http://micloudweb.preview.n.xiaomi.com/gallery/public/resource/info";
    }
}
