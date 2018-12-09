.class public final Lcom/android/camera/log/CameraMetadataSerializer;
.super Ljava/lang/Object;
.source "CameraMetadataSerializer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/log/CameraMetadataSerializer$Writable;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 23
    const-class v0, Lcom/android/camera/log/CameraMetadataSerializer;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/log/CameraMetadataSerializer;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Ljava/lang/Object;)Ljava/lang/String;
    .locals 0

    .line 22
    invoke-static {p0}, Lcom/android/camera/log/CameraMetadataSerializer;->metadataValueToString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static dumpMetadata(Lcom/android/camera/log/CameraMetadataSerializer$Writable;Ljava/io/Writer;)V
    .locals 2

    .line 136
    :try_start_0
    invoke-interface {p0, p1}, Lcom/android/camera/log/CameraMetadataSerializer$Writable;->write(Ljava/io/Writer;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 141
    if-eqz p1, :cond_0

    .line 142
    :try_start_1
    invoke-virtual {p1}, Ljava/io/Writer;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 144
    :catch_0
    move-exception p0

    .line 145
    sget-object p1, Lcom/android/camera/log/CameraMetadataSerializer;->TAG:Ljava/lang/String;

    const-string v0, "dumpMetadata - Failed to close writer."

    invoke-static {p1, v0, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 147
    goto :goto_1

    .line 146
    :cond_0
    :goto_0
    goto :goto_1

    .line 140
    :catchall_0
    move-exception p0

    goto :goto_2

    .line 137
    :catch_1
    move-exception p0

    .line 138
    :try_start_2
    sget-object v0, Lcom/android/camera/log/CameraMetadataSerializer;->TAG:Ljava/lang/String;

    const-string v1, "dumpMetadata - Failed to dump metadata"

    invoke-static {v0, v1, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 141
    if-eqz p1, :cond_0

    .line 142
    :try_start_3
    invoke-virtual {p1}, Ljava/io/Writer;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0

    .line 148
    :goto_1
    return-void

    .line 140
    :goto_2
    nop

    .line 141
    if-eqz p1, :cond_1

    .line 142
    :try_start_4
    invoke-virtual {p1}, Ljava/io/Writer;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_3

    .line 144
    :catch_2
    move-exception p1

    .line 145
    sget-object v0, Lcom/android/camera/log/CameraMetadataSerializer;->TAG:Ljava/lang/String;

    const-string v1, "dumpMetadata - Failed to close writer."

    invoke-static {v0, v1, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    nop

    .line 146
    :cond_1
    :goto_3
    throw p0
.end method

.method private static dumpMetadata(Ljava/lang/String;Landroid/hardware/camera2/CaptureRequest;Ljava/io/Writer;)V
    .locals 1

    .line 58
    new-instance v0, Lcom/android/camera/log/CameraMetadataSerializer$1;

    invoke-direct {v0, p1, p0}, Lcom/android/camera/log/CameraMetadataSerializer$1;-><init>(Landroid/hardware/camera2/CaptureRequest;Ljava/lang/String;)V

    .line 72
    new-instance p0, Ljava/io/BufferedWriter;

    invoke-direct {p0, p2}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    invoke-static {v0, p0}, Lcom/android/camera/log/CameraMetadataSerializer;->dumpMetadata(Lcom/android/camera/log/CameraMetadataSerializer$Writable;Ljava/io/Writer;)V

    .line 73
    return-void
.end method

.method private static dumpMetadata(Ljava/lang/String;Landroid/hardware/camera2/CaptureResult;Ljava/io/Writer;)V
    .locals 1

    .line 81
    new-instance v0, Lcom/android/camera/log/CameraMetadataSerializer$2;

    invoke-direct {v0, p1, p0}, Lcom/android/camera/log/CameraMetadataSerializer$2;-><init>(Landroid/hardware/camera2/CaptureResult;Ljava/lang/String;)V

    .line 95
    new-instance p0, Ljava/io/BufferedWriter;

    invoke-direct {p0, p2}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    invoke-static {v0, p0}, Lcom/android/camera/log/CameraMetadataSerializer;->dumpMetadata(Lcom/android/camera/log/CameraMetadataSerializer$Writable;Ljava/io/Writer;)V

    .line 96
    return-void
.end method

.method private static metadataValueToString(Ljava/lang/Object;)Ljava/lang/String;
    .locals 4

    .line 99
    if-nez p0, :cond_0

    .line 100
    const-string p0, "<null>"

    return-object p0

    .line 102
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 103
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 104
    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    invoke-static {p0}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v1

    .line 107
    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    .line 108
    invoke-static {p0, v2}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v3

    .line 109
    invoke-static {v3}, Lcom/android/camera/log/CameraMetadataSerializer;->metadataValueToString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    add-int/lit8 v3, v1, -0x1

    if-eq v2, v3, :cond_1

    .line 112
    const-string v3, ", "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 115
    :cond_2
    const/16 p0, 0x5d

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 117
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 121
    :cond_3
    instance-of v0, p0, Landroid/hardware/camera2/params/LensShadingMap;

    if-eqz v0, :cond_4

    .line 122
    check-cast p0, Landroid/hardware/camera2/params/LensShadingMap;

    invoke-static {p0}, Lcom/android/camera/log/CameraMetadataSerializer;->toString(Landroid/hardware/camera2/params/LensShadingMap;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 123
    :cond_4
    instance-of v0, p0, Landroid/util/Pair;

    if-eqz v0, :cond_5

    .line 124
    check-cast p0, Landroid/util/Pair;

    invoke-static {p0}, Lcom/android/camera/log/CameraMetadataSerializer;->toString(Landroid/util/Pair;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 126
    :cond_5
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static serialize(Ljava/lang/String;Landroid/hardware/camera2/CameraMetadata;Ljava/io/File;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/hardware/camera2/CameraMetadata<",
            "*>;",
            "Ljava/io/File;",
            ")V"
        }
    .end annotation

    .line 36
    :try_start_0
    new-instance v0, Ljava/io/FileWriter;

    const/4 v1, 0x1

    invoke-direct {v0, p2, v1}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V

    .line 37
    instance-of p2, p1, Landroid/hardware/camera2/CaptureRequest;

    if-eqz p2, :cond_0

    .line 38
    check-cast p1, Landroid/hardware/camera2/CaptureRequest;

    invoke-static {p0, p1, v0}, Lcom/android/camera/log/CameraMetadataSerializer;->dumpMetadata(Ljava/lang/String;Landroid/hardware/camera2/CaptureRequest;Ljava/io/Writer;)V

    goto :goto_0

    .line 39
    :cond_0
    instance-of p2, p1, Landroid/hardware/camera2/CaptureResult;

    if-eqz p2, :cond_1

    .line 40
    check-cast p1, Landroid/hardware/camera2/CaptureResult;

    invoke-static {p0, p1, v0}, Lcom/android/camera/log/CameraMetadataSerializer;->dumpMetadata(Ljava/lang/String;Landroid/hardware/camera2/CaptureResult;Ljava/io/Writer;)V

    .line 46
    :goto_0
    invoke-virtual {v0}, Ljava/io/FileWriter;->close()V

    .line 49
    goto :goto_1

    .line 42
    :cond_1
    invoke-virtual {v0}, Ljava/io/FileWriter;->close()V

    .line 43
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Cannot generate debug data from type "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    :catch_0
    move-exception p0

    .line 48
    sget-object p1, Lcom/android/camera/log/CameraMetadataSerializer;->TAG:Ljava/lang/String;

    const-string p2, "Could not write capture data to file."

    invoke-static {p1, p2, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 50
    :goto_1
    return-void
.end method

.method private static toString(Landroid/hardware/camera2/params/LensShadingMap;)Ljava/lang/String;
    .locals 9

    .line 151
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 152
    const-string v1, "LensShadingMap{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    const-string v1, "R"

    const-string v2, "G_even"

    const-string v3, "G_odd"

    const-string v4, "B"

    filled-new-array {v1, v2, v3, v4}, [Ljava/lang/String;

    move-result-object v1

    .line 155
    invoke-virtual {p0}, Landroid/hardware/camera2/params/LensShadingMap;->getRowCount()I

    move-result v2

    .line 156
    invoke-virtual {p0}, Landroid/hardware/camera2/params/LensShadingMap;->getColumnCount()I

    move-result v3

    .line 157
    nop

    .line 159
    const/4 v4, 0x0

    move v5, v4

    :goto_0
    const/4 v6, 0x4

    if-ge v5, v6, :cond_5

    .line 160
    aget-object v6, v1, v5

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    const-string v6, ":("

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    move v6, v4

    :goto_1
    if-ge v6, v2, :cond_3

    .line 164
    const-string v7, "["

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    move v7, v4

    :goto_2
    if-ge v7, v3, :cond_1

    .line 166
    invoke-virtual {p0, v5, v7, v6}, Landroid/hardware/camera2/params/LensShadingMap;->getGainFactor(III)F

    move-result v8

    .line 167
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 168
    add-int/lit8 v8, v3, -0x1

    if-ge v7, v8, :cond_0

    .line 169
    const-string v8, ", "

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    :cond_0
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 172
    :cond_1
    const-string v7, "]"

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    add-int/lit8 v7, v2, -0x1

    if-ge v6, v7, :cond_2

    .line 174
    const-string v7, ", "

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    :cond_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 178
    :cond_3
    const-string v6, ")"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    const/4 v6, 0x3

    if-ge v5, v6, :cond_4

    .line 180
    const-string v6, ", "

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    :cond_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 184
    :cond_5
    const-string p0, "}"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static toString(Landroid/util/Pair;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair<",
            "**>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 189
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Pair: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    invoke-static {v1}, Lcom/android/camera/log/CameraMetadataSerializer;->metadataValueToString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " / "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 190
    invoke-static {p0}, Lcom/android/camera/log/CameraMetadataSerializer;->metadataValueToString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 189
    return-object p0
.end method
