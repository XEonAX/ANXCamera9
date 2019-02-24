.class public interface abstract Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;
.super Ljava/lang/Object;
.source "NativeCallbacks.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/ttve/nativePort/NativeCallbacks;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "IOpenGLCallback"
.end annotation


# virtual methods
.method public abstract onOpenGLCreate(I)I
.end method

.method public abstract onOpenGLDestroy(I)I
.end method

.method public abstract onOpenGLDrawAfter(ID)I
.end method

.method public abstract onOpenGLDrawBefore(ID)I
.end method

.method public abstract onPreviewSurface(I)I
.end method
