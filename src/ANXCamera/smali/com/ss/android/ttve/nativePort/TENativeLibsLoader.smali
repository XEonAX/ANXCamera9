.class public Lcom/ss/android/ttve/nativePort/TENativeLibsLoader;
.super Ljava/lang/Object;
.source "TENativeLibsLoader.java"


# annotations
.annotation build Landroid/support/annotation/Keep;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/ttve/nativePort/TENativeLibsLoader$ILibraryLoader;,
        Lcom/ss/android/ttve/nativePort/TENativeLibsLoader$DefaultLibraryLoader;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static mLibraryLoader:Lcom/ss/android/ttve/nativePort/TENativeLibsLoader$ILibraryLoader;

.field private static sLibraryLoaded:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 12
    const/4 v0, 0x0

    sput-boolean v0, Lcom/ss/android/ttve/nativePort/TENativeLibsLoader;->sLibraryLoaded:Z

    .line 13
    const-class v0, Lcom/ss/android/ttve/nativePort/TENativeLibsLoader;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/ss/android/ttve/nativePort/TENativeLibsLoader;->TAG:Ljava/lang/String;

    .line 14
    new-instance v0, Lcom/ss/android/ttve/nativePort/TENativeLibsLoader$DefaultLibraryLoader;

    invoke-direct {v0}, Lcom/ss/android/ttve/nativePort/TENativeLibsLoader$DefaultLibraryLoader;-><init>()V

    sput-object v0, Lcom/ss/android/ttve/nativePort/TENativeLibsLoader;->mLibraryLoader:Lcom/ss/android/ttve/nativePort/TENativeLibsLoader$ILibraryLoader;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static loadLibrary()V
    .locals 1

    .line 17
    sget-boolean v0, Lcom/ss/android/ttve/nativePort/TENativeLibsLoader;->sLibraryLoaded:Z

    if-eqz v0, :cond_0

    .line 18
    return-void

    .line 21
    :cond_0
    const-string v0, "ttffmpeg"

    invoke-static {v0}, Lcom/ss/android/ttve/nativePort/TENativeLibsLoader;->safeLoadSo(Ljava/lang/String;)V

    .line 24
    const-string v0, "effect"

    invoke-static {v0}, Lcom/ss/android/ttve/nativePort/TENativeLibsLoader;->safeLoadSo(Ljava/lang/String;)V

    .line 25
    const-string v0, "yuv"

    invoke-static {v0}, Lcom/ss/android/ttve/nativePort/TENativeLibsLoader;->safeLoadSo(Ljava/lang/String;)V

    .line 26
    const-string v0, "audioeffect"

    invoke-static {v0}, Lcom/ss/android/ttve/nativePort/TENativeLibsLoader;->safeLoadSo(Ljava/lang/String;)V

    .line 27
    const-string v0, "ttvideoeditor"

    invoke-static {v0}, Lcom/ss/android/ttve/nativePort/TENativeLibsLoader;->safeLoadSo(Ljava/lang/String;)V

    .line 29
    const/4 v0, 0x1

    sput-boolean v0, Lcom/ss/android/ttve/nativePort/TENativeLibsLoader;->sLibraryLoaded:Z

    .line 30
    return-void
.end method

.method private static safeLoadSo(Ljava/lang/String;)V
    .locals 4

    .line 34
    :try_start_0
    sget-object v0, Lcom/ss/android/ttve/nativePort/TENativeLibsLoader;->mLibraryLoader:Lcom/ss/android/ttve/nativePort/TENativeLibsLoader$ILibraryLoader;

    if-eqz v0, :cond_0

    .line 35
    sget-object v0, Lcom/ss/android/ttve/nativePort/TENativeLibsLoader;->mLibraryLoader:Lcom/ss/android/ttve/nativePort/TENativeLibsLoader$ILibraryLoader;

    invoke-interface {v0, p0}, Lcom/ss/android/ttve/nativePort/TENativeLibsLoader$ILibraryLoader;->load(Ljava/lang/String;)Z

    goto :goto_0

    .line 37
    :cond_0
    invoke-static {p0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    :goto_0
    goto :goto_1

    .line 39
    :catch_0
    move-exception v0

    .line 40
    sget-object v1, Lcom/ss/android/ttve/nativePort/TENativeLibsLoader;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Load native library ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "] failed : "

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    :goto_1
    return-void
.end method

.method public static setLibraryLoad(Lcom/ss/android/ttve/nativePort/TENativeLibsLoader$ILibraryLoader;)V
    .locals 0

    .line 46
    sput-object p0, Lcom/ss/android/ttve/nativePort/TENativeLibsLoader;->mLibraryLoader:Lcom/ss/android/ttve/nativePort/TENativeLibsLoader$ILibraryLoader;

    .line 47
    return-void
.end method
