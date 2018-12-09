.class public Lcom/ss/android/vesdk/VECameraSettings;
.super Ljava/lang/Object;
.source "VECameraSettings.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/vesdk/VECameraSettings$Builder;,
        Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;,
        Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;,
        Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/ss/android/vesdk/VECameraSettings;",
            ">;"
        }
    .end annotation
.end field

.field public static final OPTION_FLAG_DEFAULT:B = 0x1t

.field public static final OPTION_FLAG_FPS_RANGE:B = 0x2t

.field public static final OPTION_FLAG_PICTURE_SIZE:B = 0x1t

.field public static final SCENE_MODE_ACTION:Ljava/lang/String; = "action"

.field public static final SCENE_MODE_AUTO:Ljava/lang/String; = "auto"

.field public static final SCENE_MODE_BARCODE:Ljava/lang/String; = "barcode"

.field public static final SCENE_MODE_BEACH:Ljava/lang/String; = "beach"

.field public static final SCENE_MODE_CANDLELIGHT:Ljava/lang/String; = "candlelight"

.field public static final SCENE_MODE_FIREWORKS:Ljava/lang/String; = "fireworks"

.field public static final SCENE_MODE_HDR:Ljava/lang/String; = "hdr"

.field public static final SCENE_MODE_LANDSCAPE:Ljava/lang/String; = "landscape"

.field public static final SCENE_MODE_NIGHT:Ljava/lang/String; = "night"

.field public static final SCENE_MODE_NIGHT_PORTRAIT:Ljava/lang/String; = "night-portrait"

.field public static final SCENE_MODE_PARTY:Ljava/lang/String; = "party"

.field public static final SCENE_MODE_PORTRAIT:Ljava/lang/String; = "portrait"

.field public static final SCENE_MODE_SNOW:Ljava/lang/String; = "snow"

.field public static final SCENE_MODE_SPORTS:Ljava/lang/String; = "sports"

.field public static final SCENE_MODE_STEADYPHOTO:Ljava/lang/String; = "steadyphoto"

.field public static final SCENE_MODE_SUNSET:Ljava/lang/String; = "sunset"

.field public static final SCENE_MODE_THEATRE:Ljava/lang/String; = "theatre"

