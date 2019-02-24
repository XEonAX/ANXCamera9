.class Lcom/android/camera/CameraBrightness$CameraBrightnessTask;
.super Landroid/os/AsyncTask;
.source "CameraBrightness.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/CameraBrightness;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CameraBrightnessTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field private final ADJUST_RATIO_BASE:F

.field private final ADJUST_RATIO_RANGE:F

.field private final DEBUG:Z

.field private mActivityWeakReference:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private mCallbackWeakReference:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/camera/CameraBrightnessCallback;",
            ">;"
        }
    .end annotation
.end field

.field private mPaused:Z

.field private mPositiveScreenManualBrightnessSpline:Landroid/util/Spline;

.field private mScreenManualBrightnessSpline:Landroid/util/Spline;

.field private mUseDefaultValue:Z


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lcom/android/camera/CameraBrightnessCallback;ZZ)V
    .locals 1

    .line 62
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 52
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->DEBUG:Z

    .line 53
    const v0, 0x3e99999a    # 0.3f

    iput v0, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->ADJUST_RATIO_RANGE:F

    .line 54
    const v0, 0x3dcccccd    # 0.1f

    iput v0, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->ADJUST_RATIO_BASE:F

    .line 63
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mActivityWeakReference:Ljava/lang/ref/WeakReference;

    .line 64
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mCallbackWeakReference:Ljava/lang/ref/WeakReference;

    .line 65
    iput-boolean p4, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mPaused:Z

    .line 66
    iput-boolean p3, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mUseDefaultValue:Z

    .line 67
    return-void
.end method

