.class public final enum Lcom/google/zxing/pdf417/encoder/Compaction;
.super Ljava/lang/Enum;
.source "Compaction.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/zxing/pdf417/encoder/Compaction;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum AUTO:Lcom/google/zxing/pdf417/encoder/Compaction;

.field public static final enum BYTE:Lcom/google/zxing/pdf417/encoder/Compaction;

.field private static final synthetic ENUM$VALUES:[Lcom/google/zxing/pdf417/encoder/Compaction;

.field public static final enum NUMERIC:Lcom/google/zxing/pdf417/encoder/Compaction;

.field public static final enum TEXT:Lcom/google/zxing/pdf417/encoder/Compaction;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .line 21
    new-instance v0, Lcom/google/zxing/pdf417/encoder/Compaction;

    const-string v1, "AUTO"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/zxing/pdf417/encoder/Compaction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/zxing/pdf417/encoder/Compaction;->AUTO:Lcom/google/zxing/pdf417/encoder/Compaction;

    .line 22
    new-instance v0, Lcom/google/zxing/pdf417/encoder/Compaction;

    const-string v1, "TEXT"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/google/zxing/pdf417/encoder/Compaction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/zxing/pdf417/encoder/Compaction;->TEXT:Lcom/google/zxing/pdf417/encoder/Compaction;

    .line 23
    new-instance v0, Lcom/google/zxing/pdf417/encoder/Compaction;

    const-string v1, "BYTE"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/google/zxing/pdf417/encoder/Compaction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/zxing/pdf417/encoder/Compaction;->BYTE:Lcom/google/zxing/pdf417/encoder/Compaction;

    .line 24
    new-instance v0, Lcom/google/zxing/pdf417/encoder/Compaction;

    const-string v1, "NUMERIC"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/google/zxing/pdf417/encoder/Compaction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/zxing/pdf417/encoder/Compaction;->NUMERIC:Lcom/google/zxing/pdf417/encoder/Compaction;

    .line 19
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/google/zxing/pdf417/encoder/Compaction;

    sget-object v1, Lcom/google/zxing/pdf417/encoder/Compaction;->AUTO:Lcom/google/zxing/pdf417/encoder/Compaction;

    aput-object v1, v0, v2

    sget-object v1, Lcom/google/zxing/pdf417/encoder/Compaction;->TEXT:Lcom/google/zxing/pdf417/encoder/Compaction;

    aput-object v1, v0, v3

    sget-object v1, Lcom/google/zxing/pdf417/encoder/Compaction;->BYTE:Lcom/google/zxing/pdf417/encoder/Compaction;

    aput-object v1, v0, v4

    sget-object v1, Lcom/google/zxing/pdf417/encoder/Compaction;->NUMERIC:Lcom/google/zxing/pdf417/encoder/Compaction;

    aput-object v1, v0, v5

    sput-object v0, Lcom/google/zxing/pdf417/encoder/Compaction;->ENUM$VALUES:[Lcom/google/zxing/pdf417/encoder/Compaction;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3

    .line 19
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/zxing/pdf417/encoder/Compaction;
    .registers 2

    .line 1
    const-class v0, Lcom/google/zxing/pdf417/encoder/Compaction;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/zxing/pdf417/encoder/Compaction;

    return-object p0
.end method

.method public static values()[Lcom/google/zxing/pdf417/encoder/Compaction;
    .registers 4

    .line 1
    sget-object v0, Lcom/google/zxing/pdf417/encoder/Compaction;->ENUM$VALUES:[Lcom/google/zxing/pdf417/encoder/Compaction;

    array-length v1, v0

    new-array v2, v1, [Lcom/google/zxing/pdf417/encoder/Compaction;

    const/4 v3, 0x0

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
