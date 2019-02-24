.class public interface abstract Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;
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
    name = "LiveVideoEditor"
.end annotation


# static fields
.field public static final TYPE_TAG:I = 0xd1


# virtual methods
.method public abstract combineVideoAudio(Ljava/lang/String;Lcom/ss/android/vesdk/VECommonCallback;Lcom/ss/android/vesdk/VECommonCallback;)V
.end method

.method public abstract init(Landroid/view/TextureView;Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/vesdk/VECommonCallback;Lcom/ss/android/vesdk/VECommonCallback;)Z
.end method

.method public abstract onDestory()V
.end method

.method public abstract pausePlay()V
.end method

.method public abstract resumePlay()V
.end method

.method public abstract setRecordParameter(III)V
.end method

.method public abstract startPlay()V
.end method
