.class public interface abstract Lcom/android/camera/protocol/ModeProtocol;
.super Ljava/lang/Object;
.source "ModeProtocol.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/protocol/ModeProtocol$UltraWideProtocol;,
        Lcom/android/camera/protocol/ModeProtocol$OnFaceBeautyChangedProtocol;,
        Lcom/android/camera/protocol/ModeProtocol$VerticalProtocol;,
        Lcom/android/camera/protocol/ModeProtocol$BottomMenuProtocol;,
        Lcom/android/camera/protocol/ModeProtocol$FullScreenProtocol;,
        Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;,
        Lcom/android/camera/protocol/ModeProtocol$TopConfigProtocol;,
        Lcom/android/camera/protocol/ModeProtocol$FaceBeautyProtocol;,
        Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;,
        Lcom/android/camera/protocol/ModeProtocol$StickerProtocol;,
        Lcom/android/camera/protocol/ModeProtocol$ManuallyAdjust;,
        Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;,
        Lcom/android/camera/protocol/ModeProtocol$BokehFNumberController;,
        Lcom/android/camera/protocol/ModeProtocol$DualController;,
        Lcom/android/camera/protocol/ModeProtocol$ManuallyValueChanged;,
        Lcom/android/camera/protocol/ModeProtocol$BeautyRecording;,
        Lcom/android/camera/protocol/ModeProtocol$HandleBeautyRecording;,
        Lcom/android/camera/protocol/ModeProtocol$HandlerSwitcher;,
        Lcom/android/camera/protocol/ModeProtocol$FilterProtocol;,
        Lcom/android/camera/protocol/ModeProtocol$BackStack;,
        Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;,
        Lcom/android/camera/protocol/ModeProtocol$GestureDetected;,
        Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;,
        Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;,
        Lcom/android/camera/protocol/ModeProtocol$SnapShotIndicator;,
        Lcom/android/camera/protocol/ModeProtocol$IndicatorProtocol;,
        Lcom/android/camera/protocol/ModeProtocol$ShowType;,
        Lcom/android/camera/protocol/ModeProtocol$IndicatorType;,
        Lcom/android/camera/protocol/ModeProtocol$EffectCropViewController;,
        Lcom/android/camera/protocol/ModeProtocol$ZoomProtocol;,
        Lcom/android/camera/protocol/ModeProtocol$EvChangedProtocol;,
        Lcom/android/camera/protocol/ModeProtocol$AdjustEvState;,
        Lcom/android/camera/protocol/ModeProtocol$PlayVideoProtocol;,
        Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;,
        Lcom/android/camera/protocol/ModeProtocol$ModeChangeController;,
        Lcom/android/camera/protocol/ModeProtocol$CameraActionTrack;,
        Lcom/android/camera/protocol/ModeProtocol$CameraModuleSpecial;,
        Lcom/android/camera/protocol/ModeProtocol$CameraAction;,
        Lcom/android/camera/protocol/ModeProtocol$TopAlert;,
        Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;,
        Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;,
        Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;,
        Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;,
        Lcom/android/camera/protocol/ModeProtocol$EventType;,
        Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;,
        Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;,
        Lcom/android/camera/protocol/ModeProtocol$ProtocolType;
    }
.end annotation


# static fields
.field public static final ADJUST_EV_START:I = 0x1

.field public static final ADJUST_EV_STOP:I = 0x2

.field public static final EVENT_BEAUTY:I = 0x2

.field public static final EVENT_BEAUTYLEVEL:I = 0x5

.field public static final EVENT_BLANK_BEAUTY:I = 0xa

.field public static final EVENT_EYE_POPU_TIP:I = 0x9

.field public static final EVENT_FILTER:I = 0x1

.field public static final EVENT_INTENT_SHOT_FINISH:I = 0x6

.field public static final EVENT_LIVE_SPEED:I = 0xd

.field public static final EVENT_LIVE_STICKER:I = 0xc

.field public static final EVENT_MAKEUP:I = 0x3

.field public static final EVENT_RESTORE_BOTTOM_ACTION:I = 0x7

.field public static final EVENT_STICKER:I = 0x4

.field public static final INDICATOR_FACE_VIEW:I = 0x1

.field public static final INDICATOR_FOCUS_VIEW:I = 0x2

.field public static final INDICATOR_OBJECT_VIEW:I = 0x3

.field public static final PROTOCOL_ACTION:I = 0xa1

.field public static final PROTOCOL_ACTION_PROCESSING:I = 0xa2

.field public static final PROTOCOL_ACTION_TRACK:I = 0xba

.field public static final PROTOCOL_BACK_STACK:I = 0xab

.field public static final PROTOCOL_BEAUTY_RECORDING:I = 0xad

.field public static final PROTOCOL_BOKEH_F_NUMBER:I = 0xd2

.field public static final PROTOCOL_BOTTOM_MENU:I = 0xc5

.field public static final PROTOCOL_BOTTOM_POPUP_TIPS:I = 0xaf

.field public static final PROTOCOL_CAMERA_MODULE_SPEC:I = 0xc3

.field public static final PROTOCOL_CONFIG_CHANGE:I = 0xa4

.field public static final PROTOCOL_DELEGATE:I = 0xa0

.field public static final PROTOCOL_DUAL_CONTROLLER:I = 0xb6

.field public static final PROTOCOL_EFFECT_CONTROL:I = 0xa5

.field public static final PROTOCOL_EV_CHANGED:I = 0xa9

.field public static final PROTOCOL_FACE_BEAUTY:I = 0xb9

.field public static final PROTOCOL_FILTER_SWITCHER:I = 0xb7

.field public static final PROTOCOL_FRONT_BEAUTY:I = 0xc2

.field public static final PROTOCOL_LIVE_CONFIG:I = 0xc9

.field public static final PROTOCOL_LIVE_MUSIC:I = 0xd3

.field public static final PROTOCOL_LIVE_VIDEO_EDITOR:I = 0xd1

.field public static final PROTOCOL_MAIN_CONTENT:I = 0xa6

.field public static final PROTOCOL_MAKEUP_CONTROL:I = 0xb4

.field public static final PROTOCOL_MANUALLY_ADJUST:I = 0xb5

.field public static final PROTOCOL_MANUALLY_CHANGE:I = 0xae

.field public static final PROTOCOL_MODE_CHANGE_CONTROLLER:I = 0xb3

.field public static final PROTOCOL_ON_FACE_BEAUTY_CHANGED:I = 0xc7

.field public static final PROTOCOL_PANORAMA:I = 0xb0

.field public static final PROTOCOL_PLAY_VIDEO:I = 0xa7

.field public static final PROTOCOL_PREVIEW_CHANGED:I = 0xa8

.field public static final PROTOCOL_SCREEN_LIGHT:I = 0xc4

.field public static final PROTOCOL_SNAP_INDICATOR:I = 0xb8

.field public static final PROTOCOL_STICKER_CONTROL:I = 0xb2

.field public static final PROTOCOL_TOP_ALERT:I = 0xac

.field public static final PROTOCOL_TOP_CONFIG:I = 0xc1

.field public static final PROTOCOL_ULTRA_WIDE:I = 0xc8

.field public static final PROTOCOL_VERTICAL:I = 0xc6

.field public static final PROTOCOL_ZOOM_CHANGED:I = 0xaa

.field public static final SHOW_FAIL:I = 0x3

.field public static final SHOW_START:I = 0x1

.field public static final SHOW_SUCCESS:I = 0x2
