.class public Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$GPUModelInfo;
.super Ljava/lang/Object;
.source "GPUModelDetector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "GPUModelInfo"
.end annotation


# instance fields
.field private mGPUModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;

.field private mGPUModelNumber:I

.field private mGPUSubModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

.field final synthetic this$0:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;


# direct methods
.method public constructor <init>(Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;I)V
    .locals 0

    .line 310
    iput-object p1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$GPUModelInfo;->this$0:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 311
    iput-object p2, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$GPUModelInfo;->mGPUModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;

    .line 312
    iput-object p3, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$GPUModelInfo;->mGPUSubModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    .line 313
    iput p4, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$GPUModelInfo;->mGPUModelNumber:I

    .line 314
    return-void
.end method


# virtual methods
.method public getGPUModel()Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;
    .locals 1

    .line 317
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$GPUModelInfo;->mGPUModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;

    return-object v0
.end method

.method public getGPUModelNumber()I
    .locals 1

    .line 325
    iget v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$GPUModelInfo;->mGPUModelNumber:I

    return v0
.end method

.method public getGPUSubModel()Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;
    .locals 1

    .line 321
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$GPUModelInfo;->mGPUSubModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    return-object v0
.end method
