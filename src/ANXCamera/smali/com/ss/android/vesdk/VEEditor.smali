.class public Lcom/ss/android/vesdk/VEEditor;
.super Ljava/lang/Object;
.source "VEEditor.java"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;,
        Lcom/ss/android/vesdk/VEEditor$VEState;,
        Lcom/ss/android/vesdk/VEEditor$SEEK_MODE;,
        Lcom/ss/android/vesdk/VEEditor$VIDEO_RATIO;,
        Lcom/ss/android/vesdk/VEEditor$SCALE_MODE;
    }
.end annotation


# static fields
.field private static final AUDIO_VOLUME:Ljava/lang/String; = "audio volume"

.field private static final EFFECT_RES_PATH:Ljava/lang/String; = "effect res path"

.field private static final ENGINE_PREPARE_FOR_COMPILE:I = 0x1

.field private static final ENGINE_PREPARE_FOR_COMPILE_WITHWATERMARK:I = 0x2

.field private static final ENGINE_PREPARE_FOR_PLAYBACK:I = 0x0

.field private static final ENTITY_ALPHA:Ljava/lang/String; = "entity alpha"

.field private static final ENTITY_END_TIME:Ljava/lang/String; = "entity end time"

.field private static final ENTITY_LAYER:Ljava/lang/String; = "entity layer"

.field private static final ENTITY_PATH:Ljava/lang/String; = "entity path"

.field private static final ENTITY_POSITION_X:Ljava/lang/String; = "entity position x"

.field private static final ENTITY_POSITION_Y:Ljava/lang/String; = "entity position y"

.field private static final ENTITY_ROTATION:Ljava/lang/String; = "entity rotation"

.field private static final ENTITY_SCALE_X:Ljava/lang/String; = "entity scale x"

.field private static final ENTITY_SCALE_Y:Ljava/lang/String; = "entity scale y"

.field private static final ENTITY_START_TIME:Ljava/lang/String; = "entity start time"

.field private static final FILTER_INTENSITY:Ljava/lang/String; = "filter intensity"

.field private static final FILTER_PATH_LEFT:Ljava/lang/String; = "left filter"

.field private static final FILTER_PATH_RIGHT:Ljava/lang/String; = "right filter"

.field private static final FILTER_POSITION:Ljava/lang/String; = "filter position"

.field private static final TAG:Ljava/lang/String; = "VEEditor"

.field private static final TEFilterType_Audio:I = 0x1

.field private static final TEFilterType_Caption:I = 0x4

.field private static final TEFilterType_Color:I = 0x2

.field private static final TEFilterType_Effect_Color:I = 0x7

.field private static final TEFilterType_Effect_Filter:I = 0x8

.field private static final TEFilterType_Sticker:I = 0x0

.field private static final TEFilterType_TimeEffect:I = 0x6

.field private static final TEFilterType_TransForm:I = 0x3

.field private static final TEFilterType_WaterMark:I = 0x5

.field private static final TETrackProperty_BGM:I = 0x1

.field private static final TETrackProperty_OriginalSound:I = 0x0

.field public static final TETrackType_Audio:I = 0x1

.field public static final TETrackType_Video:I


# instance fields
.field private mAudioEffectfilterIndex:I

.field private mBCompileHighQualityGif:Z

.field private mBReversePlay:Z

.field private mBackGroundColor:I
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation
.end field

.field private mCancelReverse:Z

.field private mColorFilterIndex:I

.field private mCompileType:Ljava/lang/String;

.field private mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

.field private mInPoint:I

.field private mInitDisplayHeight:I

.field private mInitDisplayWidth:I

.field private mInitSize:Lcom/ss/android/vesdk/VESize;

.field private mMasterTrackIndex:I

.field private mModelsDir:Ljava/lang/String;

.field private mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;

.field private mOutPoint:I

.field private mOutputFile:Ljava/lang/String;

.field private mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

.field private mReverseDone:Z

.field private mSurface:Landroid/view/Surface;

.field private mSurfaceCallback:Landroid/view/SurfaceHolder$Callback2;

.field private mSurfaceHeight:I

.field private mSurfaceTexture:Landroid/graphics/SurfaceTexture;

.field private mSurfaceView:Landroid/view/SurfaceView;

.field private mSurfaceWidth:I

.field private final mTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

.field private mTextureView:Landroid/view/TextureView;

.field private mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

.field private mVideoOutRes:Lcom/ss/android/vesdk/VEEditor$VIDEO_RATIO;

.field private mbSeparateAV:Ljava/lang/Boolean;

.field private miFrameCount:I

.field private mlCompileStartTime:J

.field private mlCurTimeMS:J

.field private mlLastTimeMS:J

.field private mp4ToGIFConverter:Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;

.field private waterMarkFile:Ljava/lang/String;

.field private waterMarkHeight:D

.field private waterMarkOffsetX:D

.field private waterMarkOffsetY:D

.field private waterMarkWidth:D


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/VEException;
        }
    .end annotation

    .line 425
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    new-instance v0, Lcom/ss/android/vesdk/VESize;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mInitSize:Lcom/ss/android/vesdk/VESize;

    .line 62
    const-string v0, "mp4"

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCompileType:Ljava/lang/String;

    .line 168
    const/4 v0, 0x0

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceWidth:I

    .line 169
    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceHeight:I

    .line 171
    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mInitDisplayWidth:I

    .line 172
    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mInitDisplayHeight:I

    .line 174
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mbSeparateAV:Ljava/lang/Boolean;

    .line 175
    iput v1, p0, Lcom/ss/android/vesdk/VEEditor;->mAudioEffectfilterIndex:I

    .line 177
    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mMasterTrackIndex:I

    .line 178
    invoke-static {}, Lcom/ss/android/ttve/nativePort/TEInterface;->createEngine()Lcom/ss/android/ttve/nativePort/TEInterface;

    move-result-object v2

    iput-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    .line 184
    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->miFrameCount:I

    .line 185
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/ss/android/vesdk/VEEditor;->mlCurTimeMS:J

    .line 186
    iput-wide v2, p0, Lcom/ss/android/vesdk/VEEditor;->mlLastTimeMS:J

    .line 191
    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mReverseDone:Z

    .line 192
    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCancelReverse:Z

    .line 194
    iput v1, p0, Lcom/ss/android/vesdk/VEEditor;->mColorFilterIndex:I

    .line 197
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mOutputFile:Ljava/lang/String;

    .line 198
    iput-wide v2, p0, Lcom/ss/android/vesdk/VEEditor;->mlCompileStartTime:J

    .line 199
    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mBReversePlay:Z

    .line 200
    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mBCompileHighQualityGif:Z

    .line 201
    iput-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mp4ToGIFConverter:Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;

    .line 203
    const/high16 v0, -0x1000000

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mBackGroundColor:I

    .line 259
    new-instance v0, Lcom/ss/android/vesdk/VEEditor$1;

    invoke-direct {v0, p0}, Lcom/ss/android/vesdk/VEEditor$1;-><init>(Lcom/ss/android/vesdk/VEEditor;)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    .line 291
    new-instance v0, Lcom/ss/android/vesdk/VEEditor$2;

    invoke-direct {v0, p0}, Lcom/ss/android/vesdk/VEEditor$2;-><init>(Lcom/ss/android/vesdk/VEEditor;)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceCallback:Landroid/view/SurfaceHolder$Callback2;

    .line 319
    new-instance v0, Lcom/ss/android/vesdk/VEEditor$3;

    invoke-direct {v0, p0}, Lcom/ss/android/vesdk/VEEditor$3;-><init>(Lcom/ss/android/vesdk/VEEditor;)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;

    .line 426
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 429
    const-string v0, "VEEditor"

    const-string v2, "VEEditor no surface"

    invoke-static {v0, v2}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 430
    new-instance v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    invoke-direct {v0, p1}, Lcom/ss/android/vesdk/runtime/VEEditorResManager;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    .line 431
    const-string p1, "iesve_veeditor_offscreen"

    const/4 v0, 0x1

    invoke-static {p1, v0, v1}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    .line 432
    return-void

    .line 427
    :cond_0
    new-instance v0, Lcom/ss/android/vesdk/VEException;

    const/16 v1, -0x64

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "workspace is: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, v1, p1}, Lcom/ss/android/vesdk/VEException;-><init>(ILjava/lang/String;)V

    throw v0
.end method

.method public constructor <init>(Ljava/lang/String;Landroid/view/SurfaceView;)V
    .locals 4

    .line 441
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    new-instance v0, Lcom/ss/android/vesdk/VESize;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mInitSize:Lcom/ss/android/vesdk/VESize;

    .line 62
    const-string v0, "mp4"

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCompileType:Ljava/lang/String;

    .line 168
    const/4 v0, 0x0

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceWidth:I

    .line 169
    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceHeight:I

    .line 171
    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mInitDisplayWidth:I

    .line 172
    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mInitDisplayHeight:I

    .line 174
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mbSeparateAV:Ljava/lang/Boolean;

    .line 175
    iput v1, p0, Lcom/ss/android/vesdk/VEEditor;->mAudioEffectfilterIndex:I

    .line 177
    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mMasterTrackIndex:I

    .line 178
    invoke-static {}, Lcom/ss/android/ttve/nativePort/TEInterface;->createEngine()Lcom/ss/android/ttve/nativePort/TEInterface;

    move-result-object v2

    iput-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    .line 184
    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->miFrameCount:I

    .line 185
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/ss/android/vesdk/VEEditor;->mlCurTimeMS:J

    .line 186
    iput-wide v2, p0, Lcom/ss/android/vesdk/VEEditor;->mlLastTimeMS:J

    .line 191
    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mReverseDone:Z

    .line 192
    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCancelReverse:Z

    .line 194
    iput v1, p0, Lcom/ss/android/vesdk/VEEditor;->mColorFilterIndex:I

    .line 197
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mOutputFile:Ljava/lang/String;

    .line 198
    iput-wide v2, p0, Lcom/ss/android/vesdk/VEEditor;->mlCompileStartTime:J

    .line 199
    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mBReversePlay:Z

    .line 200
    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mBCompileHighQualityGif:Z

    .line 201
    iput-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mp4ToGIFConverter:Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;

    .line 203
    const/high16 v0, -0x1000000

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mBackGroundColor:I

    .line 259
    new-instance v0, Lcom/ss/android/vesdk/VEEditor$1;

    invoke-direct {v0, p0}, Lcom/ss/android/vesdk/VEEditor$1;-><init>(Lcom/ss/android/vesdk/VEEditor;)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    .line 291
    new-instance v0, Lcom/ss/android/vesdk/VEEditor$2;

    invoke-direct {v0, p0}, Lcom/ss/android/vesdk/VEEditor$2;-><init>(Lcom/ss/android/vesdk/VEEditor;)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceCallback:Landroid/view/SurfaceHolder$Callback2;

    .line 319
    new-instance v0, Lcom/ss/android/vesdk/VEEditor$3;

    invoke-direct {v0, p0}, Lcom/ss/android/vesdk/VEEditor$3;-><init>(Lcom/ss/android/vesdk/VEEditor;)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;

    .line 442
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 445
    const-string v0, "VEEditor"

    const-string v1, "VEEditor surfaceView"

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 446
    new-instance v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    invoke-direct {v0, p1}, Lcom/ss/android/vesdk/runtime/VEEditorResManager;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    .line 447
    iput-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceView:Landroid/view/SurfaceView;

    .line 448
    invoke-virtual {p2}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object p1

    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceCallback:Landroid/view/SurfaceHolder$Callback2;

    invoke-interface {p1, p2}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 449
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;

    invoke-virtual {p1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOpenGLListeners(Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;)V

    .line 450
    return-void

    .line 443
    :cond_0
    new-instance p2, Lcom/ss/android/vesdk/VEException;

    const/16 v0, -0x64

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "workspace is: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, v0, p1}, Lcom/ss/android/vesdk/VEException;-><init>(ILjava/lang/String;)V

    throw p2
.end method

.method public constructor <init>(Ljava/lang/String;Landroid/view/TextureView;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/VEException;
        }
    .end annotation

    .line 474
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    new-instance v0, Lcom/ss/android/vesdk/VESize;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mInitSize:Lcom/ss/android/vesdk/VESize;

    .line 62
    const-string v0, "mp4"

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCompileType:Ljava/lang/String;

    .line 168
    const/4 v0, 0x0

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceWidth:I

    .line 169
    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceHeight:I

    .line 171
    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mInitDisplayWidth:I

    .line 172
    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mInitDisplayHeight:I

    .line 174
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mbSeparateAV:Ljava/lang/Boolean;

    .line 175
    iput v1, p0, Lcom/ss/android/vesdk/VEEditor;->mAudioEffectfilterIndex:I

    .line 177
    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mMasterTrackIndex:I

    .line 178
    invoke-static {}, Lcom/ss/android/ttve/nativePort/TEInterface;->createEngine()Lcom/ss/android/ttve/nativePort/TEInterface;

    move-result-object v2

    iput-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    .line 184
    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->miFrameCount:I

    .line 185
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/ss/android/vesdk/VEEditor;->mlCurTimeMS:J

    .line 186
    iput-wide v2, p0, Lcom/ss/android/vesdk/VEEditor;->mlLastTimeMS:J

    .line 191
    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mReverseDone:Z

    .line 192
    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCancelReverse:Z

    .line 194
    iput v1, p0, Lcom/ss/android/vesdk/VEEditor;->mColorFilterIndex:I

    .line 197
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mOutputFile:Ljava/lang/String;

    .line 198
    iput-wide v2, p0, Lcom/ss/android/vesdk/VEEditor;->mlCompileStartTime:J

    .line 199
    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mBReversePlay:Z

    .line 200
    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mBCompileHighQualityGif:Z

    .line 201
    iput-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mp4ToGIFConverter:Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;

    .line 203
    const/high16 v0, -0x1000000

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mBackGroundColor:I

    .line 259
    new-instance v0, Lcom/ss/android/vesdk/VEEditor$1;

    invoke-direct {v0, p0}, Lcom/ss/android/vesdk/VEEditor$1;-><init>(Lcom/ss/android/vesdk/VEEditor;)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    .line 291
    new-instance v0, Lcom/ss/android/vesdk/VEEditor$2;

    invoke-direct {v0, p0}, Lcom/ss/android/vesdk/VEEditor$2;-><init>(Lcom/ss/android/vesdk/VEEditor;)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceCallback:Landroid/view/SurfaceHolder$Callback2;

    .line 319
    new-instance v0, Lcom/ss/android/vesdk/VEEditor$3;

    invoke-direct {v0, p0}, Lcom/ss/android/vesdk/VEEditor$3;-><init>(Lcom/ss/android/vesdk/VEEditor;)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;

    .line 475
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 478
    const-string v0, "VEEditor"

    const-string v1, "VEEditor textureView"

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 479
    new-instance v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    invoke-direct {v0, p1}, Lcom/ss/android/vesdk/runtime/VEEditorResManager;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    .line 480
    iput-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mTextureView:Landroid/view/TextureView;

    .line 481
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    invoke-virtual {p2, p1}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 482
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;

    invoke-virtual {p1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOpenGLListeners(Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;)V

    .line 483
    return-void

    .line 476
    :cond_0
    new-instance p2, Lcom/ss/android/vesdk/VEException;

    const/16 v0, -0x64

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "workspace is: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, v0, p1}, Lcom/ss/android/vesdk/VEException;-><init>(ILjava/lang/String;)V

    throw p2
.end method

.method static synthetic access$000(Lcom/ss/android/vesdk/VEEditor;)Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 54
    iget-object p0, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    return-object p0
.end method

.method static synthetic access$002(Lcom/ss/android/vesdk/VEEditor;Landroid/graphics/SurfaceTexture;)Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 54
    iput-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    return-object p1
.end method

.method static synthetic access$100(Lcom/ss/android/vesdk/VEEditor;)Landroid/view/Surface;
    .locals 0

    .line 54
    iget-object p0, p0, Lcom/ss/android/vesdk/VEEditor;->mSurface:Landroid/view/Surface;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/ss/android/vesdk/VEEditor;)J
    .locals 2

    .line 54
    iget-wide v0, p0, Lcom/ss/android/vesdk/VEEditor;->mlLastTimeMS:J

    return-wide v0
.end method

.method static synthetic access$1002(Lcom/ss/android/vesdk/VEEditor;J)J
    .locals 0

    .line 54
    iput-wide p1, p0, Lcom/ss/android/vesdk/VEEditor;->mlLastTimeMS:J

    return-wide p1
.end method

.method static synthetic access$102(Lcom/ss/android/vesdk/VEEditor;Landroid/view/Surface;)Landroid/view/Surface;
    .locals 0

    .line 54
    iput-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mSurface:Landroid/view/Surface;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/ss/android/vesdk/VEEditor;)Z
    .locals 0

    .line 54
    iget-boolean p0, p0, Lcom/ss/android/vesdk/VEEditor;->mBCompileHighQualityGif:Z

    return p0
