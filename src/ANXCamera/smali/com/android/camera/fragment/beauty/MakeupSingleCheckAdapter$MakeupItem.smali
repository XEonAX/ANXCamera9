.class public Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;
.super Ljava/lang/Object;
.source "MakeupSingleCheckAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MakeupItem"
.end annotation


# instance fields
.field private cameraBeautyParameterType:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field private mImageResource:I

.field private mTextResource:I


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 212
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 213
    iput p1, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->mImageResource:I

    .line 214
    iput p2, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->mTextResource:I

    .line 215
    return-void
.end method

.method public constructor <init>(IILcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V
    .locals 0

    .line 206
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 207
    iput p1, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->mImageResource:I

    .line 208
    iput p2, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->mTextResource:I

    .line 209
    iput-object p3, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->cameraBeautyParameterType:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 210
    return-void
.end method


# virtual methods
.method public getCameraBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;
    .locals 1

    .line 226
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->cameraBeautyParameterType:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    return-object v0
.end method

.method public getImageResource()I
    .locals 1

    .line 222
    iget v0, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->mImageResource:I

    return v0
.end method

.method public getTextResource()I
    .locals 1

    .line 218
    iget v0, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->mTextResource:I

    return v0
.end method
