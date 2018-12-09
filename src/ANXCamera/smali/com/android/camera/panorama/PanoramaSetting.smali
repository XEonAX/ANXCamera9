.class public Lcom/android/camera/panorama/PanoramaSetting;
.super Ljava/lang/Object;
.source "PanoramaSetting.java"


# static fields
.field private static final DEBUG:Z = false

.field public static final KEY_AOVX:Ljava/lang/String; = "aovx"

.field public static final KEY_AOVY:Ljava/lang/String; = "aovy"

.field public static final KEY_AOV_GAIN:Ljava/lang/String; = "aov_gain"

.field public static final KEY_CALCSEAM_PIXNUM:Ljava/lang/String; = "calcseam_pixnum"

.field public static final KEY_DISTORTION_K1:Ljava/lang/String; = "distortion_k1"

.field public static final KEY_DISTORTION_K2:Ljava/lang/String; = "distortion_k2"

.field public static final KEY_DISTORTION_K3:Ljava/lang/String; = "distortion_k3"

.field public static final KEY_DISTORTION_K4:Ljava/lang/String; = "distortion_k4"

.field public static final KEY_DRAW_THRESHOLD:Ljava/lang/String; = "draw_threshold"

.field public static final KEY_ROTATION_RATIO:Ljava/lang/String; = "rotation_ratio"

.field public static final KEY_SEAMSEARCH_RATIO:Ljava/lang/String; = "seamsearch_ratio"

.field public static final KEY_SHRINK_RATIO:Ljava/lang/String; = "shrink_ratio"

.field public static final KEY_USE_DEFORM:Ljava/lang/String; = "use_deform"

.field public static final KEY_USE_LUMINANCE_CORRECTION:Ljava/lang/String; = "use_luminance_correction"

.field public static final KEY_ZROTATION_COEFF:Ljava/lang/String; = "zrotation_coeff"

.field private static final TAG:Ljava/lang/String; = "PanoramaSetting"


# instance fields
.field private aov_gain:D

.field private aovx:D

.field private aovy:D

.field private calcseam_pixnum:I

.field private distortion_k1:D

.field private distortion_k2:D

.field private distortion_k3:D

.field private distortion_k4:D

.field private draw_threshold:D

.field private motion_detection_mode:I

.field private projection_mode:I

.field private rotation_ratio:D

.field private seamsearch_ratio:D

.field private shrink_ratio:F

.field private use_deform:Z

.field private use_luminance_correction:Z

.field private zrotation_coeff:D


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 4

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    const-wide v0, 0x40519999a0000000L    # 70.4000015258789

    iput-wide v0, p0, Lcom/android/camera/panorama/PanoramaSetting;->aovx:D

    .line 38
    const-wide v0, 0x404bd999a0000000L    # 55.70000076293945

    iput-wide v0, p0, Lcom/android/camera/panorama/PanoramaSetting;->aovy:D

    .line 39
    const/high16 p1, 0x40f00000    # 7.5f

    iput p1, p0, Lcom/android/camera/panorama/PanoramaSetting;->shrink_ratio:F

    .line 40
    const/16 p1, 0x7e90

    iput p1, p0, Lcom/android/camera/panorama/PanoramaSetting;->calcseam_pixnum:I

    .line 41
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/panorama/PanoramaSetting;->use_deform:Z

    .line 43
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/panorama/PanoramaSetting;->use_luminance_correction:Z

    .line 44
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    iput-wide v0, p0, Lcom/android/camera/panorama/PanoramaSetting;->seamsearch_ratio:D

    .line 45
    const-wide v2, 0x3fee666666666666L    # 0.95

    iput-wide v2, p0, Lcom/android/camera/panorama/PanoramaSetting;->zrotation_coeff:D

    .line 46
    const-wide/high16 v2, 0x3fe0000000000000L    # 0.5

    iput-wide v2, p0, Lcom/android/camera/panorama/PanoramaSetting;->draw_threshold:D

    .line 47
    iput-wide v0, p0, Lcom/android/camera/panorama/PanoramaSetting;->aov_gain:D

    .line 49
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/android/camera/panorama/PanoramaSetting;->distortion_k1:D

    .line 50
    iput-wide v2, p0, Lcom/android/camera/panorama/PanoramaSetting;->distortion_k2:D

    .line 51
    iput-wide v2, p0, Lcom/android/camera/panorama/PanoramaSetting;->distortion_k3:D

    .line 52
    iput-wide v2, p0, Lcom/android/camera/panorama/PanoramaSetting;->distortion_k4:D

    .line 54
    iput-wide v0, p0, Lcom/android/camera/panorama/PanoramaSetting;->rotation_ratio:D

    .line 55
    iput p1, p0, Lcom/android/camera/panorama/PanoramaSetting;->projection_mode:I

    .line 56
    iput p1, p0, Lcom/android/camera/panorama/PanoramaSetting;->motion_detection_mode:I

    .line 77
    const-string p1, "PanoramaSetting"

    invoke-virtual {p0}, Lcom/android/camera/panorama/PanoramaSetting;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    return-void