.field public static final sCameraSceneMode:[Ljava/lang/String;


# instance fields
.field CameraHWLevelAndroid2TE:[I

.field CameraHWLevelTE2Android:[I

.field private mCameraFacing:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;

.field private mCameraType:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

.field private mFps:I

.field private mFpsRange:[I

.field private mHwLevel:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

.field private mIsUseCloudConfig:Z

.field private mOptionFlags:B

.field private mPreviewSize:Lcom/ss/android/vesdk/VESize;

.field private mSceneMode:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 17

    .line 157
    const-string v0, "auto"

    const-string v1, "action"

    const-string v2, "barcode"

    const-string v3, "beach"

    const-string v4, "candlelight"

    const-string v5, "fireworks"

    const-string v6, "hdr"

    const-string v7, "landscape"

    const-string v8, "night"

    const-string v9, "night-portrait"

    const-string v10, "party"

    const-string v11, "portrait"

    const-string v12, "snow"

    const-string v13, "sports"

    const-string v14, "steadyphoto"

    const-string v15, "sunset"

    const-string v16, "theatre"

    filled-new-array/range {v0 .. v16}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/ss/android/vesdk/VECameraSettings;->sCameraSceneMode:[Ljava/lang/String;

    .line 308
    new-instance v0, Lcom/ss/android/vesdk/VECameraSettings$1;

    invoke-direct {v0}, Lcom/ss/android/vesdk/VECameraSettings$1;-><init>()V

    sput-object v0, Lcom/ss/android/vesdk/VECameraSettings;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 254
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 129
    const/4 v0, 0x4

    new-array v1, v0, [I

    fill-array-data v1, :array_0

    iput-object v1, p0, Lcom/ss/android/vesdk/VECameraSettings;->CameraHWLevelTE2Android:[I

    .line 130
    new-array v0, v0, [I

    fill-array-data v0, :array_1

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->CameraHWLevelAndroid2TE:[I

    .line 186
    const/16 v0, 0x1e

    iput v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mFps:I

    .line 193
    new-instance v1, Lcom/ss/android/vesdk/VESize;

    const/16 v2, 0x500

    const/16 v3, 0x2d0

    invoke-direct {v1, v3, v2}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    iput-object v1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mPreviewSize:Lcom/ss/android/vesdk/VESize;

    .line 200
    const/4 v1, 0x2

    new-array v1, v1, [I

    fill-array-data v1, :array_2

    iput-object v1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mFpsRange:[I

    .line 207
    sget-object v1, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;->CAMERA_HW_LEVEL_LEGACY:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    iput-object v1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mHwLevel:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    .line 214
    sget-object v1, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;->TYPE1:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    iput-object v1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCameraType:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    .line 221
    sget-object v1, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;->FACING_FRONT:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;

    iput-object v1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCameraFacing:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;

    .line 228
    const-string v1, "auto"

    iput-object v1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mSceneMode:Ljava/lang/String;

    .line 235
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mIsUseCloudConfig:Z

    .line 244
    const/4 v1, 0x1

    iput-byte v1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mOptionFlags:B

    .line 255
    sget-object v1, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;->TYPE1:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    iput-object v1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCameraType:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    .line 256
    sget-object v1, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;->FACING_FRONT:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;

    iput-object v1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCameraFacing:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;

    .line 257
    iput v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mFps:I

    .line 258
    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mPreviewSize:Lcom/ss/android/vesdk/VESize;

    iput v3, v0, Lcom/ss/android/vesdk/VESize;->width:I

    .line 259
    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mPreviewSize:Lcom/ss/android/vesdk/VESize;

    iput v2, v0, Lcom/ss/android/vesdk/VESize;->height:I

    .line 260
    return-void

    :array_0
    .array-data 4
        0x2
        0x0
        0x1
        0x3
    .end array-data

    :array_1
    .array-data 4
        0x1
        0x2
        0x0
        0x3
    .end array-data

    :array_2
    .array-data 4
        0x1e
        0x1e
    .end array-data
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 3

    .line 274
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 129
    const/4 v0, 0x4

    new-array v1, v0, [I

    fill-array-data v1, :array_0

    iput-object v1, p0, Lcom/ss/android/vesdk/VECameraSettings;->CameraHWLevelTE2Android:[I

    .line 130
    new-array v0, v0, [I

    fill-array-data v0, :array_1

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->CameraHWLevelAndroid2TE:[I

    .line 186
    const/16 v0, 0x1e

    iput v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mFps:I

    .line 193
    new-instance v0, Lcom/ss/android/vesdk/VESize;

    const/16 v1, 0x2d0

    const/16 v2, 0x500

    invoke-direct {v0, v1, v2}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mPreviewSize:Lcom/ss/android/vesdk/VESize;

    .line 200
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_2

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mFpsRange:[I

    .line 207
    sget-object v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;->CAMERA_HW_LEVEL_LEGACY:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mHwLevel:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    .line 214
    sget-object v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;->TYPE1:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCameraType:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    .line 221
    sget-object v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;->FACING_FRONT:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCameraFacing:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;

    .line 228
    const-string v0, "auto"

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mSceneMode:Ljava/lang/String;

    .line 235
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mIsUseCloudConfig:Z

    .line 244
    const/4 v1, 0x1

    iput-byte v1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mOptionFlags:B

    .line 275
    invoke-virtual {p1}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v2

    iput-object v2, p0, Lcom/ss/android/vesdk/VECameraSettings;->CameraHWLevelTE2Android:[I

    .line 276
    invoke-virtual {p1}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v2

    iput-object v2, p0, Lcom/ss/android/vesdk/VECameraSettings;->CameraHWLevelAndroid2TE:[I

    .line 277
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/ss/android/vesdk/VECameraSettings;->mFps:I

    .line 278
    const-class v2, Lcom/ss/android/vesdk/VESize;

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Lcom/ss/android/vesdk/VESize;

    iput-object v2, p0, Lcom/ss/android/vesdk/VECameraSettings;->mPreviewSize:Lcom/ss/android/vesdk/VESize;

    .line 279
    invoke-virtual {p1}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v2

    iput-object v2, p0, Lcom/ss/android/vesdk/VECameraSettings;->mFpsRange:[I

    .line 280
    const-class v2, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    iput-object v2, p0, Lcom/ss/android/vesdk/VECameraSettings;->mHwLevel:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    .line 281
    const-class v2, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    iput-object v2, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCameraType:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    .line 282
    const-class v2, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;

    iput-object v2, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCameraFacing:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;

    .line 283
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/ss/android/vesdk/VECameraSettings;->mSceneMode:Ljava/lang/String;

    .line 284
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v2

    if-eqz v2, :cond_0

    move v0, v1

    nop

    :cond_0
    iput-boolean v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mIsUseCloudConfig:Z

    .line 285
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result p1

    iput-byte p1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mOptionFlags:B

    .line 286
    return-void

    :array_0
    .array-data 4
        0x2
        0x0
        0x1
        0x3
    .end array-data

    :array_1
    .array-data 4
        0x1
        0x2
        0x0
        0x3
    .end array-data

    :array_2
    .array-data 4
        0x1e
        0x1e
    .end array-data
.end method

.method private constructor <init>(Lcom/ss/android/vesdk/VECameraSettings$Builder;)V
    .locals 3

    .line 262
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 129
    const/4 v0, 0x4

    new-array v1, v0, [I

    fill-array-data v1, :array_0

    iput-object v1, p0, Lcom/ss/android/vesdk/VECameraSettings;->CameraHWLevelTE2Android:[I

    .line 130
    new-array v0, v0, [I

    fill-array-data v0, :array_1

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->CameraHWLevelAndroid2TE:[I

    .line 186
    const/16 v0, 0x1e

    iput v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mFps:I

    .line 193
    new-instance v0, Lcom/ss/android/vesdk/VESize;

    const/16 v1, 0x2d0

    const/16 v2, 0x500

    invoke-direct {v0, v1, v2}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mPreviewSize:Lcom/ss/android/vesdk/VESize;

    .line 200
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_2

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mFpsRange:[I

    .line 207
    sget-object v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;->CAMERA_HW_LEVEL_LEGACY:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mHwLevel:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    .line 214
    sget-object v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;->TYPE1:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCameraType:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    .line 221
    sget-object v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;->FACING_FRONT:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCameraFacing:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;

    .line 228
    const-string v0, "auto"

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mSceneMode:Ljava/lang/String;

    .line 235
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mIsUseCloudConfig:Z

    .line 244
    const/4 v0, 0x1

    iput-byte v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mOptionFlags:B

    .line 263
    invoke-static {p1}, Lcom/ss/android/vesdk/VECameraSettings$Builder;->access$000(Lcom/ss/android/vesdk/VECameraSettings$Builder;)Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCameraType:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    .line 264
    invoke-static {p1}, Lcom/ss/android/vesdk/VECameraSettings$Builder;->access$100(Lcom/ss/android/vesdk/VECameraSettings$Builder;)Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCameraFacing:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;

    .line 265
    invoke-static {p1}, Lcom/ss/android/vesdk/VECameraSettings$Builder;->access$200(Lcom/ss/android/vesdk/VECameraSettings$Builder;)I

    move-result v0

    iput v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mFps:I

    .line 266
    invoke-static {p1}, Lcom/ss/android/vesdk/VECameraSettings$Builder;->access$300(Lcom/ss/android/vesdk/VECameraSettings$Builder;)Lcom/ss/android/vesdk/VESize;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mPreviewSize:Lcom/ss/android/vesdk/VESize;

    .line 267
    invoke-static {p1}, Lcom/ss/android/vesdk/VECameraSettings$Builder;->access$400(Lcom/ss/android/vesdk/VECameraSettings$Builder;)Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mHwLevel:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    .line 268
    invoke-static {p1}, Lcom/ss/android/vesdk/VECameraSettings$Builder;->access$500(Lcom/ss/android/vesdk/VECameraSettings$Builder;)[I

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mFpsRange:[I

    .line 269
    invoke-static {p1}, Lcom/ss/android/vesdk/VECameraSettings$Builder;->access$600(Lcom/ss/android/vesdk/VECameraSettings$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mSceneMode:Ljava/lang/String;

    .line 270
    invoke-static {p1}, Lcom/ss/android/vesdk/VECameraSettings$Builder;->access$700(Lcom/ss/android/vesdk/VECameraSettings$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mIsUseCloudConfig:Z

    .line 271
    iget-byte p1, p1, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mOptionFlags:B

    iput-byte p1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mOptionFlags:B

    .line 272
    return-void

    :array_0
    .array-data 4
        0x2
        0x0
        0x1
        0x3
    .end array-data

    :array_1
    .array-data 4
        0x1
        0x2
        0x0
        0x3
    .end array-data

    :array_2
    .array-data 4
        0x1e
        0x1e
    .end array-data
.end method

.method synthetic constructor <init>(Lcom/ss/android/vesdk/VECameraSettings$Builder;Lcom/ss/android/vesdk/VECameraSettings$1;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1}, Lcom/ss/android/vesdk/VECameraSettings;-><init>(Lcom/ss/android/vesdk/VECameraSettings$Builder;)V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .line 305
    const/4 v0, 0x0

    return v0
.end method

.method public getCameraFacing()Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;
    .locals 1

    .line 336
    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCameraFacing:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;

    return-object v0
.end method

.method public getCameraType()Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;
    .locals 2

    .line 357
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mIsUseCloudConfig:Z

    if-eqz v0, :cond_1

    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    if-eqz v0, :cond_1

    .line 358
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget v0, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordCameraType:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 359
    sget-object v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;->TYPE1:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    return-object v0

    .line 361
    :cond_0
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget v0, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordCameraType:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 362
    sget-object v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;->TYPE2:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    return-object v0

    .line 365
    :cond_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCameraType:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    return-object v0
.end method

.method public getFps()I
    .locals 1

    .line 420
    iget v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mFps:I

    return v0
.end method

.method public getFpsRange()[I
    .locals 1

    .line 410
    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mFpsRange:[I

    return-object v0
.end method

.method public getHwLevel()Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;
    .locals 1

    .line 440
    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mHwLevel:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    return-object v0
.end method

.method public getOptionFlag()B
    .locals 1

    .line 511
    iget-byte v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mOptionFlags:B

    return v0
.end method

.method getPreviewSize()Lcom/ss/android/vesdk/VESize;
    .locals 3

    .line 386
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mIsUseCloudConfig:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    if-eqz v0, :cond_0

    .line 387
    new-instance v0, Lcom/ss/android/vesdk/VESize;

    sget-object v1, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCameraPreviewResolutionWidth:I

    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget v2, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCameraPreviewResolutionHeight:I

    invoke-direct {v0, v1, v2}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    return-object v0

    .line 390
    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mPreviewSize:Lcom/ss/android/vesdk/VESize;

    return-object v0
.end method

.method public getSceneMode()Ljava/lang/String;
    .locals 1

    .line 460
    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mSceneMode:Ljava/lang/String;

    return-object v0
.end method

.method public setCameraFacing(Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;)V
    .locals 0

    .line 326
    iput-object p1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCameraFacing:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;

    .line 327
    return-void
.end method

.method public setCameraType(Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;)V
    .locals 0

    .line 346
    iput-object p1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCameraType:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    .line 347
    return-void
.end method

.method public setFps(I)V
    .locals 0

    .line 430
    iput p1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mFps:I

    .line 431
    return-void
.end method

.method public setFpsRange([I)V
    .locals 0

    .line 400
    iput-object p1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mFpsRange:[I

    .line 401
    return-void
.end method

.method public setHwLevel(Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;)V
    .locals 0

    .line 450
    iput-object p1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mHwLevel:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    .line 451
    return-void
.end method

.method public setIsUseCloudConfig(Z)V
    .locals 0

    .line 484
    iput-boolean p1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mIsUseCloudConfig:Z

    .line 485
    return-void
.end method

.method public setOptionFlag(B)V
    .locals 0

    .line 500
    iput-byte p1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mOptionFlags:B

    .line 501
    return-void
.end method

.method public setPreviewSize(II)V
    .locals 1

    .line 376
    new-instance v0, Lcom/ss/android/vesdk/VESize;

    invoke-direct {v0, p1, p2}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mPreviewSize:Lcom/ss/android/vesdk/VESize;

    .line 377
    return-void
.end method

.method public setSceneMode(Ljava/lang/String;)V
    .locals 0

    .line 470
    iput-object p1, p0, Lcom/ss/android/vesdk/VECameraSettings;->mSceneMode:Ljava/lang/String;

    .line 471
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    .line 290
    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->CameraHWLevelTE2Android:[I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 291
    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->CameraHWLevelAndroid2TE:[I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 292
    iget v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mFps:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 293
    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mPreviewSize:Lcom/ss/android/vesdk/VESize;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 294
    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mFpsRange:[I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 295
    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mHwLevel:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 296
    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCameraType:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 297
    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings;->mCameraFacing:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 298
    iget-object p2, p0, Lcom/ss/android/vesdk/VECameraSettings;->mSceneMode:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 299
    iget-boolean p2, p0, Lcom/ss/android/vesdk/VECameraSettings;->mIsUseCloudConfig:Z

    int-to-byte p2, p2

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 300
    iget-byte p2, p0, Lcom/ss/android/vesdk/VECameraSettings;->mOptionFlags:B

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 301
    return-void
.end method
