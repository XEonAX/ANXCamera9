.class public Lorg/jcodec/containers/mp4/boxes/HandlerBox;
.super Lorg/jcodec/containers/mp4/boxes/FullBox;
.source "HandlerBox.java"


# instance fields
.field private componentFlags:I

.field private componentFlagsMask:I

.field private componentManufacturer:Ljava/lang/String;

.field private componentName:Ljava/lang/String;

.field private componentSubType:Ljava/lang/String;

.field private componentType:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    .line 20
    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 21
    return-void
.end method

.method public static createHandlerBox(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II)Lorg/jcodec/containers/mp4/boxes/HandlerBox;
    .locals 3

    .line 36
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/HandlerBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 37
    iput-object p0, v0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentType:Ljava/lang/String;

    .line 38
    iput-object p1, v0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentSubType:Ljava/lang/String;

    .line 39
    iput-object p2, v0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentManufacturer:Ljava/lang/String;

    .line 40
    iput p3, v0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentFlags:I

    .line 41
    iput p4, v0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentFlagsMask:I

    .line 42
    const-string p0, ""

    iput-object p0, v0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentName:Ljava/lang/String;

    .line 43
    return-object v0
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    .line 31
    const-string v0, "hdlr"

    return-object v0
.end method


# virtual methods
.method public doWrite(Ljava/nio/ByteBuffer;)V
    .locals 1

    .line 59
    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->doWrite(Ljava/nio/ByteBuffer;)V

    .line 61
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentType:Ljava/lang/String;

    invoke-static {v0}, Lorg/jcodec/common/JCodecUtil2;->asciiString(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 62
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentSubType:Ljava/lang/String;

    invoke-static {v0}, Lorg/jcodec/common/JCodecUtil2;->asciiString(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 63
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentManufacturer:Ljava/lang/String;

    invoke-static {v0}, Lorg/jcodec/common/JCodecUtil2;->asciiString(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 65
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentFlags:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 66
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentFlagsMask:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 67
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentName:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 68
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentName:Ljava/lang/String;

    invoke-static {v0}, Lorg/jcodec/common/JCodecUtil2;->asciiString(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 70
    :cond_0
    return-void
.end method

.method public estimateSize()I
    .locals 2

    .line 74
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentType:Ljava/lang/String;

    invoke-static {v0}, Lorg/jcodec/common/JCodecUtil2;->asciiString(Ljava/lang/String;)[B

    move-result-object v0

    array-length v0, v0

    const/16 v1, 0xc

    add-int/2addr v1, v0

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentSubType:Ljava/lang/String;

    invoke-static {v0}, Lorg/jcodec/common/JCodecUtil2;->asciiString(Ljava/lang/String;)[B

    move-result-object v0

    array-length v0, v0

    add-int/2addr v1, v0

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentManufacturer:Ljava/lang/String;

    .line 75
    invoke-static {v0}, Lorg/jcodec/common/JCodecUtil2;->asciiString(Ljava/lang/String;)[B

    move-result-object v0

    array-length v0, v0

    add-int/2addr v1, v0

    add-int/lit8 v1, v1, 0x9

    return v1
.end method

.method public getComponentFlags()I
    .locals 1

    .line 91
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentFlags:I

    return v0
.end method

.method public getComponentFlagsMask()I
    .locals 1

    .line 95
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentFlagsMask:I

    return v0
.end method

.method public getComponentManufacturer()Ljava/lang/String;
    .locals 1

    .line 87
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentManufacturer:Ljava/lang/String;

    return-object v0
.end method

.method public getComponentSubType()Ljava/lang/String;
    .locals 1

    .line 83
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentSubType:Ljava/lang/String;

    return-object v0
.end method

.method public getComponentType()Ljava/lang/String;
    .locals 1

    .line 79
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentType:Ljava/lang/String;

    return-object v0
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 2

    .line 47
    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->parse(Ljava/nio/ByteBuffer;)V

    .line 49
    const/4 v0, 0x4

    invoke-static {p1, v0}, Lorg/jcodec/common/io/NIOUtils;->readString(Ljava/nio/ByteBuffer;I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentType:Ljava/lang/String;

    .line 50
    invoke-static {p1, v0}, Lorg/jcodec/common/io/NIOUtils;->readString(Ljava/nio/ByteBuffer;I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentSubType:Ljava/lang/String;

    .line 51
    invoke-static {p1, v0}, Lorg/jcodec/common/io/NIOUtils;->readString(Ljava/nio/ByteBuffer;I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentManufacturer:Ljava/lang/String;

    .line 53
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentFlags:I

    .line 54
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentFlagsMask:I

    .line 55
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    invoke-static {p1, v0}, Lorg/jcodec/common/io/NIOUtils;->readString(Ljava/nio/ByteBuffer;I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->componentName:Ljava/lang/String;

    .line 56
    return-void
.end method
