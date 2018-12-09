.class public interface abstract Lcom/android/camera/data/provider/DataProvider$ProviderEvent;
.super Ljava/lang/Object;
.source "DataProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/data/provider/DataProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ProviderEvent"
.end annotation


# virtual methods
.method public abstract cloneValues()Landroid/support/v4/util/SimpleArrayMap;
.end method

.method public abstract concurrentEditor()Lcom/android/camera/data/data/DataItemBase$ConcurrentEditor;
.end method

.method public abstract contains(Ljava/lang/String;)Z
.end method

.method public abstract editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
.end method

.method public abstract getBoolean(Ljava/lang/String;Z)Z
.end method

.method public abstract getFloat(Ljava/lang/String;F)F
.end method

.method public abstract getInt(Ljava/lang/String;I)I
.end method

.method public abstract getLong(Ljava/lang/String;J)J
.end method

.method public abstract getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract injectCloud(Lcom/android/camera/data/cloud/DataCloud$CloudItem;)V
.end method

.method public abstract isTransient()Z
.end method

.method public abstract provideKey()Ljava/lang/String;
.end method
