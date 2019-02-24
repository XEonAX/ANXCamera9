package com.google.android.apps.gsa.search.shared.service.proto;

import com.google.protobuf.Internal.EnumLite;
import com.google.protobuf.Internal.EnumLiteMap;

public enum ServiceEventId implements EnumLite {
    ATTACH_WEBVIEW(1),
    SHOW_WEBVIEW(63),
    HIDE_WEBVIEW(64),
    WEBVIEW_SCROLL_PADDING(65),
    DETACH_WEBVIEW(2),
    SET_DOODLE_DATA(3),
    ATTACH_NATIVE_VIEW(4),
    DETACH_NATIVE_VIEW(5),
    BIND_SPEECH_LEVELS(6),
    CLIENT_NOT_ACTIVATED(7),
    OPEN_LOCATION_SETTINGS(8),
    SEND_FEEDBACK(9),
    GSA_CONFIG_CHANGED(10),
    ENABLE_ACCESSIBILITY_TALKBACK(12),
    DISABLE_ACCESSIBILITY_TALKBACK(13),
    ATTACH_MATERIAL_PROGRESS_BAR(14),
    UPDATE_SEARCHBOX_UI_CONFIG(15),
    BACK_PRESS(16),
    UPDATE_CORPORA(17),
    CANVAS_WORKER_BINDER_RESPONSE(18),
    CANVAS_WORKER_BINDER_PROVIDER_RESPONSE(140),
    HANDLE_CANVAS_RESULT(20),
    HANDLE_CANVAS_RESULT_DONE(21),
    CLEAR_CANVAS(22),
    CANVAS_RESULTS_PROVIDER_BINDER(139),
    UPDATE_PROGRESS_AMOUNT(24),
    UPDATE_LOGO_HEADER_STATE(25),
    UPDATE_LOGO_HEADER_VISIBILITY(26),
    TRANSITION_TO_NOW(27),
    HAND_OVER(29),
    SHOW_PROGRESS(30),
    SHOW_CANVAS(31),
    NOTIFY_COMPLETED_CONVERSATION(32),
    NOTIFY_STARTED_CONVERSATION(33),
    NOTIFY_REQUEST_FOLLOW_ON(34),
    INIT_NOW_UI(35),
    UPDATE_SHOW_CORPUS_BAR(36),
    NOW_MAIN_STREAM_RESPONSE(37),
    REQUEST_LOG_UPDATE_CARD_IMPRESSION(38),
    UNDO_ACTION_USER_INTERACTION(39),
    UPDATE_CONVERSATION_STATE(42),
    DUMMY_EVENT(43),
    TTS_RESULT_EVENT(44),
    UPDATE_ACCOUNT_DRAWER(45),
    UPDATE_SPEECH_DETECTION_STATE(46),
    HANDSFREE_EVENT(47),
    SHOW_PROMPT(48),
    REPLACE_SEARCH_BOX_TEXT(180),
    SET_QUERY(49),
    CONFIGURE_ACTIVITY(50),
    START_ACTIVITY_FOR_RESULT(51),
    OPEN_DOODLE_RESPONSE(56),
    ON_SERVICE_CONNECTED(57),
    ON_SERVICE_DISCONNECTED(58),
    NATIVE_VIEW_ATTACHED(59),
    UPDATE_ACTION_DATA(60),
    HIDE_CANVAS(61),
    COCA_RESPONSE(62),
    ATTACH_STATE_CHANGED(66),
    UPDATE_CURRENT_NETWORK_TYPE(67),
    REMOTE_ACTION_RESPONSE(68),
    HIDE_HEADER(69),
    SHOW_HEADER(70),
    SHOW_LOADING_ICON(71),
    TAKE_RECENTLY_SCREENSHOT(72),
    OVERLAY_VIEW_REQUEST(73),
    VOICE_SEARCH_DONE(74),
    CLEAR_ERROR(75),
    TTS_PLAYBACK_DONE(76),
    TTS_PLAYBACK_STARTED(77),
    FOCUS_QUERY_AND_SHOW_KEYBOARD(78),
    UNFOCUS_QUERY_AND_HIDE_KEYBOARD(79),
    OPT_IN_COMPLETED(80),
    OPT_IN_NOT_NEEDED(81),
    FORCE_CLOSE(82),
    UPDATE_LEGACY_UI(83),
    UPDATE_ACTION_UI(84),
    AMP_VIEWER_SUPPORT_RESPONSE(85),
    UPDATE_CORPORA_ORDER(87),
    ON_HOTWORD_DETECTION_ERROR(88),
    UPDATE_TASK_DESCRIPTION(89),
    HANDLE_PLAIN_QUERY(91),
    SHOW_HOTWORD_TRIGGERED(94),
    HANDLE_SUGGEST_RESPONSE(95),
    SHOW_CLOCKWORK_RESULT(96),
    ON_SOUND_SEARCH_RESULT(97),
    UPDATE_TOP_VOICE_ACTION(98),
    SET_FINAL_RECOGNIZED_TEXT(99),
    UPDATE_RECOGNIZED_TEXT(100),
    BUILD_VE_LOGGING_DATA(101),
    SHOW_RECOGNITION_STATE(102),
    SHOW_ERROR(103),
    ON_AUDIO_RECORDING_AVAILABLE(104),
    SET_SEARCH_PLATE_MODE(105),
    START_ACTIVITY(106),
    SET_EXTERNAL_FLAGS(107),
    ON_TRANSCRIPTION_UPDATE(108),
    UPDATE_TIMESTAMP_UI(110),
    SHOW_VOICE_ACTIONS(111),
    NOTIFY_DEVICE_SELECTION_SUPPRESSION(113),
    SHOW_DISPLAY_SEGMENT(115),
    SHOW_ASSISTANT_RESPONSE(116),
    MONET_SERVICE_EVENT(117),
    UPDATE_VOICE_ACTION_UI(118),
    START_OF_SPEECH(119),
    HANDLE_CONTEXTUAL_CARDS(120),
    ON_TELEPHONY_OBTAINED(121),
    ON_TELEPHONY_LOST(122),
    DO_NOT_COMMIT_TO_TOUCH_ON_PAUSE(123),
    COMMIT_TO_TOUCH_ON_PAUSE(126),
    WORKER_UNLOADING_FINISHED(127),
    SHOW_PROMO_BAR(128),
    SHOW_SCREENSHOT_CAPTURE_UI(129),
    HIDE_SCREENSHOT_CAPTURE_UI(130),
    UPDATE_CANVAS_TIMING_LOGGER(131),
    NO_SPEECH_DETECTED(132),
    SHOW_MESSAGE_UI(133),
    HIDE_MESSAGE_UI(134),
    UPDATE_MEDIA_EXECUTION(135),
    UPDATE_SPEECH_EVENT(136),
    INIT_SEARCHBOX_UI(137),
    SHORTCUTS_AVAILABLE(138),
    UNBIND_BACKGROUND_CLIENT(141),
    CONVERSATION_SURFACE_EVENT(142),
    ASSISTANT_REQUEST_ID(202),
    UPDATE_SEARCHBOX_HINT_TEXT(143),
    GENERIC_SUGGEST_CALLBACK(144),
    SHOW_DATA_SAVER_ENABLED_DIALOG(145),
    SHOW_NOTIFICATIONS_DISABLED_DIALOG(146),
    PRONUNCIATION_LEARNING_DONE(148),
    PRONUNCIATION_LEARNING_SAVING_TO_ASSISTANT_SETTINGS_SERVER_ERROR(149),
    FINGERPRINT_AUTH_SERVICE_EVENT(150),
    REAUTH_SERVICE_EVENT(151),
    SCROLL_MAIN_CONTENT(152),
    OPA_DELETE_HISTORY_ENTRIES(153),
    SHOW_BACKGROUND_RETRY_ONBOARDING(154),
    OPA_EYES_VIEW_CONTROL(155),
    OPA_EYES_PROVIDE_IMAGES_RESPONSE(158),
    OPA_KEEP_SCREEN_ON(220),
    WERNICKE_PLAYBACK_STATE_CHANGED(156),
    SEARCH_ERROR_CHANGED(157),
    SHOW_HATS_SURVEY(160),
    PROACTIVE_RESPONSE_DRAWER_STATE(198),
    PROACTIVE_RESPONSE_CLUSTERED_CARDS(162),
    PROACTIVE_RESPONSE_STATIC_MAP_WITH_OPTIONS(163),
    PROACTIVE_RESPONSE_RESOLVE_TRAINING_QUESTION(164),
    PROACTIVE_RESPONSE_PHOTO_GALLERY_INTENT(165),
    PROACTIVE_RESPONSE_IS_REMINDER_SMART_ACTION_SUPPORTED(166),
    PROACTIVE_RESPONSE_TRANSLATE_IN_PLACE(167),
    PROACTIVE_RESPONSE_ENABLE_SEARCH_HISTORY_FOR_ACTIVE_ACCOUNT(168),
    PROACTIVE_RESPONSE_HELP_INTENT(170),
    PROACTIVE_RESPONSE_CREATE_CALENDAR_EVENT(171),
    PROACTIVE_RESPONSE_CURRENT_ACCOUNT(172),
    PROACTIVE_RESPONSE_LOCATION_SETTINGS_RESOLUTION(174),
    PROACTIVE_RESPONSE_SHARABLE_SHORT_URL(176),
    PROACTIVE_RESPONSE_NEW_CARDS_INFO(178),
    PROACTIVE_RESPONSE_NEW_CARDS_INFO_NON_TAB_STREAM(179),
    MUSIC_DETECTED(181),
    OPA_RESPONSE_SHERLOG_ENTRIES(182),
    COMMON_CONTENT_PROVIDER_DELETE_RESPONSE(183),
    COMMON_CONTENT_PROVIDER_QUERY_RESPONSE(184),
    COMMON_CONTENT_PROVIDER_GET_TYPE_RESPONSE(185),
    COMMON_CONTENT_PROVIDER_INSERT_RESPONSE(186),
    COMMON_CONTENT_PROVIDER_BULK_INSERT_RESPONSE(187),
    COMMON_CONTENT_PROVIDER_UPDATE_RESPONSE(188),
    COMMON_CONTENT_PROVIDER_OPEN_FILE_RESPONSE(189),
    LOAD_NATIVESRP_CANVAS(191),
    SHOW_FOOTER(192),
    HIDE_FOOTER(193),
    CONVERSATION_DELTA_PROCESSED(194),
    UPDATE_HAMBURGER_IN_NOW(195),
    UPDATE_HAMBURGER_IN_LOGO_HEADER(196),
    CHANGE_UPDATE_TIP_VISIBILITY(197),
    SRP_BOTTOM_BAR_SEARCH_TAB_CLICKED(199),
    HANDLE_HOTWORD_QUERY(200),
    SHOW_UPDATE_TOOLTIP(201),
    SEND_MEDIA_SESSION_TOKEN(203),
    HANDLE_DEEPLINK_DONE(204),
    OPA_STARTED(205),
    RSS_GMM_COMMUTE_QUERY_RESPONSE(206),
    BOTTOM_BAR_ENABLED_IN_SUGGEST(207),
    SHOW_BOTTOM_BAR_FEED_LURE_IN_SUGGEST(210),
    UPDATE_INITIAL_HEADER_VISIBILITY(211),
    PLACE_DETAILS_SERVICE_EVENT(212),
    BOTTOM_BAR_DRAWER_BUTTON_CLICKED(213),
    CLOSE_DRAWER_VIA_BOTTOM_BAR(214),
    SHOW_SCREENSHOT_CAPTURE_BUBBLE(215),
    HIDE_BURGER_IN_HEADER(216),
    SHOW_BURGER_IN_HEADER(217),
    NEW_ASSISTANT_RESPONSE_RECEIVED(218),
    OPA_CONVERSATION_CANCELLED(219),
    OPA_UI_SHOW_SUGGESTIONS(221),
    FETCH_CUSTOM_LOCATION_DETAILS_RESULTS(222),
    ACTIONS_RENDERING_DONE(223),
    OPA_ZERO_STATE_ENTRIES(224),
    HTTP_EXECUTE_REQUEST_UNBUFFERED_RESPONSE(225),
    HTTP_EXECUTE_REQUEST_RESPONSE(229),
    HTTP_CREATE_GRPC_CHANNEL_RESPONSE(230),
    HTTP_GET_STATISTICS_RESPONSE(226),
    OPA_ZERO_STATE_RESPONSE(227),
    SESSION_SEARCH_GRAPH_START(228),
    FETCH_SEARCH_SERVICE_BACKGROUND_TASK_NAMES_RESULT(231),
    WEB_ANSWER_HISTORY_RESPONSE(232),
    OPA_EYES_CAMERA_STATE(233),
    GELLER_RESPONSE(234),
    GET_SETTINGS_SERVICE_EVENT(235),
    UPDATE_SETTINGS_SERVICE_EVENT(236),
    LINK_DEVICE_SERVICE_EVENT(237),
    DISPLAY_DYNAMIC_ICON(238),
    SHOW_GREETING_BUBBLE(239),
    LENS_SERVICE_API_VERSION(240);
    
