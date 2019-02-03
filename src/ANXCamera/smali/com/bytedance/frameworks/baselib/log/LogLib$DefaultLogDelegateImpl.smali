.class public Lcom/bytedance/frameworks/baselib/log/LogLib$DefaultLogDelegateImpl;
.super Ljava/lang/Object;
.source "LogLib.java"

# interfaces
.implements Lcom/bytedance/frameworks/baselib/log/LogLib$ILogDelegate;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bytedance/frameworks/baselib/log/LogLib;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DefaultLogDelegateImpl"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isNetworkAvailable(Landroid/content/Context;)Z
    .locals 0

    .line 18
    const/4 p1, 0x0

    return p1
.end method
