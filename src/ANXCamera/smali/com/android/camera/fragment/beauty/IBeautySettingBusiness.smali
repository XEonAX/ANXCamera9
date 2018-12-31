.class public interface abstract Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;
.super Ljava/lang/Object;
.source "IBeautySettingBusiness.java"

# interfaces
.implements Lcom/android/camera/fragment/beauty/IBeautyBusiness;


# virtual methods
.method public abstract getCurrentBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;
.end method

.method public abstract getProgress()I
.end method

.method public abstract getTypeArray()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/beauty/BeautyParameters$Type;",
            ">;"
        }
    .end annotation
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
