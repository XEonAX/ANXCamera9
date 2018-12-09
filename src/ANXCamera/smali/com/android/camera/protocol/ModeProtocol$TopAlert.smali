.class public interface abstract Lcom/android/camera/protocol/ModeProtocol$TopAlert;
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
    name = "TopAlert"
.end annotation


# static fields
.field public static final TYPE_TAG:I = 0xac


# virtual methods
.method public abstract alertAiDetectTipHint(IIJ)V
    .param p2    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
.end method

.method public abstract alertAiSceneSelector(I)V
.end method

.method public abstract alertFlash(IZZ)V
.end method

.method public abstract alertHDR(IZZ)V
.end method

.method public abstract alertLightingHint(I)V
.end method

.method public abstract alertLightingTitle(Z)V
.end method

.method public abstract alertMoonModeSelector(I)V
.end method

.method public abstract alertSwitchHint(II)V
    .param p2    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
.end method

.method public abstract alertTopHint(II)V
    .param p2    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
.end method

.method public abstract alertTopMusicHint(ILjava/lang/String;)V
.end method

.method public abstract alertUpdateValue(I)V
.end method

.method public varargs abstract disableMenuItem([I)V
.end method

.method public varargs abstract enableMenuItem([I)V
.end method

.method public abstract hideAlert()V
.end method

.method public abstract hideConfigMenu()V
.end method

.method public abstract hideExtraMenu()V
.end method

.method public abstract insertConfigItem(I)V
.end method

.method public abstract reInitAlert()V
.end method

.method public abstract refreshExtraMenu()V
.end method

.method public abstract removeConfigItem(I)V
.end method

.method public abstract removeExtraMenu(I)V
.end method

.method public abstract setAiSceneImageLevel(I)V
.end method

.method public abstract setRecordingTimeState(I)V
.end method

.method public abstract showConfigMenu()V
.end method

.method public abstract startLiveShotAnimation()V
.end method

.method public varargs abstract updateConfigItem([I)V
.end method

.method public abstract updateContentDescription()V
.end method

.method public abstract updateRecordingTime(Ljava/lang/String;)V
.end method
