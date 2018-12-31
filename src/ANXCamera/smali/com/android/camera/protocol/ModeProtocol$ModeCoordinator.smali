.class public interface abstract Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;
.super Ljava/lang/Object;
.source "ModeProtocol.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/protocol/ModeProtocol;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ModeCoordinator"
.end annotation


# virtual methods
.method public abstract attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<P::",
            "Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;",
            ">(ITP;)V"
        }
    .end annotation
.end method

.method public abstract detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<P::",
            "Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;",
            ">(ITP;)V"
        }
    .end annotation
.end method

.method public abstract getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<P::",
            "Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;",
            ">(I)TP;"
        }
    .end annotation
.end method
