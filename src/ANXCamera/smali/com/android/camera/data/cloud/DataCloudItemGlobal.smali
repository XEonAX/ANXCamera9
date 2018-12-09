.class public Lcom/android/camera/data/cloud/DataCloudItemGlobal;
.super Lcom/android/camera/data/cloud/DataCloudItemBase;
.source "DataCloudItemGlobal.java"


# static fields
.field private static final KEY:Ljava/lang/String; = "cloud_global"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Lcom/android/camera/data/cloud/DataCloudItemBase;-><init>()V

    return-void
.end method


# virtual methods
.method public provideKey()Ljava/lang/String;
    .locals 1

    .line 12
    const-string v0, "cloud_global"

    return-object v0
.end method
