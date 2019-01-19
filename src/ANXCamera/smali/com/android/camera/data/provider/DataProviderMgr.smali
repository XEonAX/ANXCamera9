.class public Lcom/android/camera/data/provider/DataProviderMgr;
.super Ljava/lang/Object;
.source "DataProviderMgr.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;
    }
.end annotation


# instance fields
.field private mDataProvider:Lcom/android/camera/data/provider/DataProvider;


# direct methods
.method public constructor <init>(Lcom/android/camera/data/cloud/DataCloud$CloudManager;)V
    .locals 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    new-instance v0, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;

    invoke-direct {v0, p0, p1}, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;-><init>(Lcom/android/camera/data/provider/DataProviderMgr;Lcom/android/camera/data/cloud/DataCloud$CloudManager;)V

    iput-object v0, p0, Lcom/android/camera/data/provider/DataProviderMgr;->mDataProvider:Lcom/android/camera/data/provider/DataProvider;

    .line 17
    return-void
.end method


# virtual methods
.method public provider()Lcom/android/camera/data/provider/DataProvider;
    .locals 1

    .line 20
    iget-object v0, p0, Lcom/android/camera/data/provider/DataProviderMgr;->mDataProvider:Lcom/android/camera/data/provider/DataProvider;

    return-object v0
.end method
