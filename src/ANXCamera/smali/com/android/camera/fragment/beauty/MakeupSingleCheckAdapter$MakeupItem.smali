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

    .line 214
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 215
    iput p1, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->mImageResource:I

    .line 216
    iput p2, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->mTextResource:I

    .line 217
    return-void
.end method

.method public constructor <init>(IILcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V
    .locals 0

    .line 208
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 209
    iput p1, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->mImageResource:I

    .line 210
    iput p2, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->mTextResource:I

    .line 211
    iput-object p3, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->cameraBeautyParameterType:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 212
    return-void
.end method


# virtual methods
.method public getCameraBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;
    .locals 1

    .line 228
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->cameraBeautyParameterType:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    return-object v0
.end method

.method public getImageResource()I
    .locals 1

    .line 224
    iget v0, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->mImageResource:I

    return v0
.end method

.method public getTextResource()I
    .locals 1

    .line 220
    iget v0, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->mTextResource:I

    return v0
.end method
