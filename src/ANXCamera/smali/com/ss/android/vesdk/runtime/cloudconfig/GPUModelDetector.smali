.class public Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;
.super Ljava/lang/Object;
.source "GPUModelDetector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;,
        Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;,
        Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$GPUModelInfo;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "GPUModelDetector"

.field private static final instance:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;


# instance fields
.field private isSurpportAdvancedEffect:Z

.field private isSurpportHighResolutionRecord:Z

.field private mGPUModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;

.field private mGPUModelNumber:I

.field private mGPUSubModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 14
    new-instance v0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;

    invoke-direct {v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;-><init>()V

    sput-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->instance:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private DetectAdrenoGpu([Ljava/lang/String;)V
    .locals 5

    .line 167
    array-length v0, p1

    .line 168
    const/4 v1, 0x2

    if-ge v0, v1, :cond_0

    .line 169
    return-void

    .line 171
    :cond_0
    const/4 v2, 0x1

    aget-object v3, p1, v2

    const-string v4, "(TM)"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 172
    const/4 v2, 0x3

    if-ne v0, v2, :cond_2

    aget-object v0, p1, v1

    invoke-direct {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->isNumeric(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 173
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;->Adreno:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUSubModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    .line 174
    aget-object p1, p1, v1

    invoke-direct {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUModelNumber:I

    goto :goto_0

    .line 176
    :cond_1
    aget-object v0, p1, v2

    invoke-direct {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->isNumeric(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 177
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;->Adreno:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUSubModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    .line 178
    aget-object p1, p1, v2

    invoke-direct {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUModelNumber:I

    .line 180
    :cond_2
    :goto_0
    return-void
.end method

.method private DetectIntelGpu([Ljava/lang/String;)V
    .locals 4

    .line 251
    array-length v0, p1

    .line 252
    const/4 v1, 0x3

    if-ge v0, v1, :cond_0

    .line 253
    return-void

    .line 255
    :cond_0
    const/4 v2, 0x1

    aget-object v2, p1, v2

    const-string v3, "HD"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, 0x2

    aget-object v2, p1, v2

    const-string v3, "Graphics"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 256
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;->Intel_HD_Graphics:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    iput-object v2, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUSubModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    .line 257
    const/4 v2, 0x4

    if-ne v0, v2, :cond_1

    aget-object v0, p1, v1

    invoke-direct {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->isNumeric(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 258
    aget-object p1, p1, v1

    invoke-direct {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUModelNumber:I

    .line 260
    :cond_1
    return-void
.end method

.method private DetectMaliGpu([Ljava/lang/String;)V
    .locals 4

    .line 183
    array-length v0, p1

    .line 184
    const/4 v1, 0x2

    if-ge v0, v1, :cond_0

    .line 185
    return-void

    .line 188
    :cond_0
    const/4 v2, 0x1

    aget-object v3, p1, v2

    invoke-direct {p0, v3}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->isNumeric(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 189
    if-ne v0, v1, :cond_1

    .line 190
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;->Mali:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUSubModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    goto :goto_0

    .line 191
    :cond_1
    const/4 v3, 0x3

    if-ne v0, v3, :cond_2

    aget-object v0, p1, v1

    const-string v1, "MP"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 192
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;->Mali_MP:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUSubModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    .line 194
    :cond_2
    :goto_0
    aget-object p1, p1, v2

    invoke-direct {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUModelNumber:I

    goto :goto_1

    .line 195
    :cond_3
    if-ne v0, v1, :cond_4

    aget-object v0, p1, v2

    if-eqz v0, :cond_4

    aget-object v0, p1, v2

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_4

    aget-object v0, p1, v2

    const/4 v1, 0x0

    .line 196
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x54

    if-ne v0, v1, :cond_4

    .line 197
    aget-object p1, p1, v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 198
    invoke-direct {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->isNumeric(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 199
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;->Mali_T:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUSubModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    .line 200
    invoke-direct {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUModelNumber:I

    .line 203
    :cond_4
    :goto_1
    return-void
.end method

.method private DetectNVIDIAGpu([Ljava/lang/String;)V
    .locals 5

    .line 263
    array-length v0, p1

    .line 264
    const/4 v1, 0x2

    if-ge v0, v1, :cond_0

    .line 265
    return-void

    .line 267
    :cond_0
    const/4 v2, 0x1

    aget-object v3, p1, v2

    const-string v4, "Tegra"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 268
    const/4 v2, 0x3

    if-lt v0, v2, :cond_1

    aget-object p1, p1, v1

    const-string v0, "X1"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 269
    sget-object p1, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;->NVIDIA_Tegra_X1:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    iput-object p1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUSubModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    goto :goto_0

    .line 271
    :cond_1
    sget-object p1, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;->NVIDIA_Tegra:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    iput-object p1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUSubModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    goto :goto_0

    .line 273
    :cond_2
    aget-object p1, p1, v2

    const-string v0, "AP"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 274
    sget-object p1, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;->NVIDIA_AP:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    iput-object p1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUSubModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    .line 276
    :cond_3
    :goto_0
    return-void
.end method

.method private DetectPowerVRGpu([Ljava/lang/String;)V
    .locals 6

    .line 206
    array-length v0, p1

    .line 207
    const/4 v1, 0x2

    if-ge v0, v1, :cond_0

    .line 208
    return-void

    .line 211
    :cond_0
    const/4 v2, 0x1

    aget-object v3, p1, v2

    const-string v4, "SGX"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    const/4 v4, 0x3

    if-eqz v3, :cond_6

    .line 212
    if-eq v0, v4, :cond_1

    .line 213
    return-void

    .line 215
    :cond_1
    aget-object v0, p1, v1

    aget-object v2, p1, v1

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v1

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    const-string v2, "MP"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    if-eqz v0, :cond_3

    .line 216
    aget-object v0, p1, v1

    aget-object p1, p1, v1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    sub-int/2addr p1, v1

    invoke-virtual {v0, v2, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 217
    invoke-direct {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->isNumeric(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 218
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;->PowerVR_SGX_MP:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUSubModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    .line 219
    invoke-direct {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUModelNumber:I

    .line 221
    :cond_2
    goto/16 :goto_0

    :cond_3
    aget-object v0, p1, v1

    aget-object v3, p1, v1

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    sub-int/2addr v3, v4

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    const-string v3, "MP2"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 222
    aget-object v0, p1, v1

    aget-object p1, p1, v1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    sub-int/2addr p1, v4

    invoke-virtual {v0, v2, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 223
    invoke-direct {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->isNumeric(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 224
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;->PowerVR_SGX_MP2:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUSubModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    .line 225
    invoke-direct {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUModelNumber:I

    .line 227
    :cond_4
    goto/16 :goto_0

    :cond_5
    aget-object v0, p1, v1

    invoke-direct {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->isNumeric(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 228
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;->PowerVR_SGX:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUSubModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    .line 229
    aget-object p1, p1, v1

    invoke-direct {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUModelNumber:I

    goto :goto_0

    .line 231
    :cond_6
    aget-object v3, p1, v2

    const-string v5, "Rogue"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 232
    if-eq v0, v4, :cond_7

    .line 233
    return-void

    .line 234
    :cond_7
    aget-object v0, p1, v1

    const-string v3, "Han"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 235
    sget-object p1, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;->PowerVR_Rogue_Han:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    iput-object p1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUSubModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    goto :goto_0

    .line 236
    :cond_8
    aget-object v0, p1, v1

    const-string v3, "Hood"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 237
    sget-object p1, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;->PowerVR_Rogue_Hood:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    iput-object p1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUSubModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    goto :goto_0

    .line 238
    :cond_9
    aget-object v0, p1, v1

    const-string v3, "Marlowe"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 239
    sget-object p1, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;->PowerVR_Rogue_Marlowe:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    iput-object p1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUSubModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    goto :goto_0

    .line 240
    :cond_a
    aget-object v0, p1, v1

    const-string v3, "G"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 241
    aget-object p1, p1, v1

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 242
    invoke-direct {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->isNumeric(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 243
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;->PowerVR_Rogue_G:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUSubModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    .line 244
    invoke-direct {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUModelNumber:I

    .line 248
    :cond_b
    :goto_0
    return-void
.end method

.method private DetectVideoCoreGpu([Ljava/lang/String;)V
    .locals 2

    .line 298
    array-length v0, p1

    .line 299
    const/4 v1, 0x3

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    aget-object v0, p1, v0

    const-string v1, "IV"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x2

    aget-object p1, p1, v0

    const-string v0, "HW"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 300
    sget-object p1, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;->VideoCore_IV_HW:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    iput-object p1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUSubModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    .line 301
    return-void

    .line 303
    :cond_0
    return-void
.end method

.method private DetectVivanteGCGpu([Ljava/lang/String;)V
    .locals 2

    .line 279
    array-length v0, p1

    .line 280
    const/4 v1, 0x2

    if-ge v0, v1, :cond_0

    .line 281
    return-void

    .line 282
    :cond_0
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;->Vivante_GC:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUSubModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    .line 283
    const/4 v0, 0x0

    aget-object p1, p1, v0

    invoke-direct {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->stripNonDigitCharFromString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 284
    invoke-direct {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUModelNumber:I

    .line 285
    return-void
.end method

.method private DetectVivanteGpu([Ljava/lang/String;)V
    .locals 3

    .line 288
    array-length v0, p1

    .line 289
    const/4 v1, 0x2

    if-ge v0, v1, :cond_0

    .line 290
    return-void

    .line 291
    :cond_0
    const/4 v0, 0x1

    aget-object v1, p1, v0

    const-string v2, "GC"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 292
    return-void

    .line 293
    :cond_1
    sget-object v1, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;->Vivante_GC:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    iput-object v1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUSubModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    .line 294
    aget-object p1, p1, v0

    invoke-direct {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->stripNonDigitCharFromString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 295
    invoke-direct {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUModelNumber:I

    .line 296
    return-void
.end method

.method static synthetic access$000(Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$GPUModelInfo;
    .locals 0

    .line 11
    invoke-direct {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->getGPUModel(Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$GPUModelInfo;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;)Z
    .locals 0

    .line 11
    iget-boolean p0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->isSurpportAdvancedEffect:Z

    return p0
.end method

.method static synthetic access$102(Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;Z)Z
    .locals 0

    .line 11
    iput-boolean p1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->isSurpportAdvancedEffect:Z

    return p1
.end method

.method static synthetic access$200(Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;)Z
    .locals 0

    .line 11
    iget-boolean p0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->isSurpportHighResolutionRecord:Z

    return p0
.end method

.method static synthetic access$202(Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;Z)Z
    .locals 0

    .line 11
    iput-boolean p1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->isSurpportHighResolutionRecord:Z

    return p1
.end method

.method private getGPUModel(Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$GPUModelInfo;
    .locals 3

    .line 128
    if-eqz p1, :cond_8

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_8

    .line 129
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;->Unknown:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;

    .line 130
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;->Unknown:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUSubModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    .line 131
    const/4 v0, 0x0

    iput v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUModelNumber:I

    .line 132
    const-string v1, "[-\\s+]"

    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    .line 133
    array-length v1, p1

    const/4 v2, 0x1

    if-lt v1, v2, :cond_8

    .line 134
    aget-object v0, p1, v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 135
    const-string v1, "Adreno"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 136
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;->Adreno:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;

    .line 137
    invoke-direct {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->DetectAdrenoGpu([Ljava/lang/String;)V

    goto/16 :goto_1

    .line 138
    :cond_0
    const-string v1, "Mali"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 139
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;->Mali:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;

    .line 140
    invoke-direct {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->DetectMaliGpu([Ljava/lang/String;)V

    goto :goto_1

    .line 141
    :cond_1
    const-string v1, "PowerVR"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 142
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;->PowerVR:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;

    .line 143
    invoke-direct {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->DetectPowerVRGpu([Ljava/lang/String;)V

    goto :goto_1

    .line 144
    :cond_2
    const-string v1, "Intel"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_7

    const-string v1, "Intel(R)"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    goto :goto_0

    .line 147
    :cond_3
    const-string v1, "NVIDIA"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 148
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;->Intel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;

    .line 149
    invoke-direct {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->DetectNVIDIAGpu([Ljava/lang/String;)V

    goto :goto_1

    .line 150
    :cond_4
    const-string v1, "Vivante"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 151
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;->Vivante:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;

    .line 152
    invoke-direct {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->DetectVivanteGpu([Ljava/lang/String;)V

    goto :goto_1

    .line 153
    :cond_5
    const-string v1, "GC1000"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 154
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;->Vivante:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;

    .line 155
    invoke-direct {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->DetectVivanteGCGpu([Ljava/lang/String;)V

    goto :goto_1

    .line 156
    :cond_6
    const-string v1, "VideoCore"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 157
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;->VideoCore:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;

    .line 158
    invoke-direct {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->DetectVideoCoreGpu([Ljava/lang/String;)V

    goto :goto_1

    .line 145
    :cond_7
    :goto_0
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;->Intel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;

    .line 146
    invoke-direct {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->DetectIntelGpu([Ljava/lang/String;)V

    .line 162
    :cond_8
    :goto_1
    new-instance p1, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$GPUModelInfo;

    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;

    iget-object v1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUSubModel:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    iget v2, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->mGPUModelNumber:I

    invoke-direct {p1, p0, v0, v1, v2}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$GPUModelInfo;-><init>(Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuModel;Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;I)V

    .line 163
    return-object p1
.end method

.method public static getInstance()Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;
    .locals 1

    .line 17
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->instance:Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;

    return-object v0
.end method

.method private isNumeric(Ljava/lang/String;)Z
    .locals 1

    .line 364
    const-string v0, "-?[0-9]+.?[0-9]+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    .line 365
    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 366
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    if-nez v0, :cond_0

    .line 367
    const-string v0, "[0-9]+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    .line 368
    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    .line 369
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->matches()Z

    move-result p1

    if-nez p1, :cond_0

    .line 370
    const/4 p1, 0x0

    return p1

    .line 373
    :cond_0
    const/4 p1, 0x1

    return p1
.end method

.method private parseInt(Ljava/lang/String;)I
    .locals 0

    .line 388
    nop

    .line 390
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 393
    goto :goto_0

    .line 391
    :catch_0
    move-exception p1

    .line 392
    invoke-virtual {p1}, Ljava/lang/NumberFormatException;->printStackTrace()V

    .line 394
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private stripNonDigitCharFromString(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 377
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 378
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 379
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v2

    .line 380
    invoke-direct {p0, v2}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->isNumeric(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 381
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 378
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 384
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public detectGPUSurpportAdvancedEffect()V
    .locals 1

    .line 32
    new-instance v0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$1;

    invoke-direct {v0, p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$1;-><init>(Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;)V

    .line 69
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 70
    return-void
.end method

.method public detectGPUSurpportHighResolutionRecord()V
    .locals 1

    .line 73
    new-instance v0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$2;

    invoke-direct {v0, p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$2;-><init>(Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;)V

    .line 112
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 113
    return-void
.end method

.method public getGLVersion()Ljava/lang/String;
    .locals 1

    .line 124
    invoke-static {}, Lcom/ss/android/ttve/nativePort/TEGPUInfoReader;->nativeGetGLVersion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getGPUModel()Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$GPUModelInfo;
    .locals 1

    .line 120
    invoke-static {}, Lcom/ss/android/ttve/nativePort/TEGPUInfoReader;->nativeGetGPURenderer()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->getGPUModel(Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$GPUModelInfo;

    move-result-object v0

    return-object v0
.end method

.method public isSurpportAdvancedEffect()Z
    .locals 1

    .line 24
    iget-boolean v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->isSurpportAdvancedEffect:Z

    return v0
.end method

.method public isSurpportHighResolutionRecord()Z
    .locals 1

    .line 28
    iget-boolean v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->isSurpportHighResolutionRecord:Z

    return v0
.end method
