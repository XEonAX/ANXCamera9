.class abstract Lcom/google/zxing/oned/rss/expanded/decoders/DecodedObject;
.super Ljava/lang/Object;
.source "DecodedObject.java"


# instance fields
.field private final newPosition:I


# direct methods
.method constructor <init>(I)V
    .registers 2
    .param p1, "newPosition"    # I

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput p1, p0, Lcom/google/zxing/oned/rss/expanded/decoders/DecodedObject;->newPosition:I

    .line 38
    return-void
.end method


# virtual methods
.method final getNewPosition()I
    .registers 2

    .line 41
    iget v0, p0, Lcom/google/zxing/oned/rss/expanded/decoders/DecodedObject;->newPosition:I

    return v0
.end method
