.class public Lcom/android/camera/module/CameraHandler;
.super Landroid/os/Handler;
.source "CameraHandler.java"


# static fields
.field public static final APPLY_PREFERENCE_CHANGE:I = 0x20

.field public static final ASD_DELAY:I = 0x1a

.field public static final CAMERA_OPEN_DONE:I = 0x8

.field public static final CAMERA_OPEN_EXCEPTION:I = 0xa

.field public static final CAMERA_RUNTIME_EXCEPTION:I = 0x33

.field public static final CHANGE_UI_LAYOUT_BY_PREVIEW:I = 0x12

.field public static final CHECK_DISPLAY_ROTATION:I = 0x4

.field public static final CHECK_PREVIEW_ORIENTATION:I = 0x1f

.field public static final CLEAR_BLUR_FLAG:I = 0x16

.field public static final CLEAR_SCREEN_DELAY:I = 0x2

.field public static final COUNT_DOWN:I = 0x14

.field public static final DELAY_BURST_END:I = 0x24

.field public static final DO_CAPTURE:I = 0xf

.field public static final FIRST_TIME_INIT:I = 0x1

.field public static final HANDLE_FREEZE_HDR_CALLBACK:I = 0x18

.field public static final HIDE_WARNING_MESSAGE:I = 0x15

.field public static final KEEP_SCREEN_ON_DELAY:I = 0x3e8

.field public static final MSG_ABANDON_HANDLER:I = 0x2d

.field public static final MSG_BURST_SHOT_FINISHED:I = 0x30

.field public static final MSG_BURST_SHOT_STOP_TIME_OUT:I = 0x31

.field public static final MSG_FB_MODE_CHANGED:I = 0x22

.field public static final MSG_FORCE_MULTI_SNAP_DONE:I = 0x25

.field public static final MSG_KEEP_SCREEN_ON:I = 0x11

.field public static final MSG_LYING_FLAG:I = 0x27

.field public static final MSG_NORMAL_SHOT_TIMEOUT:I = 0x32

.field public static final MSG_RESET_HAND_GESTURE:I = 0x39

.field public static final MSG_RESET_UI:I = 0x35

.field public static final MSG_RESTART_MODULE:I = 0x2c

.field public static final MSG_SAVE_POWER:I = 0x34

.field public static final MSG_SHOW_STEREO_USE_HINT:I = 0x28

.field public static final MSG_STILL_CAPTURE:I = 0x34

.field public static final MSG_UPDATE_FACE_VIEW:I = 0x23

.field public static final MSG_UPDATE_FOCUS_VIEW:I = 0x38

.field public static final MSG_UPDATE_FPS960_HINT:I = 0x36

.field public static final MSG_WAIT_STOP_CALLBACK_TIMEOUT:I = 0x2e

.field public static final MULTI_SNAP_LAUNCH:I = 0xc

.field public static final OPEN_AUDIO_CAPTURE:I = 0x1d

.field public static final RENDER_BITMAP_TEXTURE:I = 0x19

.field public static final RESET_VIDEO_AUTO_FOCUS:I = 0x37

.field public static final RESTORE_SOUND_MESSAGE:I = 0x2b

.field public static final SAVE_POWER_DELAY:I = 0x16e360

.field public static final SET_CAMERA_PARAMETERS_WHEN_IDLE:I = 0x3

.field public static final SET_ORIENTATION:I = 0x21

.field public static final SHOW_FIRST_USE_HINT:I = 0x5

.field public static final SHOW_OBJECT_TRACK_HINT:I = 0x17

.field public static final START_PREVIEW_DONE:I = 0x9

.field public static final SWITCH_CAMERA_ANIMATION_DONE:I = 0x1c

.field public static final SWITCH_MANUAL_MODE:I = 0x29

.field public static final TAKE_PICTURE_DONE:I = 0x1b

.field public static final UPDATE_MODE_PREFERENCE:I = 0xb

.field public static final UPDATE_RECORD_TIME:I = 0x2a


# instance fields
.field private activityRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/camera/Camera;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/android/camera/Camera;)V
    .locals 1

    .line 91
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 92
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/android/camera/module/CameraHandler;->activityRef:Ljava/lang/ref/WeakReference;

    .line 93
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 0

    .line 97
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 98
    return-void
.end method
