.class public interface abstract Lcom/ss/android/medialib/AVCEncoderInterface;
.super Ljava/lang/Object;
.source "AVCEncoderInterface.java"


# static fields
.field public static final BITRATE_MODE_CBR:I = 0x2

.field public static final BITRATE_MODE_CQ:I = 0x0

.field public static final BITRATE_MODE_VBR:I = 0x1

.field public static final ENCODE_PROFILE_BASELINE:I = 0x1

.field public static final ENCODE_PROFILE_HIGH:I = 0x8

.field public static final ENCODE_PROFILE_MAIN:I = 0x2


# virtual methods
.method public abstract getProfile()I
.end method

.method public abstract onEncoderData(IIIZ)I
.end method

.method public abstract onEncoderData(Ljava/nio/ByteBuffer;IZ)V
.end method

.method public abstract onEncoderData([BIZ)V
.end method

.method public abstract onInitHardEncoder(IIIIIIZ)Landroid/view/Surface;
.end method

.method public abstract onInitHardEncoder(IIIIZ)Landroid/view/Surface;
.end method

.method public abstract onSetCodecConfig(Ljava/nio/ByteBuffer;)V
.end method

.method public abstract onSwapGlBuffers()V
.end method

.method public abstract onUninitHardEncoder()V
.end method

.method public abstract onWriteFile(Ljava/nio/ByteBuffer;III)V
.end method

.method public abstract onWriteFile(Ljava/nio/ByteBuffer;JJII)V
.end method

.method public abstract setColorFormat(I)V
.end method