    public static final int ACTIONS_RENDERING_DONE_VALUE = 223;
    public static final int AMP_VIEWER_SUPPORT_RESPONSE_VALUE = 85;
    public static final int ASSISTANT_REQUEST_ID_VALUE = 202;
    public static final int ATTACH_MATERIAL_PROGRESS_BAR_VALUE = 14;
    public static final int ATTACH_NATIVE_VIEW_VALUE = 4;
    public static final int ATTACH_STATE_CHANGED_VALUE = 66;
    public static final int ATTACH_WEBVIEW_VALUE = 1;
    public static final int BACK_PRESS_VALUE = 16;
    public static final int BIND_SPEECH_LEVELS_VALUE = 6;
    public static final int BOTTOM_BAR_DRAWER_BUTTON_CLICKED_VALUE = 213;
    public static final int BOTTOM_BAR_ENABLED_IN_SUGGEST_VALUE = 207;
    public static final int BUILD_VE_LOGGING_DATA_VALUE = 101;
    public static final int CANVAS_RESULTS_PROVIDER_BINDER_VALUE = 139;
    public static final int CANVAS_WORKER_BINDER_PROVIDER_RESPONSE_VALUE = 140;
    public static final int CANVAS_WORKER_BINDER_RESPONSE_VALUE = 18;
    public static final int CHANGE_UPDATE_TIP_VISIBILITY_VALUE = 197;
    public static final int CLEAR_CANVAS_VALUE = 22;
    public static final int CLEAR_ERROR_VALUE = 75;
    public static final int CLIENT_NOT_ACTIVATED_VALUE = 7;
    public static final int CLOSE_DRAWER_VIA_BOTTOM_BAR_VALUE = 214;
    public static final int COCA_RESPONSE_VALUE = 62;
    public static final int COMMIT_TO_TOUCH_ON_PAUSE_VALUE = 126;
    public static final int COMMON_CONTENT_PROVIDER_BULK_INSERT_RESPONSE_VALUE = 187;
    public static final int COMMON_CONTENT_PROVIDER_DELETE_RESPONSE_VALUE = 183;
    public static final int COMMON_CONTENT_PROVIDER_GET_TYPE_RESPONSE_VALUE = 185;
    public static final int COMMON_CONTENT_PROVIDER_INSERT_RESPONSE_VALUE = 186;
    public static final int COMMON_CONTENT_PROVIDER_OPEN_FILE_RESPONSE_VALUE = 189;
    public static final int COMMON_CONTENT_PROVIDER_QUERY_RESPONSE_VALUE = 184;
    public static final int COMMON_CONTENT_PROVIDER_UPDATE_RESPONSE_VALUE = 188;
    public static final int CONFIGURE_ACTIVITY_VALUE = 50;
    public static final int CONVERSATION_DELTA_PROCESSED_VALUE = 194;
    public static final int CONVERSATION_SURFACE_EVENT_VALUE = 142;
    public static final int DETACH_NATIVE_VIEW_VALUE = 5;
    public static final int DETACH_WEBVIEW_VALUE = 2;
    public static final int DISABLE_ACCESSIBILITY_TALKBACK_VALUE = 13;
    public static final int DISPLAY_DYNAMIC_ICON_VALUE = 238;
    public static final int DO_NOT_COMMIT_TO_TOUCH_ON_PAUSE_VALUE = 123;
    public static final int DUMMY_EVENT_VALUE = 43;
    public static final int ENABLE_ACCESSIBILITY_TALKBACK_VALUE = 12;
    public static final int FETCH_CUSTOM_LOCATION_DETAILS_RESULTS_VALUE = 222;
    public static final int FETCH_SEARCH_SERVICE_BACKGROUND_TASK_NAMES_RESULT_VALUE = 231;
    public static final int FINGERPRINT_AUTH_SERVICE_EVENT_VALUE = 150;
    public static final int FOCUS_QUERY_AND_SHOW_KEYBOARD_VALUE = 78;
    public static final int FORCE_CLOSE_VALUE = 82;
    public static final int GELLER_RESPONSE_VALUE = 234;
    public static final int GENERIC_SUGGEST_CALLBACK_VALUE = 144;
    public static final int GET_SETTINGS_SERVICE_EVENT_VALUE = 235;
    public static final int GSA_CONFIG_CHANGED_VALUE = 10;
    public static final int HANDLE_CANVAS_RESULT_DONE_VALUE = 21;
    public static final int HANDLE_CANVAS_RESULT_VALUE = 20;
    public static final int HANDLE_CONTEXTUAL_CARDS_VALUE = 120;
    public static final int HANDLE_DEEPLINK_DONE_VALUE = 204;
    public static final int HANDLE_HOTWORD_QUERY_VALUE = 200;
    public static final int HANDLE_PLAIN_QUERY_VALUE = 91;
    public static final int HANDLE_SUGGEST_RESPONSE_VALUE = 95;
    public static final int HANDSFREE_EVENT_VALUE = 47;
    public static final int HAND_OVER_VALUE = 29;
    public static final int HIDE_BURGER_IN_HEADER_VALUE = 216;
    public static final int HIDE_CANVAS_VALUE = 61;
    public static final int HIDE_FOOTER_VALUE = 193;
    public static final int HIDE_HEADER_VALUE = 69;
    public static final int HIDE_MESSAGE_UI_VALUE = 134;
    public static final int HIDE_SCREENSHOT_CAPTURE_UI_VALUE = 130;
    public static final int HIDE_WEBVIEW_VALUE = 64;
    public static final int HTTP_CREATE_GRPC_CHANNEL_RESPONSE_VALUE = 230;
    public static final int HTTP_EXECUTE_REQUEST_RESPONSE_VALUE = 229;
    public static final int HTTP_EXECUTE_REQUEST_UNBUFFERED_RESPONSE_VALUE = 225;
    public static final int HTTP_GET_STATISTICS_RESPONSE_VALUE = 226;
    public static final int INIT_NOW_UI_VALUE = 35;
    public static final int INIT_SEARCHBOX_UI_VALUE = 137;
    public static final int LENS_SERVICE_API_VERSION_VALUE = 240;
    public static final int LINK_DEVICE_SERVICE_EVENT_VALUE = 237;
    public static final int LOAD_NATIVESRP_CANVAS_VALUE = 191;
    public static final int MONET_SERVICE_EVENT_VALUE = 117;
    public static final int MUSIC_DETECTED_VALUE = 181;
    public static final int NATIVE_VIEW_ATTACHED_VALUE = 59;
    public static final int NEW_ASSISTANT_RESPONSE_RECEIVED_VALUE = 218;
    public static final int NOTIFY_COMPLETED_CONVERSATION_VALUE = 32;
    public static final int NOTIFY_DEVICE_SELECTION_SUPPRESSION_VALUE = 113;
    public static final int NOTIFY_REQUEST_FOLLOW_ON_VALUE = 34;
    public static final int NOTIFY_STARTED_CONVERSATION_VALUE = 33;
    public static final int NOW_MAIN_STREAM_RESPONSE_VALUE = 37;
    public static final int NO_SPEECH_DETECTED_VALUE = 132;
    public static final int ON_AUDIO_RECORDING_AVAILABLE_VALUE = 104;
    public static final int ON_HOTWORD_DETECTION_ERROR_VALUE = 88;
    public static final int ON_SERVICE_CONNECTED_VALUE = 57;
    public static final int ON_SERVICE_DISCONNECTED_VALUE = 58;
    public static final int ON_SOUND_SEARCH_RESULT_VALUE = 97;
    public static final int ON_TELEPHONY_LOST_VALUE = 122;
    public static final int ON_TELEPHONY_OBTAINED_VALUE = 121;
    public static final int ON_TRANSCRIPTION_UPDATE_VALUE = 108;
    public static final int OPA_CONVERSATION_CANCELLED_VALUE = 219;
    public static final int OPA_DELETE_HISTORY_ENTRIES_VALUE = 153;
    public static final int OPA_EYES_CAMERA_STATE_VALUE = 233;
    public static final int OPA_EYES_PROVIDE_IMAGES_RESPONSE_VALUE = 158;
    public static final int OPA_EYES_VIEW_CONTROL_VALUE = 155;
    public static final int OPA_KEEP_SCREEN_ON_VALUE = 220;
    public static final int OPA_RESPONSE_SHERLOG_ENTRIES_VALUE = 182;
    public static final int OPA_STARTED_VALUE = 205;
    public static final int OPA_UI_SHOW_SUGGESTIONS_VALUE = 221;
    public static final int OPA_ZERO_STATE_ENTRIES_VALUE = 224;
    public static final int OPA_ZERO_STATE_RESPONSE_VALUE = 227;
    public static final int OPEN_DOODLE_RESPONSE_VALUE = 56;
    public static final int OPEN_LOCATION_SETTINGS_VALUE = 8;
    public static final int OPT_IN_COMPLETED_VALUE = 80;
    public static final int OPT_IN_NOT_NEEDED_VALUE = 81;
    public static final int OVERLAY_VIEW_REQUEST_VALUE = 73;
    public static final int PLACE_DETAILS_SERVICE_EVENT_VALUE = 212;
    public static final int PROACTIVE_RESPONSE_CLUSTERED_CARDS_VALUE = 162;
    public static final int PROACTIVE_RESPONSE_CREATE_CALENDAR_EVENT_VALUE = 171;
    public static final int PROACTIVE_RESPONSE_CURRENT_ACCOUNT_VALUE = 172;
    public static final int PROACTIVE_RESPONSE_DRAWER_STATE_VALUE = 198;
    public static final int PROACTIVE_RESPONSE_ENABLE_SEARCH_HISTORY_FOR_ACTIVE_ACCOUNT_VALUE = 168;
    public static final int PROACTIVE_RESPONSE_HELP_INTENT_VALUE = 170;
    public static final int PROACTIVE_RESPONSE_IS_REMINDER_SMART_ACTION_SUPPORTED_VALUE = 166;
    public static final int PROACTIVE_RESPONSE_LOCATION_SETTINGS_RESOLUTION_VALUE = 174;
    public static final int PROACTIVE_RESPONSE_NEW_CARDS_INFO_NON_TAB_STREAM_VALUE = 179;
    public static final int PROACTIVE_RESPONSE_NEW_CARDS_INFO_VALUE = 178;
    public static final int PROACTIVE_RESPONSE_PHOTO_GALLERY_INTENT_VALUE = 165;
    public static final int PROACTIVE_RESPONSE_RESOLVE_TRAINING_QUESTION_VALUE = 164;
    public static final int PROACTIVE_RESPONSE_SHARABLE_SHORT_URL_VALUE = 176;
    public static final int PROACTIVE_RESPONSE_STATIC_MAP_WITH_OPTIONS_VALUE = 163;
    public static final int PROACTIVE_RESPONSE_TRANSLATE_IN_PLACE_VALUE = 167;
    public static final int PRONUNCIATION_LEARNING_DONE_VALUE = 148;
    public static final int PRONUNCIATION_LEARNING_SAVING_TO_ASSISTANT_SETTINGS_SERVER_ERROR_VALUE = 149;
    public static final int REAUTH_SERVICE_EVENT_VALUE = 151;
    public static final int REMOTE_ACTION_RESPONSE_VALUE = 68;
    public static final int REPLACE_SEARCH_BOX_TEXT_VALUE = 180;
    public static final int REQUEST_LOG_UPDATE_CARD_IMPRESSION_VALUE = 38;
    public static final int RSS_GMM_COMMUTE_QUERY_RESPONSE_VALUE = 206;
    public static final int SCROLL_MAIN_CONTENT_VALUE = 152;
    public static final int SEARCH_ERROR_CHANGED_VALUE = 157;
    public static final int SEND_FEEDBACK_VALUE = 9;
    public static final int SEND_MEDIA_SESSION_TOKEN_VALUE = 203;
    public static final int SESSION_SEARCH_GRAPH_START_VALUE = 228;
    public static final int SET_DOODLE_DATA_VALUE = 3;
    public static final int SET_EXTERNAL_FLAGS_VALUE = 107;
    public static final int SET_FINAL_RECOGNIZED_TEXT_VALUE = 99;
    public static final int SET_QUERY_VALUE = 49;
    public static final int SET_SEARCH_PLATE_MODE_VALUE = 105;
    public static final int SHORTCUTS_AVAILABLE_VALUE = 138;
    public static final int SHOW_ASSISTANT_RESPONSE_VALUE = 116;
    public static final int SHOW_BACKGROUND_RETRY_ONBOARDING_VALUE = 154;
    public static final int SHOW_BOTTOM_BAR_FEED_LURE_IN_SUGGEST_VALUE = 210;
    public static final int SHOW_BURGER_IN_HEADER_VALUE = 217;
    public static final int SHOW_CANVAS_VALUE = 31;
    public static final int SHOW_CLOCKWORK_RESULT_VALUE = 96;
    public static final int SHOW_DATA_SAVER_ENABLED_DIALOG_VALUE = 145;
    public static final int SHOW_DISPLAY_SEGMENT_VALUE = 115;
    public static final int SHOW_ERROR_VALUE = 103;
    public static final int SHOW_FOOTER_VALUE = 192;
    public static final int SHOW_GREETING_BUBBLE_VALUE = 239;
    public static final int SHOW_HATS_SURVEY_VALUE = 160;
    public static final int SHOW_HEADER_VALUE = 70;
    public static final int SHOW_HOTWORD_TRIGGERED_VALUE = 94;
    public static final int SHOW_LOADING_ICON_VALUE = 71;
    public static final int SHOW_MESSAGE_UI_VALUE = 133;
    public static final int SHOW_NOTIFICATIONS_DISABLED_DIALOG_VALUE = 146;
    public static final int SHOW_PROGRESS_VALUE = 30;
    public static final int SHOW_PROMO_BAR_VALUE = 128;
    public static final int SHOW_PROMPT_VALUE = 48;
    public static final int SHOW_RECOGNITION_STATE_VALUE = 102;
    public static final int SHOW_SCREENSHOT_CAPTURE_BUBBLE_VALUE = 215;
    public static final int SHOW_SCREENSHOT_CAPTURE_UI_VALUE = 129;
    public static final int SHOW_UPDATE_TOOLTIP_VALUE = 201;
    public static final int SHOW_VOICE_ACTIONS_VALUE = 111;
    public static final int SHOW_WEBVIEW_VALUE = 63;
    public static final int SRP_BOTTOM_BAR_SEARCH_TAB_CLICKED_VALUE = 199;
    public static final int START_ACTIVITY_FOR_RESULT_VALUE = 51;
    public static final int START_ACTIVITY_VALUE = 106;
    public static final int START_OF_SPEECH_VALUE = 119;
    public static final int TAKE_RECENTLY_SCREENSHOT_VALUE = 72;
    public static final int TRANSITION_TO_NOW_VALUE = 27;
    public static final int TTS_PLAYBACK_DONE_VALUE = 76;
    public static final int TTS_PLAYBACK_STARTED_VALUE = 77;
    public static final int TTS_RESULT_EVENT_VALUE = 44;
    public static final int UNBIND_BACKGROUND_CLIENT_VALUE = 141;
    public static final int UNDO_ACTION_USER_INTERACTION_VALUE = 39;
    public static final int UNFOCUS_QUERY_AND_HIDE_KEYBOARD_VALUE = 79;
    public static final int UPDATE_ACCOUNT_DRAWER_VALUE = 45;
    public static final int UPDATE_ACTION_DATA_VALUE = 60;
    public static final int UPDATE_ACTION_UI_VALUE = 84;
    public static final int UPDATE_CANVAS_TIMING_LOGGER_VALUE = 131;
    public static final int UPDATE_CONVERSATION_STATE_VALUE = 42;
    public static final int UPDATE_CORPORA_ORDER_VALUE = 87;
    public static final int UPDATE_CORPORA_VALUE = 17;
    public static final int UPDATE_CURRENT_NETWORK_TYPE_VALUE = 67;
    public static final int UPDATE_HAMBURGER_IN_LOGO_HEADER_VALUE = 196;
    public static final int UPDATE_HAMBURGER_IN_NOW_VALUE = 195;
    public static final int UPDATE_INITIAL_HEADER_VISIBILITY_VALUE = 211;
    public static final int UPDATE_LEGACY_UI_VALUE = 83;
    public static final int UPDATE_LOGO_HEADER_STATE_VALUE = 25;
    public static final int UPDATE_LOGO_HEADER_VISIBILITY_VALUE = 26;
    public static final int UPDATE_MEDIA_EXECUTION_VALUE = 135;
    public static final int UPDATE_PROGRESS_AMOUNT_VALUE = 24;
    public static final int UPDATE_RECOGNIZED_TEXT_VALUE = 100;
    public static final int UPDATE_SEARCHBOX_HINT_TEXT_VALUE = 143;
    public static final int UPDATE_SEARCHBOX_UI_CONFIG_VALUE = 15;
    public static final int UPDATE_SETTINGS_SERVICE_EVENT_VALUE = 236;
    public static final int UPDATE_SHOW_CORPUS_BAR_VALUE = 36;
    public static final int UPDATE_SPEECH_DETECTION_STATE_VALUE = 46;
    public static final int UPDATE_SPEECH_EVENT_VALUE = 136;
    public static final int UPDATE_TASK_DESCRIPTION_VALUE = 89;
    public static final int UPDATE_TIMESTAMP_UI_VALUE = 110;
    public static final int UPDATE_TOP_VOICE_ACTION_VALUE = 98;
    public static final int UPDATE_VOICE_ACTION_UI_VALUE = 118;
    public static final int VOICE_SEARCH_DONE_VALUE = 74;
    public static final int WEBVIEW_SCROLL_PADDING_VALUE = 65;
    public static final int WEB_ANSWER_HISTORY_RESPONSE_VALUE = 232;
    public static final int WERNICKE_PLAYBACK_STATE_CHANGED_VALUE = 156;
    public static final int WORKER_UNLOADING_FINISHED_VALUE = 127;
    private static final EnumLiteMap<ServiceEventId> internalValueMap = null;
    private final int value;

