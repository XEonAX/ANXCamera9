.class Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;
.super Ljava/lang/Object;
.source "VEEditor.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/vesdk/VEEditor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Mp4ToHighQualityGIFConverter"
.end annotation


# instance fields
.field mCallback:Lcom/ss/android/vesdk/VECommonCallback;

.field mInputFile:Ljava/lang/String;

.field mIsRunning:Z

.field mOutputFile:Ljava/lang/String;

.field mPaletteFile:Ljava/lang/String;

.field final synthetic this$0:Lcom/ss/android/vesdk/VEEditor;

.field private waterMarkFile:Ljava/lang/String;

.field private waterMarkHeight:I

.field private waterMarkOffsetX:I

.field private waterMarkOffsetY:I

.field private waterMarkWidth:I


# direct methods
.method constructor <init>(Lcom/ss/android/vesdk/VEEditor;)V
    .locals 1

    .line 2873
    iput-object p1, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->this$0:Lcom/ss/android/vesdk/VEEditor;

    .line 2874
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2865
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mIsRunning:Z

    .line 2867
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->waterMarkFile:Ljava/lang/String;

    .line 2868
    const/16 v0, 0x32

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->waterMarkWidth:I

    .line 2869
    iput v0, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->waterMarkHeight:I

    .line 2870
    const/16 v0, 0x64

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->waterMarkOffsetX:I

    .line 2871
    iput v0, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->waterMarkOffsetY:I

    .line 2875
    iput-object p1, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mPaletteFile:Ljava/lang/String;

    .line 2876
    iput-object p1, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mInputFile:Ljava/lang/String;

    .line 2877
    iput-object p1, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mOutputFile:Ljava/lang/String;

    .line 2878
    iput-object p1, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mCallback:Lcom/ss/android/vesdk/VECommonCallback;

    .line 2879
    return-void
.end method

