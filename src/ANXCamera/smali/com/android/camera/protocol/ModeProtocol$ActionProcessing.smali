.class public interface abstract Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;
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
    name = "ActionProcessing"
.end annotation


# static fields
.field public static final TYPE_TAG:I = 0xa2


# virtual methods
.method public abstract filterUiChange()V
.end method

.method public abstract hideExtra()V
.end method

.method public abstract isShowFilterView()Z
.end method

.method public abstract isShowLightingView()Z
.end method

.method public abstract processingAudioCapture(Z)V
.end method

.method public abstract processingFailed()V
.end method

.method public abstract processingFinish()V
.end method

.method public abstract processingPause()V
.end method

.method public abstract processingPostAction()V
.end method

.method public abstract processingPrepare()V
.end method

.method public abstract processingResume()V
.end method

.method public abstract processingStart()V
.end method

.method public abstract processingWorkspace(Z)V
.end method

.method public abstract setLightingViewStatus(Z)V
.end method

.method public abstract showOrHideBottomViewWithAnim(Z)V
.end method

.method public abstract showOrHideFilterView()Z
.end method

.method public abstract showOrHideLightingView()Z
.end method

.method public abstract updateLoading(Z)V
.end method

.method public abstract updateRecordingTime(Ljava/lang/String;)V
.end method

.method public abstract updateThumbnail(Lcom/android/camera/Thumbnail;Z)V
.end method
