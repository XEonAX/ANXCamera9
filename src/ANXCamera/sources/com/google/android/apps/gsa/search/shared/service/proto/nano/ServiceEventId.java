package com.google.android.apps.gsa.search.shared.service.proto.nano;

import com.google.protobuf.nano.NanoEnumValue;

public interface ServiceEventId {
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int ACTIONS_RENDERING_DONE = 223;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int AMP_VIEWER_SUPPORT_RESPONSE = 85;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int ASSISTANT_REQUEST_ID = 202;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int ATTACH_MATERIAL_PROGRESS_BAR = 14;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int ATTACH_NATIVE_VIEW = 4;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int ATTACH_STATE_CHANGED = 66;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int ATTACH_WEBVIEW = 1;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int BACK_PRESS = 16;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int BIND_SPEECH_LEVELS = 6;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int BOTTOM_BAR_DRAWER_BUTTON_CLICKED = 213;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int BOTTOM_BAR_ENABLED_IN_SUGGEST = 207;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int BUILD_VE_LOGGING_DATA = 101;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int CANVAS_RESULTS_PROVIDER_BINDER = 139;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int CANVAS_WORKER_BINDER_PROVIDER_RESPONSE = 140;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int CANVAS_WORKER_BINDER_RESPONSE = 18;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int CHANGE_UPDATE_TIP_VISIBILITY = 197;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int CLEAR_CANVAS = 22;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int CLEAR_ERROR = 75;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int CLIENT_NOT_ACTIVATED = 7;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int CLOSE_DRAWER_VIA_BOTTOM_BAR = 214;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int COCA_RESPONSE = 62;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int COMMIT_TO_TOUCH_ON_PAUSE = 126;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int COMMON_CONTENT_PROVIDER_BULK_INSERT_RESPONSE = 187;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int COMMON_CONTENT_PROVIDER_DELETE_RESPONSE = 183;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int COMMON_CONTENT_PROVIDER_GET_TYPE_RESPONSE = 185;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int COMMON_CONTENT_PROVIDER_INSERT_RESPONSE = 186;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int COMMON_CONTENT_PROVIDER_OPEN_FILE_RESPONSE = 189;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int COMMON_CONTENT_PROVIDER_QUERY_RESPONSE = 184;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int COMMON_CONTENT_PROVIDER_UPDATE_RESPONSE = 188;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int CONFIGURE_ACTIVITY = 50;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int CONVERSATION_DELTA_PROCESSED = 194;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int CONVERSATION_SURFACE_EVENT = 142;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int DETACH_NATIVE_VIEW = 5;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int DETACH_WEBVIEW = 2;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int DISABLE_ACCESSIBILITY_TALKBACK = 13;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int DISPLAY_DYNAMIC_ICON = 238;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int DO_NOT_COMMIT_TO_TOUCH_ON_PAUSE = 123;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int DUMMY_EVENT = 43;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int ENABLE_ACCESSIBILITY_TALKBACK = 12;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int FETCH_CUSTOM_LOCATION_DETAILS_RESULTS = 222;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int FETCH_SEARCH_SERVICE_BACKGROUND_TASK_NAMES_RESULT = 231;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int FINGERPRINT_AUTH_SERVICE_EVENT = 150;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int FOCUS_QUERY_AND_SHOW_KEYBOARD = 78;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int FORCE_CLOSE = 82;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int GELLER_RESPONSE = 234;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int GENERIC_SUGGEST_CALLBACK = 144;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int GET_SETTINGS_SERVICE_EVENT = 235;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int GSA_CONFIG_CHANGED = 10;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int HANDLE_CANVAS_RESULT = 20;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int HANDLE_CANVAS_RESULT_DONE = 21;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int HANDLE_CONTEXTUAL_CARDS = 120;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int HANDLE_DEEPLINK_DONE = 204;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int HANDLE_HOTWORD_QUERY = 200;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int HANDLE_PLAIN_QUERY = 91;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int HANDLE_SUGGEST_RESPONSE = 95;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int HANDSFREE_EVENT = 47;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int HAND_OVER = 29;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int HIDE_BURGER_IN_HEADER = 216;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int HIDE_CANVAS = 61;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int HIDE_FOOTER = 193;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int HIDE_HEADER = 69;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int HIDE_MESSAGE_UI = 134;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int HIDE_SCREENSHOT_CAPTURE_UI = 130;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int HIDE_WEBVIEW = 64;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int HTTP_CREATE_GRPC_CHANNEL_RESPONSE = 230;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int HTTP_EXECUTE_REQUEST_RESPONSE = 229;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int HTTP_EXECUTE_REQUEST_UNBUFFERED_RESPONSE = 225;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int HTTP_GET_STATISTICS_RESPONSE = 226;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int INIT_NOW_UI = 35;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int INIT_SEARCHBOX_UI = 137;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int LENS_SERVICE_API_VERSION = 240;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int LINK_DEVICE_SERVICE_EVENT = 237;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int LOAD_NATIVESRP_CANVAS = 191;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int MONET_SERVICE_EVENT = 117;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int MUSIC_DETECTED = 181;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int NATIVE_VIEW_ATTACHED = 59;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int NEW_ASSISTANT_RESPONSE_RECEIVED = 218;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int NOTIFY_COMPLETED_CONVERSATION = 32;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int NOTIFY_DEVICE_SELECTION_SUPPRESSION = 113;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int NOTIFY_REQUEST_FOLLOW_ON = 34;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int NOTIFY_STARTED_CONVERSATION = 33;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int NOW_MAIN_STREAM_RESPONSE = 37;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int NO_SPEECH_DETECTED = 132;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int ON_AUDIO_RECORDING_AVAILABLE = 104;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int ON_HOTWORD_DETECTION_ERROR = 88;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int ON_SERVICE_CONNECTED = 57;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int ON_SERVICE_DISCONNECTED = 58;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int ON_SOUND_SEARCH_RESULT = 97;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int ON_TELEPHONY_LOST = 122;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int ON_TELEPHONY_OBTAINED = 121;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int ON_TRANSCRIPTION_UPDATE = 108;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int OPA_CONVERSATION_CANCELLED = 219;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int OPA_DELETE_HISTORY_ENTRIES = 153;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int OPA_EYES_CAMERA_STATE = 233;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int OPA_EYES_PROVIDE_IMAGES_RESPONSE = 158;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int OPA_EYES_VIEW_CONTROL = 155;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int OPA_KEEP_SCREEN_ON = 220;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int OPA_RESPONSE_SHERLOG_ENTRIES = 182;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int OPA_STARTED = 205;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int OPA_UI_SHOW_SUGGESTIONS = 221;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int OPA_ZERO_STATE_ENTRIES = 224;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int OPA_ZERO_STATE_RESPONSE = 227;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int OPEN_DOODLE_RESPONSE = 56;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int OPEN_LOCATION_SETTINGS = 8;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int OPT_IN_COMPLETED = 80;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int OPT_IN_NOT_NEEDED = 81;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int OVERLAY_VIEW_REQUEST = 73;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int PLACE_DETAILS_SERVICE_EVENT = 212;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int PROACTIVE_RESPONSE_CLUSTERED_CARDS = 162;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int PROACTIVE_RESPONSE_CREATE_CALENDAR_EVENT = 171;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int PROACTIVE_RESPONSE_CURRENT_ACCOUNT = 172;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int PROACTIVE_RESPONSE_DRAWER_STATE = 198;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int PROACTIVE_RESPONSE_ENABLE_SEARCH_HISTORY_FOR_ACTIVE_ACCOUNT = 168;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int PROACTIVE_RESPONSE_HELP_INTENT = 170;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int PROACTIVE_RESPONSE_IS_REMINDER_SMART_ACTION_SUPPORTED = 166;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int PROACTIVE_RESPONSE_LOCATION_SETTINGS_RESOLUTION = 174;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int PROACTIVE_RESPONSE_NEW_CARDS_INFO = 178;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int PROACTIVE_RESPONSE_NEW_CARDS_INFO_NON_TAB_STREAM = 179;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int PROACTIVE_RESPONSE_PHOTO_GALLERY_INTENT = 165;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int PROACTIVE_RESPONSE_RESOLVE_TRAINING_QUESTION = 164;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int PROACTIVE_RESPONSE_SHARABLE_SHORT_URL = 176;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int PROACTIVE_RESPONSE_STATIC_MAP_WITH_OPTIONS = 163;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int PROACTIVE_RESPONSE_TRANSLATE_IN_PLACE = 167;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int PRONUNCIATION_LEARNING_DONE = 148;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int PRONUNCIATION_LEARNING_SAVING_TO_ASSISTANT_SETTINGS_SERVER_ERROR = 149;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int REAUTH_SERVICE_EVENT = 151;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int REMOTE_ACTION_RESPONSE = 68;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int REPLACE_SEARCH_BOX_TEXT = 180;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int REQUEST_LOG_UPDATE_CARD_IMPRESSION = 38;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int RSS_GMM_COMMUTE_QUERY_RESPONSE = 206;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SCROLL_MAIN_CONTENT = 152;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SEARCH_ERROR_CHANGED = 157;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SEND_FEEDBACK = 9;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SEND_MEDIA_SESSION_TOKEN = 203;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SESSION_SEARCH_GRAPH_START = 228;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SET_DOODLE_DATA = 3;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SET_EXTERNAL_FLAGS = 107;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SET_FINAL_RECOGNIZED_TEXT = 99;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SET_QUERY = 49;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SET_SEARCH_PLATE_MODE = 105;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SHORTCUTS_AVAILABLE = 138;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SHOW_ASSISTANT_RESPONSE = 116;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SHOW_BACKGROUND_RETRY_ONBOARDING = 154;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SHOW_BOTTOM_BAR_FEED_LURE_IN_SUGGEST = 210;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SHOW_BURGER_IN_HEADER = 217;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SHOW_CANVAS = 31;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SHOW_CLOCKWORK_RESULT = 96;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SHOW_DATA_SAVER_ENABLED_DIALOG = 145;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SHOW_DISPLAY_SEGMENT = 115;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SHOW_ERROR = 103;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SHOW_FOOTER = 192;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SHOW_GREETING_BUBBLE = 239;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SHOW_HATS_SURVEY = 160;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SHOW_HEADER = 70;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SHOW_HOTWORD_TRIGGERED = 94;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SHOW_LOADING_ICON = 71;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SHOW_MESSAGE_UI = 133;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SHOW_NOTIFICATIONS_DISABLED_DIALOG = 146;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SHOW_PROGRESS = 30;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SHOW_PROMO_BAR = 128;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SHOW_PROMPT = 48;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SHOW_RECOGNITION_STATE = 102;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SHOW_SCREENSHOT_CAPTURE_BUBBLE = 215;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SHOW_SCREENSHOT_CAPTURE_UI = 129;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SHOW_UPDATE_TOOLTIP = 201;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SHOW_VOICE_ACTIONS = 111;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SHOW_WEBVIEW = 63;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int SRP_BOTTOM_BAR_SEARCH_TAB_CLICKED = 199;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int START_ACTIVITY = 106;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int START_ACTIVITY_FOR_RESULT = 51;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int START_OF_SPEECH = 119;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int TAKE_RECENTLY_SCREENSHOT = 72;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int TRANSITION_TO_NOW = 27;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int TTS_PLAYBACK_DONE = 76;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int TTS_PLAYBACK_STARTED = 77;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int TTS_RESULT_EVENT = 44;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int UNBIND_BACKGROUND_CLIENT = 141;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int UNDO_ACTION_USER_INTERACTION = 39;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int UNFOCUS_QUERY_AND_HIDE_KEYBOARD = 79;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int UPDATE_ACCOUNT_DRAWER = 45;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int UPDATE_ACTION_DATA = 60;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int UPDATE_ACTION_UI = 84;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int UPDATE_CANVAS_TIMING_LOGGER = 131;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int UPDATE_CONVERSATION_STATE = 42;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int UPDATE_CORPORA = 17;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int UPDATE_CORPORA_ORDER = 87;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int UPDATE_CURRENT_NETWORK_TYPE = 67;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int UPDATE_HAMBURGER_IN_LOGO_HEADER = 196;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int UPDATE_HAMBURGER_IN_NOW = 195;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int UPDATE_INITIAL_HEADER_VISIBILITY = 211;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int UPDATE_LEGACY_UI = 83;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int UPDATE_LOGO_HEADER_STATE = 25;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int UPDATE_LOGO_HEADER_VISIBILITY = 26;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int UPDATE_MEDIA_EXECUTION = 135;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int UPDATE_PROGRESS_AMOUNT = 24;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int UPDATE_RECOGNIZED_TEXT = 100;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int UPDATE_SEARCHBOX_HINT_TEXT = 143;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int UPDATE_SEARCHBOX_UI_CONFIG = 15;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int UPDATE_SETTINGS_SERVICE_EVENT = 236;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int UPDATE_SHOW_CORPUS_BAR = 36;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int UPDATE_SPEECH_DETECTION_STATE = 46;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int UPDATE_SPEECH_EVENT = 136;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int UPDATE_TASK_DESCRIPTION = 89;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int UPDATE_TIMESTAMP_UI = 110;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int UPDATE_TOP_VOICE_ACTION = 98;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int UPDATE_VOICE_ACTION_UI = 118;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int VOICE_SEARCH_DONE = 74;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int WEBVIEW_SCROLL_PADDING = 65;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int WEB_ANSWER_HISTORY_RESPONSE = 232;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int WERNICKE_PLAYBACK_STATE_CHANGED = 156;
    @NanoEnumValue(legacy = false, value = ServiceEventId.class)
    public static final int WORKER_UNLOADING_FINISHED = 127;
}
