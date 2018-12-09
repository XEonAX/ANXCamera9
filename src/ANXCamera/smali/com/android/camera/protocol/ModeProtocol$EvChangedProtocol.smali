.class public interface abstract Lcom/android/camera/protocol/ModeProtocol$EvChangedProtocol;
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
    name = "EvChangedProtocol"
.end annotation


# static fields
.field public static final TYPE_TAG:I = 0xa9


# virtual methods
.method public abstract onEvChanged(II)V
.end method

.method public abstract resetEvValue()V
.end method
