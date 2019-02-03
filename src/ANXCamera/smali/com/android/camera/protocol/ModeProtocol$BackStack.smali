.class public interface abstract Lcom/android/camera/protocol/ModeProtocol$BackStack;
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
    name = "BackStack"
.end annotation


# static fields
.field public static final TYPE_TAG:I = 0xab


# virtual methods
.method public abstract addInBackStack(Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<P::",
            "Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;",
            ">(TP;)V"
        }
    .end annotation
.end method

.method public abstract handleBackStackFromKeyBack()Z
.end method

.method public abstract handleBackStackFromShutter()V
.end method

.method public abstract handleBackStackFromTapDown(II)Z
.end method

.method public abstract removeBackStack(Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<P::",
            "Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;",
            ">(TP;)V"
        }
    .end annotation
.end method
