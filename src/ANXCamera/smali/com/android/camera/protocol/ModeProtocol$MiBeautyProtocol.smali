.class public interface abstract Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;
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
    name = "MiBeautyProtocol"
.end annotation


# static fields
.field public static final TYPE_TAG:I = 0xc2


# virtual methods
.method public abstract getBeautyItems()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/beauty/BeautyParameters$Type;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getBeautyType()I
.end method

.method public abstract getCurrentBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;
.end method

.method public abstract getCurrentBeautyType()I
.end method

.method public abstract getProgress()I
.end method

.method public abstract isBeautyPanelShow()Z
.end method

.method public abstract resetBeauty()V
.end method

.method public abstract setCurrentBeautyParameterType(Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V
.end method

.method public abstract setProgress(I)V
.end method

.method public abstract setType(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)V
.end method

.method public abstract setType(Lcom/miui/filtersdk/beauty/BeautyParameterType;)V
.end method

.method public abstract switchBeautyType(I)V
.end method
