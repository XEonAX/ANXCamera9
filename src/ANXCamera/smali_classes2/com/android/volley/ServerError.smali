.class public Lcom/android/volley/ServerError;
.super Lcom/android/volley/VolleyError;
.source "ServerError.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 32
    invoke-direct {p0}, Lcom/android/volley/VolleyError;-><init>()V

    .line 33
    return-void
.end method

.method public constructor <init>(Lcom/android/volley/NetworkResponse;)V
    .registers 2
    .param p1, "networkResponse"    # Lcom/android/volley/NetworkResponse;

    .line 28
    invoke-direct {p0, p1}, Lcom/android/volley/VolleyError;-><init>(Lcom/android/volley/NetworkResponse;)V

    .line 29
    return-void
.end method