.method constructor <init>(Lcom/ss/android/vesdk/VEEditor;Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/vesdk/VECommonCallback;)V
    .locals 0

    .line 2881
    iput-object p1, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->this$0:Lcom/ss/android/vesdk/VEEditor;

    .line 2882
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2865
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mIsRunning:Z

    .line 2867
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->waterMarkFile:Ljava/lang/String;

    .line 2868
    const/16 p1, 0x32

    iput p1, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->waterMarkWidth:I

    .line 2869
    iput p1, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->waterMarkHeight:I

    .line 2870
    const/16 p1, 0x64

    iput p1, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->waterMarkOffsetX:I

    .line 2871
    iput p1, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->waterMarkOffsetY:I

    .line 2883
    iput-object p2, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mInputFile:Ljava/lang/String;

    .line 2884
    iput-object p3, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mOutputFile:Ljava/lang/String;

    .line 2885
    iput-object p4, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mCallback:Lcom/ss/android/vesdk/VECommonCallback;

    .line 2886
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mOutputFile:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ".png"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mPaletteFile:Ljava/lang/String;

    .line 2887
    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .line 2928
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mInputFile:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    const/16 v2, 0x1007

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mOutputFile:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5

    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mIsRunning:Z

    if-eqz v0, :cond_0

    goto/16 :goto_1

    .line 2934
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mIsRunning:Z

    .line 2935
    const-string v3, "ffmpeg -y -i %s -vf palettegen %s"

    const/4 v4, 0x2

    new-array v5, v4, [Ljava/lang/Object;

    iget-object v6, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mInputFile:Ljava/lang/String;

    const/4 v7, 0x0

    aput-object v6, v5, v7

    iget-object v6, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mPaletteFile:Ljava/lang/String;

    aput-object v6, v5, v0

    invoke-static {v3, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 2938
    const/4 v5, 0x0

    invoke-static {v3, v5}, Lcom/ss/android/ttve/nativePort/TEVideoUtils;->executeFFmpegCommand(Ljava/lang/String;Lcom/ss/android/ttve/nativePort/TEVideoUtils$ExecuteCommandListener;)I

    move-result v3

    .line 2939
    if-eqz v3, :cond_2

    .line 2941
    iput-boolean v7, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mIsRunning:Z

    .line 2942
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mCallback:Lcom/ss/android/vesdk/VECommonCallback;

    if-eqz v0, :cond_1

    .line 2943
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mCallback:Lcom/ss/android/vesdk/VECommonCallback;

    const-string v4, ""

    invoke-interface {v0, v2, v3, v1, v4}, Lcom/ss/android/vesdk/VECommonCallback;->onCallback(IIFLjava/lang/String;)V

    .line 2945
    :cond_1
    return-void

    .line 2950
    :cond_2
    iget-object v3, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->waterMarkFile:Ljava/lang/String;

    const/4 v6, 0x3

    if-eqz v3, :cond_3

    .line 2951
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "ffmpeg -y -i %s -i %s -i %s -filter_complex [2:v]scale=w=%d:h=%d[o0];[0:v][o0]overlay=x=%d-w/2:y=%d-h/2[o1];[o1][1:v]paletteuse -f gif %s"

    const/16 v9, 0x8

    new-array v9, v9, [Ljava/lang/Object;

    iget-object v10, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mInputFile:Ljava/lang/String;

    aput-object v10, v9, v7

    iget-object v10, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mPaletteFile:Ljava/lang/String;

    aput-object v10, v9, v0

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->waterMarkFile:Ljava/lang/String;

    aput-object v0, v9, v4

    iget v0, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->waterMarkWidth:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v9, v6

    const/4 v0, 0x4

    iget v4, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->waterMarkHeight:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v9, v0

    const/4 v0, 0x5

    iget v4, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->waterMarkOffsetX:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v9, v0

    const/4 v0, 0x6

    iget v4, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->waterMarkOffsetY:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v9, v0

    const/4 v0, 0x7

    iget-object v4, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mOutputFile:Ljava/lang/String;

    aput-object v4, v9, v0

    invoke-static {v3, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 2953
    :cond_3
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "ffmpeg -y -i %s -i %s -lavfi paletteuse -f gif %s"

    new-array v6, v6, [Ljava/lang/Object;

    iget-object v9, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mInputFile:Ljava/lang/String;

    aput-object v9, v6, v7

    iget-object v9, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mPaletteFile:Ljava/lang/String;

    aput-object v9, v6, v0

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mOutputFile:Ljava/lang/String;

    aput-object v0, v6, v4

    invoke-static {v3, v8, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 2958
    :goto_0
    invoke-static {v0, v5}, Lcom/ss/android/ttve/nativePort/TEVideoUtils;->executeFFmpegCommand(Ljava/lang/String;Lcom/ss/android/ttve/nativePort/TEVideoUtils$ExecuteCommandListener;)I

    move-result v0

    .line 2959
    iget-object v3, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mCallback:Lcom/ss/android/vesdk/VECommonCallback;

    if-eqz v3, :cond_4

    .line 2960
    iget-object v3, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mCallback:Lcom/ss/android/vesdk/VECommonCallback;

    const-string v4, ""

    invoke-interface {v3, v2, v0, v1, v4}, Lcom/ss/android/vesdk/VECommonCallback;->onCallback(IIFLjava/lang/String;)V

    .line 2962
    :cond_4
    iput-boolean v7, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mIsRunning:Z

    .line 2963
    return-void

    .line 2929
    :cond_5
    :goto_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mCallback:Lcom/ss/android/vesdk/VECommonCallback;

    if-eqz v0, :cond_6

    .line 2930
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mCallback:Lcom/ss/android/vesdk/VECommonCallback;

    const/16 v3, -0xcd

    const-string v4, ""

    invoke-interface {v0, v2, v3, v1, v4}, Lcom/ss/android/vesdk/VECommonCallback;->onCallback(IIFLjava/lang/String;)V

    .line 2932
    :cond_6
    return-void
.end method

.method public setCallback(Lcom/ss/android/vesdk/VECommonCallback;)V
    .locals 0

    .line 2923
    iput-object p1, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mCallback:Lcom/ss/android/vesdk/VECommonCallback;

    .line 2924
    return-void
.end method

.method public setInputFile(Ljava/lang/String;)V
    .locals 0

    .line 2910
    iput-object p1, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mInputFile:Ljava/lang/String;

    .line 2911
    return-void
.end method

.method public setOutputFile(Ljava/lang/String;)V
    .locals 2

    .line 2914
    iput-object p1, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mOutputFile:Ljava/lang/String;

    .line 2915
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mOutputFile:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 2916
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mPaletteFile:Ljava/lang/String;

    .line 2917
    return-void

    .line 2919
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mOutputFile:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-char v0, Ljava/io/File;->separatorChar:C

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v0, "palette.png"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mPaletteFile:Ljava/lang/String;

    .line 2920
    return-void
.end method

.method public setWaterMarkFile(Ljava/lang/String;)V
    .locals 0

    .line 2890
    iput-object p1, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->waterMarkFile:Ljava/lang/String;

    .line 2891
    return-void
.end method

.method public setWaterMarkHeight(I)V
    .locals 0

    .line 2898
    iput p1, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->waterMarkHeight:I

    .line 2899
    return-void
.end method

.method public setWaterMarkOffsetX(I)V
    .locals 0

    .line 2902
    iput p1, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->waterMarkOffsetX:I

    .line 2903
    return-void
.end method

.method public setWaterMarkOffsetY(I)V
    .locals 0

    .line 2906
    iput p1, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->waterMarkOffsetY:I

    .line 2907
    return-void
.end method

.method public setWaterMarkWidth(I)V
    .locals 0

    .line 2894
    iput p1, p0, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->waterMarkWidth:I

    .line 2895
    return-void
.end method
