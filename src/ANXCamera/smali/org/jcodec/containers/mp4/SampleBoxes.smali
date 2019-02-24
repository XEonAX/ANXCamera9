.class public Lorg/jcodec/containers/mp4/SampleBoxes;
.super Lorg/jcodec/containers/mp4/Boxes;
.source "SampleBoxes.java"


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 12
    invoke-direct {p0}, Lorg/jcodec/containers/mp4/Boxes;-><init>()V

    .line 13
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/SampleBoxes;->clear()V

    .line 15
    const-string v0, "ap4h"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/VideoSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 16
    const-string v0, "apch"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/VideoSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 17
    const-string v0, "apcn"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/VideoSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 18
    const-string v0, "apcs"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/VideoSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 19
    const-string v0, "apco"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/VideoSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 20
    const-string v0, "avc1"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/VideoSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 21
    const-string v0, "cvid"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/VideoSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 22
    const-string v0, "jpeg"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/VideoSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 23
    const-string v0, "smc "

    const-class v1, Lorg/jcodec/containers/mp4/boxes/VideoSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 24
    const-string v0, "rle "

    const-class v1, Lorg/jcodec/containers/mp4/boxes/VideoSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 25
    const-string v0, "rpza"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/VideoSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 26
    const-string v0, "kpcd"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/VideoSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 27
    const-string v0, "png "

    const-class v1, Lorg/jcodec/containers/mp4/boxes/VideoSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 28
    const-string v0, "mjpa"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/VideoSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 29
    const-string v0, "mjpb"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/VideoSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 30
    const-string v0, "SVQ1"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/VideoSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 31
    const-string v0, "SVQ3"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/VideoSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 32
    const-string v0, "mp4v"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/VideoSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 33
    const-string v0, "dvc "

    const-class v1, Lorg/jcodec/containers/mp4/boxes/VideoSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 34
    const-string v0, "dvcp"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/VideoSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 35
    const-string v0, "gif "

    const-class v1, Lorg/jcodec/containers/mp4/boxes/VideoSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 36
    const-string v0, "h263"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/VideoSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 37
    const-string v0, "tiff"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/VideoSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 38
    const-string v0, "raw "

    const-class v1, Lorg/jcodec/containers/mp4/boxes/VideoSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 39
    const-string v0, "2vuY"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/VideoSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 40
    const-string v0, "yuv2"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/VideoSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 41
    const-string v0, "v308"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/VideoSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 42
    const-string v0, "v408"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/VideoSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 43
    const-string v0, "v216"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/VideoSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 44
    const-string v0, "v410"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/VideoSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 45
    const-string v0, "v210"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/VideoSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 46
    const-string v0, "m2v1"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/VideoSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 47
    const-string v0, "m1v1"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/VideoSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 48
    const-string v0, "xd5b"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/VideoSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 49
    const-string v0, "dv5n"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/VideoSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 50
    const-string v0, "jp2h"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/VideoSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 51
    const-string v0, "mjp2"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/VideoSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 53
    const-string v0, "ac-3"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 54
    const-string v0, "cac3"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 55
    const-string v0, "ima4"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 56
    const-string v0, "aac "

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 57
    const-string v0, "celp"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 58
    const-string v0, "hvxc"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 59
    const-string v0, "twvq"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 60
    const-string v0, ".mp1"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 61
    const-string v0, ".mp2"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 62
    const-string v0, "midi"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 63
    const-string v0, "apvs"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 64
    const-string v0, "alac"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 65
    const-string v0, "aach"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 66
    const-string v0, "aacl"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 67
    const-string v0, "aace"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 68
    const-string v0, "aacf"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 69
    const-string v0, "aacp"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 70
    const-string v0, "aacs"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 71
    const-string v0, "samr"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 72
    const-string v0, "AUDB"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 73
    const-string v0, "ilbc"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 74
    const/4 v0, 0x4

    new-array v1, v0, [B

    fill-array-data v1, :array_0

    invoke-static {v1}, Lorg/jcodec/platform/Platform;->stringFromBytes([B)Ljava/lang/String;

    move-result-object v1

    const-class v2, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v1, v2}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 75
    new-array v0, v0, [B

    fill-array-data v0, :array_1

    invoke-static {v0}, Lorg/jcodec/platform/Platform;->stringFromBytes([B)Ljava/lang/String;

    move-result-object v0

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 76
    const-string v0, "aes3"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 77
    const-string v0, "NONE"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 78
    const-string v0, "raw "

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 79
    const-string v0, "twos"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 80
    const-string v0, "sowt"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 81
    const-string v0, "MAC3 "

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 82
    const-string v0, "MAC6 "

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 83
    const-string v0, "ima4"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 84
    const-string v0, "fl32"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 85
    const-string v0, "fl64"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 86
    const-string v0, "in24"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 87
    const-string v0, "in32"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 88
    const-string v0, "ulaw"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 89
    const-string v0, "alaw"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 90
    const-string v0, "dvca"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 91
    const-string v0, "QDMC"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 92
    const-string v0, "QDM2"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 93
    const-string v0, "Qclp"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 94
    const-string v0, ".mp3"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 95
    const-string v0, "mp4a"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 96
    const-string v0, "lpcm"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 98
    const-string v0, "tmcd"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/TimecodeSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 99
    const-string v0, "time"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/TimecodeSampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 101
    const-string v0, "c608"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/SampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 102
    const-string v0, "c708"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/SampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 103
    const-string v0, "text"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/SampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 106
    const-string v0, "fdsc"

    const-class v1, Lorg/jcodec/containers/mp4/boxes/SampleEntry;

    invoke-virtual {p0, v0, v1}, Lorg/jcodec/containers/mp4/SampleBoxes;->override(Ljava/lang/String;Ljava/lang/Class;)V

    .line 107
    return-void

    nop

    :array_0
    .array-data 1
        0x6dt
        0x73t
        0x0t
        0x11t
    .end array-data

    :array_1
    .array-data 1
        0x6dt
        0x73t
        0x0t
        0x31t
    .end array-data
.end method