    static {
        internalValueMap = new EnumLiteMap<ServiceEventId>() {
            public ServiceEventId findValueByNumber(int i) {
                return ServiceEventId.forNumber(i);
            }
        };
    }

    public final int getNumber() {
        return this.value;
    }

    public static ServiceEventId forNumber(int i) {
        switch (i) {
            case 1:
                return ATTACH_WEBVIEW;
            case 2:
                return DETACH_WEBVIEW;
            case 3:
                return SET_DOODLE_DATA;
            case 4:
                return ATTACH_NATIVE_VIEW;
            case 5:
                return DETACH_NATIVE_VIEW;
            case 6:
                return BIND_SPEECH_LEVELS;
            case 7:
                return CLIENT_NOT_ACTIVATED;
            case 8:
                return OPEN_LOCATION_SETTINGS;
            case 9:
                return SEND_FEEDBACK;
            case 10:
                return GSA_CONFIG_CHANGED;
            case 12:
                return ENABLE_ACCESSIBILITY_TALKBACK;
            case 13:
                return DISABLE_ACCESSIBILITY_TALKBACK;
            case 14:
                return ATTACH_MATERIAL_PROGRESS_BAR;
            case 15:
                return UPDATE_SEARCHBOX_UI_CONFIG;
            case 16:
                return BACK_PRESS;
            case 17:
                return UPDATE_CORPORA;
            case 18:
                return CANVAS_WORKER_BINDER_RESPONSE;
            case 20:
                return HANDLE_CANVAS_RESULT;
            case 21:
                return HANDLE_CANVAS_RESULT_DONE;
            case 22:
                return CLEAR_CANVAS;
            case 24:
                return UPDATE_PROGRESS_AMOUNT;
            case 25:
                return UPDATE_LOGO_HEADER_STATE;
            case 26:
                return UPDATE_LOGO_HEADER_VISIBILITY;
            case 27:
                return TRANSITION_TO_NOW;
            case 29:
                return HAND_OVER;
            case 30:
                return SHOW_PROGRESS;
            case 31:
                return SHOW_CANVAS;
            case 32:
                return NOTIFY_COMPLETED_CONVERSATION;
            case 33:
                return NOTIFY_STARTED_CONVERSATION;
            case 34:
                return NOTIFY_REQUEST_FOLLOW_ON;
            case 35:
                return INIT_NOW_UI;
            case 36:
                return UPDATE_SHOW_CORPUS_BAR;
            case 37:
                return NOW_MAIN_STREAM_RESPONSE;
            case 38:
                return REQUEST_LOG_UPDATE_CARD_IMPRESSION;
            case 39:
                return UNDO_ACTION_USER_INTERACTION;
            case 42:
                return UPDATE_CONVERSATION_STATE;
            case 43:
                return DUMMY_EVENT;
            case 44:
                return TTS_RESULT_EVENT;
            case 45:
                return UPDATE_ACCOUNT_DRAWER;
            case 46:
                return UPDATE_SPEECH_DETECTION_STATE;
            case 47:
                return HANDSFREE_EVENT;
            case 48:
                return SHOW_PROMPT;
            case 49:
                return SET_QUERY;
            case 50:
                return CONFIGURE_ACTIVITY;
            case 51:
                return START_ACTIVITY_FOR_RESULT;
            case 56:
                return OPEN_DOODLE_RESPONSE;
            case 57:
                return ON_SERVICE_CONNECTED;
            case 58:
                return ON_SERVICE_DISCONNECTED;
            case 59:
                return NATIVE_VIEW_ATTACHED;
            case 60:
                return UPDATE_ACTION_DATA;
            case 61:
                return HIDE_CANVAS;
            case 62:
                return COCA_RESPONSE;
            case 63:
                return SHOW_WEBVIEW;
            case 64:
                return HIDE_WEBVIEW;
            case 65:
                return WEBVIEW_SCROLL_PADDING;
            case 66:
                return ATTACH_STATE_CHANGED;
            case 67:
                return UPDATE_CURRENT_NETWORK_TYPE;
            case 68:
                return REMOTE_ACTION_RESPONSE;
            case 69:
                return HIDE_HEADER;
            case 70:
                return SHOW_HEADER;
            case 71:
                return SHOW_LOADING_ICON;
            case 72:
                return TAKE_RECENTLY_SCREENSHOT;
            case 73:
                return OVERLAY_VIEW_REQUEST;
            case 74:
                return VOICE_SEARCH_DONE;
            case 75:
                return CLEAR_ERROR;
            case 76:
                return TTS_PLAYBACK_DONE;
            case 77:
                return TTS_PLAYBACK_STARTED;
            case 78:
                return FOCUS_QUERY_AND_SHOW_KEYBOARD;
            case 79:
                return UNFOCUS_QUERY_AND_HIDE_KEYBOARD;
            case 80:
                return OPT_IN_COMPLETED;
            case 81:
                return OPT_IN_NOT_NEEDED;
            case 82:
                return FORCE_CLOSE;
            case 83:
                return UPDATE_LEGACY_UI;
            case 84:
                return UPDATE_ACTION_UI;
            case 85:
                return AMP_VIEWER_SUPPORT_RESPONSE;
            case 87:
                return UPDATE_CORPORA_ORDER;
            case 88:
                return ON_HOTWORD_DETECTION_ERROR;
            case 89:
                return UPDATE_TASK_DESCRIPTION;
            case 91:
                return HANDLE_PLAIN_QUERY;
            case 94:
                return SHOW_HOTWORD_TRIGGERED;
            case 95:
                return HANDLE_SUGGEST_RESPONSE;
            case 96:
                return SHOW_CLOCKWORK_RESULT;
            case 97:
                return ON_SOUND_SEARCH_RESULT;
            case 98:
                return UPDATE_TOP_VOICE_ACTION;
            case 99:
                return SET_FINAL_RECOGNIZED_TEXT;
            case 100:
                return UPDATE_RECOGNIZED_TEXT;
            case 101:
                return BUILD_VE_LOGGING_DATA;
            case 102:
                return SHOW_RECOGNITION_STATE;
            case 103:
                return SHOW_ERROR;
            case 104:
                return ON_AUDIO_RECORDING_AVAILABLE;
            case 105:
                return SET_SEARCH_PLATE_MODE;
            case 106:
                return START_ACTIVITY;
            case 107:
                return SET_EXTERNAL_FLAGS;
            case 108:
                return ON_TRANSCRIPTION_UPDATE;
            case 110:
                return UPDATE_TIMESTAMP_UI;
            case 111:
                return SHOW_VOICE_ACTIONS;
            case 113:
                return NOTIFY_DEVICE_SELECTION_SUPPRESSION;
            case 115:
                return SHOW_DISPLAY_SEGMENT;
            case 116:
                return SHOW_ASSISTANT_RESPONSE;
            case 117:
                return MONET_SERVICE_EVENT;
            case 118:
                return UPDATE_VOICE_ACTION_UI;
            case 119:
                return START_OF_SPEECH;
            case 120:
                return HANDLE_CONTEXTUAL_CARDS;
            case 121:
                return ON_TELEPHONY_OBTAINED;
            case 122:
                return ON_TELEPHONY_LOST;
            case 123:
                return DO_NOT_COMMIT_TO_TOUCH_ON_PAUSE;
            case 126:
                return COMMIT_TO_TOUCH_ON_PAUSE;
            case 127:
                return WORKER_UNLOADING_FINISHED;
            case 128:
                return SHOW_PROMO_BAR;
            case 129:
                return SHOW_SCREENSHOT_CAPTURE_UI;
            case 130:
                return HIDE_SCREENSHOT_CAPTURE_UI;
            case 131:
                return UPDATE_CANVAS_TIMING_LOGGER;
            case 132:
                return NO_SPEECH_DETECTED;
            case 133:
                return SHOW_MESSAGE_UI;
            case 134:
                return HIDE_MESSAGE_UI;
            case 135:
                return UPDATE_MEDIA_EXECUTION;
            case 136:
                return UPDATE_SPEECH_EVENT;
            case 137:
                return INIT_SEARCHBOX_UI;
            case 138:
                return SHORTCUTS_AVAILABLE;
            case 139:
                return CANVAS_RESULTS_PROVIDER_BINDER;
            case 140:
                return CANVAS_WORKER_BINDER_PROVIDER_RESPONSE;
            case 141:
                return UNBIND_BACKGROUND_CLIENT;
            case 142:
                return CONVERSATION_SURFACE_EVENT;
            case 143:
                return UPDATE_SEARCHBOX_HINT_TEXT;
            case 144:
                return GENERIC_SUGGEST_CALLBACK;
            case 145:
                return SHOW_DATA_SAVER_ENABLED_DIALOG;
            case 146:
                return SHOW_NOTIFICATIONS_DISABLED_DIALOG;
            case 148:
                return PRONUNCIATION_LEARNING_DONE;
            case 149:
                return PRONUNCIATION_LEARNING_SAVING_TO_ASSISTANT_SETTINGS_SERVER_ERROR;
            case 150:
                return FINGERPRINT_AUTH_SERVICE_EVENT;
            case 151:
                return REAUTH_SERVICE_EVENT;
            case 152:
                return SCROLL_MAIN_CONTENT;
            case 153:
                return OPA_DELETE_HISTORY_ENTRIES;
            case 154:
                return SHOW_BACKGROUND_RETRY_ONBOARDING;
            case 155:
                return OPA_EYES_VIEW_CONTROL;
            case 156:
                return WERNICKE_PLAYBACK_STATE_CHANGED;
            case 157:
                return SEARCH_ERROR_CHANGED;
            case 158:
                return OPA_EYES_PROVIDE_IMAGES_RESPONSE;
            case 160:
                return SHOW_HATS_SURVEY;
            case 162:
                return PROACTIVE_RESPONSE_CLUSTERED_CARDS;
            case 163:
                return PROACTIVE_RESPONSE_STATIC_MAP_WITH_OPTIONS;
            case 164:
                return PROACTIVE_RESPONSE_RESOLVE_TRAINING_QUESTION;
            case 165:
                return PROACTIVE_RESPONSE_PHOTO_GALLERY_INTENT;
            case 166:
                return PROACTIVE_RESPONSE_IS_REMINDER_SMART_ACTION_SUPPORTED;
            case 167:
                return PROACTIVE_RESPONSE_TRANSLATE_IN_PLACE;
            case 168:
                return PROACTIVE_RESPONSE_ENABLE_SEARCH_HISTORY_FOR_ACTIVE_ACCOUNT;
            case 170:
                return PROACTIVE_RESPONSE_HELP_INTENT;
            case 171:
                return PROACTIVE_RESPONSE_CREATE_CALENDAR_EVENT;
            case 172:
                return PROACTIVE_RESPONSE_CURRENT_ACCOUNT;
            case 174:
                return PROACTIVE_RESPONSE_LOCATION_SETTINGS_RESOLUTION;
            case 176:
                return PROACTIVE_RESPONSE_SHARABLE_SHORT_URL;
            case 178:
                return PROACTIVE_RESPONSE_NEW_CARDS_INFO;
            case 179:
                return PROACTIVE_RESPONSE_NEW_CARDS_INFO_NON_TAB_STREAM;
            case 180:
                return REPLACE_SEARCH_BOX_TEXT;
            case 181:
                return MUSIC_DETECTED;
            case 182:
                return OPA_RESPONSE_SHERLOG_ENTRIES;
            case 183:
                return COMMON_CONTENT_PROVIDER_DELETE_RESPONSE;
            case 184:
                return COMMON_CONTENT_PROVIDER_QUERY_RESPONSE;
            case 185:
                return COMMON_CONTENT_PROVIDER_GET_TYPE_RESPONSE;
            case 186:
                return COMMON_CONTENT_PROVIDER_INSERT_RESPONSE;
            case 187:
                return COMMON_CONTENT_PROVIDER_BULK_INSERT_RESPONSE;
            case 188:
                return COMMON_CONTENT_PROVIDER_UPDATE_RESPONSE;
            case 189:
                return COMMON_CONTENT_PROVIDER_OPEN_FILE_RESPONSE;
            case 191:
                return LOAD_NATIVESRP_CANVAS;
            case 192:
                return SHOW_FOOTER;
            case 193:
                return HIDE_FOOTER;
            case 194:
                return CONVERSATION_DELTA_PROCESSED;
            case 195:
                return UPDATE_HAMBURGER_IN_NOW;
            case 196:
                return UPDATE_HAMBURGER_IN_LOGO_HEADER;
            case 197:
                return CHANGE_UPDATE_TIP_VISIBILITY;
            case 198:
                return PROACTIVE_RESPONSE_DRAWER_STATE;
            case 199:
                return SRP_BOTTOM_BAR_SEARCH_TAB_CLICKED;
            case 200:
                return HANDLE_HOTWORD_QUERY;
            case 201:
                return SHOW_UPDATE_TOOLTIP;
            case 202:
                return ASSISTANT_REQUEST_ID;
            case 203:
                return SEND_MEDIA_SESSION_TOKEN;
            case 204:
                return HANDLE_DEEPLINK_DONE;
            case 205:
                return OPA_STARTED;
            case 206:
                return RSS_GMM_COMMUTE_QUERY_RESPONSE;
            case 207:
                return BOTTOM_BAR_ENABLED_IN_SUGGEST;
            case 210:
                return SHOW_BOTTOM_BAR_FEED_LURE_IN_SUGGEST;
            case 211:
                return UPDATE_INITIAL_HEADER_VISIBILITY;
            case 212:
                return PLACE_DETAILS_SERVICE_EVENT;
            case 213:
                return BOTTOM_BAR_DRAWER_BUTTON_CLICKED;
            case 214:
                return CLOSE_DRAWER_VIA_BOTTOM_BAR;
            case 215:
                return SHOW_SCREENSHOT_CAPTURE_BUBBLE;
            case 216:
                return HIDE_BURGER_IN_HEADER;
            case 217:
                return SHOW_BURGER_IN_HEADER;
            case 218:
                return NEW_ASSISTANT_RESPONSE_RECEIVED;
            case 219:
                return OPA_CONVERSATION_CANCELLED;
            case 220:
                return OPA_KEEP_SCREEN_ON;
            case 221:
                return OPA_UI_SHOW_SUGGESTIONS;
            case 222:
                return FETCH_CUSTOM_LOCATION_DETAILS_RESULTS;
            case 223:
                return ACTIONS_RENDERING_DONE;
            case 224:
                return OPA_ZERO_STATE_ENTRIES;
            case 225:
                return HTTP_EXECUTE_REQUEST_UNBUFFERED_RESPONSE;
            case 226:
                return HTTP_GET_STATISTICS_RESPONSE;
            case 227:
                return OPA_ZERO_STATE_RESPONSE;
            case 228:
                return SESSION_SEARCH_GRAPH_START;
            case 229:
                return HTTP_EXECUTE_REQUEST_RESPONSE;
            case 230:
                return HTTP_CREATE_GRPC_CHANNEL_RESPONSE;
            case 231:
                return FETCH_SEARCH_SERVICE_BACKGROUND_TASK_NAMES_RESULT;
            case 232:
                return WEB_ANSWER_HISTORY_RESPONSE;
            case 233:
                return OPA_EYES_CAMERA_STATE;
            case 234:
                return GELLER_RESPONSE;
            case 235:
                return GET_SETTINGS_SERVICE_EVENT;
            case 236:
                return UPDATE_SETTINGS_SERVICE_EVENT;
            case 237:
                return LINK_DEVICE_SERVICE_EVENT;
            case 238:
                return DISPLAY_DYNAMIC_ICON;
            case 239:
                return SHOW_GREETING_BUBBLE;
            case 240:
                return LENS_SERVICE_API_VERSION;
            default:
                return null;
        }
    }

    public static EnumLiteMap<ServiceEventId> internalGetValueMap() {
        return internalValueMap;
    }

    private ServiceEventId(int i) {
        this.value = i;
    }
}