.end method

.method private parseSetting(Landroid/util/JsonReader;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 81
    invoke-virtual {p1}, Landroid/util/JsonReader;->beginObject()V

    .line 82
    :goto_0
    invoke-virtual {p1}, Landroid/util/JsonReader;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 83
    invoke-virtual {p1}, Landroid/util/JsonReader;->nextName()Ljava/lang/String;

    move-result-object v0

    .line 84
    const-string v1, "PanoramaSetting"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "read key "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    const/4 v1, -0x1

    :try_start_0
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    goto/16 :goto_1

    :sswitch_0
    const-string v2, "distortion_k4"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v1, 0xd

    goto/16 :goto_1

    :sswitch_1
    const-string v2, "distortion_k3"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v1, 0xc

    goto/16 :goto_1

    :sswitch_2
    const-string v2, "distortion_k2"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v1, 0xb

    goto/16 :goto_1

    :sswitch_3
    const-string v2, "distortion_k1"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v1, 0xa

    goto/16 :goto_1

    :sswitch_4
    const-string v2, "aov_gain"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v1, 0x9

    goto/16 :goto_1

    :sswitch_5
    const-string v2, "seamsearch_ratio"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x6

    goto :goto_1

    :sswitch_6
    const-string v2, "calcseam_pixnum"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x3

    goto :goto_1

    :sswitch_7
    const-string v2, "aovy"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    goto :goto_1

    :sswitch_8
    const-string v2, "aovx"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x0

    goto :goto_1

    :sswitch_9
    const-string v2, "shrink_ratio"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x2

    goto :goto_1

    :sswitch_a
    const-string v2, "draw_threshold"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v1, 0x8

    goto :goto_1

    :sswitch_b
    const-string v2, "rotation_ratio"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v1, 0xe

    goto :goto_1

    :sswitch_c
    const-string v2, "zrotation_coeff"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x7

    goto :goto_1

    :sswitch_d
    const-string v2, "use_luminance_correction"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x5

    goto :goto_1

    :sswitch_e
    const-string v2, "use_deform"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x4

    :cond_0
    :goto_1
    packed-switch v1, :pswitch_data_0

    .line 149
    invoke-virtual {p1}, Landroid/util/JsonReader;->skipValue()V

    goto/16 :goto_2

    .line 145
    :pswitch_0
    invoke-virtual {p1}, Landroid/util/JsonReader;->nextDouble()D

    move-result-wide v1

    iput-wide v1, p0, Lcom/android/camera/panorama/PanoramaSetting;->rotation_ratio:D

    .line 146
    goto/16 :goto_2

    .line 141
    :pswitch_1
    invoke-virtual {p1}, Landroid/util/JsonReader;->nextDouble()D

    move-result-wide v1

    iput-wide v1, p0, Lcom/android/camera/panorama/PanoramaSetting;->distortion_k4:D

    .line 142
    goto :goto_2

    .line 137
    :pswitch_2
    invoke-virtual {p1}, Landroid/util/JsonReader;->nextDouble()D

    move-result-wide v1

    iput-wide v1, p0, Lcom/android/camera/panorama/PanoramaSetting;->distortion_k3:D

    .line 138
    goto :goto_2

    .line 133
    :pswitch_3
    invoke-virtual {p1}, Landroid/util/JsonReader;->nextDouble()D

    move-result-wide v1

    iput-wide v1, p0, Lcom/android/camera/panorama/PanoramaSetting;->distortion_k2:D

    .line 134
    goto :goto_2

    .line 129
    :pswitch_4
    invoke-virtual {p1}, Landroid/util/JsonReader;->nextDouble()D

    move-result-wide v1

    iput-wide v1, p0, Lcom/android/camera/panorama/PanoramaSetting;->distortion_k1:D

    .line 130
    goto :goto_2

    .line 125
    :pswitch_5
    invoke-virtual {p1}, Landroid/util/JsonReader;->nextDouble()D

    move-result-wide v1

    iput-wide v1, p0, Lcom/android/camera/panorama/PanoramaSetting;->aov_gain:D

    .line 126
    goto :goto_2

    .line 121
    :pswitch_6
    invoke-virtual {p1}, Landroid/util/JsonReader;->nextDouble()D

    move-result-wide v1

    iput-wide v1, p0, Lcom/android/camera/panorama/PanoramaSetting;->draw_threshold:D

    .line 122
    goto :goto_2

    .line 117
    :pswitch_7
    invoke-virtual {p1}, Landroid/util/JsonReader;->nextDouble()D

    move-result-wide v1

    iput-wide v1, p0, Lcom/android/camera/panorama/PanoramaSetting;->zrotation_coeff:D

    .line 118
    goto :goto_2

    .line 113
    :pswitch_8
    invoke-virtual {p1}, Landroid/util/JsonReader;->nextDouble()D

    move-result-wide v1

    iput-wide v1, p0, Lcom/android/camera/panorama/PanoramaSetting;->seamsearch_ratio:D

    .line 114
    goto :goto_2

    .line 109
    :pswitch_9
    invoke-virtual {p1}, Landroid/util/JsonReader;->nextBoolean()Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/camera/panorama/PanoramaSetting;->use_luminance_correction:Z

    .line 110
    goto :goto_2

    .line 105
    :pswitch_a
    invoke-virtual {p1}, Landroid/util/JsonReader;->nextBoolean()Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/camera/panorama/PanoramaSetting;->use_deform:Z

    .line 106
    goto :goto_2

    .line 101
    :pswitch_b
    invoke-virtual {p1}, Landroid/util/JsonReader;->nextInt()I

    move-result v1

    iput v1, p0, Lcom/android/camera/panorama/PanoramaSetting;->calcseam_pixnum:I

    .line 102
    goto :goto_2

    .line 97
    :pswitch_c
    invoke-virtual {p1}, Landroid/util/JsonReader;->nextDouble()D

    move-result-wide v1

    double-to-float v1, v1

    iput v1, p0, Lcom/android/camera/panorama/PanoramaSetting;->shrink_ratio:F

    .line 98
    goto :goto_2

    .line 93
    :pswitch_d
    invoke-virtual {p1}, Landroid/util/JsonReader;->nextDouble()D

    move-result-wide v1

    iput-wide v1, p0, Lcom/android/camera/panorama/PanoramaSetting;->aovy:D

    .line 94
    goto :goto_2

    .line 89
    :pswitch_e
    invoke-virtual {p1}, Landroid/util/JsonReader;->nextDouble()D

    move-result-wide v1

    iput-wide v1, p0, Lcom/android/camera/panorama/PanoramaSetting;->aovx:D
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 90
    nop

    .line 154
    :goto_2
    goto :goto_3

    .line 152
    :catch_0
    move-exception v1

    .line 153
    const-string v1, "PanoramaSetting"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "parse error, name = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 155
    :goto_3
    goto/16 :goto_0

    .line 156
    :cond_1
    invoke-virtual {p1}, Landroid/util/JsonReader;->endObject()V

    .line 157
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        -0x7206cd83 -> :sswitch_e
        -0x6eee3b43 -> :sswitch_d
        -0x5808ed0e -> :sswitch_c
        -0x29cc53f6 -> :sswitch_b
        -0x2342b8d0 -> :sswitch_a
        -0xdf771ab -> :sswitch_9
        0x2dc770 -> :sswitch_8
        0x2dc771 -> :sswitch_7
        0xefe573 -> :sswitch_6
        0x66cfbb2 -> :sswitch_5
        0x1aec8f56 -> :sswitch_4
        0x24d06008 -> :sswitch_3
        0x24d06009 -> :sswitch_2
        0x24d0600a -> :sswitch_1
        0x24d0600b -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public getAov_gain()D
    .locals 2

    .line 197
    iget-wide v0, p0, Lcom/android/camera/panorama/PanoramaSetting;->aov_gain:D

    return-wide v0
.end method

.method public getAovx()D
    .locals 2

    .line 160
    iget-wide v0, p0, Lcom/android/camera/panorama/PanoramaSetting;->aovx:D

    return-wide v0
.end method

.method public getAovy()D
    .locals 2

    .line 165
    iget-wide v0, p0, Lcom/android/camera/panorama/PanoramaSetting;->aovy:D

    return-wide v0
.end method

.method public getCalcseam_pixnum()I
    .locals 1

    .line 173
    iget v0, p0, Lcom/android/camera/panorama/PanoramaSetting;->calcseam_pixnum:I

    return v0
.end method

.method public getDistortion_k1()D
    .locals 2

    .line 201
    iget-wide v0, p0, Lcom/android/camera/panorama/PanoramaSetting;->distortion_k1:D

    return-wide v0
.end method

.method public getDistortion_k2()D
    .locals 2

    .line 205
    iget-wide v0, p0, Lcom/android/camera/panorama/PanoramaSetting;->distortion_k2:D

    return-wide v0
.end method

.method public getDistortion_k3()D
    .locals 2

    .line 209
    iget-wide v0, p0, Lcom/android/camera/panorama/PanoramaSetting;->distortion_k3:D

    return-wide v0
.end method

.method public getDistortion_k4()D
    .locals 2

    .line 213
    iget-wide v0, p0, Lcom/android/camera/panorama/PanoramaSetting;->distortion_k4:D

    return-wide v0
.end method

.method public getDraw_threshold()D
    .locals 2

    .line 193
    iget-wide v0, p0, Lcom/android/camera/panorama/PanoramaSetting;->draw_threshold:D

    return-wide v0
.end method

.method public getMotion_detection_mode()I
    .locals 1

    .line 225
    iget v0, p0, Lcom/android/camera/panorama/PanoramaSetting;->motion_detection_mode:I

    return v0
.end method

.method public getProjection_mode()I
    .locals 1

    .line 221
    iget v0, p0, Lcom/android/camera/panorama/PanoramaSetting;->projection_mode:I

    return v0
.end method

.method public getRotation_ratio()D
    .locals 2

    .line 217
    iget-wide v0, p0, Lcom/android/camera/panorama/PanoramaSetting;->rotation_ratio:D

    return-wide v0
.end method

.method public getSeamsearch_ratio()D
    .locals 2

    .line 185
    iget-wide v0, p0, Lcom/android/camera/panorama/PanoramaSetting;->seamsearch_ratio:D

    return-wide v0
.end method

.method public getShrink_ratio()F
    .locals 1

    .line 169
    iget v0, p0, Lcom/android/camera/panorama/PanoramaSetting;->shrink_ratio:F

    return v0
.end method

.method public getZrotation_coeff()D
    .locals 2

    .line 189
    iget-wide v0, p0, Lcom/android/camera/panorama/PanoramaSetting;->zrotation_coeff:D

    return-wide v0
.end method

.method public isUse_deform()Z
    .locals 1

    .line 177
    iget-boolean v0, p0, Lcom/android/camera/panorama/PanoramaSetting;->use_deform:Z

    return v0
.end method

.method public isUse_luminance_correction()Z
    .locals 1

    .line 181
    iget-boolean v0, p0, Lcom/android/camera/panorama/PanoramaSetting;->use_luminance_correction:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 230
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "PanoramaSetting{aovx="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/android/camera/panorama/PanoramaSetting;->aovx:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ", aovy="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/android/camera/panorama/PanoramaSetting;->aovy:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ", shrink_ratio="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/android/camera/panorama/PanoramaSetting;->shrink_ratio:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ", calcseam_pixnum="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/android/camera/panorama/PanoramaSetting;->calcseam_pixnum:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", use_deform="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/android/camera/panorama/PanoramaSetting;->use_deform:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", use_luminance_correction="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/android/camera/panorama/PanoramaSetting;->use_luminance_correction:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", seamsearch_ratio="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/android/camera/panorama/PanoramaSetting;->seamsearch_ratio:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ", zrotation_coeff="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/android/camera/panorama/PanoramaSetting;->zrotation_coeff:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ", draw_threshold="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/android/camera/panorama/PanoramaSetting;->draw_threshold:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ", aov_gain="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/android/camera/panorama/PanoramaSetting;->aov_gain:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ", distortion_k1="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/android/camera/panorama/PanoramaSetting;->distortion_k1:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ", distortion_k2="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/android/camera/panorama/PanoramaSetting;->distortion_k2:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ", distortion_k3="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/android/camera/panorama/PanoramaSetting;->distortion_k3:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ", distortion_k4="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/android/camera/panorama/PanoramaSetting;->distortion_k4:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ", rotation_ratio="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/android/camera/panorama/PanoramaSetting;->rotation_ratio:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
