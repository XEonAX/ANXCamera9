.class public Lorg/jcodec/containers/mp4/boxes/AliasBox;
.super Lorg/jcodec/containers/mp4/boxes/FullBox;
.source "AliasBox.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jcodec/containers/mp4/boxes/AliasBox$ExtraField;
    }
.end annotation


# static fields
.field public static final AbsolutePath:I = 0x2

.field public static final AppleRemoteAccessDialup:I = 0xa

.field public static final AppleShareServerName:I = 0x4

.field public static final AppleShareUserName:I = 0x5

.field public static final AppleShareZoneName:I = 0x3

.field public static final DirectoryIDs:I = 0x1

.field public static final DirectoryName:I = 0x0

.field public static final DriverName:I = 0x6

.field public static final RevisedAppleShare:I = 0x9

.field public static final UFT16VolumeName:I = 0xf

.field public static final UNIXAbsolutePath:I = 0x12

.field public static final UTF16AbsolutePath:I = 0xe

.field public static final VolumeMountPoint:I = 0x13


# instance fields
.field private createdLocalDate:I

.field private creatorName:Ljava/lang/String;

.field private extra:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/jcodec/containers/mp4/boxes/AliasBox$ExtraField;",
            ">;"
        }
    .end annotation
.end field

.field private fileName:Ljava/lang/String;

.field private fileNumber:I

.field private fileTypeName:Ljava/lang/String;

.field private fsId:S

.field private kind:S

.field private nlvlFrom:S

.field private nlvlTo:S

.field private parentDirId:I

.field private recordSize:S

.field private type:Ljava/lang/String;

.field private version:S

.field private volumeAttributes:I

.field private volumeCreateDate:I

.field private volumeName:Ljava/lang/String;

.field private volumeSignature:S

.field private volumeType:S


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    .line 77
    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 78
    return-void
.end method

.method public static createSelfRef()Lorg/jcodec/containers/mp4/boxes/AliasBox;
    .locals 3

    .line 185
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/AliasBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/AliasBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/AliasBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 186
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/jcodec/containers/mp4/boxes/AliasBox;->setFlags(I)V

    .line 187
    return-object v0
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    .line 57
    const-string v0, "alis"

    return-object v0
.end method


