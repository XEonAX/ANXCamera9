.class public abstract Lcom/android/camera/network/net/base/SimpleResponseHandler;
.super Lcom/android/camera/network/net/base/SimpleResponseListener;
.source "SimpleResponseHandler.java"

# interfaces
.implements Lcom/android/camera/network/net/base/ResponseHandler;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/android/camera/network/net/base/SimpleResponseListener<",
        "TT;>;",
        "Lcom/android/camera/network/net/base/ResponseHandler;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 3
    invoke-direct {p0}, Lcom/android/camera/network/net/base/SimpleResponseListener;-><init>()V

    return-void
.end method
