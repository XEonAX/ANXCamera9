.class public interface abstract Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;
.super Ljava/lang/Object;
.source "ModeProtocol.java"

# interfaces
.implements Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/protocol/ModeProtocol;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "BottomPopupTips"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips$CloseType;,
        Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips$TipType;,
        Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips$TipDuration;
    }
.end annotation


# static fields
.field public static final FILTER_CLOSE_TYPE:I = 0x1

.field public static final LIGHT_CLOSE_TYPE:I = 0x2

.field public static final NONE_CLOSE_TYPE:I = 0x0

.field public static final TIP_48M_NO_SUPPORT_ZOOM:I = 0xf

.field public static final TIP_DURATION_2S:I = 0x5

.field public static final TIP_DURATION_3S:I = 0x6

.field public static final TIP_DURATION_LONG:I = 0x2

.field public static final TIP_DURATION_PERSISTED:I = 0x4

.field public static final TIP_DURATION_SHORT:I = 0x1

.field public static final TIP_DURATION_STABLE:I = 0x3

.field public static final TIP_TYPE_3A_LOCK:I = 0x8

.field public static final TIP_TYPE_DUAL_CAMERA:I = 0x6

.field public static final TIP_TYPE_DUAL_CAMERA_SUCCESS:I = 0x7

.field public static final TIP_TYPE_EYE_LIGHT:I = 0xa

.field public static final TIP_TYPE_HAND_GESTURE:I = 0x10

.field public static final TIP_TYPE_HINT:I = 0x4

.field public static final TIP_TYPE_LIGHTING:I = 0xc

.field public static final TIP_TYPE_NEW_SLOW_MOTION:I = 0x9

.field public static final TIP_TYPE_SUPER_NIGHT:I = 0xb

.field public static final TIP_TYPE_ULTRA_WIDE:I = 0xd

.field public static final TIP_TYPE_ULTRA_WIDE_RECOMMEND:I = 0xe

.field public static final TIP_TYPE_WARNING:I = 0x5

.field public static final TYPE_TAG:I = 0xaf


# virtual methods
.method public abstract containTips(I)Z
    .param p1    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
.end method

.method public abstract directHideTipImage()V
.end method

.method public abstract directShowOrHideLeftTipImage(Z)V
.end method

.method public abstract directlyHideTips()V
.end method

.method public abstract hideCenterTipImage()V
.end method

.method public abstract hideLeftTipImage()V
.end method

.method public abstract hideQrCodeTip()V
.end method

.method public abstract hideSpeedTipImage()V
.end method

.method public abstract hideTipImage()V
.end method

.method public abstract isLightingHintVisible()Z
.end method

.method public abstract isPortraitHintVisible()Z
.end method

.method public abstract reInitTipImage()V
.end method

.method public abstract selectBeautyTipImage(Z)V
.end method

.method public abstract setLightingPattern(Ljava/lang/String;)V
.end method

.method public abstract setPortraitHintVisible(I)V
.end method

.method public abstract showCloseTip(IZ)V
.end method

.method public abstract showOrHideCloseImage(Z)V
.end method

.method public abstract showQrCodeTip()V
.end method

.method public abstract showTips(III)V
    .param p2    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
.end method

.method public abstract updateLeftTipImage()V
.end method

.method public abstract updateTipBottomMargin(IZ)V
.end method

.method public abstract updateTipImage()V
.end method
