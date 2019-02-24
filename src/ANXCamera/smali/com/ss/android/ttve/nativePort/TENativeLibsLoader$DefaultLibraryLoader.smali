.class public Lcom/ss/android/ttve/nativePort/TENativeLibsLoader$DefaultLibraryLoader;
.super Ljava/lang/Object;
.source "TENativeLibsLoader.java"

# interfaces
.implements Lcom/ss/android/ttve/nativePort/TENativeLibsLoader$ILibraryLoader;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/ttve/nativePort/TENativeLibsLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DefaultLibraryLoader"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    return-void
.end method


# virtual methods
.method public load(Ljava/lang/String;)Z
    .locals 0

    .line 54
    invoke-static {p1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 55
    const/4 p1, 0x1

    return p1
.end method
