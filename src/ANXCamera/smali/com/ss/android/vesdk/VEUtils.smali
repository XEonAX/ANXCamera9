.class public Lcom/ss/android/vesdk/VEUtils;
.super Ljava/lang/Object;
.source "VEUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAudioFileInfo(Ljava/lang/String;[I)I
    .locals 3
    .param p0    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # [I
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 68
    const-string v0, "iesve_veutils_get_audio_info"

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    .line 69
    invoke-static {p0, p1}, Lcom/ss/android/ttve/nativePort/TEVideoUtils;->getAudioFileInfo(Ljava/lang/String;[I)I

    move-result p0

    return p0
.end method

.method public static getVideoFileInfo(Ljava/lang/String;[I)I
    .locals 3
    .param p0    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # [I
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 54
    const-string v0, "iesve_veutils_get_video_info"

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    .line 55
    invoke-static {p0, p1}, Lcom/ss/android/ttve/nativePort/TEVideoUtils;->getVideoFileInfo(Ljava/lang/String;[I)I

    move-result p0

    return p0
.end method

.method public static getVideoFrames(Ljava/lang/String;[ILcom/ss/android/vesdk/VEFrameAvailableListener;)I
    .locals 3
    .param p0    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # [I
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/ss/android/vesdk/VEFrameAvailableListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 94
    new-instance v0, Lcom/ss/android/ttve/nativePort/TEVideoUtilsCallback;

    invoke-direct {v0}, Lcom/ss/android/ttve/nativePort/TEVideoUtilsCallback;-><init>()V

    .line 95
    invoke-virtual {v0, p2}, Lcom/ss/android/ttve/nativePort/TEVideoUtilsCallback;->setListener(Ljava/lang/Object;)V

    .line 96
    const-string p2, "iesve_veutils_extract_video_frames"

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {p2, v1, v2}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    .line 98
    new-instance p2, Ljava/lang/ref/WeakReference;

    invoke-direct {p2, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {p0, p1, p2}, Lcom/ss/android/ttve/nativePort/TEVideoUtils;->getVideoFrames(Ljava/lang/String;[ILjava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public static isCanImport(Ljava/lang/String;)I
    .locals 3

    .line 80
    const-string v0, "iesve_veutils_if_video_support_import"

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    .line 81
    invoke-static {p0}, Lcom/ss/android/ttve/nativePort/TEVideoUtils;->isCanImport(Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public static mux(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 3

    .line 31
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 34
    :cond_0
    const-string v0, "iesve_veutils_combine_audio_and_video_start"

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-static {v0, v2, v1}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    .line 35
    invoke-static {p0, p1, p2}, Lcom/ss/android/ttve/nativePort/TEVideoUtils;->mux(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    .line 36
    new-instance p1, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    invoke-direct {p1}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;-><init>()V

    .line 37
    const-string p2, "iesve_veutils_combine_audio_and_video_finish_result"

    if-nez p0, :cond_1

    const-string v0, "succ"

    goto :goto_0

    :cond_1
    const-string v0, "fail"

    :goto_0
    invoke-virtual {p1, p2, v0}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    .line 38
    const-string p2, "iesve_veutils_combine_audio_and_video_finish_reason"

    const-string v0, ""

    invoke-virtual {p1, p2, v0}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    .line 39
    const-string p2, "iesve_veutils_combine_audio_and_video_finish"

    invoke-static {p2, v2, p1}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    .line 41
    return p0

    .line 32
    :cond_2
    :goto_1
    const/16 p0, -0x64

    return p0
.end method

.method public static transCodeAudio(Ljava/lang/String;Ljava/lang/String;II)I
    .locals 0
    .param p0    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 112
    invoke-static {p0, p1, p2, p3}, Lcom/ss/android/ttve/nativePort/TEVideoUtils;->transCodeAudioFile(Ljava/lang/String;Ljava/lang/String;II)I

    move-result p0

    return p0
.end method
