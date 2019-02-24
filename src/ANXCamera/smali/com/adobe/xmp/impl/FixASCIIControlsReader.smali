.class public Lcom/adobe/xmp/impl/FixASCIIControlsReader;
.super Ljava/io/PushbackReader;
.source "FixASCIIControlsReader.java"


# static fields
.field private static final BUFFER_SIZE:I = 0x8

.field private static final STATE_AMP:I = 0x1

.field private static final STATE_DIG1:I = 0x4

.field private static final STATE_ERROR:I = 0x5

.field private static final STATE_HASH:I = 0x2

.field private static final STATE_HEX:I = 0x3

.field private static final STATE_START:I


# instance fields
.field private control:I

.field private digits:I

.field private state:I


# direct methods
.method public constructor <init>(Ljava/io/Reader;)V
    .locals 1

    .line 50
    const/16 v0, 0x8

    invoke-direct {p0, p1, v0}, Ljava/io/PushbackReader;-><init>(Ljava/io/Reader;I)V

    .line 37
    const/4 p1, 0x0

    iput p1, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    .line 39
    iput p1, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->control:I

    .line 41
    iput p1, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->digits:I

    .line 51
    return-void
.end method

.method private processChar(C)C
    .locals 10

    .line 114
    iget v0, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    const/4 v1, 0x3

    const/16 v2, 0x3b

    const/4 v3, 0x4

    const/16 v4, 0xa

    const/16 v5, 0x39

    const/16 v6, 0x30

    const/4 v7, 0x1

    const/4 v8, 0x0

    const/4 v9, 0x5

    packed-switch v0, :pswitch_data_0

    .line 211
    return p1

    .line 206
    :pswitch_0
    iput v8, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    .line 207
    return p1

    .line 154
    :pswitch_1
    if-gt v6, p1, :cond_1

    if-gt p1, v5, :cond_1

    .line 156
    iget v0, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->control:I

    mul-int/2addr v0, v4

    invoke-static {p1, v4}, Ljava/lang/Character;->digit(CI)I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->control:I

    .line 157
    iget v0, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->digits:I

    add-int/2addr v0, v7

    iput v0, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->digits:I

    .line 158
    iget v0, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->digits:I

    if-gt v0, v9, :cond_0

    .line 160
    iput v3, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    goto :goto_0

    .line 164
    :cond_0
    iput v9, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    goto :goto_0

    .line 167
    :cond_1
    if-ne p1, v2, :cond_2

    iget v0, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->control:I

    int-to-char v0, v0

    invoke-static {v0}, Lcom/adobe/xmp/impl/Utils;->isControlChar(C)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 169
    iput v8, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    .line 170
    iget p1, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->control:I

    int-to-char p1, p1

    return p1

    .line 174
    :cond_2
    iput v9, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    .line 176
    :goto_0
    return p1

    .line 179
    :pswitch_2
    if-gt v6, p1, :cond_3

    if-le p1, v5, :cond_5

    :cond_3
    const/16 v0, 0x61

    if-gt v0, p1, :cond_4

    const/16 v0, 0x66

    if-le p1, v0, :cond_5

    :cond_4
    const/16 v0, 0x41

    if-gt v0, p1, :cond_7

    const/16 v0, 0x46

    if-gt p1, v0, :cond_7

    .line 183
    :cond_5
    iget v0, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->control:I

    const/16 v2, 0x10

    mul-int/2addr v0, v2

    invoke-static {p1, v2}, Ljava/lang/Character;->digit(CI)I

    move-result v2

    add-int/2addr v0, v2

    iput v0, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->control:I

    .line 184
    iget v0, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->digits:I

    add-int/2addr v0, v7

    iput v0, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->digits:I

    .line 185
    iget v0, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->digits:I

    if-gt v0, v3, :cond_6

    .line 187
    iput v1, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    goto :goto_1

    .line 191
    :cond_6
    iput v9, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    goto :goto_1

    .line 194
    :cond_7
    if-ne p1, v2, :cond_8

    iget v0, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->control:I

    int-to-char v0, v0

    invoke-static {v0}, Lcom/adobe/xmp/impl/Utils;->isControlChar(C)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 196
    iput v8, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    .line 197
    iget p1, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->control:I

    int-to-char p1, p1

    return p1

    .line 201
    :cond_8
    iput v9, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    .line 203
    :goto_1
    return p1

    .line 135
    :pswitch_3
    const/16 v0, 0x78

    if-ne p1, v0, :cond_9

    .line 137
    iput v8, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->control:I

    .line 138
    iput v8, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->digits:I

    .line 139
    iput v1, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    goto :goto_2

    .line 141
    :cond_9
    if-gt v6, p1, :cond_a

    if-gt p1, v5, :cond_a

    .line 143
    invoke-static {p1, v4}, Ljava/lang/Character;->digit(CI)I

    move-result v0

    iput v0, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->control:I

    .line 144
    iput v7, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->digits:I

    .line 145
    iput v3, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    goto :goto_2

    .line 149
    :cond_a
    iput v9, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    .line 151
    :goto_2
    return p1

    .line 124
    :pswitch_4
    const/16 v0, 0x23

    if-ne p1, v0, :cond_b

    .line 126
    const/4 v0, 0x2

    iput v0, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    goto :goto_3

    .line 130
    :cond_b
    iput v9, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    .line 132
    :goto_3
    return p1

    .line 117
    :pswitch_5
    const/16 v0, 0x26

    if-ne p1, v0, :cond_c

    .line 119
    iput v7, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    .line 121
    :cond_c
    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public read([CII)I
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 59
    nop

    .line 60
    nop

    .line 61
    nop

    .line 62
    const/16 v0, 0x8

    new-array v0, v0, [C

    .line 64
    nop

    .line 65
    const/4 v1, 0x0

    const/4 v2, 0x1

    move v5, p2

    move v3, v1

    move v4, v3

    :goto_0
    move p2, v2

    :cond_0
    :goto_1
    if-eqz p2, :cond_6

    if-ge v3, p3, :cond_6

    .line 67
    invoke-super {p0, v0, v4, v2}, Ljava/io/PushbackReader;->read([CII)I

    move-result p2

    if-ne p2, v2, :cond_1

    .line 68
    move p2, v2

    goto :goto_2

    .line 67
    :cond_1
    nop

    .line 68
    move p2, v1

    :goto_2
    const/4 v6, 0x5

    if-eqz p2, :cond_5

    .line 70
    aget-char v7, v0, v4

    invoke-direct {p0, v7}, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->processChar(C)C

    move-result v7

    .line 71
    iget v8, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    if-nez v8, :cond_3

    .line 74
    invoke-static {v7}, Lcom/adobe/xmp/impl/Utils;->isControlChar(C)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 76
    const/16 v7, 0x20

    .line 78
    :cond_2
    add-int/lit8 v4, v5, 0x1

    aput-char v7, p1, v5

    .line 79
    nop

    .line 80
    add-int/lit8 v3, v3, 0x1

    .line 91
    move v5, v4

    :goto_3
    move v4, v1

    goto :goto_4

    .line 82
    :cond_3
    iget v7, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    if-ne v7, v6, :cond_4

    .line 84
    add-int/lit8 v4, v4, 0x1

    invoke-virtual {p0, v0, v1, v4}, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->unread([CII)V

    .line 85
    goto :goto_3

    .line 89
    :cond_4
    add-int/lit8 v4, v4, 0x1

    .line 91
    :goto_4
    goto :goto_1

    .line 92
    :cond_5
    if-lez v4, :cond_0

    .line 95
    invoke-virtual {p0, v0, v1, v4}, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->unread([CII)V

    .line 96
    iput v6, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    .line 97
    nop

    .line 98
    nop

    .line 65
    move v4, v1

    goto :goto_0

    .line 103
    :cond_6
    if-gtz v3, :cond_8

    if-eqz p2, :cond_7

    goto :goto_5

    :cond_7
    const/4 v3, -0x1

    :cond_8
    :goto_5
    return v3
.end method
