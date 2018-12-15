.class public final Lcom/google/zxing/pdf417/PDF417ResultMetadata;
.super Ljava/lang/Object;
.source "PDF417ResultMetadata.java"


# instance fields
.field private fileId:Ljava/lang/String;

.field private lastSegment:Z

.field private optionalData:[I

.field private segmentIndex:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getFileId()Ljava/lang/String;
    .registers 2

    .line 38
    iget-object v0, p0, Lcom/google/zxing/pdf417/PDF417ResultMetadata;->fileId:Ljava/lang/String;

    return-object v0
.end method

.method public getOptionalData()[I
    .registers 2

    .line 46
    iget-object v0, p0, Lcom/google/zxing/pdf417/PDF417ResultMetadata;->optionalData:[I

    return-object v0
.end method

.method public getSegmentIndex()I
    .registers 2

    .line 30
    iget v0, p0, Lcom/google/zxing/pdf417/PDF417ResultMetadata;->segmentIndex:I

    return v0
.end method

.method public isLastSegment()Z
    .registers 2

    .line 54
    iget-boolean v0, p0, Lcom/google/zxing/pdf417/PDF417ResultMetadata;->lastSegment:Z

    return v0
.end method

.method public setFileId(Ljava/lang/String;)V
    .registers 2
    .param p1, "fileId"    # Ljava/lang/String;

    .line 42
    iput-object p1, p0, Lcom/google/zxing/pdf417/PDF417ResultMetadata;->fileId:Ljava/lang/String;

    .line 43
    return-void
.end method

.method public setLastSegment(Z)V
    .registers 2
    .param p1, "lastSegment"    # Z

    .line 58
    iput-boolean p1, p0, Lcom/google/zxing/pdf417/PDF417ResultMetadata;->lastSegment:Z

    .line 59
    return-void
.end method

.method public setOptionalData([I)V
    .registers 2
    .param p1, "optionalData"    # [I

    .line 50
    iput-object p1, p0, Lcom/google/zxing/pdf417/PDF417ResultMetadata;->optionalData:[I

    .line 51
    return-void
.end method

.method public setSegmentIndex(I)V
    .registers 2
    .param p1, "segmentIndex"    # I

    .line 34
    iput p1, p0, Lcom/google/zxing/pdf417/PDF417ResultMetadata;->segmentIndex:I

    .line 35
    return-void
.end method
