.class public Lcom/mi/config/a;
.super Lcom/android/camera/data/data/DataItemBase;
.source "DataItemFeature.java"

# interfaces
.implements Lcom/mi/config/c;


# static fields
.field private static final TAG:Ljava/lang/String; = "DataFeature"


# instance fields
.field private pD:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Lcom/android/camera/data/data/DataItemBase;-><init>()V

    .line 30
    invoke-virtual {p0}, Lcom/mi/config/a;->eO()V

    .line 31
    return-void
.end method

.method private A(Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 81
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 82
    invoke-virtual {v0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object p1

    .line 83
    invoke-virtual {p0}, Lcom/mi/config/a;->getValues()Landroid/support/v4/util/SimpleArrayMap;

    move-result-object v1

    .line 84
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 85
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 86
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/support/v4/util/SimpleArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    goto :goto_0

    .line 88
    :cond_0
    return-void
.end method


# virtual methods
.method public B(Ljava/lang/String;)Z
    .locals 1

    .line 91
    invoke-virtual {p0}, Lcom/mi/config/a;->getValues()Landroid/support/v4/util/SimpleArrayMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/v4/util/SimpleArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public eO()V
    .locals 6

    .line 44
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    .line 45
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "feature_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "raw"

    const-string v4, "com.android.camera"

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 51
    if-gtz v1, :cond_0

    .line 52
    const-string v0, "DataFeature"

    const-string v1, "feature list default"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    return-void

    .line 56
    :cond_0
    const/4 v2, 0x0

    .line 58
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 60
    :try_start_0
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/InputStreamReader;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v0

    invoke-direct {v5, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v4, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 61
    :goto_0
    :try_start_1
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 62
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 64
    :cond_1
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mi/config/a;->A(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 70
    nop

    .line 72
    :try_start_2
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4

    goto :goto_3

    .line 70
    :catchall_0
    move-exception v0

    move-object v2, v4

    goto :goto_5

    .line 67
    :catch_0
    move-exception v0

    move-object v2, v4

    goto :goto_1

    .line 65
    :catch_1
    move-exception v0

    move-object v2, v4

    goto :goto_2

    .line 70
    :catchall_1
    move-exception v0

    goto :goto_5

    .line 67
    :catch_2
    move-exception v0

    .line 68
    :goto_1
    :try_start_3
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 70
    if-eqz v2, :cond_2

    .line 72
    :try_start_4
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_3

    .line 65
    :catch_3
    move-exception v0

    .line 66
    :goto_2
    :try_start_5
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 70
    if-eqz v2, :cond_2

    .line 72
    :try_start_6
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    .line 75
    :goto_3
    goto :goto_4

    .line 73
    :catch_4
    move-exception v0

    .line 74
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_3

    .line 78
    :cond_2
    :goto_4
    return-void

    .line 70
    :goto_5
    if-eqz v2, :cond_3

    .line 72
    :try_start_7
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_5

    .line 75
    goto :goto_6

    .line 73
    :catch_5
    move-exception v1

    .line 74
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 75
    :cond_3
    :goto_6
    throw v0
.end method

.method public eP()Z
    .locals 2

    .line 95
    const-string v0, "s_a"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public eQ()I
    .locals 2

    .line 99
    const-string v0, "c_t_r"

    const/16 v1, 0x14

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public eR()Z
    .locals 2

    .line 104
    iget-object v0, p0, Lcom/mi/config/a;->pD:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 105
    const-string v0, "ro.boot.hwc"

    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mi/config/a;->pD:Ljava/lang/String;

    .line 108
    :cond_0
    const-string v0, "india"

    iget-object v1, p0, Lcom/mi/config/a;->pD:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public eS()Z
    .locals 2

    .line 112
    iget-object v0, p0, Lcom/mi/config/a;->pD:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 113
    const-string v0, "ro.boot.hwc"

    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mi/config/a;->pD:Ljava/lang/String;

    .line 115
    :cond_0
    const-string v0, "cn"

    iget-object v1, p0, Lcom/mi/config/a;->pD:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public eT()Z
    .locals 2

    .line 119
    const-string v0, "s_i_a"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/mi/config/a;->eR()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    nop

    :cond_0
    return v1
.end method

.method public eU()Z
    .locals 2

    .line 123
    const-string v0, "c_0x0c"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/mi/config/a;->eR()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    nop

    :cond_0
    return v1
.end method

.method public eV()Z
    .locals 2

    .line 127
    const-string v0, "s_z_m"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public eW()Z
    .locals 2

    .line 131
    const-string v0, "a_e_d"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public eX()Z
    .locals 2

    .line 135
    const-string v0, "s_m_f"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public eY()Z
    .locals 2

    .line 140
    const-string v0, "i_l_m_d"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public eZ()Z
    .locals 2

    .line 144
    const-string v0, "s_p_l_b"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public fA()Z
    .locals 2

    .line 277
    invoke-static {}, Lcom/android/camera/Util;->isGlobalVersion()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 278
    return v1

    .line 280
    :cond_0
    const-string v0, "c_0x00_s_l_s"

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public fB()I
    .locals 2

    .line 284
    const-string v0, "c_0x01_p_g_a_v"

    const/16 v1, 0x118

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public fC()F
    .locals 3

    .line 288
    const-string v0, "c_0x02_p_c_r_v"

    const-wide v1, 0x3fec0d1b80000000L    # 0.8766000270843506

    invoke-virtual {p0, v0, v1, v2}, Lcom/mi/config/a;->getDoubleFromValues(Ljava/lang/String;D)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method

.method public fD()Z
    .locals 2

    .line 292
    invoke-static {}, Lcom/android/camera/Util;->isGlobalVersion()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 293
    return v1

    .line 295
    :cond_0
    const-string v0, "c_0x03"

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public fE()Z
    .locals 2

    .line 299
    const-string v0, "s_c_w_m"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public fF()Z
    .locals 2

    .line 315
    const-string v0, "c_0x08"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public fG()Z
    .locals 2

    .line 319
    const-string v0, "c_0x09"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public fH()Z
    .locals 2

    .line 323
    const-string v0, "c_0x0a"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public fI()Z
    .locals 2

    .line 327
    const-string v0, "c_0x10"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public fJ()Z
    .locals 2

    .line 331
    const-string v0, "c_0x11"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public fK()I
    .locals 2

    .line 335
    const-string v0, "c_0x13"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public fL()Z
    .locals 2

    .line 345
    const-string v0, "c_0x0e"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public fM()Z
    .locals 2

    .line 351
    invoke-virtual {p0}, Lcom/mi/config/a;->fN()I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_1

    const-string v0, "c_0x0f"

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    :goto_1
    return v1
.end method

.method public fN()I
    .locals 2

    .line 355
    const-string v0, "c_0x0d"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public fO()I
    .locals 2

    .line 359
    const-string v0, "c_0x12"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public fP()Z
    .locals 2

    .line 363
    const-string v0, "c_0x14"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public fQ()Ljava/lang/String;
    .locals 2

    .line 367
    const-string v0, "c_0x15"

    sget-object v1, Lcom/android/camera/constant/BeautyConstant;->LEVEL_CLOSE:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public fR()Z
    .locals 2

    .line 371
    const-string v0, "c_0x16"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public fa()Z
    .locals 2

    .line 148
    const-string v0, "s_p_l_f"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public fb()Z
    .locals 2

    .line 152
    const-string v0, "s_f_a"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public fc()Z
    .locals 2

    .line 156
    const-string v0, "s_p_a"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public fd()Z
    .locals 2

    .line 160
    const-string v0, "s_v_b"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public fe()Z
    .locals 2

    .line 164
    const-string v0, "s_o_a_w"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public ff()Z
    .locals 2

    .line 168
    const-string v0, "s_f_s"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public fg()Z
    .locals 2

    .line 180
    const-string v0, "s_m_c_t_f"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public fh()Z
    .locals 2

    .line 184
    const-string v0, "s_a_3"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public fi()Z
    .locals 3

    .line 189
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x0

    const/16 v2, 0x1c

    if-ne v0, v2, :cond_0

    const-string v0, "s_s_n"

    .line 190
    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    nop

    .line 189
    :cond_0
    return v1
.end method

.method public fj()Z
    .locals 2

    .line 200
    const-string v0, "s_m_l"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public fk()Z
    .locals 2

    .line 209
    const-string v0, "s_s_v"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public fl()Z
    .locals 2

    .line 213
    const-string v0, "s_s_s"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public fm()Z
    .locals 2

    .line 217
    const-string v0, "s_f_s_c"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public fn()Z
    .locals 2

    .line 221
    const-string v0, "s_b_m"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public fo()I
    .locals 2

    .line 225
    const-string v0, "c_0x0b"

    const/16 v1, 0xb4

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public fp()Z
    .locals 2

    .line 229
    const-string v0, "s_a_u"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public fq()Z
    .locals 2

    .line 233
    const-string v0, "s_f_z_i"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public fr()Z
    .locals 2

    .line 237
    const-string v0, "s_v_f_m"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public fs()Z
    .locals 2

    .line 241
    const-string v0, "s_f_9"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public ft()Z
    .locals 2

    .line 245
    const-string v0, "s_e_l"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public fu()Ljava/lang/String;
    .locals 2

    .line 249
    const-string v0, "h_d_v"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public fv()I
    .locals 2

    .line 253
    const-string v0, "a_l_l_l"

    const/16 v1, 0x15e

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public fw()I
    .locals 2

    .line 257
    const-string v0, "a_l_h_l"

    const/16 v1, 0x12c

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public fx()Z
    .locals 2

    .line 261
    const-string v0, "s_u_w"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public fy()Z
    .locals 2

    .line 265
    const-string v0, "s_c_w_b"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public fz()Z
    .locals 2

    .line 273
    const-string v0, "c_0x04_i_l_h_d"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method protected isMutable()Z
    .locals 1

    .line 341
    const/4 v0, 0x0

    return v0
.end method

.method public isSupport4KUHDEIS()Z
    .locals 2

    .line 311
    const-string v0, "c_0x07"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public isSupportBeautyBody()Z
    .locals 2

    .line 269
    const-string v0, "s_b_b"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public isSupportNormalWideLDC()Z
    .locals 2

    .line 303
    const-string v0, "c_0x05"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public isSupportUltraWideLDC()Z
    .locals 2

    .line 307
    const-string v0, "c_0x06"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public isTransient()Z
    .locals 1

    .line 40
    const/4 v0, 0x1

    return v0
.end method

.method public provideKey()Ljava/lang/String;
    .locals 1

    .line 35
    const/4 v0, 0x0

    return-object v0
.end method
