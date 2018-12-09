.class Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$2;
.super Ljava/lang/Thread;
.source "GPUModelDetector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->detectGPUSurpportHighResolutionRecord()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;


# direct methods
.method constructor <init>(Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;)V
    .locals 0

    .line 73
    iput-object p1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$2;->this$0:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 75
    nop

    .line 76
    invoke-static {}, Lcom/ss/android/ttve/nativePort/TEGPUInfoReader;->nativeGetGPURenderer()Ljava/lang/String;

    move-result-object v0

    .line 77
    const-string v1, "GPUModelDetector"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "gpurender is"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    const/4 v1, 0x0

    if-eqz v0, :cond_4

    .line 79
    iget-object v2, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$2;->this$0:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;

    invoke-static {v2, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->access$000(Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$GPUModelInfo;

    move-result-object v0

    .line 80
    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$GPUModelInfo;->getGPUModel()Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;

    move-result-object v2

    .line 81
    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$GPUModelInfo;->getGPUSubModel()Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    move-result-object v3

    .line 82
    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$GPUModelInfo;->getGPUModelNumber()I

    move-result v0

    .line 83
    sget-object v4, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;->Vivante:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;

    if-ne v2, v4, :cond_0

    .line 84
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;->Vivante_GC:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    if-ne v3, v0, :cond_4

    .line 85
    goto :goto_0

    .line 87
    :cond_0
    sget-object v4, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;->Adreno:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;

    if-ne v2, v4, :cond_1

    .line 88
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;->Adreno:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    if-ne v3, v2, :cond_4

    const/16 v2, 0x134

    if-gt v0, v2, :cond_4

    .line 89
    goto :goto_0

    .line 91
    :cond_1
    sget-object v4, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;->Mali:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;

    if-ne v2, v4, :cond_3

    .line 92
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;->Mali:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    if-ne v3, v2, :cond_2

    .line 93
    const/16 v2, 0x12c

    if-gt v0, v2, :cond_4

    .line 94
    goto :goto_0

    .line 96
    :cond_2
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;->Mali_MP:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    if-ne v3, v2, :cond_4

    .line 97
    const/16 v2, 0x1c2

    if-gt v0, v2, :cond_4

    .line 98
    goto :goto_0

    .line 101
    :cond_3
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;->PowerVR:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;

    if-ne v2, v0, :cond_4

    .line 102
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;->PowerVR_Rogue_Marlowe:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    if-eq v3, v0, :cond_4

    .line 103
    goto :goto_0

    .line 107
    :cond_4
    const/4 v1, 0x1

    :goto_0
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$2;->this$0:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;

    invoke-static {v0, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->access$202(Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;Z)Z

    .line 108
    const-string v0, "GPUModelDetector"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "isSurpportHighResolutionSupport:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$2;->this$0:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;

    invoke-static {v2}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->access$200(Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;)Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    return-void
.end method
