.class public interface abstract Lcom/android/camera/data/cloud/DataCloud$CloudItem;
.super Ljava/lang/Object;
.source "DataCloud.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/data/cloud/DataCloud;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "CloudItem"
.end annotation


# virtual methods
.method public abstract editor()Landroid/content/SharedPreferences$Editor;
.end method

.method public abstract getCloudBooleanDefault(Ljava/lang/String;Z)Z
.end method

.method public abstract getCloudFloatDefault(Ljava/lang/String;F)F
.end method

.method public abstract getCloudIntDefault(Ljava/lang/String;I)I
.end method

.method public abstract getCloudLongDefault(Ljava/lang/String;J)J
.end method

.method public abstract getCloudStringDefault(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract provideKey()Ljava/lang/String;
.end method

.method public abstract setReady(Z)V
.end method
