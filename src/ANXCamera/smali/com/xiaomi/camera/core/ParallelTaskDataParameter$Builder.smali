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

    .line 208
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 209
    new-instance v0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, p3, v1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;-><init>(Landroid/util/Size;Landroid/util/Size;Landroid/util/Size;Lcom/xiaomi/camera/core/ParallelTaskDataParameter$1;)V

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    .line 210
    return-void
.end method

.method public constructor <init>(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;)V
    .locals 2

    .line 212
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 213
    new-instance v0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;-><init>(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Lcom/xiaomi/camera/core/ParallelTaskDataParameter$1;)V

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    .line 214
    return-void
.end method


# virtual methods
.method public build()Lcom/xiaomi/camera/core/ParallelTaskDataParameter;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 218
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    return-object v0
.end method

.method public setAgeGenderAndMagicMirrorWater(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 277
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$1302(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Z)Z

    .line 278
    return-object p0
.end method

.method public setAlgorithmName(Ljava/lang/String;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 292
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$1602(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Ljava/lang/String;)Ljava/lang/String;

    .line 293
    return-object p0
.end method

.method public setBokehFrontCamera(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 287
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$1502(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Z)Z

    .line 288
    return-object p0
.end method

.method public setDualWatermarkParam(Lcom/android/camera/effect/renders/DualWatermarkParam;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 322
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$2202(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Lcom/android/camera/effect/renders/DualWatermarkParam;)Lcom/android/camera/effect/renders/DualWatermarkParam;

    .line 323
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

    .line 272
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$1202(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Ljava/util/List;)Ljava/util/List;

    .line 273
    return-object p0
.end method

.method public setFilterId(I)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 237
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$502(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;I)I

    .line 238
    return-object p0
.end method

.method public setFrontCamera(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 282
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$1402(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Z)Z

    .line 283
    return-object p0
.end method

.method public setGradienterOn(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 307
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$1902(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Z)Z

    .line 308
    return-object p0
.end method

.method public setHasDualWaterMark(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 222
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$202(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Z)Z

    .line 223
    return-object p0
.end method

.method public setJpegQuality(I)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 327
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$2302(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;I)I

    .line 328
    return-object p0
.end method

.method public setJpegRotation(I)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 247
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$702(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;I)I

    .line 248
    return-object p0
.end method

.method public setLightingPattern(I)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 232
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$402(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;I)I

    .line 233
    return-object p0
.end method

.method public setLocation(Landroid/location/Location;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 262
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$1002(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Landroid/location/Location;)Landroid/location/Location;

    .line 263
    return-object p0
.end method

.method public setMirror(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 227
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$302(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Z)Z

    .line 228
    return-object p0
.end method

.method public setOrientation(I)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 242
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$602(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;I)I

    .line 243
    return-object p0
.end method

.method public setPictureInfo(Lcom/xiaomi/camera/core/PictureInfo;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 297
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$1702(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Lcom/xiaomi/camera/core/PictureInfo;)Lcom/xiaomi/camera/core/PictureInfo;

    .line 298
    return-object p0
.end method

.method public setSaveGroupshotPrimitive(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 317
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$2102(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Z)Z

    .line 318
    return-object p0
.end method

.method public setShootOrientation(I)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 257
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$902(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;I)I

    .line 258
    return-object p0
.end method

.method public setShootRotation(F)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 252
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$802(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;F)F

    .line 253
    return-object p0
.end method

.method public setSuffix(Ljava/lang/String;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 302
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$1802(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Ljava/lang/String;)Ljava/lang/String;

    .line 303
    return-object p0
.end method

.method public setTiltShiftMode(Ljava/lang/String;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 312
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$2002(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Ljava/lang/String;)Ljava/lang/String;

    .line 313
    return-object p0
.end method

.method public setTimeWaterMarkString(Ljava/lang/String;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;
    .locals 1

    .line 267
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->mParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-static {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->access$1102(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;Ljava/lang/String;)Ljava/lang/String;

    .line 268
    return-object p0
.end method
