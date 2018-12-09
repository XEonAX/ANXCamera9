.class public Lorg/jcodec/common/StringUtils;
.super Ljava/lang/Object;
.source "StringUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static splitC(Ljava/lang/String;C)[Ljava/lang/String;
    .locals 1

    .line 51
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/jcodec/common/StringUtils;->splitWorker(Ljava/lang/String;CZ)[Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static splitWorker(Ljava/lang/String;CZ)[Ljava/lang/String;
    .locals 9

    .line 19
    if-nez p0, :cond_0

    .line 20
    const/4 p0, 0x0

    return-object p0

    .line 22
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .line 23
    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 24
    new-array p0, v1, [Ljava/lang/String;

    return-object p0

    .line 26
    :cond_1
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 27
    nop

    .line 28
    nop

    .line 29
    nop

    .line 30
    const/4 v3, 0x1

    move v4, v1

    move v5, v4

    move v6, v5

    move v7, v6

    :goto_0
    if-ge v4, v0, :cond_5

    .line 31
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v8

    if-ne v8, p1, :cond_4

    .line 32
    if-nez v5, :cond_2

    if-eqz p2, :cond_3

    .line 33
    :cond_2
    invoke-virtual {p0, v6, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    nop

    .line 35
    nop

    .line 37
    move v5, v1

    move v7, v3

    :cond_3
    add-int/lit8 v6, v4, 0x1

    .line 38
    nop

    .line 30
    move v4, v6

    goto :goto_0

    .line 40
    :cond_4
    nop

    .line 41
    nop

    .line 42
    add-int/lit8 v4, v4, 0x1

    .line 30
    move v7, v1

    move v5, v3

    goto :goto_0

    .line 44
    :cond_5
    if-nez v5, :cond_6

    if-eqz p2, :cond_7

    if-eqz v7, :cond_7

    .line 45
    :cond_6
    invoke-virtual {p0, v6, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 47
    :cond_7
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result p0

    new-array p0, p0, [Ljava/lang/String;

    invoke-interface {v2, p0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/String;

    return-object p0
.end method
