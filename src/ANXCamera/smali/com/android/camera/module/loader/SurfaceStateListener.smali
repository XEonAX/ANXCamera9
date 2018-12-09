.class public interface abstract Lcom/android/camera/module/loader/SurfaceStateListener;
.super Ljava/lang/Object;
.source "SurfaceStateListener.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/module/loader/SurfaceStateListener$SurfaceState;
    }
.end annotation


# static fields
.field public static final SURFACE_STATE_OK:I = 0x4

.field public static final SURFACE_STATE_PAUSED:I = 0x2

.field public static final SURFACE_STATE_UNCREATED:I = 0x1


# virtual methods
.method public abstract hasSurface()Z
.end method

.method public abstract updateSurfaceState(I)V
.end method
