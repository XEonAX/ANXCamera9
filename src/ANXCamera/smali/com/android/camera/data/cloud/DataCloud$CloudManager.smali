.class public interface abstract Lcom/android/camera/data/cloud/DataCloud$CloudManager;
.super Ljava/lang/Object;
.source "DataCloud.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/data/cloud/DataCloud;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "CloudManager"
.end annotation


# virtual methods
.method public abstract DataCloudFeature()Lcom/android/camera/data/cloud/DataCloud$CloudFeature;
.end method

.method public abstract fillCloudValues()V
.end method

.method public abstract provideDataCloudConfig(I)Lcom/android/camera/data/cloud/DataCloud$CloudItem;
.end method

.method public abstract provideDataCloudGlobal()Lcom/android/camera/data/cloud/DataCloud$CloudItem;
.end method
