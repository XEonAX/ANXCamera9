.class public Lorg/jcodec/common/AudioFormat;
.super Ljava/lang/Object;
.source "AudioFormat.java"


# instance fields
.field private bigEndian:Z

.field private channelCount:I

.field private sampleRate:I

.field private sampleSizeInBits:I

.field private signed:Z


# direct methods
.method public constructor <init>(IIIZZ)V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput p1, p0, Lorg/jcodec/common/AudioFormat;->sampleRate:I

    .line 20
    iput p2, p0, Lorg/jcodec/common/AudioFormat;->sampleSizeInBits:I

    .line 21
    iput p3, p0, Lorg/jcodec/common/AudioFormat;->channelCount:I

    .line 22
    iput-boolean p4, p0, Lorg/jcodec/common/AudioFormat;->signed:Z

    .line 23
    iput-boolean p5, p0, Lorg/jcodec/common/AudioFormat;->bigEndian:Z

    .line 24
    return-void
.end method


# virtual methods
.method public getChannels()I
    .locals 1

    .line 27
    iget v0, p0, Lorg/jcodec/common/AudioFormat;->channelCount:I

    return v0
.end method

.method public getSampleRate()I
    .locals 1

    .line 35
    iget v0, p0, Lorg/jcodec/common/AudioFormat;->sampleRate:I

    return v0
.end method

.method public getSampleSizeInBits()I
    .locals 1

    .line 31
    iget v0, p0, Lorg/jcodec/common/AudioFormat;->sampleSizeInBits:I

    return v0
.end method

.method public isBigEndian()Z
    .locals 1

    .line 39
    iget-boolean v0, p0, Lorg/jcodec/common/AudioFormat;->bigEndian:Z

    return v0
.end method