.method private createManualBrightnessSpline([I[I)Landroid/util/Spline;
    .locals 5

    .line 338
    :try_start_0
    array-length v0, p1

    .line 339
    new-array v1, v0, [F

    .line 340
    new-array v2, v0, [F

    .line 342
    const/4 v3, 0x0

    :goto_0
    if-ge v3, v0, :cond_0

    .line 343
    aget v4, p1, v3

    int-to-float v4, v4

    aput v4, v1, v3

    .line 344
    aget v4, p2, v3

    int-to-float v4, v4

    aput v4, v2, v3

    .line 342
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 347
    :cond_0
    new-instance p1, Lcom/android/camera/CameraBrightness$MonotoneCubicSpline;

    invoke-direct {p1, v1, v2}, Lcom/android/camera/CameraBrightness$MonotoneCubicSpline;-><init>([F[F)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 354
    return-object p1

    .line 355
    :catch_0
    move-exception p1

    .line 356
    const-string p2, "CameraBrightness"

    const-string v0, "Could not create manual-brightness spline."

    invoke-static {p2, v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 357
    const/4 p1, 0x0

    return-object p1
.end method

.method private createSpline()V
    .locals 3

    .line 252
    iget-object v0, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mScreenManualBrightnessSpline:Landroid/util/Spline;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mPositiveScreenManualBrightnessSpline:Landroid/util/Spline;

    if-nez v0, :cond_2

    :cond_0
    const-string v0, "config_manual_spline_available"

    const/4 v1, 0x1

    .line 254
    invoke-direct {p0, v0, v1}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->getAndroidBoolRes(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 255
    const-string v0, "config_manualBrightnessRemapIn"

    invoke-direct {p0, v0}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->getAndroidArrayRes(Ljava/lang/String;)[I

    move-result-object v0

    .line 256
    const-string v1, "config_manualBrightnessRemapOut"

    invoke-direct {p0, v1}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->getAndroidArrayRes(Ljava/lang/String;)[I

    move-result-object v1

    .line 258
    invoke-direct {p0, v1, v0}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->createManualBrightnessSpline([I[I)Landroid/util/Spline;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mScreenManualBrightnessSpline:Landroid/util/Spline;

    .line 259
    invoke-direct {p0, v0, v1}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->createManualBrightnessSpline([I[I)Landroid/util/Spline;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mPositiveScreenManualBrightnessSpline:Landroid/util/Spline;

    .line 260
    iget-object v0, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mScreenManualBrightnessSpline:Landroid/util/Spline;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mPositiveScreenManualBrightnessSpline:Landroid/util/Spline;

    if-nez v0, :cond_2

    .line 261
    :cond_1
    const-string v0, "CameraBrightness"

    const-string v1, "Error to create manual brightness spline"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 264
    :cond_2
    return-void
.end method

.method private execCommand(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .line 218
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 219
    const-string v2, ""

    .line 220
    nop

    .line 222
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object p1

    .line 223
    invoke-virtual {p1}, Ljava/lang/Process;->waitFor()I

    move-result v3

    if-eqz v3, :cond_0

    .line 224
    const-string v0, "CameraBrightness"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "exit value = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Process;->exitValue()I

    move-result p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 225
    return-object v2

    .line 227
    :cond_0
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    .line 228
    invoke-virtual {p1}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object p1

    invoke-direct {v4, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 229
    new-instance p1, Ljava/lang/StringBuffer;

    invoke-direct {p1}, Ljava/lang/StringBuffer;-><init>()V

    .line 230
    nop

    .line 231
    :goto_0
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 232
    invoke-virtual {p1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 234
    :cond_1
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V

    .line 235
    invoke-virtual {p1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 236
    :try_start_1
    const-string v2, "CameraBrightness"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "execCommand lcd value="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " cost="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 243
    nop

    .line 244
    move-object v2, p1

    goto :goto_3

    .line 240
    :catch_0
    move-exception v0

    move-object v2, p1

    move-object p1, v0

    goto :goto_1

    .line 237
    :catch_1
    move-exception v0

    move-object v2, p1

    move-object p1, v0

    goto :goto_2

    .line 240
    :catch_2
    move-exception p1

    .line 241
    :goto_1
    const-string v0, "CameraBrightness"

    const-string v1, "execCommand IOException"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 242
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_3

    .line 237
    :catch_3
    move-exception p1

    .line 238
    :goto_2
    const-string v0, "CameraBrightness"

    const-string v1, "execCommand InterruptedException"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 239
    invoke-virtual {p1}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 243
    nop

    .line 244
    :goto_3
    return-object v2
.end method

.method private getAndroidArrayRes(Ljava/lang/String;)[I
    .locals 3

    .line 290
    const/4 v0, 0x0

    :try_start_0
    const-class v1, Lcom/android/internal/R$array;

    const-string v2, "I"

    invoke-static {v1, p1, v2}, Lmiui/reflect/Field;->of(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Field;

    move-result-object v1

    .line 291
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 292
    invoke-virtual {v1, v0}, Lmiui/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v1

    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getIntArray(I)[I

    move-result-object v1
    :try_end_0
    .catch Lmiui/reflect/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 291
    return-object v1

    .line 295
    :catch_0
    move-exception v1

    .line 296
    const-string v2, "CameraBrightness"

    invoke-virtual {v1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 293
    :catch_1
    move-exception v1

    .line 294
    const-string v2, "CameraBrightness"

    invoke-virtual {v1}, Lmiui/reflect/NoSuchFieldException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 297
    nop

    .line 299
    :goto_0
    :try_start_1
    const-class v1, Landroid/miui/R$array;

    const-string v2, "I"

    invoke-static {v1, p1, v2}, Lmiui/reflect/Field;->of(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Field;

    move-result-object p1

    .line 300
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 301
    invoke-virtual {p1, v0}, Lmiui/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result p1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getIntArray(I)[I

    move-result-object p1
    :try_end_1
    .catch Lmiui/reflect/NoSuchFieldException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_2

    .line 300
    return-object p1

    .line 304
    :catch_2
    move-exception p1

    .line 305
    const-string v0, "CameraBrightness"

    invoke-virtual {p1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 302
    :catch_3
    move-exception p1

    .line 303
    const-string v0, "CameraBrightness"

    invoke-virtual {p1}, Lmiui/reflect/NoSuchFieldException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 306
    nop

    .line 307
    :goto_1
    const/4 p1, 0x2

    new-array p1, p1, [I

    fill-array-data p1, :array_0

    return-object p1

    :array_0
    .array-data 4
        0x0
        0xff
    .end array-data
.end method

.method private getAndroidBoolRes(Ljava/lang/String;Z)Z
    .locals 3

    .line 268
    const/4 v0, 0x0

    :try_start_0
    const-class v1, Lcom/android/internal/R$bool;

    const-string v2, "I"

    invoke-static {v1, p1, v2}, Lmiui/reflect/Field;->of(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Field;

    move-result-object v1

    .line 269
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 270
    invoke-virtual {v1, v0}, Lmiui/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v1

    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v1
    :try_end_0
    .catch Lmiui/reflect/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 269
    return v1

    .line 273
    :catch_0
    move-exception v1

    .line 274
    const-string v2, "CameraBrightness"

    invoke-virtual {v1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 271
    :catch_1
    move-exception v1

    .line 272
    const-string v2, "CameraBrightness"

    invoke-virtual {v1}, Lmiui/reflect/NoSuchFieldException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 275
    nop

    .line 277
    :goto_0
    :try_start_1
    const-class v1, Landroid/miui/R$bool;

    const-string v2, "I"

    invoke-static {v1, p1, v2}, Lmiui/reflect/Field;->of(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Field;

    move-result-object p1

    .line 278
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 279
    invoke-virtual {p1, v0}, Lmiui/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result p1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p1
    :try_end_1
    .catch Lmiui/reflect/NoSuchFieldException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_2

    .line 278
    return p1

    .line 282
    :catch_2
    move-exception p1

    .line 283
    const-string v0, "CameraBrightness"

    invoke-virtual {p1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 280
    :catch_3
    move-exception p1

    .line 281
    const-string v0, "CameraBrightness"

    invoke-virtual {p1}, Lmiui/reflect/NoSuchFieldException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 284
    nop

    .line 285
    :goto_1
    return p2
.end method

.method private getAndroidIntResource(Ljava/lang/String;)I
    .locals 2

    .line 312
    :try_start_0
    const-class v0, Lcom/android/internal/R$integer;

    const-string v1, "I"

    invoke-static {v0, p1, v1}, Lmiui/reflect/Field;->of(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Field;

    move-result-object p1

    .line 313
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/4 v1, 0x0

    .line 314
    invoke-virtual {p1, v1}, Lmiui/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1
    :try_end_0
    .catch Lmiui/reflect/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 313
    return p1

    .line 317
    :catch_0
    move-exception p1

    .line 318
    const-string v0, "CameraBrightness"

    invoke-virtual {p1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 315
    :catch_1
    move-exception p1

    .line 316
    const-string v0, "CameraBrightness"

    invoke-virtual {p1}, Lmiui/reflect/NoSuchFieldException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 319
    nop

    .line 320
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method private getBrightIsAndroidP(Landroid/view/WindowManager$LayoutParams;Landroid/app/Activity;)Ljava/lang/Integer;
    .locals 5
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 118
    const/4 v0, 0x0

    :try_start_0
    const-class v1, Landroid/os/PowerManager;

    const-string v2, "BRIGHTNESS_ON"

    invoke-static {v1, v2}, Lmiui/util/ReflectionUtils;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const-class v2, Landroid/os/PowerManager;

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v1

    .line 119
    invoke-virtual {p2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    const-string v2, "screen_brightness"

    invoke-static {p2, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I

    move-result p2

    .line 120
    const-string v2, "CameraBrightness"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "android P -> current back light -> "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 124
    nop

    .line 126
    mul-int/lit16 p2, p2, 0x100

    int-to-float p2, p2

    add-int/lit8 v1, v1, 0x1

    int-to-float v1, v1

    div-float/2addr p2, v1

    .line 127
    float-to-double v1, p2

    invoke-static {v1, v2}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v1

    double-to-int p2, v1

    invoke-direct {p0, p2}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->toEnLargeBrightness(I)I

    move-result p2

    int-to-float p2, p2

    .line 128
    iget v1, p1, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-lez v1, :cond_0

    iget p1, p1, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    const/high16 v1, 0x437f0000    # 255.0f

    mul-float/2addr p1, v1

    float-to-int p1, p1

    int-to-float p1, p1

    cmpl-float p1, p2, p1

    if-nez p1, :cond_0

    .line 129
    const-string p1, "CameraBrightness"

    const-string p2, "android P -> doInBackground brightness unchanged"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    return-object v0

    .line 132
    :cond_0
    float-to-int p1, p2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1

    .line 121
    :catch_0
    move-exception p1

    .line 122
    const-string p2, "CameraBrightness"

    invoke-virtual {p1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 123
    return-object v0
.end method

.method private getBrightNotAndroidP(Landroid/view/WindowManager$LayoutParams;)Ljava/lang/Integer;
    .locals 4
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 84
    invoke-direct {p0}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->getCurrentBackLight()I

    move-result v0

    .line 85
    const-string v1, "CameraBrightness"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "current back light -> "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    const/4 v1, 0x0

    if-gtz v0, :cond_0

    .line 87
    return-object v1

    .line 89
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->createSpline()V

    .line 91
    iget v2, p1, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-lez v2, :cond_2

    .line 92
    iget p1, p1, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    const/high16 v2, 0x437f0000    # 255.0f

    mul-float/2addr p1, v2

    .line 94
    iget-object v2, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mPositiveScreenManualBrightnessSpline:Landroid/util/Spline;

    if-eqz v2, :cond_1

    .line 95
    iget-object v2, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mPositiveScreenManualBrightnessSpline:Landroid/util/Spline;

    invoke-virtual {v2, p1}, Landroid/util/Spline;->interpolate(F)F

    move-result p1

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    goto :goto_0

    .line 97
    :cond_1
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    .line 100
    :goto_0
    sub-int/2addr p1, v0

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result p1

    const/4 v2, 0x1

    if-gt p1, v2, :cond_2

    .line 101
    const-string p1, "CameraBrightness"

    const-string v0, "doInBackground brightness unchanged"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    return-object v1

    .line 105
    :cond_2
    nop

    .line 106
    iget-object p1, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mScreenManualBrightnessSpline:Landroid/util/Spline;

    if-eqz p1, :cond_3

    .line 107
    iget-object p1, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mScreenManualBrightnessSpline:Landroid/util/Spline;

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Landroid/util/Spline;->interpolate(F)F

    move-result p1

    float-to-int v0, p1

    .line 109
    :cond_3
    invoke-direct {p0, v0}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->toEnLargeBrightness(I)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method private getCurrentBackLight()I
    .locals 4

    .line 173
    nop

    .line 174
    nop

    .line 176
    const/4 v0, 0x0

    const/4 v1, 0x0

    :cond_0
    :goto_0
    const-string v2, "0"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    if-nez v0, :cond_4

    :cond_1
    const/4 v2, 0x3

    if-ge v1, v2, :cond_4

    .line 177
    invoke-virtual {p0}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->isCancelled()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 178
    goto :goto_2

    .line 180
    :cond_2
    const-string v0, "cat sys/class/backlight/panel0-backlight/brightness"

    invoke-direct {p0, v0}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->execCommand(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 181
    const-string v2, "0"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    if-nez v0, :cond_0

    .line 183
    :cond_3
    const-wide/16 v2, 0x12c

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 186
    goto :goto_1

    .line 184
    :catch_0
    move-exception v2

    .line 185
    const-string v3, "CameraBrightness"

    invoke-virtual {v2}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 187
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 190
    :cond_4
    :goto_2
    const-string v1, "CameraBrightness"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getCurrentBackLight currentSetting="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, -0x1

    if-nez v1, :cond_8

    .line 192
    const-string v1, "config_backlightBits"

    invoke-direct {p0, v1}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->getAndroidIntResource(Ljava/lang/String;)I

    move-result v1

    .line 193
    if-gtz v1, :cond_5

    .line 195
    const-string v1, "config_backlightBit"

    invoke-direct {p0, v1}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->getMiuiIntResource(Ljava/lang/String;)I

    move-result v1

    .line 197
    :cond_5
    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    float-to-int v0, v0

    .line 198
    const/16 v3, 0x8

    if-le v1, v3, :cond_7

    .line 199
    sub-int/2addr v1, v3

    .line 200
    const/4 v2, 0x1

    shl-int v3, v2, v1

    if-ge v0, v3, :cond_6

    .line 201
    goto :goto_3

    .line 203
    :cond_6
    shr-int v2, v0, v1

    .line 205
    :goto_3
    const-string v0, "CameraBrightness"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getCurrentBackLight convert to "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 206
    nop

    .line 211
    return v2

    .line 209
    :cond_7
    return v2

    .line 213
    :cond_8
    return v2
.end method

.method private getMiuiIntResource(Ljava/lang/String;)I
    .locals 2

    .line 325
    :try_start_0
    const-class v0, Landroid/miui/R$integer;

    const-string v1, "I"

    invoke-static {v0, p1, v1}, Lmiui/reflect/Field;->of(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Field;

    move-result-object p1

    .line 326
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/4 v1, 0x0

    .line 327
    invoke-virtual {p1, v1}, Lmiui/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1
    :try_end_0
    .catch Lmiui/reflect/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 326
    return p1

    .line 330
    :catch_0
    move-exception p1

    .line 331
    const-string v0, "CameraBrightness"

    invoke-virtual {p1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 328
    :catch_1
    move-exception p1

    .line 329
    const-string v0, "CameraBrightness"

    invoke-virtual {p1}, Lmiui/reflect/NoSuchFieldException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 332
    nop

    .line 333
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method private toEnLargeBrightness(I)I
    .locals 7

    .line 165
    nop

    .line 166
    const/4 v0, 0x0

    const/16 v1, 0xb9

    invoke-static {p1, v0, v1}, Lcom/android/camera/Util;->clamp(III)I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x43390000    # 185.0f

    div-float/2addr v1, v2

    const v2, 0x3e99999a    # 0.3f

    mul-float/2addr v1, v2

    const v2, 0x3dcccccd    # 0.1f

    add-float/2addr v2, v1

    .line 167
    int-to-double v3, p1

    float-to-double v1, v2

    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    add-double/2addr v5, v1

    mul-double/2addr v3, v5

    double-to-int p1, v3

    .line 168
    const/16 v1, 0xff

    invoke-static {p1, v0, v1}, Lcom/android/camera/Util;->clamp(III)I

    move-result p1

    .line 169
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    return p1
.end method

.method private updateBrightness(I)V
    .locals 5

    .line 145
    iget-object v0, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mActivityWeakReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 146
    if-eqz v0, :cond_3

    const/4 v1, -0x1

    if-ne p1, v1, :cond_0

    iget-boolean v1, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mUseDefaultValue:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mPaused:Z

    if-nez v1, :cond_0

    goto :goto_1

    .line 147
    :cond_0
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    .line 148
    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    .line 149
    iget-boolean v2, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mUseDefaultValue:Z

    if-nez v2, :cond_1

    iget-boolean v2, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mPaused:Z

    if-nez v2, :cond_1

    .line 150
    int-to-float v2, p1

    const/high16 v3, 0x437f0000    # 255.0f

    div-float/2addr v2, v3

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    goto :goto_0

    .line 152
    :cond_1
    const/high16 v2, -0x40800000    # -1.0f

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    .line 154
    :goto_0
    const-string v2, "CameraBrightness"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "updateBrightness setting="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " useDefaultValue="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v4, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mUseDefaultValue:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v4, " screenBrightness="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, v1, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 157
    iget-object v0, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mCallbackWeakReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/CameraBrightnessCallback;

    .line 158
    if-eqz v0, :cond_2

    .line 159
    invoke-interface {v0, p1}, Lcom/android/camera/CameraBrightnessCallback;->setBrightness(I)V

    .line 161
    :cond_2
    return-void

    .line 146
    :cond_3
    :goto_1
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Integer;
    .locals 3

    .line 70
    const-string p1, "CameraBrightness"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "doInBackground useDefaultValue="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mUseDefaultValue:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, " paused="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mPaused:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    iget-object p1, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mActivityWeakReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/Activity;

    .line 72
    if-eqz p1, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mUseDefaultValue:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mPaused:Z

    if-nez v0, :cond_1

    .line 73
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    .line 74
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1c

    if-lt v1, v2, :cond_0

    .line 75
    invoke-direct {p0, v0, p1}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->getBrightIsAndroidP(Landroid/view/WindowManager$LayoutParams;Landroid/app/Activity;)Ljava/lang/Integer;

    move-result-object p1

    goto :goto_0

    :cond_0
    invoke-direct {p0, v0}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->getBrightNotAndroidP(Landroid/view/WindowManager$LayoutParams;)Ljava/lang/Integer;

    move-result-object p1

    .line 74
    :goto_0
    return-object p1

    .line 77
    :cond_1
    const/4 p1, -0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 51
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Ljava/lang/Integer;)V
    .locals 1

    .line 137
    invoke-virtual {p0}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    .line 140
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-direct {p0, p1}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->updateBrightness(I)V

    .line 141
    return-void

    .line 138
    :cond_1
    :goto_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 51
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->onPostExecute(Ljava/lang/Integer;)V

    return-void
.end method
