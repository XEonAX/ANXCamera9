.class public Lcom/ss/android/medialib/NativePort/NativeLibsLoader;
.super Ljava/lang/Object;
.source "NativeLibsLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/medialib/NativePort/NativeLibsLoader$ILibraryLoader;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static mLibraryLoader:Lcom/ss/android/medialib/NativePort/NativeLibsLoader$ILibraryLoader;

.field private static sLibraryLoaded:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 15
    const/4 v0, 0x0

    sput-boolean v0, Lcom/ss/android/medialib/NativePort/NativeLibsLoader;->sLibraryLoaded:Z

    .line 16
    const-class v0, Lcom/ss/android/medialib/NativePort/NativeLibsLoader;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/ss/android/medialib/NativePort/NativeLibsLoader;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized loadLibrary()V
    .locals 4

    const-class v0, Lcom/ss/android/medialib/NativePort/NativeLibsLoader;

    monitor-enter v0

    .line 20
    :try_start_0
    sget-boolean v1, Lcom/ss/android/medialib/NativePort/NativeLibsLoader;->sLibraryLoaded:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    .line 21
    monitor-exit v0

    return-void

    .line 23
    :cond_0
    :try_start_1
    sget-object v1, Lcom/ss/android/medialib/LibsConfig;->LIBS:Ljava/util/List;

    .line 24
    sget-object v2, Lcom/ss/android/medialib/NativePort/NativeLibsLoader;->mLibraryLoader:Lcom/ss/android/medialib/NativePort/NativeLibsLoader$ILibraryLoader;

    const/4 v3, 0x1

    if-eqz v2, :cond_1

    .line 25
    sget-object v2, Lcom/ss/android/medialib/NativePort/NativeLibsLoader;->mLibraryLoader:Lcom/ss/android/medialib/NativePort/NativeLibsLoader$ILibraryLoader;

    invoke-interface {v2, v1}, Lcom/ss/android/medialib/NativePort/NativeLibsLoader$ILibraryLoader;->onLoadNativeLibs(Ljava/util/List;)V

    .line 26
    sput-boolean v3, Lcom/ss/android/medialib/NativePort/NativeLibsLoader;->sLibraryLoaded:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 27
    monitor-exit v0

    return-void

    .line 29
    :cond_1
    :try_start_2
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 30
    invoke-static {v2}, Lcom/ss/android/medialib/NativePort/NativeLibsLoader;->safeLoadSo(Ljava/lang/String;)V

    .line 31
    goto :goto_0

    .line 32
    :cond_2
    sput-boolean v3, Lcom/ss/android/medialib/NativePort/NativeLibsLoader;->sLibraryLoaded:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 33
    monitor-exit v0

    return-void

    .line 19
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static safeLoadSo(Ljava/lang/String;)V
    .locals 3

    .line 37
    :try_start_0
    invoke-static {p0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    goto :goto_0

    .line 38
    :catch_0
    move-exception p0

    .line 39
    sget-object v0, Lcom/ss/android/medialib/NativePort/NativeLibsLoader;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "loadLibrary Load native library failed : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    :goto_0
    return-void
.end method

.method public static setLibraryLoad(Lcom/ss/android/medialib/NativePort/NativeLibsLoader$ILibraryLoader;)V
    .locals 0

    .line 45
    sput-object p0, Lcom/ss/android/medialib/NativePort/NativeLibsLoader;->mLibraryLoader:Lcom/ss/android/medialib/NativePort/NativeLibsLoader$ILibraryLoader;

    .line 46
    return-void
.end method
