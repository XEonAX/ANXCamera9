.class final Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;
.super Ljava/lang/Object;
.source "Version.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/zxing/datamatrix/decoder/Version;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ECBlocks"
.end annotation


# instance fields
.field private final ecBlocks:[Lcom/google/zxing/datamatrix/decoder/Version$ECB;

.field private final ecCodewords:I


# direct methods
.method private constructor <init>(ILcom/google/zxing/datamatrix/decoder/Version$ECB;)V
    .locals 2
    .param p1, "ecCodewords"    # I
    .param p2, "ecBlocks"    # Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 123
    iput p1, p0, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;->ecCodewords:I

    .line 124
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    iput-object v0, p0, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;->ecBlocks:[Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    .line 125
    return-void
.end method

.method private constructor <init>(ILcom/google/zxing/datamatrix/decoder/Version$ECB;Lcom/google/zxing/datamatrix/decoder/Version$ECB;)V
    .locals 2
    .param p1, "ecCodewords"    # I
    .param p2, "ecBlocks1"    # Lcom/google/zxing/datamatrix/decoder/Version$ECB;
    .param p3, "ecBlocks2"    # Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    .line 127
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 128
    iput p1, p0, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;->ecCodewords:I

    .line 129
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    const/4 v1, 0x1

    aput-object p3, v0, v1

    iput-object v0, p0, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;->ecBlocks:[Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    .line 130
    return-void
.end method

.method synthetic constructor <init>(ILcom/google/zxing/datamatrix/decoder/Version$ECB;Lcom/google/zxing/datamatrix/decoder/Version$ECB;Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V
    .locals 0

    .line 127
    invoke-direct {p0, p1, p2, p3}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/datamatrix/decoder/Version$ECB;Lcom/google/zxing/datamatrix/decoder/Version$ECB;)V

    return-void
.end method

.method synthetic constructor <init>(ILcom/google/zxing/datamatrix/decoder/Version$ECB;Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V
    .locals 0

    .line 122
    invoke-direct {p0, p1, p2}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/datamatrix/decoder/Version$ECB;)V

    return-void
.end method


# virtual methods
.method getECBlocks()[Lcom/google/zxing/datamatrix/decoder/Version$ECB;
    .locals 1

    .line 137
    iget-object v0, p0, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;->ecBlocks:[Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    return-object v0
.end method

.method getECCodewords()I
    .locals 1

    .line 133
    iget v0, p0, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;->ecCodewords:I

    return v0
.end method
