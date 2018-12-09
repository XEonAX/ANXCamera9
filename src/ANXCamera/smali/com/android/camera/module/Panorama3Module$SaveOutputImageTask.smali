.class Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;
.super Landroid/os/AsyncTask;
.source "Panorama3Module.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/Panorama3Module;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SaveOutputImageTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Integer;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field private mSaveImage:Z

.field private start_time:J

.field final synthetic this$0:Lcom/android/camera/module/Panorama3Module;


# direct methods
.method constructor <init>(Lcom/android/camera/module/Panorama3Module;Z)V
    .locals 0

    .line 1328
    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 1329
    iput-boolean p2, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->mSaveImage:Z

    .line 1330
    return-void
.end method

.method private savePanoramaPicture()V
    .locals 8

    .line 1340
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$100()Ljava/lang/String;

    move-result-object v0

    const-string v1, "savePanoramaPicture start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1343
    nop

    .line 1344
    nop

    .line 1345
    nop

    .line 1346
    nop

    .line 1348
    nop

    .line 1351
    nop

    .line 1354
    nop

    .line 1357
    nop

    .line 1360
    const/16 v0, 0x600

    sget-object v1, Lcom/android/camera/module/Panorama3Module;->mEngineLock:Ljava/lang/Object;

    monitor-enter v1

    .line 1366
    :try_start_0
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$100()Ljava/lang/String;

    move-result-object v2

    const-string v3, "savePanoramaPicture enter mEngineLock"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1368
    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v2}, Lcom/android/camera/module/Panorama3Module;->access$1200(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/MorphoPanoramaGP3;

    move-result-object v2

    if-nez v2, :cond_0

    .line 1369
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$100()Ljava/lang/String;

    move-result-object v0

    const-string v2, "savePanoramaPicture while mMorphoPanoramaGP3 is null"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1426
    :try_start_1
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v0}, Lcom/android/camera/module/Panorama3Module;->access$1700(Lcom/android/camera/module/Panorama3Module;)V

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1370
    return-void

    .line 1373
    :cond_0
    :try_start_2
    iget-boolean v2, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->mSaveImage:Z

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-nez v2, :cond_2

    .line 1374
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$100()Ljava/lang/String;

    move-result-object v0

    const-string v2, "savePanoramaPicture, don\'t save image"

    new-array v5, v3, [Ljava/lang/Object;

    invoke-static {v2, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1375
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v0}, Lcom/android/camera/module/Panorama3Module;->access$1200(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/MorphoPanoramaGP3;

    move-result-object v0

    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v2}, Lcom/android/camera/module/Panorama3Module;->access$1300(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/RoundDetector;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/panorama/RoundDetector;->currentDegree0Base()I

    move-result v2

    int-to-double v5, v2

    invoke-virtual {v0, v4, v5, v6}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->end(ID)I

    move-result v0

    .line 1376
    if-eqz v0, :cond_1

    .line 1377
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$100()Ljava/lang/String;

    move-result-object v2

    const-string v5, "savePanoramaPicture, end() -> 0x%x"

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v4, v3

    invoke-static {v5, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1426
    :cond_1
    :try_start_3
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v0}, Lcom/android/camera/module/Panorama3Module;->access$1700(Lcom/android/camera/module/Panorama3Module;)V

    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 1379
    return-void

    .line 1382
    :cond_2
    :try_start_4
    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v2}, Lcom/android/camera/module/Panorama3Module;->access$1200(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/MorphoPanoramaGP3;

    move-result-object v2

    invoke-virtual {v2, v3}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->setNoiseReductionParam(I)I

    move-result v2

    .line 1383
    if-eqz v2, :cond_3

    .line 1384
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$100()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "setNoiseReductionParam error ret:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v5, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1387
    :cond_3
    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v2}, Lcom/android/camera/module/Panorama3Module;->access$1200(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/MorphoPanoramaGP3;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->setUnsharpStrength(I)I

    move-result v0

    .line 1388
    if-eqz v0, :cond_4

    .line 1389
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$100()Ljava/lang/String;

    move-result-object v2

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "setUnsharpStrength error ret:0x%08X"

    new-array v7, v4, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v7, v3

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1392
    :cond_4
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v0}, Lcom/android/camera/module/Panorama3Module;->access$1200(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/MorphoPanoramaGP3;

    move-result-object v0

    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v2}, Lcom/android/camera/module/Panorama3Module;->access$1300(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/RoundDetector;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/panorama/RoundDetector;->currentDegree0Base()I

    move-result v2

    int-to-double v5, v2

    invoke-virtual {v0, v4, v5, v6}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->end(ID)I

    move-result v0

    .line 1394
    if-eqz v0, :cond_5

    .line 1395
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$100()Ljava/lang/String;

    move-result-object v2

    const-string v5, "savePanoramaPicture, end() -> 0x%x"

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v4, v3

    invoke-static {v5, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 1426
    :try_start_5
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v0}, Lcom/android/camera/module/Panorama3Module;->access$1700(Lcom/android/camera/module/Panorama3Module;)V

    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 1396
    return-void

    .line 1399
    :cond_5
    :try_start_6
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 1400
    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v2}, Lcom/android/camera/module/Panorama3Module;->access$1200(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/MorphoPanoramaGP3;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->getClippingRect(Landroid/graphics/Rect;)I

    move-result v2

    .line 1401
    if-eqz v2, :cond_6

    .line 1402
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$100()Ljava/lang/String;

    move-result-object v0

    const-string v5, "getClippingRect() -> 0x%x"

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v4, v3

    invoke-static {v5, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 1426
    :try_start_7
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v0}, Lcom/android/camera/module/Panorama3Module;->access$1700(Lcom/android/camera/module/Panorama3Module;)V

    monitor-exit v1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 1403
    return-void

    .line 1406
    :cond_6
    :try_start_8
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v2

    .line 1407
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v3

    .line 1409
    if-eqz v2, :cond_a

    if-nez v3, :cond_7

    goto :goto_0

    .line 1414
    :cond_7
    iget-object v5, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v5}, Lcom/android/camera/module/Panorama3Module;->access$1200(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/MorphoPanoramaGP3;

    move-result-object v5

    invoke-virtual {v5, v0}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->createOutputImage(Landroid/graphics/Rect;)I

    move-result v0

    .line 1415
    if-eqz v0, :cond_8

    .line 1416
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$100()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "createOutputImage error ret:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 1426
    :try_start_9
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v0}, Lcom/android/camera/module/Panorama3Module;->access$1700(Lcom/android/camera/module/Panorama3Module;)V

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 1417
    return-void

    .line 1420
    :cond_8
    :try_start_a
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    iget-object v5, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v5}, Lcom/android/camera/module/Panorama3Module;->access$1400(Lcom/android/camera/module/Panorama3Module;)J

    move-result-wide v5

    invoke-static {v0, v5, v6}, Lcom/android/camera/module/Panorama3Module;->access$1500(Lcom/android/camera/module/Panorama3Module;J)Ljava/lang/String;

    move-result-object v0

    .line 1421
    invoke-static {v0}, Lcom/android/camera/storage/Storage;->generateFilepath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1422
    iget-object v5, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v5, v0, v2, v3}, Lcom/android/camera/module/Panorama3Module;->access$1600(Lcom/android/camera/module/Panorama3Module;Ljava/lang/String;II)Z

    move-result v5
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    if-nez v5, :cond_9

    .line 1426
    :try_start_b
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v0}, Lcom/android/camera/module/Panorama3Module;->access$1700(Lcom/android/camera/module/Panorama3Module;)V

    monitor-exit v1

    .line 1423
    return-void

    .line 1426
    :cond_9
    iget-object v5, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v5}, Lcom/android/camera/module/Panorama3Module;->access$1700(Lcom/android/camera/module/Panorama3Module;)V

    .line 1427
    nop

    .line 1429
    nop

    .line 1430
    iget-object v5, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v5, v4}, Lcom/android/camera/module/Panorama3Module;->access$1800(Lcom/android/camera/module/Panorama3Module;I)I

    move-result v4

    .line 1431
    iget-object v5, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v5, v0, v2, v3, v4}, Lcom/android/camera/module/Panorama3Module;->access$1900(Lcom/android/camera/module/Panorama3Module;Ljava/lang/String;III)V

    .line 1432
    monitor-exit v1
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    .line 1433
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$100()Ljava/lang/String;

    move-result-object v0

    const-string v1, "savePanoramaPicture end"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1434
    return-void

    .line 1410
    :cond_a
    :goto_0
    :try_start_c
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$100()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getClippingRect() "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 1426
    :try_start_d
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v0}, Lcom/android/camera/module/Panorama3Module;->access$1700(Lcom/android/camera/module/Panorama3Module;)V

    monitor-exit v1

    .line 1411
    return-void

    .line 1426
    :catchall_0
    move-exception v0

    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v2}, Lcom/android/camera/module/Panorama3Module;->access$1700(Lcom/android/camera/module/Panorama3Module;)V

    throw v0

    .line 1432
    :catchall_1
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    throw v0
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Integer;
    .locals 1

    .line 1334
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$100()Ljava/lang/String;

    move-result-object p1

    const-string v0, "doInBackground>>"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1335
    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->savePanoramaPicture()V

    .line 1336
    const/4 p1, 0x0

    return-object p1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1324
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Ljava/lang/Integer;)V
    .locals 8

    .line 1448
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$100()Ljava/lang/String;

    move-result-object p1

    const-string v0, "PanoramaFinish done"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1450
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    iget-object p1, p1, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-static {p1}, Lcom/android/camera/AutoLockManager;->getInstance(Landroid/content/Context;)Lcom/android/camera/AutoLockManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/AutoLockManager;->hibernateDelayed()V

    .line 1451
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    iget-boolean p1, p1, Lcom/android/camera/module/Panorama3Module;->mPaused:Z

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 1452
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {p1, v0}, Lcom/android/camera/module/Panorama3Module;->access$602(Lcom/android/camera/module/Panorama3Module;Z)Z

    .line 1453
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$100()Ljava/lang/String;

    move-result-object p1

    const-string v0, "panorama mode has been paused"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1454
    return-void

    .line 1457
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v1, 0xb0

    .line 1458
    invoke-virtual {p1, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;

    .line 1460
    if-eqz p1, :cond_1

    .line 1461
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$100()Ljava/lang/String;

    move-result-object v1

    const-string v2, "onPostExecute setDisplayPreviewBitmap null"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1462
    const/4 v1, 0x0

    invoke-interface {p1, v1}, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;->setDisplayPreviewBitmap(Landroid/graphics/Bitmap;)V

    .line 1464
    :cond_1
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {p1}, Lcom/android/camera/module/Panorama3Module;->access$1000(Lcom/android/camera/module/Panorama3Module;)Landroid/graphics/Bitmap;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 1465
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {p1}, Lcom/android/camera/module/Panorama3Module;->access$1000(Lcom/android/camera/module/Panorama3Module;)Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 1468
    :cond_2
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    iget-object p1, p1, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object p1

    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Lcom/android/camera/ThumbnailUpdater;->updateThumbnailView(Z)V

    .line 1470
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    iget-object p1, p1, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz p1, :cond_5

    .line 1471
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    iget-boolean p1, p1, Lcom/android/camera/module/Panorama3Module;->mAeLockSupported:Z

    if-eqz p1, :cond_3

    .line 1472
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    iget-object p1, p1, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {p1, v0}, Lcom/android/camera2/Camera2Proxy;->setAELock(Z)V

    .line 1474
    :cond_3
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    iget-boolean p1, p1, Lcom/android/camera/module/Panorama3Module;->mAwbLockSupported:Z

    if-eqz p1, :cond_4

    .line 1475
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    iget-object p1, p1, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {p1, v0}, Lcom/android/camera2/Camera2Proxy;->setAWBLock(Z)V

    .line 1477
    :cond_4
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    iget-object p1, p1, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v2}, Lcom/android/camera/module/Panorama3Module;->access$2000(Lcom/android/camera/module/Panorama3Module;)I

    move-result v2

    invoke-virtual {p1, v2}, Lcom/android/camera2/Camera2Proxy;->setFocusMode(I)V

    .line 1478
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {p1}, Lcom/android/camera/module/Panorama3Module;->access$2100(Lcom/android/camera/module/Panorama3Module;)V

    .line 1479
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-virtual {p1, v1}, Lcom/android/camera/module/Panorama3Module;->enableCameraControls(Z)V

    .line 1481
    :cond_5
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    iget-object p1, p1, Lcom/android/camera/module/Panorama3Module;->mMainHandler:Landroid/os/Handler;

    new-instance v2, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask$1;

    invoke-direct {v2, p0}, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask$1;-><init>(Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;)V

    invoke-virtual {p1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1488
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {p1, v0}, Lcom/android/camera/module/Panorama3Module;->access$602(Lcom/android/camera/module/Panorama3Module;Z)Z

    .line 1490
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$100()Ljava/lang/String;

    move-result-object p1

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v3, "[MORTIME] PanoramaFinish time = %d"

    new-array v1, v1, [Ljava/lang/Object;

    .line 1491
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->start_time:J

    sub-long/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v1, v0

    .line 1490
    invoke-static {v2, v3, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1492
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 1324
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->onPostExecute(Ljava/lang/Integer;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 2

    .line 1438
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->start_time:J

    .line 1441
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 1442
    const/16 v1, 0xa2

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 1443
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->updateLoading(Z)V

    .line 1444
    return-void
.end method
