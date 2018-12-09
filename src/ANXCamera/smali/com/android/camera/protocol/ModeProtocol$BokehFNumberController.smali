.class public interface abstract Lcom/android/camera/protocol/ModeProtocol$BokehFNumberController;
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
    name = "BokehFNumberController"
.end annotation


# static fields
.field public static final TYPE_TAG:I = 0xd2


# virtual methods
.method public abstract hideFNumberPanel(Z)V
.end method

.method public abstract isFNumberVisible()Z
.end method

.method public abstract showFNumberPanel()V
.end method

.method public abstract updateFNumberValue()V
.end method

.method public abstract visibleHeight()I
.end method
