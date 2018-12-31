.class public final Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
.super Ljava/lang/Object;
.source "ParallelTaskDataParameter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/camera/core/ParallelTaskDataParameter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private final mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;


# direct methods
.method public constructor <init>(Landroid/util/Size;Landroid/util/Size;Landroid/util/Size;)V
    .locals 2

    .line 202
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 203
    new-instance v0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, p3, v1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;-><init>(Landroid/util/Size;Landroid/util/Size;Landroid/util/Size;Lcom/xiaomi/camera/core/ParallelTaskDataParameter$1;)V

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    .line 204
    return-void
.end method

.method public constructor <init>(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;)V
    .locals 2

    .line 206
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 207
    new-instance v0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;-><init>(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Lcom/xiaomi/camera/core/ParallelTaskDataParameter$1;)V

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    .line 208
    return-void
.end method


# virtual methods
.method public build()Lcom/xiaomi/camera/core/ParallelTaskDataParameter;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 212
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    return-object v0
.end method

.method public setAgeGenderAndMagicMirrorWater(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 271
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$1302(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Z)Z

    .line 272
    return-object p0
.end method

.method public setAlgorithmName(Ljava/lang/String;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 286
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$1602(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Ljava/lang/String;)Ljava/lang/String;

    .line 287
    return-object p0
.end method

.method public setBokehFrontCamera(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 281
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$1502(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Z)Z

    .line 282
    return-object p0
.end method

.method public setDualWatermarkParam(Lcom/android/camera/effect/renders/DualWatermarkParam;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 316
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$2202(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Lcom/android/camera/effect/renders/DualWatermarkParam;)Lcom/android/camera/effect/renders/DualWatermarkParam;

    .line 317
    return-object p0
.end method

.method public setFaceWaterMarkList(Ljava/util/List;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/watermark/WaterMarkData;",
            ">;)",
            "Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;"
        }
    .end annotation

    .line 266
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$1202(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Ljava/util/List;)Ljava/util/List;

    .line 267
    return-object p0
.end method

.method public setFilterId(I)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 231
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$502(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;I)I

    .line 232
    return-object p0
.end method

.method public setFrontCamera(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 276
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$1402(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Z)Z

    .line 277
    return-object p0
.end method

.method public setGradienterOn(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 301
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$1902(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Z)Z

    .line 302
    return-object p0
.end method

.method public setHasDualWaterMark(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 216
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$202(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Z)Z

    .line 217
    return-object p0
.end method

.method public setJpegRotation(I)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 241
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$702(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;I)I

    .line 242
    return-object p0
.end method

.method public setLightingPattern(I)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 226
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$402(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;I)I

    .line 227
    return-object p0
.end method

.method public setLocation(Landroid/location/Location;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 256
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$1002(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Landroid/location/Location;)Landroid/location/Location;

    .line 257
    return-object p0
.end method

.method public setMirror(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 221
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$302(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Z)Z

    .line 222
    return-object p0
.end method

.method public setOrientation(I)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 236
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$602(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;I)I

    .line 237
    return-object p0
.end method

.method public setPictureInfo(Lcom/xiaomi/camera/core/PictureInfo;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 291
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$1702(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Lcom/xiaomi/camera/core/PictureInfo;)Lcom/xiaomi/camera/core/PictureInfo;

    .line 292
    return-object p0
.end method

.method public setSaveGroupshotPrimitive(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 311
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$2102(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Z)Z

    .line 312
    return-object p0
.end method

.method public setShootOrientation(I)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 251
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$902(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;I)I

    .line 252
    return-object p0
.end method

.method public setShootRotation(F)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 246
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$802(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;F)F

    .line 247
    return-object p0
.end method

.method public setSuffix(Ljava/lang/String;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 296
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$1802(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Ljava/lang/String;)Ljava/lang/String;

    .line 297
    return-object p0
.end method

.method public setTiltShiftMode(Ljava/lang/String;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 306
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$2002(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Ljava/lang/String;)Ljava/lang/String;

    .line 307
    return-object p0
.end method

.method public setTimeWaterMarkString(Ljava/lang/String;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 261
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$1102(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Ljava/lang/String;)Ljava/lang/String;

    .line 262
    return-object p0
.end method
