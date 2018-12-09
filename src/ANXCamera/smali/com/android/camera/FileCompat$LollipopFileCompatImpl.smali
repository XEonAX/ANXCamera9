.class Lcom/android/camera/FileCompat$LollipopFileCompatImpl;
.super Lcom/android/camera/FileCompat$BaseFileCompatImpl;
.source "FileCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/FileCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "LollipopFileCompatImpl"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 440
    invoke-direct {p0}, Lcom/android/camera/FileCompat$BaseFileCompatImpl;-><init>()V

    return-void
.end method


# virtual methods
.method public copyFile(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 684
    invoke-super {p0, p1, p2}, Lcom/android/camera/FileCompat$BaseFileCompatImpl;->copyFile(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public createNewFile(Ljava/lang/String;)Z
    .locals 3

    .line 605
    invoke-super {p0, p1}, Lcom/android/camera/FileCompat$BaseFileCompatImpl;->createNewFile(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 606
    return v1

    .line 607
    :cond_0
    invoke-static {p1}, Lcom/android/camera/FileCompat;->isSDFile(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_1

    .line 608
    return v2

    .line 611
    :cond_1
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v1, v0, v2}, Lcom/android/camera/FileCompat$LollipopFileCompatImpl;->getDocumentFileByPath(Ljava/lang/String;ZLjava/lang/String;Z)Landroid/support/v4/provider/DocumentFile;

    move-result-object p1

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    move v1, v2

    :goto_0
    return v1
.end method

.method public createNewFileFixPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 616
    invoke-super {p0, p1}, Lcom/android/camera/FileCompat$BaseFileCompatImpl;->createNewFile(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 617
    return-object p1

    .line 618
    :cond_0
    invoke-static {p1}, Lcom/android/camera/FileCompat;->isSDFile(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 619
    return-object v1

    .line 622
    :cond_1
    const/4 v0, 0x1

    const/4 v2, 0x0

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/android/camera/FileCompat$LollipopFileCompatImpl;->getDocumentFileByPath(Ljava/lang/String;ZLjava/lang/String;Z)Landroid/support/v4/provider/DocumentFile;

    move-result-object v0

    .line 623
    if-nez v0, :cond_2

    .line 624
    return-object v1

    .line 627
    :cond_2
    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    .line 628
    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 629
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroid/support/v4/provider/DocumentFile;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 630
    return-object p1
.end method

.method public deleteFile(Ljava/lang/String;)Z
    .locals 3

    .line 635
    invoke-super {p0, p1}, Lcom/android/camera/FileCompat$BaseFileCompatImpl;->deleteFile(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 636
    return v1

    .line 637
    :cond_0
    invoke-static {p1}, Lcom/android/camera/FileCompat;->isSDFile(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_1

    .line 638
    return v2

    .line 641
    :cond_1
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v2, v0, v2}, Lcom/android/camera/FileCompat$LollipopFileCompatImpl;->getDocumentFileByPath(Ljava/lang/String;ZLjava/lang/String;Z)Landroid/support/v4/provider/DocumentFile;

    move-result-object p1

    .line 642
    if-nez p1, :cond_2

    goto :goto_0

    :cond_2
    invoke-virtual {p1}, Landroid/support/v4/provider/DocumentFile;->delete()Z

    move-result v1

    :goto_0
    return v1
.end method

.method public exists(Ljava/lang/String;)Z
    .locals 3

    .line 594
    invoke-super {p0, p1}, Lcom/android/camera/FileCompat$BaseFileCompatImpl;->exists(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 595
    return v1

    .line 596
    :cond_0
    invoke-static {p1}, Lcom/android/camera/FileCompat;->isSDFile(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_1

    .line 597
    return v2

    .line 599
    :cond_1
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v2, v0, v2}, Lcom/android/camera/FileCompat$LollipopFileCompatImpl;->getDocumentFileByPath(Ljava/lang/String;ZLjava/lang/String;Z)Landroid/support/v4/provider/DocumentFile;

    move-result-object p1

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    move v1, v2

    :goto_0
    return v1
.end method

.method public getDocumentFileByPath(Ljava/lang/String;ZLjava/lang/String;Z)Landroid/support/v4/provider/DocumentFile;
    .locals 10

    .line 452
    invoke-static {p1}, Lcom/android/camera/FileCompat;->access$000(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 453
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 454
    return-object v1

    .line 457
    :cond_0
    invoke-static {v0}, Lcom/android/camera/FileCompat;->access$100(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 458
    if-nez v2, :cond_1

    .line 459
    return-object v1

    .line 463
    :cond_1
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3, v2}, Landroid/support/v4/provider/DocumentFile;->fromTreeUri(Landroid/content/Context;Landroid/net/Uri;)Landroid/support/v4/provider/DocumentFile;

    move-result-object v2

    .line 465
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Landroid/os/Environment;->DIRECTORY_DCIM:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 466
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 467
    return-object v2

    .line 470
    :cond_2
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v3, 0x1

    add-int/2addr v0, v3

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 472
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 473
    return-object v1

    .line 477
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\\"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    .line 478
    array-length v0, p1

    sub-int/2addr v0, v3

    new-array v0, v0, [Ljava/lang/String;

    .line 479
    array-length v4, p1

    sub-int/2addr v4, v3

    const/4 v5, 0x0

    invoke-static {p1, v5, v0, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 481
    nop

    .line 482
    array-length v4, v0

    move-object v6, v2

    move v2, v5

    move v7, v2

    :goto_0
    if-ge v2, v4, :cond_8

    aget-object v8, v0, v2

    .line 484
    if-nez v6, :cond_4

    .line 485
    goto :goto_2

    .line 488
    :cond_4
    if-eqz v7, :cond_5

    .line 489
    invoke-virtual {v6, v8}, Landroid/support/v4/provider/DocumentFile;->createDirectory(Ljava/lang/String;)Landroid/support/v4/provider/DocumentFile;

    move-result-object v6

    .line 490
    goto :goto_1

    .line 493
    :cond_5
    invoke-virtual {v6, v8}, Landroid/support/v4/provider/DocumentFile;->findFile(Ljava/lang/String;)Landroid/support/v4/provider/DocumentFile;

    move-result-object v9

    .line 494
    if-nez v9, :cond_7

    .line 495
    if-eqz p2, :cond_6

    .line 496
    nop

    .line 497
    invoke-virtual {v6, v8}, Landroid/support/v4/provider/DocumentFile;->createDirectory(Ljava/lang/String;)Landroid/support/v4/provider/DocumentFile;

    move-result-object v6

    .line 482
    move v7, v3

    goto :goto_1

    .line 499
    :cond_6
    return-object v1

    .line 502
    :cond_7
    nop

    .line 482
    move-object v6, v9

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 506
    :cond_8
    :goto_2
    if-nez v6, :cond_9

    .line 507
    return-object v1

    .line 510
    :cond_9
    array-length v0, p1

    sub-int/2addr v0, v3

    aget-object p1, p1, v0

    .line 512
    invoke-virtual {v6, p1}, Landroid/support/v4/provider/DocumentFile;->findFile(Ljava/lang/String;)Landroid/support/v4/provider/DocumentFile;

    move-result-object v0

    .line 514
    nop

    .line 516
    if-nez v0, :cond_d

    if-eqz p2, :cond_d

    .line 517
    if-eqz p4, :cond_a

    .line 519
    :try_start_0
    invoke-virtual {v6, p1}, Landroid/support/v4/provider/DocumentFile;->createDirectory(Ljava/lang/String;)Landroid/support/v4/provider/DocumentFile;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    .line 520
    :catch_0
    move-exception p1

    .line 522
    const-string p2, "FileCompat"

    const-string p3, "createFile error"

    invoke-static {p2, p3, p1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 523
    return-object v1

    .line 527
    :cond_a
    nop

    .line 528
    const-string p2, "."

    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p2

    .line 529
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p4

    if-eqz p4, :cond_b

    if-lez p2, :cond_b

    .line 530
    invoke-static {p1}, Lcom/android/camera/FileCompat;->access$200(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 531
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p4

    if-nez p4, :cond_b

    .line 532
    invoke-virtual {p1, v5, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    goto :goto_3

    .line 536
    :cond_b
    move-object p2, v1

    :goto_3
    if-eqz p2, :cond_c

    move-object p1, p2

    :cond_c
    :try_start_1
    invoke-virtual {v6, p3, p1}, Landroid/support/v4/provider/DocumentFile;->createFile(Ljava/lang/String;Ljava/lang/String;)Landroid/support/v4/provider/DocumentFile;

    move-result-object p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    return-object p1

    .line 537
    :catch_1
    move-exception p1

    .line 539
    const-string p2, "FileCompat"

    const-string p3, "createFile error"

    invoke-static {p2, p3, p1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 540
    return-object v1

    .line 544
    :cond_d
    return-object v0
.end method

.method public getFileOutputStream(Ljava/lang/String;Z)Ljava/io/OutputStream;
    .locals 2

    .line 550
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_0

    invoke-static {p1}, Lcom/android/camera/FileCompat;->isSDFile(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 551
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/android/camera/FileCompat$BaseFileCompatImpl;->getFileOutputStream(Ljava/lang/String;Z)Ljava/io/OutputStream;

    move-result-object v0

    .line 552
    if-eqz v0, :cond_1

    .line 553
    return-object v0

    .line 557
    :cond_1
    invoke-static {p1}, Lcom/android/camera/FileCompat;->isSDFile(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_2

    .line 558
    return-object v1

    .line 561
    :cond_2
    nop

    .line 562
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v1, v0}, Lcom/android/camera/FileCompat$LollipopFileCompatImpl;->getDocumentFileByPath(Ljava/lang/String;ZLjava/lang/String;Z)Landroid/support/v4/provider/DocumentFile;

    move-result-object p1

    .line 563
    if-eqz p1, :cond_3

    .line 565
    :try_start_0
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object p2

    .line 566
    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    .line 567
    invoke-virtual {p1}, Landroid/support/v4/provider/DocumentFile;->getUri()Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 572
    goto :goto_0

    .line 568
    :catch_0
    move-exception p1

    .line 570
    const-string p2, "FileCompat"

    const-string v0, "getFileOutputStream error"

    invoke-static {p2, v0, p1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 571
    return-object v1

    .line 575
    :cond_3
    move-object p1, v1

    :goto_0
    return-object p1
.end method

.method public getParcelFileDescriptor(Ljava/lang/String;Z)Landroid/os/ParcelFileDescriptor;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 582
    invoke-static {p1}, Lcom/android/camera/FileCompat;->isSDFile(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 583
    invoke-super {p0, p1, p2}, Lcom/android/camera/FileCompat$BaseFileCompatImpl;->getParcelFileDescriptor(Ljava/lang/String;Z)Landroid/os/ParcelFileDescriptor;

    move-result-object p1

    return-object p1

    .line 585
    :cond_0
    invoke-static {p1}, Lcom/android/camera/FileCompat;->access$200(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 586
    const/4 v1, 0x0

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/android/camera/FileCompat$LollipopFileCompatImpl;->getDocumentFileByPath(Ljava/lang/String;ZLjava/lang/String;Z)Landroid/support/v4/provider/DocumentFile;

    move-result-object p1

    .line 588
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    .line 589
    invoke-virtual {p1}, Landroid/support/v4/provider/DocumentFile;->getUri()Landroid/net/Uri;

    move-result-object p1

    const-string v0, "rw"

    .line 588
    invoke-virtual {p2, p1, v0}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object p1

    return-object p1
.end method

.method public mkdirs(Ljava/lang/String;)Z
    .locals 3

    .line 673
    invoke-super {p0, p1}, Lcom/android/camera/FileCompat$BaseFileCompatImpl;->mkdirs(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 674
    return v1

    .line 675
    :cond_0
    invoke-static {p1}, Lcom/android/camera/FileCompat;->isSDFile(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_1

    .line 676
    return v2

    .line 678
    :cond_1
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v1, v0, v1}, Lcom/android/camera/FileCompat$LollipopFileCompatImpl;->getDocumentFileByPath(Ljava/lang/String;ZLjava/lang/String;Z)Landroid/support/v4/provider/DocumentFile;

    move-result-object p1

    if-nez p1, :cond_2

    move v1, v2

    nop

    :cond_2
    return v1
.end method

.method public renameFile(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 647
    invoke-super {p0, p1, p2}, Lcom/android/camera/FileCompat$BaseFileCompatImpl;->renameFile(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 648
    const/4 p1, 0x1

    return p1

    .line 651
    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v0

    .line 652
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v1

    .line 653
    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 654
    const-string p1, "FileCompat"

    const-string p2, "only support renameto the same folder"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 655
    return v1

    .line 658
    :cond_1
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p2

    .line 660
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v1, v0, v1}, Lcom/android/camera/FileCompat$LollipopFileCompatImpl;->getDocumentFileByPath(Ljava/lang/String;ZLjava/lang/String;Z)Landroid/support/v4/provider/DocumentFile;

    move-result-object v0

    .line 661
    if-nez v0, :cond_2

    .line 662
    return v1

    .line 665
    :cond_2
    :try_start_0
    invoke-virtual {v0, p2}, Landroid/support/v4/provider/DocumentFile;->renameTo(Ljava/lang/String;)Z

    move-result p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p2

    .line 666
    :catch_0
    move-exception p2

    .line 667
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "renameFile error, path = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method
