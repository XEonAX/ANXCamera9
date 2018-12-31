.class public interface abstract Lcom/android/camera/protocol/ModeProtocol$CameraActionTrack;
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
    name = "CameraActionTrack"
.end annotation


# static fields
.field public static final TYPE_TAG:I = 0xba


# virtual methods
.method public abstract onTrackShutterButtonMissTaken(J)V
.end method

.method public abstract onTrackShutterButtonTaken(J)V
.end method
