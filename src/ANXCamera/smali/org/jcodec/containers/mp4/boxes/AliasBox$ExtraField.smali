.class public Lorg/jcodec/containers/mp4/boxes/AliasBox$ExtraField;
.super Ljava/lang/Object;
.source "AliasBox.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jcodec/containers/mp4/boxes/AliasBox;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ExtraField"
.end annotation


# instance fields
.field data:[B

.field len:I

.field type:S


# direct methods
.method public constructor <init>(SI[B)V
    .locals 0

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput-short p1, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox$ExtraField;->type:S

    .line 67
    iput p2, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox$ExtraField;->len:I

    .line 68
    iput-object p3, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox$ExtraField;->data:[B

    .line 69
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 4

    .line 72
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox$ExtraField;->data:[B

    iget v1, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox$ExtraField;->len:I

    iget-short v2, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox$ExtraField;->type:S

    const/16 v3, 0xe

    if-eq v2, v3, :cond_1

    iget-short v2, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox$ExtraField;->type:S

    const/16 v3, 0xf

    if-ne v2, v3, :cond_0

    goto :goto_0

    :cond_0
    const-string v2, "UTF-8"

    goto :goto_1

    :cond_1
    :goto_0
    const-string v2, "UTF-16"

    :goto_1
    const/4 v3, 0x0

    invoke-static {v0, v3, v1, v2}, Lorg/jcodec/platform/Platform;->stringFromCharset4([BIILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