# virtual methods
.method protected doWrite(Ljava/nio/ByteBuffer;)V
    .locals 4

    .line 118
    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->doWrite(Ljava/nio/ByteBuffer;)V

    .line 119
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->flags:I

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    .line 120
    return-void

    .line 121
    :cond_0
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->type:Ljava/lang/String;

    invoke-static {v0}, Lorg/jcodec/common/JCodecUtil2;->asciiString(Ljava/lang/String;)[B

    move-result-object v0

    const/4 v1, 0x4

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 122
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->recordSize:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 123
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->version:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 124
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->kind:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 125
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->volumeName:Ljava/lang/String;

    const/16 v3, 0x1b

    invoke-static {p1, v0, v3}, Lorg/jcodec/common/io/NIOUtils;->writePascalStringL(Ljava/nio/ByteBuffer;Ljava/lang/String;I)V

    .line 126
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->volumeCreateDate:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 127
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->volumeSignature:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 128
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->volumeType:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 129
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->parentDirId:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 130
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->fileName:Ljava/lang/String;

    const/16 v3, 0x3f

    invoke-static {p1, v0, v3}, Lorg/jcodec/common/io/NIOUtils;->writePascalStringL(Ljava/nio/ByteBuffer;Ljava/lang/String;I)V

    .line 131
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->fileNumber:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 132
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->createdLocalDate:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 133
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->fileTypeName:Ljava/lang/String;

    invoke-static {v0}, Lorg/jcodec/common/JCodecUtil2;->asciiString(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0, v2, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 134
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->creatorName:Ljava/lang/String;

    invoke-static {v0}, Lorg/jcodec/common/JCodecUtil2;->asciiString(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0, v2, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 135
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->nlvlFrom:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 136
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->nlvlTo:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 137
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->volumeAttributes:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 138
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->fsId:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 139
    const/16 v0, 0xa

    new-array v0, v0, [B

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 140
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->extra:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jcodec/containers/mp4/boxes/AliasBox$ExtraField;

    .line 141
    iget-short v3, v1, Lorg/jcodec/containers/mp4/boxes/AliasBox$ExtraField;->type:S

    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 142
    iget v3, v1, Lorg/jcodec/containers/mp4/boxes/AliasBox$ExtraField;->len:I

    int-to-short v3, v3

    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 143
    iget-object v1, v1, Lorg/jcodec/containers/mp4/boxes/AliasBox$ExtraField;->data:[B

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 144
    goto :goto_0

    .line 145
    :cond_1
    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 146
    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 147
    return-void
.end method

.method public estimateSize()I
    .locals 4

    .line 151
    nop

    .line 152
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->flags:I

    and-int/lit8 v0, v0, 0x1

    const/16 v1, 0xa6

    if-nez v0, :cond_0

    .line 153
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->extra:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jcodec/containers/mp4/boxes/AliasBox$ExtraField;

    .line 154
    const/4 v3, 0x4

    iget-object v2, v2, Lorg/jcodec/containers/mp4/boxes/AliasBox$ExtraField;->data:[B

    array-length v2, v2

    add-int/2addr v3, v2

    add-int/2addr v1, v3

    .line 155
    goto :goto_0

    .line 157
    :cond_0
    const/16 v0, 0xc

    add-int/2addr v0, v1

    return v0
.end method

.method public getExtra(I)Lorg/jcodec/containers/mp4/boxes/AliasBox$ExtraField;
    .locals 3

    .line 173
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->extra:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jcodec/containers/mp4/boxes/AliasBox$ExtraField;

    .line 174
    iget-short v2, v1, Lorg/jcodec/containers/mp4/boxes/AliasBox$ExtraField;->type:S

    if-ne v2, p1, :cond_0

    .line 175
    return-object v1

    .line 176
    :cond_0
    goto :goto_0

    .line 177
    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public getExtras()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lorg/jcodec/containers/mp4/boxes/AliasBox$ExtraField;",
            ">;"
        }
    .end annotation

    .line 169
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->extra:Ljava/util/List;

    return-object v0
.end method

.method public getFileName()Ljava/lang/String;
    .locals 1

    .line 165
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->fileName:Ljava/lang/String;

    return-object v0
.end method

.method public getRecordSize()I
    .locals 1

    .line 161
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->recordSize:S

    return v0
.end method

.method public getUnixPath()Ljava/lang/String;
    .locals 3

    .line 191
    const/16 v0, 0x12

    invoke-virtual {p0, v0}, Lorg/jcodec/containers/mp4/boxes/AliasBox;->getExtra(I)Lorg/jcodec/containers/mp4/boxes/AliasBox$ExtraField;

    move-result-object v0

    .line 192
    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/boxes/AliasBox$ExtraField;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public isSelfRef()Z
    .locals 2

    .line 181
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->flags:I

    const/4 v1, 0x1

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 5

    .line 81
    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->parse(Ljava/nio/ByteBuffer;)V

    .line 82
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->flags:I

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    .line 83
    return-void

    .line 84
    :cond_0
    const/4 v0, 0x4

    invoke-static {p1, v0}, Lorg/jcodec/common/io/NIOUtils;->readString(Ljava/nio/ByteBuffer;I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->type:Ljava/lang/String;

    .line 85
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v1

    iput-short v1, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->recordSize:S

    .line 86
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v1

    iput-short v1, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->version:S

    .line 87
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v1

    iput-short v1, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->kind:S

    .line 88
    const/16 v1, 0x1b

    invoke-static {p1, v1}, Lorg/jcodec/common/io/NIOUtils;->readPascalStringL(Ljava/nio/ByteBuffer;I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->volumeName:Ljava/lang/String;

    .line 89
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->volumeCreateDate:I

    .line 90
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v1

    iput-short v1, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->volumeSignature:S

    .line 91
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v1

    iput-short v1, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->volumeType:S

    .line 92
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->parentDirId:I

    .line 93
    const/16 v1, 0x3f

    invoke-static {p1, v1}, Lorg/jcodec/common/io/NIOUtils;->readPascalStringL(Ljava/nio/ByteBuffer;I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->fileName:Ljava/lang/String;

    .line 94
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->fileNumber:I

    .line 95
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->createdLocalDate:I

    .line 96
    invoke-static {p1, v0}, Lorg/jcodec/common/io/NIOUtils;->readString(Ljava/nio/ByteBuffer;I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->fileTypeName:Ljava/lang/String;

    .line 97
    invoke-static {p1, v0}, Lorg/jcodec/common/io/NIOUtils;->readString(Ljava/nio/ByteBuffer;I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->creatorName:Ljava/lang/String;

    .line 98
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    iput-short v0, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->nlvlFrom:S

    .line 99
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    iput-short v0, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->nlvlTo:S

    .line 100
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->volumeAttributes:I

    .line 101
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    iput-short v0, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->fsId:S

    .line 102
    const/16 v0, 0xa

    invoke-static {p1, v0}, Lorg/jcodec/common/io/NIOUtils;->skip(Ljava/nio/ByteBuffer;I)I

    .line 104
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->extra:Ljava/util/List;

    .line 106
    :goto_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    .line 107
    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 108
    goto :goto_1

    .line 109
    :cond_1
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v1

    .line 110
    add-int/lit8 v2, v1, 0x1

    and-int/lit8 v2, v2, -0x2

    invoke-static {p1, v2}, Lorg/jcodec/common/io/NIOUtils;->read(Ljava/nio/ByteBuffer;I)Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-static {v2}, Lorg/jcodec/common/io/NIOUtils;->toArray(Ljava/nio/ByteBuffer;)[B

    move-result-object v2

    .line 111
    if-nez v2, :cond_2

    .line 112
    nop

    .line 115
    :goto_1
    return-void

    .line 113
    :cond_2
    iget-object v3, p0, Lorg/jcodec/containers/mp4/boxes/AliasBox;->extra:Ljava/util/List;

    new-instance v4, Lorg/jcodec/containers/mp4/boxes/AliasBox$ExtraField;

    invoke-direct {v4, v0, v1, v2}, Lorg/jcodec/containers/mp4/boxes/AliasBox$ExtraField;-><init>(SI[B)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 114
    goto :goto_0
.end method