.end method

.method static synthetic access$1102(Lcom/ss/android/vesdk/VEEditor;Z)Z
    .locals 0

    .line 54
    iput-boolean p1, p0, Lcom/ss/android/vesdk/VEEditor;->mBCompileHighQualityGif:Z

    return p1
.end method

.method static synthetic access$1200(Lcom/ss/android/vesdk/VEEditor;)Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;
    .locals 0

    .line 54
    iget-object p0, p0, Lcom/ss/android/vesdk/VEEditor;->mp4ToGIFConverter:Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;

    return-object p0
.end method

.method static synthetic access$1300(Lcom/ss/android/vesdk/VEEditor;)V
    .locals 0

    .line 54
    invoke-direct {p0}, Lcom/ss/android/vesdk/VEEditor;->onMonitorCompile()V

    return-void
.end method

.method static synthetic access$200(Lcom/ss/android/vesdk/VEEditor;Landroid/view/Surface;)V
    .locals 0

    .line 54
    invoke-direct {p0, p1}, Lcom/ss/android/vesdk/VEEditor;->onSurfaceCreated(Landroid/view/Surface;)V

    return-void
.end method

.method static synthetic access$302(Lcom/ss/android/vesdk/VEEditor;I)I
    .locals 0

    .line 54
    iput p1, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceWidth:I

    return p1
.end method

.method static synthetic access$402(Lcom/ss/android/vesdk/VEEditor;I)I
    .locals 0

    .line 54
    iput p1, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceHeight:I

    return p1
.end method

.method static synthetic access$500(Lcom/ss/android/vesdk/VEEditor;)V
    .locals 0

    .line 54
    invoke-direct {p0}, Lcom/ss/android/vesdk/VEEditor;->updateInitDisplaySize()V

    return-void
.end method

.method static synthetic access$600(Lcom/ss/android/vesdk/VEEditor;)V
    .locals 0

    .line 54
    invoke-direct {p0}, Lcom/ss/android/vesdk/VEEditor;->onSurfaceDestroyed()V

    return-void
.end method

.method static synthetic access$700(Lcom/ss/android/vesdk/VEEditor;II)V
    .locals 0

    .line 54
    invoke-direct {p0, p1, p2}, Lcom/ss/android/vesdk/VEEditor;->onSurfaceChanged(II)V

    return-void
.end method

.method static synthetic access$800(Lcom/ss/android/vesdk/VEEditor;)I
    .locals 0

    .line 54
    iget p0, p0, Lcom/ss/android/vesdk/VEEditor;->miFrameCount:I

    return p0
.end method

.method static synthetic access$802(Lcom/ss/android/vesdk/VEEditor;I)I
    .locals 0

    .line 54
    iput p1, p0, Lcom/ss/android/vesdk/VEEditor;->miFrameCount:I

    return p1
.end method

.method static synthetic access$804(Lcom/ss/android/vesdk/VEEditor;)I
    .locals 1

    .line 54
    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->miFrameCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->miFrameCount:I

    return v0
.end method

.method static synthetic access$900(Lcom/ss/android/vesdk/VEEditor;)J
    .locals 2

    .line 54
    iget-wide v0, p0, Lcom/ss/android/vesdk/VEEditor;->mlCurTimeMS:J

    return-wide v0
.end method

.method static synthetic access$902(Lcom/ss/android/vesdk/VEEditor;J)J
    .locals 0

    .line 54
    iput-wide p1, p0, Lcom/ss/android/vesdk/VEEditor;->mlCurTimeMS:J

    return-wide p1
.end method

.method private addSticker(Landroid/graphics/Bitmap;Lcom/ss/android/vesdk/VESize;II)I
    .locals 0

    .line 1861
    const/4 p1, 0x0

    return p1
.end method

.method private addWaterMark([Landroid/graphics/Bitmap;ILcom/ss/android/vesdk/VESize;II)I
    .locals 0

    .line 1952
    const/4 p1, 0x0

    return p1
.end method

.method public static checkFileExists(Ljava/lang/String;)Z
    .locals 1

    .line 3019
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return p0

    .line 3020
    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p0

    return p0
.end method

.method private onMonitorCompile()V
    .locals 7

    .line 392
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/ss/android/vesdk/VEEditor;->mlCompileStartTime:J

    sub-long/2addr v0, v2

    .line 393
    const-string v2, "te_composition_time"

    invoke-static {v2, v0, v1}, Lcom/ss/android/ttve/monitor/TEMonitor;->perfLong(Ljava/lang/String;J)V

    .line 395
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mOutputFile:Ljava/lang/String;

    invoke-static {v0}, Lcom/ss/android/vesdk/VEEditor;->checkFileExists(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 397
    const/16 v0, 0xa

    new-array v0, v0, [I

    .line 398
    iget-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mOutputFile:Ljava/lang/String;

    invoke-static {v2, v0}, Lcom/ss/android/ttve/nativePort/TEVideoUtils;->getVideoFileInfo(Ljava/lang/String;[I)I

    move-result v2

    if-nez v2, :cond_0

    .line 400
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lcom/ss/android/vesdk/VEEditor;->mOutputFile:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 401
    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v2

    .line 403
    const-string v4, "te_composition_file_size"

    long-to-double v2, v2

    const-wide/high16 v5, 0x4090000000000000L    # 1024.0

    div-double/2addr v2, v5

    div-double/2addr v2, v5

    invoke-static {v4, v2, v3}, Lcom/ss/android/ttve/monitor/TEMonitor;->perfDouble(Ljava/lang/String;D)V

    .line 404
    const-string v2, "te_composition_file_duration"

    const/4 v3, 0x3

    aget v3, v0, v3

    int-to-double v3, v3

    invoke-static {v2, v3, v4}, Lcom/ss/android/ttve/monitor/TEMonitor;->perfDouble(Ljava/lang/String;D)V

    .line 405
    const-string v2, "te_composition_bit_rate"

    const/4 v3, 0x6

    aget v3, v0, v3

    int-to-double v3, v3

    invoke-static {v2, v3, v4}, Lcom/ss/android/ttve/monitor/TEMonitor;->perfDouble(Ljava/lang/String;D)V

    .line 406
    const-string v2, "te_composition_fps"

    const/4 v3, 0x7

    aget v3, v0, v3

    int-to-double v3, v3

    invoke-static {v2, v3, v4}, Lcom/ss/android/ttve/monitor/TEMonitor;->perfDouble(Ljava/lang/String;D)V

    .line 407
    const-string v2, "te_composition_resolution"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v4, 0x0

    aget v4, v0, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "x"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget v0, v0, v1

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/ss/android/ttve/monitor/TEMonitor;->perfString(Ljava/lang/String;Ljava/lang/String;)V

    .line 411
    :cond_0
    sget v0, Lcom/ss/android/ttve/monitor/TEMonitor;->MONITOR_ACTION_COMPILE:I

    invoke-static {v0}, Lcom/ss/android/ttve/monitor/TEMonitor;->report(I)V

    .line 413
    new-instance v0, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    invoke-direct {v0}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;-><init>()V

    .line 414
    const-string v2, "iesve_veeditor_composition_finish_file"

    iget-object v3, p0, Lcom/ss/android/vesdk/VEEditor;->mCompileType:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    move-result-object v2

    const-string v3, "iesve_veeditor_composition_finish_result"

    const-string v4, "succ"

    .line 415
    invoke-virtual {v2, v3, v4}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    move-result-object v2

    const-string v3, "iesve_veeditor_composition_finish_reason"

    const-string v4, ""

    .line 416
    invoke-virtual {v2, v3, v4}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    .line 417
    const-string v2, "iesve_veeditor_composition_finish"

    invoke-static {v2, v1, v0}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    .line 418
    return-void
.end method

.method private onSurfaceChanged(II)V
    .locals 2

    .line 381
    const-string v0, "VEEditor"

    const-string v1, "onSurfaceChanged..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 382
    if-eqz p1, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    .line 384
    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setSurfaceSize(II)V

    .line 385
    return-void

    .line 383
    :cond_1
    :goto_0
    return-void
.end method

.method private onSurfaceCreated(Landroid/view/Surface;)V
    .locals 2

    .line 375
    const-string v0, "VEEditor"

    const-string v1, "surfaceCreated..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 377
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setPreviewSurface(Landroid/view/Surface;)V

    .line 378
    return-void
.end method

.method private onSurfaceDestroyed()V
    .locals 2

    .line 359
    const-string v0, "VEEditor"

    const-string v1, "surfaceDestroyed..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 360
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->releasePreviewSurface()V

    .line 361
    return-void
.end method

.method private setAudioEffectParam(IIILcom/ss/android/vesdk/VEAudioEffectBean;)V
    .locals 2

    .line 2521
    const-string p1, "VEEditor"

    const-string p2, "setAudioEffectParam..."

    invoke-static {p1, p2}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 2522
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string p2, "audioEffectType"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p4, Lcom/ss/android/vesdk/VEAudioEffectBean;->type:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p3, p2, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 2526
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string p2, "formatShiftOn"

    iget-boolean v0, p4, Lcom/ss/android/vesdk/VEAudioEffectBean;->formatShiftOn:Z

    if-eqz v0, :cond_0

    const-string v0, "1"

    goto :goto_0

    :cond_0
    const-string v0, "0"

    :goto_0
    invoke-virtual {p1, p3, p2, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 2530
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string p2, "smoothOn"

    iget-boolean v0, p4, Lcom/ss/android/vesdk/VEAudioEffectBean;->smoothOn:Z

    if-eqz v0, :cond_1

    const-string v0, "1"

    goto :goto_1

    :cond_1
    const-string v0, "0"

    :goto_1
    invoke-virtual {p1, p3, p2, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 2534
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string p2, "processChMode"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p4, Lcom/ss/android/vesdk/VEAudioEffectBean;->processChMode:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p3, p2, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 2538
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string p2, "transientDetectMode"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p4, Lcom/ss/android/vesdk/VEAudioEffectBean;->transientDetectMode:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p3, p2, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 2542
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string p2, "phaseResetMode"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p4, Lcom/ss/android/vesdk/VEAudioEffectBean;->phaseResetMode:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p3, p2, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 2546
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string p2, "phaseAdjustMethod"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p4, Lcom/ss/android/vesdk/VEAudioEffectBean;->phaseAdjustMethod:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p3, p2, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 2550
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string p2, "windowMode"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p4, Lcom/ss/android/vesdk/VEAudioEffectBean;->windowMode:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p3, p2, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 2554
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string p2, "pitchTunerMode"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p4, Lcom/ss/android/vesdk/VEAudioEffectBean;->pitchTunerMode:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p3, p2, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 2558
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string p2, "blockSize"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p4, Lcom/ss/android/vesdk/VEAudioEffectBean;->blockSize:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p3, p2, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 2562
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string p2, "centtone"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p4, Lcom/ss/android/vesdk/VEAudioEffectBean;->centtone:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p3, p2, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 2566
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string p2, "semiton"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p4, Lcom/ss/android/vesdk/VEAudioEffectBean;->semiton:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p3, p2, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 2570
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string p2, "octative"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p4, Lcom/ss/android/vesdk/VEAudioEffectBean;->octative:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p3, p2, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 2574
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string p2, "speedRatio"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p4, p4, Lcom/ss/android/vesdk/VEAudioEffectBean;->speedRatio:F

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p1, p3, p2, p4}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 2578
    return-void
.end method

.method private setBitrateOptions(Lcom/ss/android/vesdk/VEVideoEncodeSettings;)V
    .locals 5

    .line 2891
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getSwCRF()I

    move-result v1

    invoke-virtual {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getSwMaxRate()I

    move-result v2

    invoke-virtual {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getSwPreset()I

    move-result v3

    invoke-virtual {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getSwQP()I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/ss/android/ttve/nativePort/TEInterface;->setCompileSoftwareEncodeOptions(IIII)V

    .line 2892
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getBps()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setCompileHardwareEncodeOptions(I)V

    .line 2893
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getBitrateMode()Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ordinal()I

    move-result v1

    invoke-virtual {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getEncodeProfile()I

    move-result p1

    invoke-virtual {v0, v1, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setCompileCommonEncodeOptions(II)V

    .line 2894
    return-void
.end method

.method private updateInitDisplaySize()V
    .locals 3

    .line 2898
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mInitSize:Lcom/ss/android/vesdk/VESize;

    iget v0, v0, Lcom/ss/android/vesdk/VESize;->width:I

    int-to-float v0, v0

    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mInitSize:Lcom/ss/android/vesdk/VESize;

    iget v1, v1, Lcom/ss/android/vesdk/VESize;->height:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    iget v1, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceWidth:I

    int-to-float v1, v1

    iget v2, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceHeight:I

    int-to-float v2, v2

    div-float/2addr v1, v2

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    .line 2899
    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceWidth:I

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mInitDisplayWidth:I

    .line 2900
    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceWidth:I

    int-to-float v0, v0

    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mInitSize:Lcom/ss/android/vesdk/VESize;

    iget v1, v1, Lcom/ss/android/vesdk/VESize;->width:I

    int-to-float v1, v1

    iget-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mInitSize:Lcom/ss/android/vesdk/VESize;

    iget v2, v2, Lcom/ss/android/vesdk/VESize;->height:I

    int-to-float v2, v2

    div-float/2addr v1, v2

    div-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mInitDisplayHeight:I

    goto :goto_0

    .line 2902
    :cond_0
    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceHeight:I

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mInitDisplayHeight:I

    .line 2903
    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceHeight:I

    int-to-float v0, v0

    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mInitSize:Lcom/ss/android/vesdk/VESize;

    iget v1, v1, Lcom/ss/android/vesdk/VESize;->height:I

    int-to-float v1, v1

    iget-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mInitSize:Lcom/ss/android/vesdk/VESize;

    iget v2, v2, Lcom/ss/android/vesdk/VESize;->width:I

    int-to-float v2, v2

    div-float/2addr v1, v2

    div-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mInitDisplayWidth:I

    .line 2905
    :goto_0
    return-void
.end method


# virtual methods
.method public addAudioEffects(II[I[I[Lcom/ss/android/vesdk/VEAudioEffectBean;)[I
    .locals 9

    .line 2492
    const-string v0, "VEEditor"

    const-string v1, "addAudioEffects..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 2494
    array-length v0, p3

    .line 2495
    new-array v2, v0, [I

    .line 2496
    new-array v6, v0, [I

    .line 2497
    new-array v7, v0, [I

    .line 2498
    new-array v3, v0, [Ljava/lang/String;

    .line 2499
    const/4 v8, 0x0

    move v1, v8

    :goto_0
    if-ge v1, v0, :cond_0

    .line 2500
    aput p1, v2, v1

    .line 2501
    aput p2, v6, v1

    .line 2502
    const-string v4, "audio effect"

    aput-object v4, v3, v1

    .line 2503
    const/4 v4, 0x1

    aput v4, v7, v1

    .line 2499
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2505
    :cond_0
    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    move-object v4, p3

    move-object v5, p4

    invoke-virtual/range {v1 .. v7}, Lcom/ss/android/ttve/nativePort/TEInterface;->addFilters([I[Ljava/lang/String;[I[I[I[I)[I

    move-result-object p3

    .line 2513
    :goto_1
    if-ge v8, v0, :cond_1

    .line 2514
    aget p4, p3, v8

    aget-object v1, p5, v8

    invoke-direct {p0, p1, p2, p4, v1}, Lcom/ss/android/vesdk/VEEditor;->setAudioEffectParam(IIILcom/ss/android/vesdk/VEAudioEffectBean;)V

    .line 2513
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 2517
    :cond_1
    return-object p3
.end method

.method public addAudioTrack(Ljava/lang/String;IIIIZ)I
    .locals 7

    .line 1386
    monitor-enter p0

    .line 1387
    :try_start_0
    const-string v0, "VEEditor"

    const-string v1, "addAudioTrack..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1388
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/16 v1, -0x64

    if-eqz v0, :cond_0

    .line 1389
    monitor-exit p0

    return v1

    .line 1391
    :cond_0
    if-le p3, p2, :cond_4

    if-gez p2, :cond_1

    goto :goto_1

    .line 1394
    :cond_1
    if-le p5, p4, :cond_3

    if-gez p4, :cond_2

    goto :goto_0

    .line 1398
    :cond_2
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    move-object v1, p1

    move v2, p4

    move v3, p5

    move v4, p2

    move v5, p3

    move v6, p6

    invoke-virtual/range {v0 .. v6}, Lcom/ss/android/ttve/nativePort/TEInterface;->addAudioTrack(Ljava/lang/String;IIIIZ)I

    move-result p1

    monitor-exit p0

    return p1

    .line 1395
    :cond_3
    :goto_0
    monitor-exit p0

    return v1

    .line 1392
    :cond_4
    :goto_1
    monitor-exit p0

    return v1

    .line 1399
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public addAudioTrack(Ljava/lang/String;IIIIZII)I
    .locals 11

    move-object v1, p0

    move v0, p2

    move v4, p4

    .line 1419
    monitor-enter p0

    .line 1420
    :try_start_0
    const-string v2, "VEEditor"

    const-string v3, "addAudioTrack..."

    invoke-static {v2, v3}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1421
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    const/16 v3, -0x64

    if-eqz v2, :cond_0

    .line 1422
    monitor-exit p0

    return v3

    .line 1424
    :cond_0
    move v7, p3

    if-le v7, v0, :cond_4

    if-gez v0, :cond_1

    goto :goto_1

    .line 1427
    :cond_1
    move/from16 v5, p5

    if-le v5, v4, :cond_3

    if-gez v4, :cond_2

    goto :goto_0

    .line 1431
    :cond_2
    iget-object v2, v1, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    move-object v3, p1

    move v6, v0

    move/from16 v8, p6

    move/from16 v9, p7

    move/from16 v10, p8

    invoke-virtual/range {v2 .. v10}, Lcom/ss/android/ttve/nativePort/TEInterface;->addAudioTrack(Ljava/lang/String;IIIIZII)I

    move-result v0

    monitor-exit p0

    return v0

    .line 1428
    :cond_3
    :goto_0
    monitor-exit p0

    return v3

    .line 1425
    :cond_4
    :goto_1
    monitor-exit p0

    return v3

    .line 1432
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public addAudioTrack(Ljava/lang/String;IIZ)I
    .locals 10

    .line 1356
    monitor-enter p0

    .line 1357
    :try_start_0
    const-string v0, "VEEditor"

    const-string v1, "addAudioTrack..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1358
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/16 v1, -0x64

    if-eqz v0, :cond_0

    .line 1359
    monitor-exit p0

    return v1

    .line 1361
    :cond_0
    if-le p3, p2, :cond_2

    if-gez p2, :cond_1

    goto :goto_0

    .line 1365
    :cond_1
    const-string v0, "iesve_veeditor_import_music"

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    .line 1367
    iget-object v3, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v5, 0x0

    sub-int v6, p3, p2

    move-object v4, p1

    move v7, p2

    move v8, p3

    move v9, p4

    invoke-virtual/range {v3 .. v9}, Lcom/ss/android/ttve/nativePort/TEInterface;->addAudioTrack(Ljava/lang/String;IIIIZ)I

    move-result p1

    monitor-exit p0

    return p1

    .line 1362
    :cond_2
    :goto_0
    monitor-exit p0

    return v1

    .line 1368
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public addEqualizer(IIIII)I
    .locals 8

    .line 2632
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v1, 0x1

    new-array v2, v1, [I

    const/4 v7, 0x0

    aput p1, v2, v7

    const-string p1, "audio equalizer"

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    new-array v3, v1, [I

    aput p4, v3, v7

    new-array v4, v1, [I

    aput p5, v4, v7

    new-array v5, v1, [I

    aput p2, v5, v7

    new-array v6, v1, [I

    aput v1, v6, v7

    move-object v1, v2

    move-object v2, p1

    invoke-virtual/range {v0 .. v6}, Lcom/ss/android/ttve/nativePort/TEInterface;->addFilters([I[Ljava/lang/String;[I[I[I[I)[I

    move-result-object p1

    .line 2641
    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    aget p4, p1, v7

    const-string p5, "preset_id"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p4, p5, p3}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 2646
    aget p1, p1, v7

    return p1
.end method

.method public addExtRes(Ljava/lang/String;IIIIFFFF)I
    .locals 20

    move/from16 v0, p2

    move/from16 v1, p3

    .line 1909
    const-string v2, "VEEditor"

    const-string v3, "addSticker..."

    invoke-static {v2, v3}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1910
    if-gt v0, v1, :cond_1

    if-ltz v0, :cond_1

    invoke-static/range {p1 .. p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    .line 1914
    :cond_0
    const-string v2, "iesve_veeditor_import_sticker"

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-static {v2, v4, v3}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    .line 1916
    move-object/from16 v2, p0

    iget-object v5, v2, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    new-array v6, v4, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v6, v2

    const/4 v7, 0x0

    new-array v8, v4, [I

    aput v0, v8, v2

    new-array v9, v4, [I

    aput v1, v9, v2

    new-array v10, v4, [I

    aput p4, v10, v2

    new-array v11, v4, [I

    aput p5, v11, v2

    move/from16 v0, p8

    float-to-double v12, v0

    move/from16 v0, p9

    float-to-double v14, v0

    move/from16 v0, p6

    float-to-double v0, v0

    move/from16 v2, p7

    float-to-double v2, v2

    move-wide/from16 v16, v0

    move-wide/from16 v18, v2

    invoke-virtual/range {v5 .. v19}, Lcom/ss/android/ttve/nativePort/TEInterface;->addSticker([Ljava/lang/String;[Ljava/lang/String;[I[I[I[IDDDD)I

    move-result v0

    return v0

    .line 1911
    :cond_1
    :goto_0
    const/16 v0, -0x64

    return v0
.end method

.method public addFilterEffects([I[I[Ljava/lang/String;)[I
    .locals 9

    .line 2190
    array-length v0, p1

    .line 2191
    new-array v2, v0, [I

    .line 2192
    new-array v6, v0, [I

    .line 2193
    new-array v7, v0, [I

    .line 2194
    new-array v3, v0, [Ljava/lang/String;

    .line 2195
    const/4 v8, 0x0

    move v1, v8

    :goto_0
    if-ge v1, v0, :cond_0

    .line 2196
    aput v8, v2, v1

    .line 2197
    aput v8, v6, v1

    .line 2198
    const-string v4, "filter effect"

    aput-object v4, v3, v1

    .line 2199
    const/16 v4, 0x8

    aput v4, v7, v1

    .line 2195
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2201
    :cond_0
    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    move-object v4, p1

    move-object v5, p2

    invoke-virtual/range {v1 .. v7}, Lcom/ss/android/ttve/nativePort/TEInterface;->addFilters([I[Ljava/lang/String;[I[I[I[I)[I

    move-result-object p1

    .line 2209
    array-length p2, p1

    if-eq v0, p2, :cond_1

    .line 2210
    new-array p1, v0, [I

    .line 2211
    const/4 p2, -0x1

    invoke-static {p1, p2}, Ljava/util/Arrays;->fill([II)V

    .line 2212
    return-object p1

    .line 2215
    :cond_1
    :goto_1
    if-ge v8, v0, :cond_2

    .line 2216
    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    aget v1, p1, v8

    const-string v2, "effect res path"

    aget-object v3, p3, v8

    invoke-virtual {p2, v1, v2, v3}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 2215
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 2220
    :cond_2
    return-object p1
.end method

.method public addInfoSticker(Ljava/lang/String;[Ljava/lang/String;)I
    .locals 3
    .param p2    # [Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 1676
    const-string v0, "VEEditor"

    const-string v1, "addInfoSticker..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1677
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1678
    const/16 p1, -0x64

    return p1

    .line 1681
    :cond_0
    const-string v0, "iesve_veeditor_import_sticker"

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    .line 1683
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->addInfoSticker(Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public addMetadata(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2

    .line 2772
    monitor-enter p0

    .line 2773
    :try_start_0
    const-string v0, "VEEditor"

    const-string v1, "addMetadata..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 2775
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 2778
    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->addMetaData(Ljava/lang/String;Ljava/lang/String;)V

    .line 2779
    const/4 p1, 0x0

    monitor-exit p0

    return p1

    .line 2776
    :cond_1
    :goto_0
    const/16 p1, -0x64

    monitor-exit p0

    return p1

    .line 2780
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public addPitchTempo(IIFFII)I
    .locals 8

    .line 2717
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v1, 0x1

    new-array v2, v1, [I

    const/4 v7, 0x0

    aput p1, v2, v7

    const-string p1, "audio pitch tempo"

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    new-array v3, v1, [I

    aput p5, v3, v7

    new-array v4, v1, [I

    aput p6, v4, v7

    new-array v5, v1, [I

    aput p2, v5, v7

    new-array v6, v1, [I

    aput v1, v6, v7

    move-object v1, v2

    move-object v2, p1

    invoke-virtual/range {v0 .. v6}, Lcom/ss/android/ttve/nativePort/TEInterface;->addFilters([I[Ljava/lang/String;[I[I[I[I)[I

    move-result-object p1

    .line 2726
    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    aget p5, p1, v7

    const-string p6, "pitch_scale"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p5, p6, p3}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 2730
    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    aget p3, p1, v7

    const-string p5, "time_ratio"

    new-instance p6, Ljava/lang/StringBuilder;

    invoke-direct {p6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, ""

    invoke-virtual {p6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p6, p4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {p6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p2, p3, p5, p4}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 2734
    aget p1, p1, v7

    return p1
.end method

.method public addRepeatEffect(IIIII)I
    .locals 10

    .line 2295
    monitor-enter p0

    .line 2298
    :try_start_0
    const-string v0, "VEEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "addRepeatEffect... "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 2300
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->pauseSync()I

    move-result v0

    .line 2301
    if-eqz v0, :cond_0

    .line 2302
    const-string p1, "VEEditor"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "pauseSync failed, ret "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 2303
    const/4 p1, -0x1

    monitor-exit p0

    return p1

    .line 2306
    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/vesdk/VEEditor;->getDuration()I

    move-result v0

    .line 2307
    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v8, 0x1

    new-array v2, v8, [I

    const/4 v9, 0x0

    aput p1, v2, v9

    const-string p1, "timeEffect repeating"

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object v3

    new-array v4, v8, [I

    aput p3, v4, v9

    new-array v5, v8, [I

    aput v0, v5, v9

    new-array v6, v8, [I

    aput p2, v6, v9

    new-array v7, v8, [I

    const/4 p1, 0x6

    aput p1, v7, v9

    invoke-virtual/range {v1 .. v7}, Lcom/ss/android/ttve/nativePort/TEInterface;->addFilters([I[Ljava/lang/String;[I[I[I[I)[I

    move-result-object p1

    .line 2316
    aget p2, p1, v9

    iput p2, p0, Lcom/ss/android/vesdk/VEEditor;->mAudioEffectfilterIndex:I

    .line 2318
    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    aget p3, p1, v9

    const-string v0, "timeEffect repeating duration"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p5

    invoke-virtual {p2, p3, v0, p5}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 2323
    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    aget p3, p1, v9

    const-string p5, "timeEffect repeating times"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p2, p3, p5, p4}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 2329
    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->createTimeline()I

    .line 2333
    new-instance p2, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    invoke-direct {p2}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;-><init>()V

    .line 2334
    const-string p3, "iesve_veeditor_time_effect_id"

    const-string p4, "repeat"

    invoke-virtual {p2, p3, p4}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    .line 2335
    const-string p3, "iesve_veeditor_time_effect"

    invoke-static {p3, v8, p2}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    .line 2337
    aget p1, p1, v9

    monitor-exit p0

    return p1

    .line 2338
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public addReverb(IIFFFFFII)I
    .locals 10

    move-object v0, p0

    .line 2667
    iget-object v1, v0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v2, 0x1

    new-array v3, v2, [I

    const/4 v8, 0x0

    aput p1, v3, v8

    const-string v4, "audio reverb"

    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v4

    new-array v5, v2, [I

    aput p8, v5, v8

    new-array v6, v2, [I

    aput p9, v6, v8

    new-array v7, v2, [I

    aput p2, v7, v8

    new-array v9, v2, [I

    aput v2, v9, v8

    move-object v2, v3

    move-object v3, v4

    move-object v4, v5

    move-object v5, v6

    move-object v6, v7

    move-object v7, v9

    invoke-virtual/range {v1 .. v7}, Lcom/ss/android/ttve/nativePort/TEInterface;->addFilters([I[Ljava/lang/String;[I[I[I[I)[I

    move-result-object v1

    .line 2677
    iget-object v2, v0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    aget v3, v1, v8

    const-string v4, "room_size"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v6, p3

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v3, v4, v5}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 2681
    iget-object v2, v0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    aget v3, v1, v8

    const-string v4, "hfDamping"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v6, p4

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v3, v4, v5}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 2685
    iget-object v2, v0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    aget v3, v1, v8

    const-string v4, "stereoDepth"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v6, p5

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v3, v4, v5}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 2689
    iget-object v2, v0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    aget v3, v1, v8

    const-string v4, "dry"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v6, p6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v3, v4, v5}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 2693
    iget-object v0, v0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    aget v2, v1, v8

    const-string v3, "wet"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v5, p7

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v2, v3, v4}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 2698
    aget v0, v1, v8

    return v0
.end method

.method public addSegmentVolume([I[I[I[I[F)[I
    .locals 9

    .line 1559
    array-length v0, p3

    .line 1560
    new-array v3, v0, [Ljava/lang/String;

    .line 1561
    new-array v7, v0, [I

    .line 1562
    const/4 v8, 0x0

    move v1, v8

    :goto_0
    if-ge v1, v0, :cond_0

    .line 1563
    const-string v2, "audio volume filter"

    aput-object v2, v3, v1

    .line 1564
    const/4 v2, 0x1

    aput v2, v7, v1

    .line 1562
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1567
    :cond_0
    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    move-object v2, p1

    move-object v4, p3

    move-object v5, p4

    move-object v6, p2

    invoke-virtual/range {v1 .. v7}, Lcom/ss/android/ttve/nativePort/TEInterface;->addFilters([I[Ljava/lang/String;[I[I[I[I)[I

    move-result-object p1

    .line 1569
    :goto_1
    if-ge v8, v0, :cond_1

    .line 1570
    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    aget p3, p1, v8

    const-string p4, "audio volume"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget v2, p5, v8

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, p3, p4, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 1569
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 1573
    :cond_1
    return-object p1
.end method

.method public addSlowMotionEffect(IIIIFF)I
    .locals 17

    move-object/from16 v1, p0

    move/from16 v0, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    .line 2404
    move/from16 v6, p6

    monitor-enter p0

    .line 2406
    :try_start_0
    const-string v7, "VEEditor"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "addSlowMotionEffect... "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 2408
    iget-object v7, v1, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v7}, Lcom/ss/android/ttve/nativePort/TEInterface;->pauseSync()I

    move-result v7

    .line 2409
    if-eqz v7, :cond_0

    .line 2410
    const-string v0, "VEEditor"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "pauseSync failed, ret "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 2411
    const/4 v0, -0x1

    monitor-exit p0

    return v0

    .line 2414
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/ss/android/vesdk/VEEditor;->getDuration()I

    move-result v7

    .line 2415
    iget-object v8, v1, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v15, 0x1

    new-array v9, v15, [I

    const/16 v16, 0x0

    aput v0, v9, v16

    const-string v0, "timeEffect slow motion"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v10

    new-array v11, v15, [I

    aput v3, v11, v16

    new-array v12, v15, [I

    aput v7, v12, v16

    new-array v13, v15, [I

    aput v2, v13, v16

    new-array v14, v15, [I

    const/4 v0, 0x6

    aput v0, v14, v16

    invoke-virtual/range {v8 .. v14}, Lcom/ss/android/ttve/nativePort/TEInterface;->addFilters([I[Ljava/lang/String;[I[I[I[I)[I

    move-result-object v0

    .line 2424
    aget v2, v0, v16

    iput v2, v1, Lcom/ss/android/vesdk/VEEditor;->mAudioEffectfilterIndex:I

    .line 2426
    iget-object v2, v1, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    aget v3, v0, v16

    const-string v7, "timeEffect slow motion duration"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, ""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v7, v4}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 2431
    iget-object v2, v1, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    aget v3, v0, v16

    const-string v4, "timeEffect slow motion speed"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, ""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v3, v4, v5}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 2436
    iget-object v2, v1, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    aget v3, v0, v16

    const-string v4, "timeEffect fast motion speed"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, ""

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v3, v4, v5}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 2442
    iget-object v2, v1, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->createTimeline()I

    .line 2446
    new-instance v2, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    invoke-direct {v2}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;-><init>()V

    .line 2447
    const-string v3, "iesve_veeditor_time_effect_id"

    const-string v4, "slow"

    invoke-virtual {v2, v3, v4}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    .line 2448
    const-string v3, "iesve_veeditor_time_effect"

    invoke-static {v3, v15, v2}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    .line 2450
    aget v0, v0, v16

    monitor-exit p0

    return v0

    .line 2451
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public addSticker(Ljava/lang/String;IIIIFFFF)I
    .locals 20

    move/from16 v0, p2

    move/from16 v1, p3

    .line 1881
    const-string v2, "VEEditor"

    const-string v3, "addSticker..."

    invoke-static {v2, v3}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1882
    if-gt v0, v1, :cond_1

    if-ltz v0, :cond_1

    invoke-static/range {p1 .. p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    .line 1886
    :cond_0
    const-string v2, "iesve_veeditor_import_sticker"

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-static {v2, v4, v3}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    .line 1888
    move-object/from16 v2, p0

    iget-object v5, v2, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    new-array v6, v4, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v6, v2

    const/4 v7, 0x0

    new-array v8, v4, [I

    aput v0, v8, v2

    new-array v9, v4, [I

    aput v1, v9, v2

    new-array v10, v4, [I

    aput p4, v10, v2

    new-array v11, v4, [I

    aput p5, v11, v2

    move/from16 v0, p8

    float-to-double v12, v0

    move/from16 v0, p9

    float-to-double v14, v0

    move/from16 v0, p6

    float-to-double v0, v0

    move/from16 v2, p7

    float-to-double v2, v2

    move-wide/from16 v16, v0

    move-wide/from16 v18, v2

    invoke-virtual/range {v5 .. v19}, Lcom/ss/android/ttve/nativePort/TEInterface;->addSticker([Ljava/lang/String;[Ljava/lang/String;[I[I[I[IDDDD)I

    move-result v0

    return v0

    .line 1883
    :cond_1
    :goto_0
    const/16 v0, -0x64

    return v0
.end method

.method public addWaterMark(Ljava/lang/String;DDDD)I
    .locals 16

    move-object/from16 v0, p0

    .line 1976
    const-string v1, "VEEditor"

    const-string v2, "addWaterMark..."

    invoke-static {v1, v2}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1977
    iget-object v3, v0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v1, 0x1

    new-array v4, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v4, v2

    new-array v6, v1, [I

    aput v2, v6, v2

    new-array v7, v1, [I

    iget-object v0, v0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    .line 1978
    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->getDuration()I

    move-result v0

    aput v0, v7, v2

    .line 1977
    const/4 v5, 0x0

    move-wide/from16 v8, p6

    move-wide/from16 v10, p8

    move-wide/from16 v12, p2

    move-wide/from16 v14, p4

    invoke-virtual/range {v3 .. v15}, Lcom/ss/android/ttve/nativePort/TEInterface;->addWaterMark([Ljava/lang/String;[Ljava/lang/String;[I[IDDDD)I

    move-result v0

    return v0
.end method

.method public addWaterMarkForGifHigh(Ljava/lang/String;DDDD)I
    .locals 0

    .line 1994
    iput-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkFile:Ljava/lang/String;

    .line 1995
    iput-wide p2, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkWidth:D

    .line 1996
    iput-wide p4, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkHeight:D

    .line 1997
    iput-wide p6, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkOffsetX:D

    .line 1998
    iput-wide p8, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkOffsetY:D

    .line 1999
    const/4 p1, 0x0

    return p1
.end method

.method public cancelReverseVideo()I
    .locals 1

    .line 1207
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mReverseDone:Z

    if-eqz v0, :cond_0

    .line 1208
    const/16 v0, -0x69

    return v0

    .line 1210
    :cond_0
    monitor-enter p0

    .line 1211
    :try_start_0
    new-instance v0, Lcom/ss/android/medialib/FFMpegInvoker;

    invoke-direct {v0}, Lcom/ss/android/medialib/FFMpegInvoker;-><init>()V

    .line 1212
    invoke-virtual {v0}, Lcom/ss/android/medialib/FFMpegInvoker;->stopReverseVideo()I

    .line 1213
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCancelReverse:Z

    .line 1214
    monitor-exit p0

    .line 1215
    const/4 v0, 0x0

    return v0

    .line 1214
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public changeRes([Ljava/lang/String;[I[I[Ljava/lang/String;[Ljava/lang/String;[I[ILcom/ss/android/vesdk/VEEditor$VIDEO_RATIO;)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/VEException;
        }
    .end annotation

    .line 880
    const-string v0, "VEEditor"

    const-string v1, "reInit..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 883
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->stop()I

    move-result v0

    .line 884
    const/4 v1, -0x1

    if-eqz v0, :cond_0

    .line 885
    const-string p1, "VEEditor"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "stop in changeRes failed, ret = "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 886
    return v1

    .line 889
    :cond_0
    invoke-virtual/range {p0 .. p8}, Lcom/ss/android/vesdk/VEEditor;->init2([Ljava/lang/String;[I[I[Ljava/lang/String;[Ljava/lang/String;[I[ILcom/ss/android/vesdk/VEEditor$VIDEO_RATIO;)I

    move-result p1

    .line 890
    if-eqz p1, :cond_1

    .line 891
    const-string p2, "VEEditor"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "init2 in changeRes failed, ret = "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Lcom/ss/android/ttve/common/TELogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 892
    return p1

    .line 896
    :cond_1
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->createTimeline()I

    .line 898
    const/4 p1, 0x0

    iput p1, p0, Lcom/ss/android/vesdk/VEEditor;->mInPoint:I

    .line 899
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->getDuration()I

    move-result p1

    iput p1, p0, Lcom/ss/android/vesdk/VEEditor;->mOutPoint:I

    .line 900
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget p2, p0, Lcom/ss/android/vesdk/VEEditor;->mInPoint:I

    iget p3, p0, Lcom/ss/android/vesdk/VEEditor;->mOutPoint:I

    iget-object p4, p0, Lcom/ss/android/vesdk/VEEditor;->mModelsDir:Ljava/lang/String;

    invoke-virtual {p1, p2, p3, v1, p4}, Lcom/ss/android/ttve/nativePort/TEInterface;->prepareEngine(IIILjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public clearDisplay(I)V
    .locals 1

    .line 673
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->clearDisplay(I)V

    .line 674
    return-void
.end method

.method public compile(Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/vesdk/VEVideoEncodeSettings;)V
    .locals 10

    .line 2792
    monitor-enter p0

    .line 2794
    :try_start_0
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->getNativeHandler()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 2795
    monitor-exit p0

    return-void

    .line 2797
    :cond_0
    iput-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mOutputFile:Ljava/lang/String;

    .line 2798
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/ss/android/vesdk/VEEditor;->mlCompileStartTime:J

    .line 2800
    const-string v0, "VEEditor"

    const-string v1, "compile..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 2801
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->stop()I

    .line 2803
    sget-object v0, Lcom/ss/android/vesdk/VEEditor$6;->$SwitchMap$com$ss$android$vesdk$VEVideoEncodeSettings$COMPILE_TYPE:[I

    invoke-virtual {p3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getCompileType()Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x2

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_0

    .line 2835
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    goto/16 :goto_0

    .line 2813
    :pswitch_0
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mp4ToGIFConverter:Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mp4ToGIFConverter:Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;

    iget-boolean p1, p1, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mIsRunning:Z

    if-eqz p1, :cond_1

    .line 2814
    monitor-exit p0

    return-void

    .line 2816
    :cond_1
    iput-boolean v2, p0, Lcom/ss/android/vesdk/VEEditor;->mBCompileHighQualityGif:Z

    .line 2817
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->setCompileType(I)V

    .line 2818
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mp4ToGIFConverter:Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;

    if-nez p1, :cond_2

    .line 2819
    new-instance p1, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;

    invoke-direct {p1, p0}, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;-><init>(Lcom/ss/android/vesdk/VEEditor;)V

    iput-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mp4ToGIFConverter:Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;

    .line 2821
    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v0, Ljava/io/File;

    iget-object v3, p0, Lcom/ss/android/vesdk/VEEditor;->mOutputFile:Ljava/lang/String;

    invoke-direct {v0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-char v0, Ljava/io/File;->separatorChar:C

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v0, "gif.mp4"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 2822
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mp4ToGIFConverter:Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;

    invoke-virtual {v0, p1}, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->setInputFile(Ljava/lang/String;)V

    .line 2823
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mp4ToGIFConverter:Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;

    iget-object v3, p0, Lcom/ss/android/vesdk/VEEditor;->mOutputFile:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->setOutputFile(Ljava/lang/String;)V

    .line 2825
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mp4ToGIFConverter:Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;

    iget-object v3, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkFile:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->setWaterMarkFile(Ljava/lang/String;)V

    .line 2826
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mp4ToGIFConverter:Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;

    iget-wide v3, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkWidth:D

    invoke-virtual {p3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getVideoRes()Lcom/ss/android/vesdk/VESize;

    move-result-object v5

    iget v5, v5, Lcom/ss/android/vesdk/VESize;->width:I

    int-to-double v5, v5

    mul-double/2addr v3, v5

    double-to-int v3, v3

    invoke-virtual {v0, v3}, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->setWaterMarkWidth(I)V

    .line 2827
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mp4ToGIFConverter:Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;

    iget-wide v3, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkHeight:D

    invoke-virtual {p3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getVideoRes()Lcom/ss/android/vesdk/VESize;

    move-result-object v5

    iget v5, v5, Lcom/ss/android/vesdk/VESize;->height:I

    int-to-double v5, v5

    mul-double/2addr v3, v5

    double-to-int v3, v3

    invoke-virtual {v0, v3}, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->setWaterMarkHeight(I)V

    .line 2828
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mp4ToGIFConverter:Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;

    iget-wide v3, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkOffsetX:D

    invoke-virtual {p3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getVideoRes()Lcom/ss/android/vesdk/VESize;

    move-result-object v5

    iget v5, v5, Lcom/ss/android/vesdk/VESize;->width:I

    int-to-double v5, v5

    mul-double/2addr v3, v5

    double-to-int v3, v3

    invoke-virtual {v0, v3}, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->setWaterMarkOffsetX(I)V

    .line 2829
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mp4ToGIFConverter:Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;

    iget-wide v3, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkOffsetY:D

    invoke-virtual {p3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getVideoRes()Lcom/ss/android/vesdk/VESize;

    move-result-object v5

    iget v5, v5, Lcom/ss/android/vesdk/VESize;->height:I

    int-to-double v5, v5

    mul-double/2addr v3, v5

    double-to-int v3, v3

    invoke-virtual {v0, v3}, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->setWaterMarkOffsetY(I)V

    .line 2831
    nop

    .line 2832
    const-string v0, "high_gif"

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCompileType:Ljava/lang/String;

    .line 2833
    goto :goto_1

    .line 2809
    :pswitch_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setCompileType(I)V

    .line 2810
    const-string v0, "gif"

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCompileType:Ljava/lang/String;

    .line 2811
    goto :goto_1

    .line 2805
    :pswitch_2
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setCompileType(I)V

    .line 2806
    const-string v0, "mp4"

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCompileType:Ljava/lang/String;

    .line 2807
    goto :goto_1

    .line 2835
    :goto_0
    invoke-virtual {v0, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setCompileType(I)V

    .line 2836
    const-string v0, "mp4"

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCompileType:Ljava/lang/String;

    .line 2840
    :goto_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getFps()I

    move-result v3

    invoke-virtual {v0, v3}, Lcom/ss/android/ttve/nativePort/TEInterface;->setCompileFps(I)V

    .line 2842
    invoke-direct {p0, p3}, Lcom/ss/android/vesdk/VEEditor;->setBitrateOptions(Lcom/ss/android/vesdk/VEVideoEncodeSettings;)V

    .line 2845
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setEngineCompilePath(Ljava/lang/String;Ljava/lang/String;)V

    .line 2848
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getResizeMode()I

    move-result p2

    .line 2849
    invoke-virtual {p3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getResizeX()F

    move-result v0

    .line 2850
    invoke-virtual {p3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getResizeY()F

    move-result v3

    .line 2848
    invoke-virtual {p1, p2, v0, v3}, Lcom/ss/android/ttve/nativePort/TEInterface;->setResizer(IFF)V

    .line 2853
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getRotate()I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setUsrRotate(I)V

    .line 2856
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->isHwEnc()Z

    move-result p2

    invoke-virtual {p1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setUseHwEnc(Z)V

    .line 2859
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getGopSize()I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setEncGopSize(I)V

    .line 2862
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getSpeed()F

    move-result p2

    invoke-virtual {p1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setSpeedRatio(F)V

    .line 2865
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getVideoRes()Lcom/ss/android/vesdk/VESize;

    move-result-object p2

    iget p2, p2, Lcom/ss/android/vesdk/VESize;->width:I

    invoke-virtual {p3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getVideoRes()Lcom/ss/android/vesdk/VESize;

    move-result-object v0

    iget v0, v0, Lcom/ss/android/vesdk/VESize;->height:I

    invoke-virtual {p1, p2, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->setWidthHeight(II)V

    .line 2866
    invoke-virtual {p3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getWatermarkParam()Lcom/ss/android/vesdk/VEWatermarkParam;

    move-result-object p1

    .line 2867
    if-eqz p1, :cond_3

    iget-boolean p2, p1, Lcom/ss/android/vesdk/VEWatermarkParam;->needExtFile:Z

    if-eqz p2, :cond_3

    .line 2868
    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p2, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setCompileWatermark(Lcom/ss/android/vesdk/VEWatermarkParam;)V

    .line 2869
    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget p3, p0, Lcom/ss/android/vesdk/VEEditor;->mInPoint:I

    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mOutPoint:I

    iget-object v3, p0, Lcom/ss/android/vesdk/VEEditor;->mModelsDir:Ljava/lang/String;

    invoke-virtual {p2, p3, v0, v1, v3}, Lcom/ss/android/ttve/nativePort/TEInterface;->prepareEngine(IIILjava/lang/String;)I

    move-result p2

    if-eqz p2, :cond_4

    .line 2870
    monitor-exit p0

    return-void

    .line 2873
    :cond_3
    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget p3, p0, Lcom/ss/android/vesdk/VEEditor;->mInPoint:I

    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mOutPoint:I

    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mModelsDir:Ljava/lang/String;

    invoke-virtual {p2, p3, v0, v2, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->prepareEngine(IIILjava/lang/String;)I

    move-result p2

    if-eqz p2, :cond_4

    .line 2874
    monitor-exit p0

    return-void

    .line 2877
    :cond_4
    if-eqz p1, :cond_5

    .line 2878
    iget-object v3, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget-object v4, p1, Lcom/ss/android/vesdk/VEWatermarkParam;->images:[Ljava/lang/String;

    iget v5, p1, Lcom/ss/android/vesdk/VEWatermarkParam;->interval:I

    iget v6, p1, Lcom/ss/android/vesdk/VEWatermarkParam;->xOffset:I

    iget v7, p1, Lcom/ss/android/vesdk/VEWatermarkParam;->yOffset:I

    iget v8, p1, Lcom/ss/android/vesdk/VEWatermarkParam;->width:I

    iget v9, p1, Lcom/ss/android/vesdk/VEWatermarkParam;->height:I

    invoke-virtual/range {v3 .. v9}, Lcom/ss/android/ttve/nativePort/TEInterface;->setWaterMark([Ljava/lang/String;IIIII)V

    .line 2881
    :cond_5
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->start()I

    .line 2883
    new-instance p1, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    invoke-direct {p1}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;-><init>()V

    .line 2884
    const-string p2, "iesve_veeditor_composition_start_file"

    iget-object p3, p0, Lcom/ss/android/vesdk/VEEditor;->mCompileType:Ljava/lang/String;

    invoke-virtual {p1, p2, p3}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    .line 2885
    const-string p2, "iesve_veeditor_composition_start"

    invoke-static {p2, v2, p1}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    .line 2886
    monitor-exit p0

    .line 2887
    return-void

    .line 2886
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public deleteAudioFilters([I)I
    .locals 2

    .line 2745
    monitor-enter p0

    .line 2746
    :try_start_0
    const-string v0, "VEEditor"

    const-string v1, "deleteAudioFilter..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 2747
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->removeFilter([I)I

    move-result p1

    monitor-exit p0

    return p1

    .line 2748
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public deleteAudioTrack(I)I
    .locals 2

    .line 1535
    monitor-enter p0

    .line 1536
    :try_start_0
    const-string v0, "VEEditor"

    const-string v1, "deleteAudioTrack..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1537
    if-ltz p1, :cond_0

    .line 1538
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->deleteAudioTrack(I)I

    move-result p1

    monitor-exit p0

    return p1

    .line 1540
    :cond_0
    const/16 p1, -0x64

    monitor-exit p0

    return p1

    .line 1542
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public deleteFilterEffects([I)I
    .locals 1

    .line 2231
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->removeFilter([I)I

    move-result p1

    return p1
.end method

.method public deleteRepeatEffect(I)I
    .locals 3

    .line 2349
    monitor-enter p0

    .line 2351
    :try_start_0
    const-string v0, "VEEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "deleteRepeatEffect... "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 2353
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->pauseSync()I

    move-result v0

    .line 2354
    if-eqz v0, :cond_0

    .line 2355
    const-string p1, "VEEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "pauseSync failed, ret "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 2356
    const/4 p1, -0x1

    monitor-exit p0

    return p1

    .line 2358
    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v1, 0x1

    new-array v1, v1, [I

    const/4 v2, 0x0

    aput p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->removeFilter([I)I

    move-result p1

    .line 2360
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->createTimeline()I

    .line 2361
    monitor-exit p0

    return p1

    .line 2362
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public deleteSlowEffect(I)I
    .locals 3

    .line 2462
    monitor-enter p0

    .line 2464
    :try_start_0
    const-string v0, "VEEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "deleteSlowEffect... "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 2466
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->pauseSync()I

    move-result v0

    .line 2467
    if-eqz v0, :cond_0

    .line 2468
    const-string p1, "VEEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "pauseSync failed, ret "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 2469
    const/4 p1, -0x1

    monitor-exit p0

    return p1

    .line 2471
    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v1, 0x1

    new-array v1, v1, [I

    const/4 v2, 0x0

    aput p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->removeFilter([I)I

    move-result p1

    .line 2473
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->createTimeline()I

    .line 2474
    monitor-exit p0

    return p1

    .line 2475
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public deleteSticker(I)I
    .locals 2

    .line 1932
    const-string v0, "VEEditor"

    const-string v1, "deleteSticker..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1933
    if-gez p1, :cond_0

    .line 1934
    const/16 p1, -0x64

    return p1

    .line 1936
    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->deleteSticker(I)I

    move-result p1

    return p1
.end method

.method public deleteWaterMark(I)I
    .locals 0

    .line 2759
    const/4 p1, 0x0

    return p1
.end method

.method public destroy()V
    .locals 4

    .line 1046
    monitor-enter p0

    .line 1047
    :try_start_0
    const-string v0, "VEEditor"

    const-string v1, "onDestroy..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1048
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->getNativeHandler()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 1049
    monitor-exit p0

    return-void

    .line 1051
    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceView:Landroid/view/SurfaceView;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 1052
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceView:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iget-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceCallback:Landroid/view/SurfaceHolder$Callback2;

    invoke-interface {v0, v2}, Landroid/view/SurfaceHolder;->removeCallback(Landroid/view/SurfaceHolder$Callback;)V

    goto :goto_0

    .line 1053
    :cond_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mTextureView:Landroid/view/TextureView;

    if-eqz v0, :cond_2

    .line 1054
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mTextureView:Landroid/view/TextureView;

    invoke-virtual {v0}, Landroid/view/TextureView;->getSurfaceTextureListener()Landroid/view/TextureView$SurfaceTextureListener;

    move-result-object v0

    iget-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    if-ne v0, v2, :cond_2

    .line 1055
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mTextureView:Landroid/view/TextureView;

    invoke-virtual {v0, v1}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 1058
    :cond_2
    :goto_0
    iput-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceView:Landroid/view/SurfaceView;

    .line 1059
    iput-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mTextureView:Landroid/view/TextureView;

    .line 1060
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    if-eqz v0, :cond_3

    .line 1061
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOpenGLListeners(Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;)V

    .line 1062
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setInfoListener(Lcom/ss/android/ttve/common/TECommonCallback;)V

    .line 1063
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setErrorListener(Lcom/ss/android/ttve/common/TECommonCallback;)V

    .line 1064
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->destroyEngine()I

    .line 1066
    :cond_3
    iput-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    .line 1067
    monitor-exit p0

    .line 1068
    return-void

    .line 1067
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public disableAudioEffect(II)I
    .locals 2

    .line 2611
    const-string v0, "VEEditor"

    const-string v1, "disableAudioEffect..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 2612
    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    .line 2613
    const/16 p1, -0x64

    return p1

    .line 2615
    :cond_0
    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v1, p1, v0, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->adjustFilterInOut(III)I

    move-result p1

    return p1
.end method

.method public disableFilterEffect(II)I
    .locals 2

    .line 2173
    if-ltz p1, :cond_1

    if-gez p2, :cond_0

    goto :goto_0

    .line 2176
    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v1, -0x1

    invoke-virtual {v0, p1, v1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->adjustFilterInOut(III)I

    move-result p1

    return p1

    .line 2174
    :cond_1
    :goto_0
    const/16 p1, -0x64

    return p1
.end method

.method public enableAudioEffect(IIILcom/ss/android/vesdk/VEAudioEffectBean;)I
    .locals 9

    .line 2249
    const-string v0, "VEEditor"

    const-string v1, "enableAudioEffect..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 2252
    invoke-virtual {p0}, Lcom/ss/android/vesdk/VEEditor;->getDuration()I

    move-result v0

    .line 2253
    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v2, 0x1

    new-array v3, v2, [I

    const/4 v8, 0x0

    aput p1, v3, v8

    const-string v4, "audio effect"

    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v4

    new-array v5, v2, [I

    aput p3, v5, v8

    new-array p3, v2, [I

    aput v0, p3, v8

    new-array v6, v2, [I

    aput p2, v6, v8

    new-array v7, v2, [I

    aput v2, v7, v8

    move-object v2, v3

    move-object v3, v4

    move-object v4, v5

    move-object v5, p3

    invoke-virtual/range {v1 .. v7}, Lcom/ss/android/ttve/nativePort/TEInterface;->addFilters([I[Ljava/lang/String;[I[I[I[I)[I

    move-result-object p3

    .line 2262
    aget v0, p3, v8

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mAudioEffectfilterIndex:I

    .line 2264
    aget v0, p3, v8

    invoke-direct {p0, p1, p2, v0, p4}, Lcom/ss/android/vesdk/VEEditor;->setAudioEffectParam(IIILcom/ss/android/vesdk/VEAudioEffectBean;)V

    .line 2265
    aget p1, p3, v8

    return p1
.end method

.method public enableAudioEffect(ILcom/ss/android/vesdk/VEAudioEffectBean;)I
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 2593
    const-string v0, "VEEditor"

    const-string v1, "enableAudioEffect..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 2594
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mbSeparateAV:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 2596
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0, p1, p2}, Lcom/ss/android/vesdk/VEEditor;->enableAudioEffect(IIILcom/ss/android/vesdk/VEAudioEffectBean;)I

    move-result p1

    iput p1, p0, Lcom/ss/android/vesdk/VEEditor;->mAudioEffectfilterIndex:I

    .line 2597
    iget p1, p0, Lcom/ss/android/vesdk/VEEditor;->mAudioEffectfilterIndex:I

    return p1
.end method

.method public enableFilterEffect(ILjava/lang/String;)I
    .locals 10

    .line 2134
    if-ltz p1, :cond_2

    invoke-virtual {p0}, Lcom/ss/android/vesdk/VEEditor;->getDuration()I

    move-result v0

    if-gt p1, v0, :cond_2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 2139
    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/vesdk/VEEditor;->getDuration()I

    move-result v0

    .line 2140
    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v8, 0x1

    new-array v2, v8, [I

    const/4 v9, 0x0

    aput v9, v2, v9

    const-string v3, "video effect"

    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v3

    new-array v4, v8, [I

    aput p1, v4, v9

    new-array v5, v8, [I

    aput v0, v5, v9

    new-array v6, v8, [I

    aput v9, v6, v9

    new-array v7, v8, [I

    const/16 p1, 0x8

    aput p1, v7, v9

    invoke-virtual/range {v1 .. v7}, Lcom/ss/android/ttve/nativePort/TEInterface;->addFilters([I[Ljava/lang/String;[I[I[I[I)[I

    move-result-object p1

    .line 2148
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    aget v1, p1, v9

    const-string v2, "effect res path"

    invoke-virtual {v0, v1, v2, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 2150
    new-instance v0, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    invoke-direct {v0}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;-><init>()V

    .line 2151
    const-string v1, ""

    .line 2152
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 2153
    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {p2, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p2

    .line 2154
    array-length v2, p2

    if-lez v2, :cond_1

    .line 2155
    array-length v1, p2

    sub-int/2addr v1, v8

    aget-object v1, p2, v1

    .line 2158
    :cond_1
    const-string p2, "iesve_veeditor_filter_effect_id"

    invoke-virtual {v0, p2, v1}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    .line 2159
    const-string p2, "iesve_veeditor_filter_effect"

    invoke-static {p2, v8, v0}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    .line 2161
    aget p1, p1, v9

    return p1

    .line 2135
    :cond_2
    :goto_0
    const/16 p1, -0x64

    return p1
.end method

.method public enableReversePlay(Z)I
    .locals 5

    .line 1097
    monitor-enter p0

    .line 1098
    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mReverseDone:Z

    if-nez v0, :cond_0

    .line 1099
    const/16 p1, -0x64

    monitor-exit p0

    return p1

    .line 1101
    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iget-object v0, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mReverseVideoPath:[Ljava/lang/String;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iget-object v0, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mReverseVideoPath:[Ljava/lang/String;

    array-length v0, v0

    if-gtz v0, :cond_1

    goto :goto_2

    .line 1105
    :cond_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->stop()I

    .line 1107
    if-eqz p1, :cond_2

    .line 1108
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iget-object v0, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mReverseVideoPath:[Ljava/lang/String;

    goto :goto_0

    .line 1110
    :cond_2
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iget-object v0, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mVideoPaths:[Ljava/lang/String;

    .line 1112
    :goto_0
    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v2, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->updateTrackClips(II[Ljava/lang/String;)I

    move-result v0

    .line 1113
    if-eqz v0, :cond_3

    .line 1114
    const-string p1, "VEEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Create Scene failed, ret = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/ss/android/ttve/common/TELogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 1115
    monitor-exit p0

    return v0

    .line 1117
    :cond_3
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget-boolean v1, p0, Lcom/ss/android/vesdk/VEEditor;->mBReversePlay:Z

    const/4 v3, 0x1

    if-eq p1, v1, :cond_4

    move v1, v3

    goto :goto_1

    :cond_4
    move v1, v2

    :goto_1
    invoke-virtual {v0, v2, v2, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->updateTrackFilter(IIZ)I

    .line 1118
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->createTimeline()I

    .line 1119
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->getDuration()I

    move-result v1

    iget-object v4, p0, Lcom/ss/android/vesdk/VEEditor;->mModelsDir:Ljava/lang/String;

    invoke-virtual {v0, v2, v1, v2, v4}, Lcom/ss/android/ttve/nativePort/TEInterface;->prepareEngine(IIILjava/lang/String;)I

    .line 1120
    sget-object v0, Lcom/ss/android/vesdk/VEEditor$SEEK_MODE;->EDITOR_SEEK_FLAG_LastSeek:Lcom/ss/android/vesdk/VEEditor$SEEK_MODE;

    invoke-virtual {p0, v2, v0}, Lcom/ss/android/vesdk/VEEditor;->seek(ILcom/ss/android/vesdk/VEEditor$SEEK_MODE;)I

    .line 1121
    iput-boolean p1, p0, Lcom/ss/android/vesdk/VEEditor;->mBReversePlay:Z

    .line 1123
    if-eqz p1, :cond_5

    .line 1124
    new-instance p1, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    invoke-direct {p1}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;-><init>()V

    .line 1125
    const-string v0, "iesve_veeditor_time_effect_id"

    const-string v1, "reverse"

    invoke-virtual {p1, v0, v1}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    .line 1126
    const-string v0, "iesve_veeditor_time_effect"

    invoke-static {v0, v3, p1}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    .line 1129
    :cond_5
    monitor-exit p0

    return v2

    .line 1102
    :cond_6
    :goto_2
    const/16 p1, -0x69

    monitor-exit p0

    return p1

    .line 1130
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public genReverseVideo()I
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/VEException;
        }
    .end annotation

    .line 1177
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iget-object v0, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mVideoPaths:[Ljava/lang/String;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iget-object v0, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mVideoPaths:[Ljava/lang/String;

    array-length v0, v0

    if-gtz v0, :cond_0

    goto :goto_1

    .line 1180
    :cond_0
    new-instance v0, Lcom/ss/android/medialib/FFMpegInvoker;

    invoke-direct {v0}, Lcom/ss/android/medialib/FFMpegInvoker;-><init>()V

    .line 1181
    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iget-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iget-object v2, v2, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mVideoPaths:[Ljava/lang/String;

    array-length v2, v2

    new-array v2, v2, [Ljava/lang/String;

    iput-object v2, v1, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mReverseVideoPath:[Ljava/lang/String;

    .line 1183
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    iget-object v3, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iget-object v3, v3, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mVideoPaths:[Ljava/lang/String;

    array-length v3, v3

    if-ge v2, v3, :cond_3

    .line 1184
    iget-object v3, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    invoke-virtual {v3, v2}, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->genReverseVideoPath(I)Ljava/lang/String;

    move-result-object v3

    .line 1185
    iget-object v4, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iget-object v4, v4, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mVideoPaths:[Ljava/lang/String;

    aget-object v4, v4, v2

    invoke-virtual {v0, v4, v3}, Lcom/ss/android/medialib/FFMpegInvoker;->addFastReverseVideo(Ljava/lang/String;Ljava/lang/String;)I

    move-result v4

    .line 1186
    iget-boolean v5, p0, Lcom/ss/android/vesdk/VEEditor;->mCancelReverse:Z

    const/4 v6, -0x1

    if-eqz v5, :cond_1

    .line 1187
    iput-boolean v1, p0, Lcom/ss/android/vesdk/VEEditor;->mCancelReverse:Z

    .line 1188
    return v6

    .line 1190
    :cond_1
    if-nez v4, :cond_2

    .line 1193
    iget-object v4, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iget-object v4, v4, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mReverseVideoPath:[Ljava/lang/String;

    aput-object v3, v4, v2

    .line 1183
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1191
    :cond_2
    new-instance v0, Lcom/ss/android/vesdk/VEException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "reverse mResManager.mVideoPaths[i] failed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v6, v1}, Lcom/ss/android/vesdk/VEException;-><init>(ILjava/lang/String;)V

    throw v0

    .line 1195
    :cond_3
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mReverseDone:Z

    .line 1196
    return v1

    .line 1178
    :cond_4
    :goto_1
    const/16 v0, -0x64

    return v0
.end method

.method public getCurPosition()I
    .locals 1

    .line 1341
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->getCurPosition()I

    move-result v0

    return v0
.end method

.method public getCurrDisplayImage()Landroid/graphics/Bitmap;
    .locals 4

    .line 629
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->getDisplayRect()Lcom/ss/android/vesdk/VERect;

    move-result-object v0

    .line 630
    iget v1, v0, Lcom/ss/android/vesdk/VERect;->width:I

    iget v2, v0, Lcom/ss/android/vesdk/VERect;->height:I

    mul-int/2addr v1, v2

    mul-int/lit8 v1, v1, 0x4

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 631
    iget-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/ss/android/ttve/nativePort/TEInterface;->getDisplayImage([B)I

    move-result v2

    .line 632
    if-eqz v2, :cond_0

    .line 633
    const-string v0, "VEEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getDisplayImage failed "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 634
    const/4 v0, 0x0

    return-object v0

    .line 636
    :cond_0
    iget v2, v0, Lcom/ss/android/vesdk/VERect;->width:I

    iget v0, v0, Lcom/ss/android/vesdk/VERect;->height:I

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v0, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 637
    invoke-virtual {v0, v1}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    .line 638
    return-object v0
.end method

.method public getDuration()I
    .locals 1

    .line 1331
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->getDuration()I

    move-result v0

    return v0
.end method

.method public getInfoStickerBoundingBox(I)[F
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/VEException;
        }
    .end annotation

    .line 1829
    const-string v0, "VEEditor"

    const-string v1, "getInfoStickerBoundingBox..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1830
    if-ltz p1, :cond_0

    .line 1833
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->getInfoStickerBoundingBox(I)[F

    move-result-object p1

    return-object p1

    .line 1831
    :cond_0
    new-instance p1, Lcom/ss/android/vesdk/VEException;

    const/16 v0, -0x64

    const-string v1, ""

    invoke-direct {p1, v0, v1}, Lcom/ss/android/vesdk/VEException;-><init>(ILjava/lang/String;)V

    throw p1
.end method

.method public getInitSize()Lcom/ss/android/vesdk/VESize;
    .locals 3

    .line 593
    new-instance v0, Lcom/ss/android/vesdk/VESize;

    iget v1, p0, Lcom/ss/android/vesdk/VEEditor;->mInitDisplayWidth:I

    iget v2, p0, Lcom/ss/android/vesdk/VEEditor;->mInitDisplayHeight:I

    invoke-direct {v0, v1, v2}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    .line 594
    return-object v0
.end method

.method public getReverseVideoPaths()[Ljava/lang/String;
    .locals 1

    .line 1226
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mReverseDone:Z

    if-eqz v0, :cond_0

    .line 1227
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iget-object v0, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mReverseVideoPath:[Ljava/lang/String;

    return-object v0

    .line 1229
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getState()Lcom/ss/android/vesdk/VEEditor$VEState;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/VEException;
        }
    .end annotation

    .line 1078
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/16 v1, -0x69

    if-eqz v0, :cond_1

    .line 1081
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->getCurState()I

    move-result v0

    .line 1082
    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    .line 1085
    invoke-static {v0}, Lcom/ss/android/vesdk/VEEditor$VEState;->valueOf(I)Lcom/ss/android/vesdk/VEEditor$VEState;

    move-result-object v0

    return-object v0

    .line 1083
    :cond_0
    new-instance v0, Lcom/ss/android/vesdk/VEException;

    const-string v2, " native video editor is null"

    invoke-direct {v0, v1, v2}, Lcom/ss/android/vesdk/VEException;-><init>(ILjava/lang/String;)V

    throw v0

    .line 1079
    :cond_1
    new-instance v0, Lcom/ss/android/vesdk/VEException;

    const-string v2, "video editor is null"

    invoke-direct {v0, v1, v2}, Lcom/ss/android/vesdk/VEException;-><init>(ILjava/lang/String;)V

    throw v0
.end method

.method public getVolume(III)F
    .locals 2

    .line 1634
    const-string v0, "VEEditor"

    const-string v1, "getVolume..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1635
    if-ltz p3, :cond_1

    invoke-virtual {p0}, Lcom/ss/android/vesdk/VEEditor;->getDuration()I

    move-result v0

    if-le p3, v0, :cond_0

    goto :goto_0

    .line 1638
    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p2, p1, p3}, Lcom/ss/android/ttve/nativePort/TEInterface;->getTrackVolume(III)F

    move-result p1

    return p1

    .line 1636
    :cond_1
    :goto_0
    const/high16 p1, -0x3d380000    # -100.0f

    return p1
.end method

.method public init([Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Lcom/ss/android/vesdk/VEEditor$VIDEO_RATIO;)I
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/VEException;
        }
    .end annotation

    .line 771
    monitor-enter p0

    .line 772
    :try_start_0
    const-string v0, "VEEditor"

    const-string v1, "init..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 773
    iget-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->getWorkspace()Ljava/lang/String;

    move-result-object v3

    const/4 v0, 0x0

    move-object v7, v0

    check-cast v7, [[Ljava/lang/String;

    invoke-virtual {p4}, Lcom/ss/android/vesdk/VEEditor$VIDEO_RATIO;->ordinal()I

    move-result v8

    move-object v4, p1

    move-object v5, p3

    move-object v6, p2

    invoke-virtual/range {v2 .. v8}, Lcom/ss/android/ttve/nativePort/TEInterface;->createScene(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[[Ljava/lang/String;I)I

    move-result v0

    .line 774
    if-eqz v0, :cond_0

    .line 775
    const-string p1, "VEEditor"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Create Scene failed, ret = "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/ss/android/ttve/common/TELogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 776
    monitor-exit p0

    return v0

    .line 778
    :cond_0
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/ss/android/vesdk/VEEditor;->mReverseDone:Z

    .line 779
    iput-object p4, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoOutRes:Lcom/ss/android/vesdk/VEEditor$VIDEO_RATIO;

    .line 780
    iget-object p4, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iput-object p3, p4, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mAudioPaths:[Ljava/lang/String;

    .line 781
    iget-object p4, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iput-object p1, p4, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mVideoPaths:[Ljava/lang/String;

    .line 782
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iput-object p2, p1, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mTransitions:[Ljava/lang/String;

    .line 784
    const/4 p1, 0x1

    if-eqz p3, :cond_1

    array-length p2, p3

    if-eqz p2, :cond_1

    move p2, p1

    goto :goto_0

    :cond_1
    move p2, v1

    :goto_0
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    iput-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mbSeparateAV:Ljava/lang/Boolean;

    .line 785
    iput v1, p0, Lcom/ss/android/vesdk/VEEditor;->mMasterTrackIndex:I

    .line 786
    iput v1, p0, Lcom/ss/android/vesdk/VEEditor;->mInPoint:I

    .line 787
    invoke-virtual {p0}, Lcom/ss/android/vesdk/VEEditor;->getDuration()I

    move-result p2

    iput p2, p0, Lcom/ss/android/vesdk/VEEditor;->mOutPoint:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 789
    :try_start_1
    invoke-static {}, Lcom/ss/android/vesdk/runtime/VERuntime;->getInstance()Lcom/ss/android/vesdk/runtime/VERuntime;

    move-result-object p2

    invoke-virtual {p2}, Lcom/ss/android/vesdk/runtime/VERuntime;->getEnv()Lcom/ss/android/vesdk/runtime/VEEnv;

    move-result-object p2

    invoke-virtual {p2}, Lcom/ss/android/vesdk/runtime/VEEnv;->getDetectModelsDir()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mModelsDir:Ljava/lang/String;

    .line 790
    iget-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    new-array v3, p1, [I

    aput v1, v3, v1

    const-string p2, "color filter"

    filled-new-array {p2}, [Ljava/lang/String;

    move-result-object v4

    new-array v5, p1, [I

    aput v1, v5, v1

    new-array v6, p1, [I

    iget p2, p0, Lcom/ss/android/vesdk/VEEditor;->mOutPoint:I

    aput p2, v6, v1

    new-array v7, p1, [I

    aput v1, v7, v1

    new-array v8, p1, [I

    const/4 p1, 0x7

    aput p1, v8, v1

    invoke-virtual/range {v2 .. v8}, Lcom/ss/android/ttve/nativePort/TEInterface;->addFilters([I[Ljava/lang/String;[I[I[I[I)[I

    move-result-object p1

    .line 793
    aget p1, p1, v1

    iput p1, p0, Lcom/ss/android/vesdk/VEEditor;->mColorFilterIndex:I
    :try_end_1
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 794
    :try_start_2
    monitor-exit p0

    return v0

    .line 795
    :catch_0
    move-exception p1

    .line 796
    new-instance p1, Lcom/ss/android/vesdk/VEException;

    const/4 p2, -0x1

    const-string p3, "init failed: VESDK need to be init"

    invoke-direct {p1, p2, p3}, Lcom/ss/android/vesdk/VEException;-><init>(ILjava/lang/String;)V

    throw p1

    .line 798
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public init2([Ljava/lang/String;[I[I[Ljava/lang/String;[Ljava/lang/String;[I[ILcom/ss/android/vesdk/VEEditor$VIDEO_RATIO;)I
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/VEException;
        }
    .end annotation

    move-object v1, p0

    move-object/from16 v0, p5

    .line 829
    monitor-enter p0

    .line 830
    :try_start_0
    const-string v2, "VEEditor"

    const-string v3, "init..."

    invoke-static {v2, v3}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 831
    iget-object v2, v1, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v3, 0x0

    move-object v10, v3

    check-cast v10, [[Ljava/lang/String;

    .line 833
    invoke-virtual/range {p8 .. p8}, Lcom/ss/android/vesdk/VEEditor$VIDEO_RATIO;->ordinal()I

    move-result v11

    .line 831
    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, v0

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p4

    invoke-virtual/range {v2 .. v11}, Lcom/ss/android/ttve/nativePort/TEInterface;->createScene2([Ljava/lang/String;[I[I[Ljava/lang/String;[I[I[Ljava/lang/String;[[Ljava/lang/String;I)I

    move-result v2

    .line 834
    if-eqz v2, :cond_0

    .line 835
    const-string v0, "VEEditor"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Create Scene failed, ret = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/ss/android/ttve/common/TELogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 836
    monitor-exit p0

    return v2

    .line 838
    :cond_0
    const/4 v3, 0x0

    iput-boolean v3, v1, Lcom/ss/android/vesdk/VEEditor;->mReverseDone:Z

    .line 839
    move-object/from16 v4, p8

    iput-object v4, v1, Lcom/ss/android/vesdk/VEEditor;->mVideoOutRes:Lcom/ss/android/vesdk/VEEditor$VIDEO_RATIO;

    .line 840
    iget-object v4, v1, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iput-object v0, v4, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mAudioPaths:[Ljava/lang/String;

    .line 841
    iget-object v4, v1, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    move-object v5, p1

    iput-object v5, v4, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mVideoPaths:[Ljava/lang/String;

    .line 842
    iget-object v4, v1, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    move-object/from16 v5, p4

    iput-object v5, v4, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mTransitions:[Ljava/lang/String;

    .line 844
    const/4 v4, 0x1

    if-eqz v0, :cond_1

    array-length v0, v0

    if-eqz v0, :cond_1

    move v0, v4

    goto :goto_0

    :cond_1
    move v0, v3

    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, v1, Lcom/ss/android/vesdk/VEEditor;->mbSeparateAV:Ljava/lang/Boolean;

    .line 845
    iput v3, v1, Lcom/ss/android/vesdk/VEEditor;->mMasterTrackIndex:I

    .line 846
    iput v3, v1, Lcom/ss/android/vesdk/VEEditor;->mInPoint:I

    .line 847
    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEEditor;->getDuration()I

    move-result v0

    iput v0, v1, Lcom/ss/android/vesdk/VEEditor;->mOutPoint:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 849
    :try_start_1
    invoke-static {}, Lcom/ss/android/vesdk/runtime/VERuntime;->getInstance()Lcom/ss/android/vesdk/runtime/VERuntime;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VERuntime;->getEnv()Lcom/ss/android/vesdk/runtime/VEEnv;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VEEnv;->getDetectModelsDir()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/ss/android/vesdk/VEEditor;->mModelsDir:Ljava/lang/String;

    .line 850
    iget-object v5, v1, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    new-array v6, v4, [I

    aput v3, v6, v3

    const-string v0, "color filter"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v7

    new-array v8, v4, [I

    aput v3, v8, v3

    new-array v9, v4, [I

    iget v0, v1, Lcom/ss/android/vesdk/VEEditor;->mOutPoint:I

    aput v0, v9, v3

    new-array v10, v4, [I

    aput v3, v10, v3

    new-array v11, v4, [I

    const/4 v0, 0x7

    aput v0, v11, v3

    invoke-virtual/range {v5 .. v11}, Lcom/ss/android/ttve/nativePort/TEInterface;->addFilters([I[Ljava/lang/String;[I[I[I[I)[I

    move-result-object v0

    .line 853
    aget v0, v0, v3

    iput v0, v1, Lcom/ss/android/vesdk/VEEditor;->mColorFilterIndex:I
    :try_end_1
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 854
    :try_start_2
    monitor-exit p0

    return v2

    .line 855
    :catch_0
    move-exception v0

    .line 856
    new-instance v0, Lcom/ss/android/vesdk/VEException;

    const/4 v2, -0x1

    const-string v3, "init failed: VESDK need to be init"

    invoke-direct {v0, v2, v3}, Lcom/ss/android/vesdk/VEException;-><init>(ILjava/lang/String;)V

    throw v0

    .line 858
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0
.end method

.method public invalidate()V
    .locals 8

    .line 730
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/high16 v1, -0x40800000    # -1.0f

    const/high16 v2, -0x40800000    # -1.0f

    const/high16 v3, -0x40800000    # -1.0f

    const/high16 v4, -0x40800000    # -1.0f

    const v5, -0x13880

    const v6, -0x13880

    const/4 v7, 0x1

    invoke-virtual/range {v0 .. v7}, Lcom/ss/android/ttve/nativePort/TEInterface;->setDisplayState(FFFFIIZ)V

    .line 731
    return-void
.end method

.method public onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 1

    .line 371
    const-string p1, "VEEditor"

    const-string v0, "onFrameAvailable..."

    invoke-static {p1, v0}, Lcom/ss/android/ttve/common/TELogUtil;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 372
    return-void
.end method

.method public pause()I
    .locals 2

    .line 1285
    const-string v0, "VEEditor"

    const-string v1, "pause..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1286
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->pause()I

    move-result v0

    return v0
.end method

.method public pauseSync()I
    .locals 2

    .line 1290
    const-string v0, "VEEditor"

    const-string v1, "pauseSync..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1291
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->pauseSync()I

    move-result v0

    return v0
.end method

.method public play()I
    .locals 2

    .line 1275
    const-string v0, "VEEditor"

    const-string v1, "play..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1276
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->start()I

    move-result v0

    return v0
.end method

.method public prepare()I
    .locals 4

    .line 992
    monitor-enter p0

    .line 993
    :try_start_0
    const-string v0, "VEEditor"

    const-string v1, "prepare..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 994
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mModelsDir:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 995
    const-string v0, ""

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mModelsDir:Ljava/lang/String;

    .line 996
    const-string v0, "VEEditor"

    const-string v1, "model dir is empty"

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 998
    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->getDuration()I

    move-result v1

    iget-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mModelsDir:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v1, v3, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->prepareEngine(IIILjava/lang/String;)I

    move-result v0

    .line 1000
    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->getInitResolution()[I

    move-result-object v1

    .line 1001
    iget-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mInitSize:Lcom/ss/android/vesdk/VESize;

    aget v3, v1, v3

    iput v3, v2, Lcom/ss/android/vesdk/VESize;->width:I

    .line 1002
    iget-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mInitSize:Lcom/ss/android/vesdk/VESize;

    const/4 v3, 0x1

    aget v1, v1, v3

    iput v1, v2, Lcom/ss/android/vesdk/VESize;->height:I

    .line 1005
    iget v1, p0, Lcom/ss/android/vesdk/VEEditor;->mBackGroundColor:I

    invoke-virtual {p0, v1}, Lcom/ss/android/vesdk/VEEditor;->setBackgroundColor(I)V

    .line 1006
    monitor-exit p0

    return v0

    .line 1007
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public removeInfoSticker(I)I
    .locals 3

    .line 1812
    const-string v0, "VEEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "removeInfoSticker... index: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1813
    if-gez p1, :cond_0

    .line 1814
    const/16 p1, -0x64

    return p1

    .line 1816
    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->removeInfoSticker(I)I

    move-result p1

    return p1
.end method

.method public removeSegmentVolume(I)I
    .locals 3

    .line 1601
    if-gez p1, :cond_0

    .line 1602
    const/16 p1, -0x64

    return p1

    .line 1605
    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v1, 0x1

    new-array v1, v1, [I

    const/4 v2, 0x0

    aput p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->removeFilter([I)I

    move-result p1

    return p1
.end method

.method public restore(Lcom/ss/android/vesdk/VEEditorModel;)Z
    .locals 5
    .param p1    # Lcom/ss/android/vesdk/VEEditorModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 945
    iget-object v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->projectXML:Ljava/lang/String;

    .line 946
    invoke-static {v0}, Lcom/ss/android/vesdk/VEEditor;->checkFileExists(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 947
    const-string p1, "VEEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "projectXML not exists: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/ss/android/ttve/common/TELogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 948
    return v2

    .line 951
    :cond_0
    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v1, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->restore(Ljava/lang/String;)I

    move-result v1

    .line 952
    if-gez v1, :cond_1

    .line 953
    const-string p1, "VEEditor"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "video editor restore failed: result: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", project xml: "

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/ss/android/ttve/common/TELogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 954
    return v2

    .line 957
    :cond_1
    iget v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->inPoint:I

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mInPoint:I

    .line 958
    iget v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->outputPoint:I

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mOutPoint:I

    .line 959
    iget-boolean v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->reverseDone:Z

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mReverseDone:Z

    .line 960
    iget-object v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->videoOutRes:Lcom/ss/android/vesdk/VEEditor$VIDEO_RATIO;

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoOutRes:Lcom/ss/android/vesdk/VEEditor$VIDEO_RATIO;

    .line 961
    iget-boolean v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->separateAV:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mbSeparateAV:Ljava/lang/Boolean;

    .line 962
    iget v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->masterTrackIndex:I

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mMasterTrackIndex:I

    .line 963
    iget v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->audioEffectFilterIndex:I

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mAudioEffectfilterIndex:I

    .line 964
    iget-object v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->modelDir:Ljava/lang/String;

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mModelsDir:Ljava/lang/String;

    .line 965
    iget v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->colorFilterIndex:I

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mColorFilterIndex:I

    .line 966
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iget-object v1, p1, Lcom/ss/android/vesdk/VEEditorModel;->videoPaths:[Ljava/lang/String;

    iput-object v1, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mVideoPaths:[Ljava/lang/String;

    .line 967
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iget-object v1, p1, Lcom/ss/android/vesdk/VEEditorModel;->audioPaths:[Ljava/lang/String;

    iput-object v1, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mAudioPaths:[Ljava/lang/String;

    .line 968
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iget-object v1, p1, Lcom/ss/android/vesdk/VEEditorModel;->transitions:[Ljava/lang/String;

    iput-object v1, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mTransitions:[Ljava/lang/String;

    .line 969
    iget v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->backgroundColor:I

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mBackGroundColor:I

    .line 970
    iget-object v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->outputFile:Ljava/lang/String;

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mOutputFile:Ljava/lang/String;

    .line 971
    iget-object v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->watermarkFile:Ljava/lang/String;

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkFile:Ljava/lang/String;

    .line 972
    iget-wide v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->watermarkWidth:D

    iput-wide v0, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkWidth:D

    .line 973
    iget-wide v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->watermarkHeight:D

    iput-wide v0, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkHeight:D

    .line 974
    iget-wide v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->watermarkOffsetX:D

    iput-wide v0, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkOffsetX:D

    .line 975
    iget-wide v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->watermarkOffsetY:D

    iput-wide v0, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkOffsetY:D

    .line 977
    iget-object v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->colorFilterRightPath:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 978
    iget-object v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->colorFilterLeftPath:Ljava/lang/String;

    iget p1, p1, Lcom/ss/android/vesdk/VEEditorModel;->colorFilterIntensity:F

    invoke-virtual {p0, v0, p1}, Lcom/ss/android/vesdk/VEEditor;->setColorFilter(Ljava/lang/String;F)I

    goto :goto_0

    .line 980
    :cond_2
    iget-object v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->colorFilterLeftPath:Ljava/lang/String;

    iget-object v1, p1, Lcom/ss/android/vesdk/VEEditorModel;->colorFilterRightPath:Ljava/lang/String;

    iget v2, p1, Lcom/ss/android/vesdk/VEEditorModel;->colorFilterPosition:F

    iget p1, p1, Lcom/ss/android/vesdk/VEEditorModel;->colorFilterIntensity:F

    invoke-virtual {p0, v0, v1, v2, p1}, Lcom/ss/android/vesdk/VEEditor;->setColorFilter(Ljava/lang/String;Ljava/lang/String;FF)I

    .line 982
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method public save()Lcom/ss/android/vesdk/VEEditorModel;
    .locals 4
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 908
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->save()Ljava/lang/String;

    move-result-object v0

    .line 909
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-static {v0}, Lcom/ss/android/vesdk/VEEditor;->checkFileExists(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    goto/16 :goto_0

    .line 913
    :cond_0
    new-instance v1, Lcom/ss/android/vesdk/VEEditorModel;

    invoke-direct {v1}, Lcom/ss/android/vesdk/VEEditorModel;-><init>()V

    .line 914
    iput-object v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->projectXML:Ljava/lang/String;

    .line 915
    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mInPoint:I

    iput v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->inPoint:I

    .line 916
    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mOutPoint:I

    iput v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->outputPoint:I

    .line 917
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mReverseDone:Z

    iput-boolean v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->reverseDone:Z

    .line 918
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoOutRes:Lcom/ss/android/vesdk/VEEditor$VIDEO_RATIO;

    iput-object v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->videoOutRes:Lcom/ss/android/vesdk/VEEditor$VIDEO_RATIO;

    .line 919
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mbSeparateAV:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->separateAV:Z

    .line 920
    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mMasterTrackIndex:I

    iput v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->masterTrackIndex:I

    .line 921
    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mAudioEffectfilterIndex:I

    iput v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->audioEffectFilterIndex:I

    .line 922
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mModelsDir:Ljava/lang/String;

    iput-object v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->modelDir:Ljava/lang/String;

    .line 923
    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mColorFilterIndex:I

    iput v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->colorFilterIndex:I

    .line 924
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iget-object v0, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mVideoPaths:[Ljava/lang/String;

    iput-object v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->videoPaths:[Ljava/lang/String;

    .line 925
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iget-object v0, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mAudioPaths:[Ljava/lang/String;

    iput-object v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->audioPaths:[Ljava/lang/String;

    .line 926
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iget-object v0, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mTransitions:[Ljava/lang/String;

    iput-object v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->transitions:[Ljava/lang/String;

    .line 927
    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mBackGroundColor:I

    iput v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->backgroundColor:I

    .line 928
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mOutputFile:Ljava/lang/String;

    iput-object v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->outputFile:Ljava/lang/String;

    .line 929
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkFile:Ljava/lang/String;

    iput-object v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->watermarkFile:Ljava/lang/String;

    .line 930
    iget-wide v2, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkWidth:D

    iput-wide v2, v1, Lcom/ss/android/vesdk/VEEditorModel;->watermarkWidth:D

    .line 931
    iget-wide v2, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkHeight:D

    iput-wide v2, v1, Lcom/ss/android/vesdk/VEEditorModel;->watermarkHeight:D

    .line 932
    iget-wide v2, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkOffsetX:D

    iput-wide v2, v1, Lcom/ss/android/vesdk/VEEditorModel;->watermarkOffsetX:D

    .line 933
    iget-wide v2, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkOffsetY:D

    iput-wide v2, v1, Lcom/ss/android/vesdk/VEEditorModel;->watermarkOffsetY:D

    .line 935
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    if-eqz v0, :cond_1

    .line 936
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    invoke-virtual {v0}, Lcom/ss/android/ttve/model/FilterBean;->getLeftResPath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->colorFilterLeftPath:Ljava/lang/String;

    .line 937
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    invoke-virtual {v0}, Lcom/ss/android/ttve/model/FilterBean;->getRightResPath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->colorFilterRightPath:Ljava/lang/String;

    .line 938
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    invoke-virtual {v0}, Lcom/ss/android/ttve/model/FilterBean;->getPosition()F

    move-result v0

    iput v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->colorFilterPosition:F

    .line 939
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    invoke-virtual {v0}, Lcom/ss/android/ttve/model/FilterBean;->getIntensity()F

    move-result v0

    iput v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->colorFilterIntensity:F

    .line 941
    :cond_1
    return-object v1

    .line 910
    :cond_2
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public seek(ILcom/ss/android/vesdk/VEEditor$SEEK_MODE;)I
    .locals 3

    .line 1320
    const-string v0, "VEEditor"

    const-string v1, "seek..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1321
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget v1, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceWidth:I

    iget v2, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceHeight:I

    invoke-virtual {p2}, Lcom/ss/android/vesdk/VEEditor$SEEK_MODE;->ordinal()I

    move-result p2

    invoke-virtual {v0, p1, v1, v2, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->seek(IIII)I

    move-result p1

    return p1
.end method

.method public setBackgroundColor(I)V
    .locals 4

    .line 653
    iput p1, p0, Lcom/ss/android/vesdk/VEEditor;->mBackGroundColor:I

    .line 654
    shr-int/lit8 v0, p1, 0x10

    and-int/lit16 v0, v0, 0xff

    int-to-float v0, v0

    const/high16 v1, 0x437f0000    # 255.0f

    div-float/2addr v0, v1

    .line 655
    shr-int/lit8 v2, p1, 0x8

    and-int/lit16 v2, v2, 0xff

    int-to-float v2, v2

    div-float/2addr v2, v1

    .line 656
    and-int/lit16 v3, p1, 0xff

    int-to-float v3, v3

    div-float/2addr v3, v1

    .line 657
    shr-int/lit8 p1, p1, 0x18

    and-int/lit16 p1, p1, 0xff

    int-to-float p1, p1

    div-float/2addr p1, v1

    .line 659
    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v1, v0, v2, v3, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setBackGroundColor(FFFF)V

    .line 660
    return-void
.end method

.method public setColorFilter(Ljava/lang/String;F)I
    .locals 6

    .line 2024
    monitor-enter p0

    .line 2025
    :try_start_0
    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mColorFilterIndex:I

    if-gez v0, :cond_0

    .line 2026
    const/16 p1, -0x69

    monitor-exit p0

    return p1

    .line 2028
    :cond_0
    const/4 v0, 0x0

    cmpg-float v0, p2, v0

    if-ltz v0, :cond_6

    if-nez p1, :cond_1

    goto/16 :goto_0

    .line 2031
    :cond_1
    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v1, p2, v0

    if-lez v1, :cond_2

    .line 2032
    move p2, v0

    :cond_2
    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    if-nez v1, :cond_3

    .line 2033
    new-instance v1, Lcom/ss/android/ttve/model/FilterBean;

    invoke-direct {v1}, Lcom/ss/android/ttve/model/FilterBean;-><init>()V

    iput-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    .line 2035
    :cond_3
    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    invoke-virtual {v1}, Lcom/ss/android/ttve/model/FilterBean;->getLeftResPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    .line 2036
    invoke-virtual {v1}, Lcom/ss/android/ttve/model/FilterBean;->getRightResPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_4

    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    .line 2037
    invoke-virtual {v1}, Lcom/ss/android/ttve/model/FilterBean;->getIntensity()F

    move-result v1

    cmpl-float v1, v1, p2

    if-nez v1, :cond_4

    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    .line 2038
    invoke-virtual {v1}, Lcom/ss/android/ttve/model/FilterBean;->getPosition()F

    move-result v1

    cmpl-float v1, v1, v0

    if-nez v1, :cond_4

    .line 2039
    monitor-exit p0

    return v2

    .line 2042
    :cond_4
    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    invoke-virtual {v1, p1}, Lcom/ss/android/ttve/model/FilterBean;->setLeftResPath(Ljava/lang/String;)V

    .line 2043
    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    const-string v3, ""

    invoke-virtual {v1, v3}, Lcom/ss/android/ttve/model/FilterBean;->setRightResPath(Ljava/lang/String;)V

    .line 2044
    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    invoke-virtual {v1, v0}, Lcom/ss/android/ttve/model/FilterBean;->setPosition(F)V

    .line 2045
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    invoke-virtual {v0, p2}, Lcom/ss/android/ttve/model/FilterBean;->setIntensity(F)V

    .line 2046
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget v1, p0, Lcom/ss/android/vesdk/VEEditor;->mColorFilterIndex:I

    const-string v3, "left filter"

    invoke-virtual {v0, v1, v3, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 2047
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget v1, p0, Lcom/ss/android/vesdk/VEEditor;->mColorFilterIndex:I

    const-string v3, "filter intensity"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, v1, v3, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 2048
    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mColorFilterIndex:I

    const-string v1, "right filter"

    const-string v3, ""

    invoke-virtual {p2, v0, v1, v3}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 2049
    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mColorFilterIndex:I

    const-string v1, "filter position"

    const-string v3, "1.0"

    invoke-virtual {p2, v0, v1, v3}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 2051
    new-instance p2, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    invoke-direct {p2}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;-><init>()V

    .line 2052
    const-string v0, ""

    .line 2053
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v3, 0x1

    if-nez v1, :cond_5

    .line 2054
    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    .line 2055
    array-length v1, p1

    if-lez v1, :cond_5

    .line 2056
    array-length v0, p1

    sub-int/2addr v0, v3

    aget-object v0, p1, v0

    .line 2059
    :cond_5
    const-string p1, "iesve_veeditor_set_filter_click_filter_id"

    invoke-virtual {p2, p1, v0}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    .line 2060
    const-string p1, "iesve_veeditor_set_filter_click"

    invoke-static {p1, v3, p2}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    .line 2062
    monitor-exit p0

    return v2

    .line 2029
    :cond_6
    :goto_0
    const/16 p1, -0x64

    monitor-exit p0

    return p1

    .line 2063
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public setColorFilter(Ljava/lang/String;Ljava/lang/String;FF)I
    .locals 6

    .line 2077
    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mColorFilterIndex:I

    if-gez v0, :cond_0

    .line 2078
    const/16 p1, -0x69

    return p1

    .line 2080
    :cond_0
    const/4 v0, 0x0

    cmpg-float v1, p4, v0

    if-ltz v1, :cond_8

    cmpg-float v0, p3, v0

    if-ltz v0, :cond_8

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_8

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto/16 :goto_0

    .line 2083
    :cond_1
    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v1, p4, v0

    if-lez v1, :cond_2

    .line 2084
    move p4, v0

    :cond_2
    cmpl-float v1, p3, v0

    if-lez v1, :cond_3

    .line 2086
    move p3, v0

    :cond_3
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    if-nez v0, :cond_4

    .line 2087
    new-instance v0, Lcom/ss/android/ttve/model/FilterBean;

    invoke-direct {v0}, Lcom/ss/android/ttve/model/FilterBean;-><init>()V

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    .line 2089
    :cond_4
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    invoke-virtual {v0}, Lcom/ss/android/ttve/model/FilterBean;->getLeftResPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    .line 2090
    invoke-virtual {v0}, Lcom/ss/android/ttve/model/FilterBean;->getRightResPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    .line 2091
    invoke-virtual {v0}, Lcom/ss/android/ttve/model/FilterBean;->getIntensity()F

    move-result v0

    cmpl-float v0, v0, p4

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    .line 2092
    invoke-virtual {v0}, Lcom/ss/android/ttve/model/FilterBean;->getPosition()F

    move-result v0

    cmpl-float v0, v0, p3

    if-nez v0, :cond_5

    .line 2093
    return v1

    .line 2096
    :cond_5
    const-string v0, "VEEditor"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "leftFilterPath: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\nrightFilterPath: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " position: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, " intensity: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/ss/android/ttve/common/TELogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2097
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget v2, p0, Lcom/ss/android/vesdk/VEEditor;->mColorFilterIndex:I

    const-string v3, "left filter"

    invoke-virtual {v0, v2, v3, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 2098
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget v2, p0, Lcom/ss/android/vesdk/VEEditor;->mColorFilterIndex:I

    const-string v3, "filter intensity"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {v0, v2, v3, p4}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 2099
    iget-object p4, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mColorFilterIndex:I

    const-string v2, "right filter"

    invoke-virtual {p4, v0, v2, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 2100
    iget-object p4, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mColorFilterIndex:I

    const-string v2, "filter position"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p4, v0, v2, p3}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    .line 2102
    new-instance p3, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    invoke-direct {p3}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;-><init>()V

    .line 2103
    const-string p4, ""

    .line 2104
    const-string v0, ""

    .line 2105
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    const/4 v3, 0x1

    if-nez v2, :cond_6

    .line 2106
    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    .line 2107
    array-length v2, p1

    if-lez v2, :cond_6

    .line 2108
    array-length p4, p1

    sub-int/2addr p4, v3

    aget-object p4, p1, p4

    .line 2111
    :cond_6
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_7

    .line 2112
    sget-object p1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {p2, p1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    .line 2113
    array-length p2, p1

    if-lez p2, :cond_7

    .line 2114
    array-length p2, p1

    sub-int/2addr p2, v3

    aget-object v0, p1, p2

    .line 2117
    :cond_7
    const-string p1, "iesve_veeditor_set_filter_slide_left_id"

    invoke-virtual {p3, p1, p4}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    .line 2118
    const-string p1, "iesve_veeditor_set_filter_slide_right_id"

    invoke-virtual {p3, p1, v0}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    .line 2119
    const-string p1, "iesve_veeditor_set_filter_slide"

    invoke-static {p1, v3, p3}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    .line 2121
    return v1

    .line 2081
    :cond_8
    :goto_0
    const/16 p1, -0x64

    return p1
.end method

.method public setCrop(IIII)V
    .locals 3

    .line 1032
    new-instance v0, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    invoke-direct {v0}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;-><init>()V

    .line 1033
    const-string v1, "iesve_veeditor_cut_scale"

    div-int v2, p4, p3

    invoke-virtual {v0, v1, v2}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;I)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    .line 1034
    const-string v1, "iesve_veeditor_cut_scale"

    const/4 v2, 0x1

    invoke-static {v1, v2, v0}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    .line 1036
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/ss/android/ttve/nativePort/TEInterface;->setCrop(IIII)V

    .line 1037
    return-void
.end method

.method public setDisplayPos(IIII)V
    .locals 8

    .line 576
    const-string v0, "VEEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setDisplayPos... "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 577
    int-to-float v0, p3

    iget v1, p0, Lcom/ss/android/vesdk/VEEditor;->mInitDisplayWidth:I

    int-to-float v1, v1

    div-float v3, v0, v1

    .line 578
    int-to-float v0, p4

    iget v1, p0, Lcom/ss/android/vesdk/VEEditor;->mInitDisplayHeight:I

    int-to-float v1, v1

    div-float v4, v0, v1

    .line 579
    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceWidth:I

    div-int/lit8 v0, v0, 0x2

    div-int/lit8 p3, p3, 0x2

    sub-int/2addr v0, p3

    sub-int/2addr v0, p1

    neg-int v6, v0

    .line 580
    iget p1, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceHeight:I

    div-int/lit8 p1, p1, 0x2

    div-int/lit8 p4, p4, 0x2

    sub-int/2addr p1, p4

    sub-int v7, p1, p2

    .line 582
    const/4 v5, 0x0

    move-object v2, p0

    invoke-virtual/range {v2 .. v7}, Lcom/ss/android/vesdk/VEEditor;->setDisplayState(FFFII)V

    .line 583
    return-void
.end method

.method public setDisplayState(FFFII)V
    .locals 10

    .line 613
    new-instance v0, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    invoke-direct {v0}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;-><init>()V

    .line 614
    const-string v1, "iesve_veeditor_video_scale_width"

    invoke-virtual {v0, v1, p1}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;F)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    move-result-object v1

    const-string v2, "iesve_veeditor_video_scale_heigh"

    .line 615
    invoke-virtual {v1, v2, p2}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;F)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    .line 616
    const-string v1, "iesve_veeditor_video_scale"

    const/4 v2, 0x1

    invoke-static {v1, v2, v0}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    .line 618
    const-string v0, "VEEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setDisplayState... "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 619
    iget-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v6, 0x0

    const/4 v9, 0x0

    move v3, p1

    move v4, p2

    move v5, p3

    move v7, p4

    move v8, p5

    invoke-virtual/range {v2 .. v9}, Lcom/ss/android/ttve/nativePort/TEInterface;->setDisplayState(FFFFIIZ)V

    .line 620
    return-void
.end method

.method public setExpandLastFrame(Z)V
    .locals 1

    .line 807
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setExpandLastFrame(Z)V

    .line 808
    return-void
.end method

.method public setInOut(II)I
    .locals 3

    .line 743
    monitor-enter p0

    .line 744
    :try_start_0
    new-instance v0, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    invoke-direct {v0}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;-><init>()V

    .line 745
    const-string v1, "iesve_veeditor_cut_duration"

    sub-int v2, p2, p1

    invoke-virtual {v0, v1, v2}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;I)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    .line 746
    const-string v1, "iesve_veeditor_cut_duration"

    const/4 v2, 0x1

    invoke-static {v1, v2, v0}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    .line 748
    const-string v0, "VEEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setInOut... "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 749
    iput p1, p0, Lcom/ss/android/vesdk/VEEditor;->mInPoint:I

    .line 750
    iput p2, p0, Lcom/ss/android/vesdk/VEEditor;->mOutPoint:I

    .line 752
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->stop()I

    .line 753
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mModelsDir:Ljava/lang/String;

    invoke-virtual {v0, p1, p2, v1, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->prepareEngine(IIILjava/lang/String;)I

    move-result p1

    monitor-exit p0

    return p1

    .line 754
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public setInfoStickerAlpha(IF)I
    .locals 3

    .line 1777
    const-string v0, "VEEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setInfoStickerAlpha... index: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "alpha: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1778
    if-gez p1, :cond_0

    .line 1779
    const/16 p1, -0x64

    return p1

    .line 1781
    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string v1, "entity alpha"

    invoke-static {p2}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p1, v1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public setInfoStickerEditMode(Z)I
    .locals 0

    .line 1846
    const/4 p1, -0x1

    return p1
.end method

.method public setInfoStickerLayer(II)I
    .locals 3

    .line 1794
    const-string v0, "VEEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setInfoStickerLayer... index: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "layer: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1796
    if-gez p1, :cond_0

    .line 1797
    const/16 p1, -0x64

    return p1

    .line 1799
    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string v1, "entity layer"

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p1, v1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public setInfoStickerPosition(IFF)I
    .locals 3

    .line 1697
    const-string v0, "VEEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setInfoStickerPosition... index: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "offsetX: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, "offsetY: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1699
    if-gez p1, :cond_0

    .line 1700
    const/16 p1, -0x64

    return p1

    .line 1703
    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string v1, "entity position x"

    invoke-static {p2}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p1, v1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    move-result p2

    .line 1704
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string v1, "entity position y"

    invoke-static {p3}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v0, p1, v1, p3}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    move-result p1

    add-int/2addr p2, p1

    .line 1706
    return p2
.end method

.method public setInfoStickerRotation(IF)I
    .locals 3

    .line 1719
    const-string v0, "VEEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setInfoStickerRotation... index: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "degree: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1720
    if-gez p1, :cond_0

    .line 1721
    const/16 p1, -0x64

    return p1

    .line 1723
    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string v1, "entity rotation"

    invoke-static {p2}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p1, v1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public setInfoStickerScale(IF)I
    .locals 3

    .line 1758
    const-string v0, "VEEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setInfoStickerScale... index: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "scale: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1759
    if-gez p1, :cond_0

    .line 1760
    const/16 p1, -0x64

    return p1

    .line 1762
    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string v1, "entity scale x"

    invoke-static {p2}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, p1, v1, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 1763
    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string v2, "entity scale y"

    invoke-static {p2}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, p1, v2, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    move-result p1

    add-int/2addr v0, p1

    .line 1764
    return v0
.end method

.method public setInfoStickerTime(III)I
    .locals 3

    .line 1737
    const-string v0, "VEEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setInfoStickerTime... index: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "startTime: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "endTime: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1739
    if-gez p1, :cond_0

    .line 1740
    const/16 p1, -0x64

    return p1

    .line 1743
    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string v1, "entity start time"

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p1, v1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    move-result p2

    .line 1744
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string v1, "entity end time"

    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v0, p1, v1, p3}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    move-result p1

    add-int/2addr p2, p1

    .line 1745
    return p2
.end method

.method public setLoopPlay(Z)V
    .locals 2

    .line 1017
    const-string v0, "VEEditor"

    const-string v1, "setLoopPlay"

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1018
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setLooping(Z)V

    .line 1019
    return-void
.end method

.method public setOnErrorListener(Lcom/ss/android/vesdk/VECommonCallback;)V
    .locals 5
    .param p1    # Lcom/ss/android/vesdk/VECommonCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 509
    new-instance v0, Lcom/ss/android/vesdk/VEEditor$4;

    invoke-direct {v0, p0, p1}, Lcom/ss/android/vesdk/VEEditor$4;-><init>(Lcom/ss/android/vesdk/VEEditor;Lcom/ss/android/vesdk/VECommonCallback;)V

    .line 516
    const-string p1, "VEEditor"

    const-string v1, "setOnErrorListener..."

    invoke-static {p1, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 517
    monitor-enter p0

    .line 518
    :try_start_0
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->getNativeHandler()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long p1, v1, v3

    if-nez p1, :cond_0

    .line 519
    monitor-exit p0

    return-void

    .line 520
    :cond_0
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p1, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->setErrorListener(Lcom/ss/android/ttve/common/TECommonCallback;)V

    .line 521
    monitor-exit p0

    .line 522
    return-void

    .line 521
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public setOnInfoListener(Lcom/ss/android/vesdk/VECommonCallback;)V
    .locals 5
    .param p1    # Lcom/ss/android/vesdk/VECommonCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 531
    new-instance v0, Lcom/ss/android/vesdk/VEEditor$5;

    invoke-direct {v0, p0, p1}, Lcom/ss/android/vesdk/VEEditor$5;-><init>(Lcom/ss/android/vesdk/VEEditor;Lcom/ss/android/vesdk/VECommonCallback;)V

    .line 554
    const-string p1, "VEEditor"

    const-string v1, "setOnInfoListener..."

    invoke-static {p1, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 555
    monitor-enter p0

    .line 556
    :try_start_0
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->getNativeHandler()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long p1, v1, v3

    if-nez p1, :cond_0

    .line 557
    monitor-exit p0

    return-void

    .line 558
    :cond_0
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p1, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->setInfoListener(Lcom/ss/android/ttve/common/TECommonCallback;)V

    .line 559
    monitor-exit p0

    .line 560
    return-void

    .line 559
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public setReverseVideoPaths([Ljava/lang/String;)I
    .locals 1

    .line 1242
    if-eqz p1, :cond_2

    array-length v0, p1

    if-gtz v0, :cond_0

    goto :goto_0

    .line 1246
    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    if-eqz v0, :cond_1

    .line 1247
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iput-object p1, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mReverseVideoPath:[Ljava/lang/String;

    .line 1248
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/ss/android/vesdk/VEEditor;->mReverseDone:Z

    .line 1250
    :cond_1
    const/16 p1, -0x69

    return p1

    .line 1243
    :cond_2
    :goto_0
    const/16 p1, -0x64

    return p1
.end method

.method public setScaleMode(Lcom/ss/android/vesdk/VEEditor$SCALE_MODE;)I
    .locals 2

    .line 1304
    const-string v0, "VEEditor"

    const-string v1, "setScaleMode..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1305
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p1}, Lcom/ss/android/vesdk/VEEditor$SCALE_MODE;->ordinal()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setScaleMode(I)V

    .line 1306
    const/4 p1, 0x0

    return p1
.end method

.method public setSpeedRatio(F)I
    .locals 1

    .line 2372
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setSpeedRatio(F)V

    .line 2373
    const/4 p1, 0x0

    return p1
.end method

.method public setSpeedRatioAndUpdate(F)I
    .locals 4

    .line 2383
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->stop()I

    .line 2384
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setSpeedRatio(F)V

    .line 2385
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->createTimeline()I

    .line 2386
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mInPoint:I

    iget v1, p0, Lcom/ss/android/vesdk/VEEditor;->mOutPoint:I

    iget-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mModelsDir:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-virtual {p1, v0, v1, v3, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->prepareEngine(IIILjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public setStickerAnimator(ILcom/ss/android/vesdk/VEStickerAnimator;)I
    .locals 2
    .param p2    # Lcom/ss/android/vesdk/VEStickerAnimator;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 1652
    const-string v0, "VEEditor"

    const-string v1, "addAnimator..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1653
    if-ltz p1, :cond_2

    if-nez p2, :cond_0

    goto :goto_0

    .line 1657
    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->getStickerFilterIndex(I)I

    move-result p1

    .line 1658
    if-gez p1, :cond_1

    .line 1659
    return p1

    .line 1662
    :cond_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string v1, "animator"

    invoke-virtual {v0, p1, v1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Lcom/ss/android/vesdk/VEStickerAnimator;)I

    move-result p1

    return p1

    .line 1654
    :cond_2
    :goto_0
    const/16 p1, -0x64

    return p1
.end method

.method public setUseLargeMattingModel(Z)V
    .locals 1

    .line 2277
    monitor-enter p0

    .line 2278
    :try_start_0
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setUseLargeMattingModel(Z)V

    .line 2279
    monitor-exit p0

    .line 2280
    return-void

    .line 2279
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public setVolume(IIF)Z
    .locals 2

    .line 1618
    monitor-enter p0

    .line 1619
    :try_start_0
    const-string v0, "VEEditor"

    const-string v1, "setVolume..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1620
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p2, p1, p3}, Lcom/ss/android/ttve/nativePort/TEInterface;->setTrackVolume(IIF)Z

    move-result p1

    monitor-exit p0

    return p1

    .line 1621
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public testSerialization()Z
    .locals 1

    .line 2908
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->testSerialization()Z

    move-result v0

    return v0
.end method

.method public updateAudioTrack(IIIIIZ)I
    .locals 7

    .line 1474
    monitor-enter p0

    .line 1475
    :try_start_0
    const-string v0, "VEEditor"

    const-string v1, "updateAudioTrack..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1476
    const/16 v0, -0x64

    if-gez p1, :cond_0

    .line 1477
    monitor-exit p0

    return v0

    .line 1479
    :cond_0
    if-le p3, p2, :cond_4

    if-gez p2, :cond_1

    goto :goto_1

    .line 1483
    :cond_1
    if-le p5, p4, :cond_3

    if-gez p4, :cond_2

    goto :goto_0

    .line 1487
    :cond_2
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    move v1, p1

    move v2, p4

    move v3, p5

    move v4, p2

    move v5, p3

    move v6, p6

    invoke-virtual/range {v0 .. v6}, Lcom/ss/android/ttve/nativePort/TEInterface;->updateAudioTrack(IIIIIZ)I

    move-result p1

    monitor-exit p0

    return p1

    .line 1484
    :cond_3
    :goto_0
    monitor-exit p0

    return v0

    .line 1480
    :cond_4
    :goto_1
    monitor-exit p0

    return v0

    .line 1488
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public updateAudioTrack(IIIIIZII)I
    .locals 11

    move-object v1, p0

    move v0, p2

    move v4, p4

    move/from16 v9, p7

    .line 1507
    monitor-enter p0

    .line 1508
    :try_start_0
    const-string v2, "VEEditor"

    const-string v3, "updateAudioTrack..."

    invoke-static {v2, v3}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1509
    const/16 v2, -0x64

    if-gez p1, :cond_0

    .line 1510
    monitor-exit p0

    return v2

    .line 1512
    :cond_0
    move v7, p3

    if-le v7, v0, :cond_6

    if-gez v0, :cond_1

    goto :goto_2

    .line 1516
    :cond_1
    move/from16 v5, p5

    if-le v5, v4, :cond_5

    if-gez v4, :cond_2

    goto :goto_1

    .line 1520
    :cond_2
    move/from16 v10, p8

    if-le v10, v9, :cond_4

    if-gez v9, :cond_3

    goto :goto_0

    .line 1524
    :cond_3
    iget-object v2, v1, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    move v3, p1

    move v6, v0

    move/from16 v8, p6

    invoke-virtual/range {v2 .. v10}, Lcom/ss/android/ttve/nativePort/TEInterface;->updateAudioTrack(IIIIIZII)I

    move-result v0

    monitor-exit p0

    return v0

    .line 1521
    :cond_4
    :goto_0
    monitor-exit p0

    return v2

    .line 1517
    :cond_5
    :goto_1
    monitor-exit p0

    return v2

    .line 1513
    :cond_6
    :goto_2
    monitor-exit p0

    return v2

    .line 1525
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public updateAudioTrack(IIIZ)I
    .locals 7

    .line 1447
    monitor-enter p0

    .line 1448
    :try_start_0
    const-string v0, "VEEditor"

    const-string v1, "updateAudioTrack..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1449
    const/16 v0, -0x64

    if-gez p1, :cond_0

    .line 1450
    monitor-exit p0

    return v0

    .line 1452
    :cond_0
    if-le p3, p2, :cond_2

    if-gez p2, :cond_1

    goto :goto_0

    .line 1456
    :cond_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v2, 0x0

    sub-int v3, p3, p2

    move v1, p1

    move v4, p2

    move v5, p3

    move v6, p4

    invoke-virtual/range {v0 .. v6}, Lcom/ss/android/ttve/nativePort/TEInterface;->updateAudioTrack(IIIIIZ)I

    move-result p1

    monitor-exit p0

    return p1

    .line 1453
    :cond_2
    :goto_0
    monitor-exit p0

    return v0

    .line 1457
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public updatePreViewResolution(IIII)V
    .locals 1

    .line 2012
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/ss/android/ttve/nativePort/TEInterface;->updateResolution(IIII)V

    .line 2013
    return-void
.end method

.method public updateSegmentVolume(IF)I
    .locals 4

    .line 1585
    if-gez p1, :cond_0

    .line 1586
    const/16 p1, -0x64

    return p1

    .line 1588
    :cond_0
    const/4 v0, 0x0

    cmpg-float v1, p2, v0

    if-gez v1, :cond_1

    .line 1589
    move p2, v0

    :cond_1
    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v1, p2, v0

    if-lez v1, :cond_2

    .line 1590
    move p2, v0

    :cond_2
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string v1, "audio volume"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p1, v1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    move-result p1

    return p1
.end method
