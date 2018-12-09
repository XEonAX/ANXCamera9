.class public Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;
.super Lorg/jcodec/containers/mp4/boxes/SampleEntry;
.source "AudioSampleEntry.java"


# static fields
.field public static final EMPTY:[Lorg/jcodec/common/model/Label;

.field private static final MATRIX_STEREO:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/jcodec/common/model/Label;",
            ">;"
        }
    .end annotation
.end field

.field private static final MONO:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/jcodec/common/model/Label;",
            ">;"
        }
    .end annotation
.end field

.field private static final STEREO:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/jcodec/common/model/Label;",
            ">;"
        }
    .end annotation
.end field

.field public static kAudioFormatFlagIsAlignedHigh:I

.field public static kAudioFormatFlagIsBigEndian:I

.field public static kAudioFormatFlagIsFloat:I

.field public static kAudioFormatFlagIsNonInterleaved:I

.field public static kAudioFormatFlagIsNonMixable:I

.field public static kAudioFormatFlagIsPacked:I

.field public static kAudioFormatFlagIsSignedInteger:I

.field public static pcms:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static translationStereo:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lorg/jcodec/common/model/Label;",
            "Lorg/jcodec/common/model/ChannelLabel;",
            ">;"
        }
    .end annotation
.end field

.field private static translationSurround:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lorg/jcodec/common/model/Label;",
            "Lorg/jcodec/common/model/ChannelLabel;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private bytesPerFrame:I

.field private bytesPerPkt:I

.field private bytesPerSample:I

.field private channelCount:S

.field private compressionId:I

.field private lpcmFlags:I

.field private pktSize:I

.field private revision:S

.field private sampleRate:F

.field private sampleSize:S

.field private samplesPerPkt:I

.field private vendor:I

.field private version:S


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 36
    const/4 v0, 0x1

    sput v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->kAudioFormatFlagIsFloat:I

    .line 37
    const/4 v1, 0x2

    sput v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->kAudioFormatFlagIsBigEndian:I

    .line 38
    const/4 v2, 0x4

    sput v2, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->kAudioFormatFlagIsSignedInteger:I

    .line 39
    const/16 v2, 0x8

    sput v2, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->kAudioFormatFlagIsPacked:I

    .line 40
    const/16 v2, 0x10

    sput v2, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->kAudioFormatFlagIsAlignedHigh:I

    .line 41
    const/16 v2, 0x20

    sput v2, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->kAudioFormatFlagIsNonInterleaved:I

    .line 42
    const/16 v2, 0x40

    sput v2, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->kAudioFormatFlagIsNonMixable:I

    .line 79
    new-array v2, v0, [Lorg/jcodec/common/model/Label;

    sget-object v3, Lorg/jcodec/common/model/Label;->Mono:Lorg/jcodec/common/model/Label;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    sput-object v2, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->MONO:Ljava/util/List;

    .line 80
    new-array v2, v1, [Lorg/jcodec/common/model/Label;

    sget-object v3, Lorg/jcodec/common/model/Label;->Left:Lorg/jcodec/common/model/Label;

    aput-object v3, v2, v4

    sget-object v3, Lorg/jcodec/common/model/Label;->Right:Lorg/jcodec/common/model/Label;

    aput-object v3, v2, v0

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    sput-object v2, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->STEREO:Ljava/util/List;

    .line 81
    new-array v1, v1, [Lorg/jcodec/common/model/Label;

    sget-object v2, Lorg/jcodec/common/model/Label;->LeftTotal:Lorg/jcodec/common/model/Label;

    aput-object v2, v1, v4

    sget-object v2, Lorg/jcodec/common/model/Label;->RightTotal:Lorg/jcodec/common/model/Label;

    aput-object v2, v1, v0

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->MATRIX_STEREO:Ljava/util/List;

    .line 82
    new-array v0, v4, [Lorg/jcodec/common/model/Label;

    sput-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->EMPTY:[Lorg/jcodec/common/model/Label;

    .line 221
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->pcms:Ljava/util/Set;

    .line 224
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->pcms:Ljava/util/Set;

    const-string v1, "raw "

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 225
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->pcms:Ljava/util/Set;

    const-string v1, "twos"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 226
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->pcms:Ljava/util/Set;

    const-string v1, "sowt"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 227
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->pcms:Ljava/util/Set;

    const-string v1, "fl32"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 228
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->pcms:Ljava/util/Set;

    const-string v1, "fl64"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 229
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->pcms:Ljava/util/Set;

    const-string v1, "in24"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 230
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->pcms:Ljava/util/Set;

    const-string v1, "in32"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 231
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->pcms:Ljava/util/Set;

    const-string v1, "lpcm"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 318
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->translationStereo:Ljava/util/Map;

    .line 319
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->translationSurround:Ljava/util/Map;

    .line 322
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->translationStereo:Ljava/util/Map;

    sget-object v1, Lorg/jcodec/common/model/Label;->Left:Lorg/jcodec/common/model/Label;

    sget-object v2, Lorg/jcodec/common/model/ChannelLabel;->STEREO_LEFT:Lorg/jcodec/common/model/ChannelLabel;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 323
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->translationStereo:Ljava/util/Map;

    sget-object v1, Lorg/jcodec/common/model/Label;->Right:Lorg/jcodec/common/model/Label;

    sget-object v2, Lorg/jcodec/common/model/ChannelLabel;->STEREO_RIGHT:Lorg/jcodec/common/model/ChannelLabel;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 324
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->translationStereo:Ljava/util/Map;

    sget-object v1, Lorg/jcodec/common/model/Label;->HeadphonesLeft:Lorg/jcodec/common/model/Label;

    sget-object v2, Lorg/jcodec/common/model/ChannelLabel;->STEREO_LEFT:Lorg/jcodec/common/model/ChannelLabel;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 325
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->translationStereo:Ljava/util/Map;

    sget-object v1, Lorg/jcodec/common/model/Label;->HeadphonesRight:Lorg/jcodec/common/model/Label;

    sget-object v2, Lorg/jcodec/common/model/ChannelLabel;->STEREO_RIGHT:Lorg/jcodec/common/model/ChannelLabel;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 326
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->translationStereo:Ljava/util/Map;

    sget-object v1, Lorg/jcodec/common/model/Label;->LeftTotal:Lorg/jcodec/common/model/Label;

    sget-object v2, Lorg/jcodec/common/model/ChannelLabel;->STEREO_LEFT:Lorg/jcodec/common/model/ChannelLabel;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 327
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->translationStereo:Ljava/util/Map;

    sget-object v1, Lorg/jcodec/common/model/Label;->RightTotal:Lorg/jcodec/common/model/Label;

    sget-object v2, Lorg/jcodec/common/model/ChannelLabel;->STEREO_RIGHT:Lorg/jcodec/common/model/ChannelLabel;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 328
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->translationStereo:Ljava/util/Map;

    sget-object v1, Lorg/jcodec/common/model/Label;->LeftWide:Lorg/jcodec/common/model/Label;

    sget-object v2, Lorg/jcodec/common/model/ChannelLabel;->STEREO_LEFT:Lorg/jcodec/common/model/ChannelLabel;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 329
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->translationStereo:Ljava/util/Map;

    sget-object v1, Lorg/jcodec/common/model/Label;->RightWide:Lorg/jcodec/common/model/Label;

    sget-object v2, Lorg/jcodec/common/model/ChannelLabel;->STEREO_RIGHT:Lorg/jcodec/common/model/ChannelLabel;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 331
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->translationSurround:Ljava/util/Map;

    sget-object v1, Lorg/jcodec/common/model/Label;->Left:Lorg/jcodec/common/model/Label;

    sget-object v2, Lorg/jcodec/common/model/ChannelLabel;->FRONT_LEFT:Lorg/jcodec/common/model/ChannelLabel;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 332
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->translationSurround:Ljava/util/Map;

    sget-object v1, Lorg/jcodec/common/model/Label;->Right:Lorg/jcodec/common/model/Label;

    sget-object v2, Lorg/jcodec/common/model/ChannelLabel;->FRONT_RIGHT:Lorg/jcodec/common/model/ChannelLabel;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 333
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->translationSurround:Ljava/util/Map;

    sget-object v1, Lorg/jcodec/common/model/Label;->LeftCenter:Lorg/jcodec/common/model/Label;

    sget-object v2, Lorg/jcodec/common/model/ChannelLabel;->FRONT_CENTER_LEFT:Lorg/jcodec/common/model/ChannelLabel;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 334
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->translationSurround:Ljava/util/Map;

    sget-object v1, Lorg/jcodec/common/model/Label;->RightCenter:Lorg/jcodec/common/model/Label;

    sget-object v2, Lorg/jcodec/common/model/ChannelLabel;->FRONT_CENTER_RIGHT:Lorg/jcodec/common/model/ChannelLabel;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 335
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->translationSurround:Ljava/util/Map;

    sget-object v1, Lorg/jcodec/common/model/Label;->Center:Lorg/jcodec/common/model/Label;

    sget-object v2, Lorg/jcodec/common/model/ChannelLabel;->CENTER:Lorg/jcodec/common/model/ChannelLabel;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 336
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->translationSurround:Ljava/util/Map;

    sget-object v1, Lorg/jcodec/common/model/Label;->CenterSurround:Lorg/jcodec/common/model/Label;

    sget-object v2, Lorg/jcodec/common/model/ChannelLabel;->REAR_CENTER:Lorg/jcodec/common/model/ChannelLabel;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 337
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->translationSurround:Ljava/util/Map;

    sget-object v1, Lorg/jcodec/common/model/Label;->CenterSurroundDirect:Lorg/jcodec/common/model/Label;

    sget-object v2, Lorg/jcodec/common/model/ChannelLabel;->REAR_CENTER:Lorg/jcodec/common/model/ChannelLabel;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 338
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->translationSurround:Ljava/util/Map;

    sget-object v1, Lorg/jcodec/common/model/Label;->LeftSurround:Lorg/jcodec/common/model/Label;

    sget-object v2, Lorg/jcodec/common/model/ChannelLabel;->REAR_LEFT:Lorg/jcodec/common/model/ChannelLabel;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 339
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->translationSurround:Ljava/util/Map;

    sget-object v1, Lorg/jcodec/common/model/Label;->LeftSurroundDirect:Lorg/jcodec/common/model/Label;

    sget-object v2, Lorg/jcodec/common/model/ChannelLabel;->REAR_LEFT:Lorg/jcodec/common/model/ChannelLabel;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 340
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->translationSurround:Ljava/util/Map;

    sget-object v1, Lorg/jcodec/common/model/Label;->RightSurround:Lorg/jcodec/common/model/Label;

    sget-object v2, Lorg/jcodec/common/model/ChannelLabel;->REAR_RIGHT:Lorg/jcodec/common/model/ChannelLabel;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 341
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->translationSurround:Ljava/util/Map;

    sget-object v1, Lorg/jcodec/common/model/Label;->RightSurroundDirect:Lorg/jcodec/common/model/Label;

    sget-object v2, Lorg/jcodec/common/model/ChannelLabel;->REAR_RIGHT:Lorg/jcodec/common/model/ChannelLabel;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 342
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->translationSurround:Ljava/util/Map;

    sget-object v1, Lorg/jcodec/common/model/Label;->RearSurroundLeft:Lorg/jcodec/common/model/Label;

    sget-object v2, Lorg/jcodec/common/model/ChannelLabel;->SIDE_LEFT:Lorg/jcodec/common/model/ChannelLabel;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 343
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->translationSurround:Ljava/util/Map;

    sget-object v1, Lorg/jcodec/common/model/Label;->RearSurroundRight:Lorg/jcodec/common/model/Label;

    sget-object v2, Lorg/jcodec/common/model/ChannelLabel;->SIDE_RIGHT:Lorg/jcodec/common/model/ChannelLabel;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 344
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->translationSurround:Ljava/util/Map;

    sget-object v1, Lorg/jcodec/common/model/Label;->LFE2:Lorg/jcodec/common/model/Label;

    sget-object v2, Lorg/jcodec/common/model/ChannelLabel;->LFE:Lorg/jcodec/common/model/ChannelLabel;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 345
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->translationSurround:Ljava/util/Map;

    sget-object v1, Lorg/jcodec/common/model/Label;->LFEScreen:Lorg/jcodec/common/model/Label;

    sget-object v2, Lorg/jcodec/common/model/ChannelLabel;->LFE:Lorg/jcodec/common/model/ChannelLabel;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 346
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->translationSurround:Ljava/util/Map;

    sget-object v1, Lorg/jcodec/common/model/Label;->LeftTotal:Lorg/jcodec/common/model/Label;

    sget-object v2, Lorg/jcodec/common/model/ChannelLabel;->STEREO_LEFT:Lorg/jcodec/common/model/ChannelLabel;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 347
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->translationSurround:Ljava/util/Map;

    sget-object v1, Lorg/jcodec/common/model/Label;->RightTotal:Lorg/jcodec/common/model/Label;

    sget-object v2, Lorg/jcodec/common/model/ChannelLabel;->STEREO_RIGHT:Lorg/jcodec/common/model/ChannelLabel;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 348
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->translationSurround:Ljava/util/Map;

    sget-object v1, Lorg/jcodec/common/model/Label;->LeftWide:Lorg/jcodec/common/model/Label;

    sget-object v2, Lorg/jcodec/common/model/ChannelLabel;->STEREO_LEFT:Lorg/jcodec/common/model/ChannelLabel;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 349
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->translationSurround:Ljava/util/Map;

    sget-object v1, Lorg/jcodec/common/model/Label;->RightWide:Lorg/jcodec/common/model/Label;

    sget-object v2, Lorg/jcodec/common/model/ChannelLabel;->STEREO_RIGHT:Lorg/jcodec/common/model/ChannelLabel;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 350
    return-void
.end method

.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    .line 85
    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/SampleEntry;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 86
    return-void
.end method

.method public static _setLabels(Lorg/jcodec/containers/mp4/boxes/TrakBox;[Lorg/jcodec/common/model/Label;)V
    .locals 7

    .line 391
    const-class v0, Lorg/jcodec/containers/mp4/boxes/ChannelBox;

    const-string v1, "mdia"

    const-string v2, "minf"

    const-string v3, "stbl"

    const-string v4, "stsd"

    const-string v6, "chan"

    const/4 v5, 0x0

    filled-new-array/range {v1 .. v6}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->findFirstPath(Lorg/jcodec/containers/mp4/boxes/NodeBox;Ljava/lang/Class;[Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v0

    check-cast v0, Lorg/jcodec/containers/mp4/boxes/ChannelBox;

    .line 392
    if-nez v0, :cond_0

    .line 393
    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/ChannelBox;->createChannelBox()Lorg/jcodec/containers/mp4/boxes/ChannelBox;

    move-result-object v0

    .line 394
    const-class v1, Lorg/jcodec/containers/mp4/boxes/SampleEntry;

    const-string v2, "mdia"

    const-string v3, "minf"

    const-string v4, "stbl"

    const-string v5, "stsd"

    const/4 v6, 0x0

    filled-new-array {v2, v3, v4, v5, v6}, [Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v1, v2}, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->findFirstPath(Lorg/jcodec/containers/mp4/boxes/NodeBox;Ljava/lang/Class;[Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object p0

    check-cast p0, Lorg/jcodec/containers/mp4/boxes/SampleEntry;

    invoke-virtual {p0, v0}, Lorg/jcodec/containers/mp4/boxes/SampleEntry;->add(Lorg/jcodec/containers/mp4/boxes/Box;)V

    .line 396
    :cond_0
    invoke-static {p1, v0}, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->setLabels([Lorg/jcodec/common/model/Label;Lorg/jcodec/containers/mp4/boxes/ChannelBox;)V

    .line 397
    return-void
.end method

.method public static audioSampleEntry(Ljava/lang/String;IIIILjava/nio/ByteOrder;)Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;
    .locals 18

    move/from16 v0, p3

    .line 288
    const-wide/16 v1, 0x0

    move-object/from16 v3, p0

    invoke-static {v3, v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;->createHeader(Ljava/lang/String;J)Lorg/jcodec/containers/mp4/boxes/Header;

    move-result-object v4

    move/from16 v1, p1

    int-to-short v5, v1

    int-to-short v6, v0

    mul-int v15, v0, p2

    const/16 v7, 0x10

    const/4 v9, 0x0

    const/4 v10, 0x0

    const v11, 0xffff

    const/4 v12, 0x0

    const/4 v13, 0x1

    const/16 v17, 0x1

    move/from16 v8, p4

    move/from16 v14, p2

    move/from16 v16, p2

    invoke-static/range {v4 .. v17}, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->createAudioSampleEntry(Lorg/jcodec/containers/mp4/boxes/Header;SSSISIIIIIIIS)Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    move-result-object v0

    .line 292
    new-instance v1, Lorg/jcodec/containers/mp4/boxes/NodeBox;

    new-instance v2, Lorg/jcodec/containers/mp4/boxes/Header;

    const-string v4, "wave"

    invoke-direct {v2, v4}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/NodeBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 293
    invoke-virtual {v0, v1}, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->add(Lorg/jcodec/containers/mp4/boxes/Box;)V

    .line 295
    invoke-static/range {p0 .. p0}, Lorg/jcodec/containers/mp4/boxes/FormatBox;->createFormatBox(Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/FormatBox;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->add(Lorg/jcodec/containers/mp4/boxes/Box;)V

    .line 296
    invoke-static/range {p5 .. p5}, Lorg/jcodec/containers/mp4/boxes/EndianBox;->createEndianBox(Ljava/nio/ByteOrder;)Lorg/jcodec/containers/mp4/boxes/EndianBox;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->add(Lorg/jcodec/containers/mp4/boxes/Box;)V

    .line 297
    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->terminatorAtom()Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->add(Lorg/jcodec/containers/mp4/boxes/Box;)V

    .line 300
    return-object v0
.end method

.method public static audioSampleEntryPCM(Lorg/jcodec/common/AudioFormat;)Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;
    .locals 6

    .line 313
    invoke-static {p0}, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->lookupFourcc(Lorg/jcodec/common/AudioFormat;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lorg/jcodec/common/AudioFormat;->getSampleSizeInBits()I

    move-result v1

    shr-int/lit8 v2, v1, 0x3

    .line 314
    invoke-virtual {p0}, Lorg/jcodec/common/AudioFormat;->getChannels()I

    move-result v3

    invoke-virtual {p0}, Lorg/jcodec/common/AudioFormat;->getSampleRate()I

    move-result v4

    .line 315
    invoke-virtual {p0}, Lorg/jcodec/common/AudioFormat;->isBigEndian()Z

    move-result p0

    if-eqz p0, :cond_0

    sget-object p0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    .line 313
    :goto_0
    move-object v5, p0

    goto :goto_1

    .line 315
    :cond_0
    sget-object p0, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    goto :goto_0

    .line 313
    :goto_1
    const/4 v1, 0x1

    invoke-static/range {v0 .. v5}, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->audioSampleEntry(Ljava/lang/String;IIIILjava/nio/ByteOrder;)Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    move-result-object p0

    return-object p0
.end method

.method public static compressedAudioSampleEntry(Ljava/lang/String;IIIIIII)Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;
    .locals 16

    .line 280
    const-wide/16 v0, 0x0

    move-object/from16 v2, p0

    invoke-static {v2, v0, v1}, Lorg/jcodec/containers/mp4/boxes/Header;->createHeader(Ljava/lang/String;J)Lorg/jcodec/containers/mp4/boxes/Header;

    move-result-object v2

    move/from16 v0, p1

    int-to-short v3, v0

    move/from16 v0, p3

    int-to-short v4, v0

    const/16 v5, 0x10

    const/4 v7, 0x0

    const/4 v8, 0x0

    const v9, 0xfffe

    const/4 v10, 0x0

    const/4 v14, 0x2

    const/4 v15, 0x0

    move/from16 v6, p4

    move/from16 v11, p5

    move/from16 v12, p6

    move/from16 v13, p7

    invoke-static/range {v2 .. v15}, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->createAudioSampleEntry(Lorg/jcodec/containers/mp4/boxes/Header;SSSISIIIIIIIS)Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    move-result-object v0

    .line 283
    return-object v0
.end method

.method public static createAudioSampleEntry(Lorg/jcodec/containers/mp4/boxes/Header;SSSISIIIIIIIS)Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;
    .locals 1

    .line 48
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-direct {v0, p0}, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 49
    iput-short p1, v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->drefInd:S

    .line 50
    iput-short p2, v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->channelCount:S

    .line 51
    iput-short p3, v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->sampleSize:S

    .line 52
    int-to-float p0, p4

    iput p0, v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->sampleRate:F

    .line 53
    iput-short p5, v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->revision:S

    .line 54
    iput p6, v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->vendor:I

    .line 55
    iput p7, v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->compressionId:I

    .line 56
    iput p8, v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->pktSize:I

    .line 57
    iput p9, v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->samplesPerPkt:I

    .line 58
    iput p10, v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->bytesPerPkt:I

    .line 59
    iput p11, v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->bytesPerFrame:I

    .line 60
    iput p12, v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->bytesPerSample:I

    .line 61
    iput-short p13, v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->version:S

    .line 62
    return-object v0
.end method

.method public static extractLabels([Lorg/jcodec/containers/mp4/boxes/ChannelBox$ChannelDescription;)[Lorg/jcodec/common/model/Label;
    .locals 3

    .line 447
    array-length v0, p0

    new-array v0, v0, [Lorg/jcodec/common/model/Label;

    .line 448
    const/4 v1, 0x0

    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_0

    .line 449
    aget-object v2, p0, v1

    invoke-virtual {v2}, Lorg/jcodec/containers/mp4/boxes/ChannelBox$ChannelDescription;->getLabel()Lorg/jcodec/common/model/Label;

    move-result-object v2

    aput-object v2, v0, v1

    .line 448
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 450
    :cond_0
    return-object v0
.end method

.method public static getLabelsByBitmap(J)[Lorg/jcodec/common/model/Label;
    .locals 9

    .line 436
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 437
    invoke-static {}, Lorg/jcodec/common/model/Label;->values()[Lorg/jcodec/common/model/Label;

    move-result-object v1

    .line 438
    const/4 v2, 0x0

    move v3, v2

    :goto_0
    array-length v4, v1

    if-ge v3, v4, :cond_1

    .line 439
    aget-object v4, v1, v3

    .line 440
    iget-wide v5, v4, Lorg/jcodec/common/model/Label;->bitmapVal:J

    and-long/2addr v5, p0

    const-wide/16 v7, 0x0

    cmp-long v5, v5, v7

    if-eqz v5, :cond_0

    .line 441
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 438
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 443
    :cond_1
    new-array p0, v2, [Lorg/jcodec/common/model/Label;

    invoke-interface {v0, p0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Lorg/jcodec/common/model/Label;

    return-object p0
.end method

.method public static getLabelsFromChan(Lorg/jcodec/containers/mp4/boxes/ChannelBox;)[Lorg/jcodec/common/model/Label;
    .locals 7

    .line 454
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/ChannelBox;->getChannelLayout()I

    move-result v0

    int-to-long v0, v0

    .line 455
    const/16 v2, 0x10

    shr-long v2, v0, v2

    const-wide/16 v4, 0x93

    cmp-long v2, v2, v4

    const/4 v3, 0x0

    if-nez v2, :cond_1

    .line 456
    long-to-int p0, v0

    const v0, 0xffff

    and-int/2addr p0, v0

    .line 457
    new-array v0, p0, [Lorg/jcodec/common/model/Label;

    .line 458
    :goto_0
    if-ge v3, p0, :cond_0

    .line 459
    const/high16 v1, 0x10000

    or-int/2addr v1, v3

    invoke-static {v1}, Lorg/jcodec/common/model/Label;->getByVal(I)Lorg/jcodec/common/model/Label;

    move-result-object v1

    aput-object v1, v0, v3

    .line 458
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 460
    :cond_0
    return-object v0

    .line 462
    :cond_1
    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/channel/ChannelLayout;->values()[Lorg/jcodec/containers/mp4/boxes/channel/ChannelLayout;

    move-result-object v2

    .line 463
    :goto_1
    array-length v4, v2

    if-ge v3, v4, :cond_5

    .line 464
    aget-object v4, v2, v3

    .line 465
    invoke-virtual {v4}, Lorg/jcodec/containers/mp4/boxes/channel/ChannelLayout;->getCode()I

    move-result v5

    int-to-long v5, v5

    cmp-long v5, v5, v0

    if-nez v5, :cond_4

    .line 466
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/channel/ChannelLayout;->kCAFChannelLayoutTag_UseChannelDescriptions:Lorg/jcodec/containers/mp4/boxes/channel/ChannelLayout;

    if-ne v4, v0, :cond_2

    .line 467
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/ChannelBox;->getDescriptions()[Lorg/jcodec/containers/mp4/boxes/ChannelBox$ChannelDescription;

    move-result-object p0

    invoke-static {p0}, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->extractLabels([Lorg/jcodec/containers/mp4/boxes/ChannelBox$ChannelDescription;)[Lorg/jcodec/common/model/Label;

    move-result-object p0

    return-object p0

    .line 468
    :cond_2
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/channel/ChannelLayout;->kCAFChannelLayoutTag_UseChannelBitmap:Lorg/jcodec/containers/mp4/boxes/channel/ChannelLayout;

    if-ne v4, v0, :cond_3

    .line 469
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/ChannelBox;->getChannelBitmap()I

    move-result p0

    int-to-long v0, p0

    invoke-static {v0, v1}, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->getLabelsByBitmap(J)[Lorg/jcodec/common/model/Label;

    move-result-object p0

    return-object p0

    .line 471
    :cond_3
    invoke-virtual {v4}, Lorg/jcodec/containers/mp4/boxes/channel/ChannelLayout;->getLabels()[Lorg/jcodec/common/model/Label;

    move-result-object p0

    return-object p0

    .line 463
    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 475
    :cond_5
    sget-object p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->EMPTY:[Lorg/jcodec/common/model/Label;

    return-object p0
.end method

.method public static getLabelsFromSampleEntry(Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;)[Lorg/jcodec/common/model/Label;
    .locals 7

    .line 353
    const-class v0, Lorg/jcodec/containers/mp4/boxes/ChannelBox;

    const-string v1, "chan"

    invoke-static {p0, v0, v1}, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->findFirst(Lorg/jcodec/containers/mp4/boxes/NodeBox;Ljava/lang/Class;Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v0

    check-cast v0, Lorg/jcodec/containers/mp4/boxes/ChannelBox;

    .line 354
    if-eqz v0, :cond_0

    .line 355
    invoke-static {v0}, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->getLabelsFromChan(Lorg/jcodec/containers/mp4/boxes/ChannelBox;)[Lorg/jcodec/common/model/Label;

    move-result-object p0

    return-object p0

    .line 357
    :cond_0
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->getChannelCount()S

    move-result p0

    .line 358
    const/4 v0, 0x5

    const/4 v1, 0x4

    const/4 v2, 0x3

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    packed-switch p0, :pswitch_data_0

    .line 373
    new-array p0, p0, [Lorg/jcodec/common/model/Label;

    .line 374
    sget-object v0, Lorg/jcodec/common/model/Label;->Mono:Lorg/jcodec/common/model/Label;

    invoke-static {p0, v0}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 375
    return-object p0

    .line 370
    :pswitch_0
    const/4 p0, 0x6

    new-array p0, p0, [Lorg/jcodec/common/model/Label;

    sget-object v6, Lorg/jcodec/common/model/Label;->Left:Lorg/jcodec/common/model/Label;

    aput-object v6, p0, v5

    sget-object v5, Lorg/jcodec/common/model/Label;->Right:Lorg/jcodec/common/model/Label;

    aput-object v5, p0, v4

    sget-object v4, Lorg/jcodec/common/model/Label;->Center:Lorg/jcodec/common/model/Label;

    aput-object v4, p0, v3

    sget-object v3, Lorg/jcodec/common/model/Label;->LFEScreen:Lorg/jcodec/common/model/Label;

    aput-object v3, p0, v2

    sget-object v2, Lorg/jcodec/common/model/Label;->LeftSurround:Lorg/jcodec/common/model/Label;

    aput-object v2, p0, v1

    sget-object v1, Lorg/jcodec/common/model/Label;->RightSurround:Lorg/jcodec/common/model/Label;

    aput-object v1, p0, v0

    return-object p0

    .line 368
    :pswitch_1
    new-array p0, v0, [Lorg/jcodec/common/model/Label;

    sget-object v0, Lorg/jcodec/common/model/Label;->Left:Lorg/jcodec/common/model/Label;

    aput-object v0, p0, v5

    sget-object v0, Lorg/jcodec/common/model/Label;->Right:Lorg/jcodec/common/model/Label;

    aput-object v0, p0, v4

    sget-object v0, Lorg/jcodec/common/model/Label;->Center:Lorg/jcodec/common/model/Label;

    aput-object v0, p0, v3

    sget-object v0, Lorg/jcodec/common/model/Label;->LeftSurround:Lorg/jcodec/common/model/Label;

    aput-object v0, p0, v2

    sget-object v0, Lorg/jcodec/common/model/Label;->RightSurround:Lorg/jcodec/common/model/Label;

    aput-object v0, p0, v1

    return-object p0

    .line 366
    :pswitch_2
    new-array p0, v1, [Lorg/jcodec/common/model/Label;

    sget-object v0, Lorg/jcodec/common/model/Label;->Left:Lorg/jcodec/common/model/Label;

    aput-object v0, p0, v5

    sget-object v0, Lorg/jcodec/common/model/Label;->Right:Lorg/jcodec/common/model/Label;

    aput-object v0, p0, v4

    sget-object v0, Lorg/jcodec/common/model/Label;->LeftSurround:Lorg/jcodec/common/model/Label;

    aput-object v0, p0, v3

    sget-object v0, Lorg/jcodec/common/model/Label;->RightSurround:Lorg/jcodec/common/model/Label;

    aput-object v0, p0, v2

    return-object p0

    .line 364
    :pswitch_3
    new-array p0, v2, [Lorg/jcodec/common/model/Label;

    sget-object v0, Lorg/jcodec/common/model/Label;->Left:Lorg/jcodec/common/model/Label;

    aput-object v0, p0, v5

    sget-object v0, Lorg/jcodec/common/model/Label;->Right:Lorg/jcodec/common/model/Label;

    aput-object v0, p0, v4

    sget-object v0, Lorg/jcodec/common/model/Label;->Center:Lorg/jcodec/common/model/Label;

    aput-object v0, p0, v3

    return-object p0

    .line 362
    :pswitch_4
    new-array p0, v3, [Lorg/jcodec/common/model/Label;

    sget-object v0, Lorg/jcodec/common/model/Label;->Left:Lorg/jcodec/common/model/Label;

    aput-object v0, p0, v5

    sget-object v0, Lorg/jcodec/common/model/Label;->Right:Lorg/jcodec/common/model/Label;

    aput-object v0, p0, v4

    return-object p0

    .line 360
    :pswitch_5
    new-array p0, v4, [Lorg/jcodec/common/model/Label;

    sget-object v0, Lorg/jcodec/common/model/Label;->Mono:Lorg/jcodec/common/model/Label;

    aput-object v0, p0, v5

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static getLabelsFromTrack(Lorg/jcodec/containers/mp4/boxes/TrakBox;)[Lorg/jcodec/common/model/Label;
    .locals 1

    .line 381
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->getSampleEntries()[Lorg/jcodec/containers/mp4/boxes/SampleEntry;

    move-result-object p0

    const/4 v0, 0x0

    aget-object p0, p0, v0

    check-cast p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-static {p0}, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->getLabelsFromSampleEntry(Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;)[Lorg/jcodec/common/model/Label;

    move-result-object p0

    return-object p0
.end method

.method public static lookupFourcc(Lorg/jcodec/common/AudioFormat;)Ljava/lang/String;
    .locals 3

    .line 304
    invoke-virtual {p0}, Lorg/jcodec/common/AudioFormat;->getSampleSizeInBits()I

    move-result v0

    const/16 v1, 0x10

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Lorg/jcodec/common/AudioFormat;->isBigEndian()Z

    move-result v0

    if-nez v0, :cond_0

    .line 305
    const-string p0, "sowt"

    return-object p0

    .line 306
    :cond_0
    invoke-virtual {p0}, Lorg/jcodec/common/AudioFormat;->getSampleSizeInBits()I

    move-result v0

    const/16 v1, 0x18

    if-ne v0, v1, :cond_1

    .line 307
    const-string p0, "in24"

    return-object p0

    .line 309
    :cond_1
    new-instance v0, Lorg/jcodec/api/NotSupportedException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Audio format "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, " is not supported."

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lorg/jcodec/api/NotSupportedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static setLabel(Lorg/jcodec/containers/mp4/boxes/TrakBox;ILorg/jcodec/common/model/Label;)V
    .locals 1

    .line 385
    invoke-static {p0}, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->getLabelsFromTrack(Lorg/jcodec/containers/mp4/boxes/TrakBox;)[Lorg/jcodec/common/model/Label;

    move-result-object v0

    .line 386
    aput-object p2, v0, p1

    .line 387
    invoke-static {p0, v0}, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->_setLabels(Lorg/jcodec/containers/mp4/boxes/TrakBox;[Lorg/jcodec/common/model/Label;)V

    .line 388
    return-void
.end method

.method public static setLabels([Lorg/jcodec/common/model/Label;Lorg/jcodec/containers/mp4/boxes/ChannelBox;)V
    .locals 6

    .line 400
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/channel/ChannelLayout;->kCAFChannelLayoutTag_UseChannelDescriptions:Lorg/jcodec/containers/mp4/boxes/channel/ChannelLayout;

    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/boxes/channel/ChannelLayout;->getCode()I

    move-result v0

    invoke-virtual {p1, v0}, Lorg/jcodec/containers/mp4/boxes/ChannelBox;->setChannelLayout(I)V

    .line 401
    array-length v0, p0

    new-array v0, v0, [Lorg/jcodec/containers/mp4/boxes/ChannelBox$ChannelDescription;

    .line 402
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    array-length v3, p0

    if-ge v2, v3, :cond_0

    .line 403
    new-instance v3, Lorg/jcodec/containers/mp4/boxes/ChannelBox$ChannelDescription;

    aget-object v4, p0, v2

    invoke-virtual {v4}, Lorg/jcodec/common/model/Label;->getVal()I

    move-result v4

    const/4 v5, 0x3

    new-array v5, v5, [F

    fill-array-data v5, :array_0

    invoke-direct {v3, v4, v1, v5}, Lorg/jcodec/containers/mp4/boxes/ChannelBox$ChannelDescription;-><init>(II[F)V

    aput-object v3, v0, v2

    .line 402
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 404
    :cond_0
    invoke-virtual {p1, v0}, Lorg/jcodec/containers/mp4/boxes/ChannelBox;->setDescriptions([Lorg/jcodec/containers/mp4/boxes/ChannelBox$ChannelDescription;)V

    .line 405
    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
    .end array-data
.end method

.method private translate(Ljava/util/Map;[Lorg/jcodec/common/model/Label;)[Lorg/jcodec/common/model/ChannelLabel;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lorg/jcodec/common/model/Label;",
            "Lorg/jcodec/common/model/ChannelLabel;",
            ">;[",
            "Lorg/jcodec/common/model/Label;",
            ")[",
            "Lorg/jcodec/common/model/ChannelLabel;"
        }
    .end annotation

    .line 269
    array-length v0, p2

    new-array v0, v0, [Lorg/jcodec/common/model/ChannelLabel;

    .line 270
    nop

    .line 271
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    array-length v3, p2

    if-ge v1, v3, :cond_0

    .line 272
    aget-object v3, p2, v1

    .line 273
    add-int/lit8 v4, v2, 0x1

    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jcodec/common/model/ChannelLabel;

    aput-object v3, v0, v2

    .line 271
    add-int/lit8 v1, v1, 0x1

    move v2, v4

    goto :goto_0

    .line 275
    :cond_0
    return-object v0
.end method


# virtual methods
.method public calcFrameSize()I
    .locals 2

    .line 171
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->version:S

    if-eqz v0, :cond_1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->bytesPerFrame:I

    if-nez v0, :cond_0

    goto :goto_0

    .line 174
    :cond_0
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->bytesPerFrame:I

    return v0

    .line 172
    :cond_1
    :goto_0
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->sampleSize:S

    shr-int/lit8 v0, v0, 0x3

    iget-short v1, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->channelCount:S

    mul-int/2addr v0, v1

    return v0
.end method

.method public calcSampleSize()I
    .locals 2

    .line 178
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->calcFrameSize()I

    move-result v0

    iget-short v1, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->channelCount:S

    div-int/2addr v0, v1

    return v0
.end method

.method protected doWrite(Ljava/nio/ByteBuffer;)V
    .locals 4

    .line 123
    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/SampleEntry;->doWrite(Ljava/nio/ByteBuffer;)V

    .line 125
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->version:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 126
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->revision:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 127
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->vendor:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 129
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->version:S

    const/16 v1, 0x10

    const/4 v2, 0x2

    if-ge v0, v2, :cond_1

    .line 130
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->channelCount:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 131
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->version:S

    if-nez v0, :cond_0

    .line 132
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->sampleSize:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    goto :goto_0

    .line 134
    :cond_0
    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 136
    :goto_0
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->compressionId:I

    int-to-short v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 137
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->pktSize:I

    int-to-short v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 139
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->sampleRate:F

    float-to-double v0, v0

    const-wide/high16 v2, 0x40f0000000000000L    # 65536.0

    mul-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    move-result-wide v0

    long-to-int v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 141
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->version:S

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    .line 142
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->samplesPerPkt:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 143
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->bytesPerPkt:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 144
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->bytesPerFrame:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 145
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->bytesPerSample:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    goto :goto_1

    .line 147
    :cond_1
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->version:S

    if-ne v0, v2, :cond_2

    .line 148
    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 149
    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 150
    const/4 v0, -0x2

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 151
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 152
    const/high16 v0, 0x10000

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 153
    const/16 v0, 0x48

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 154
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->sampleRate:F

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 155
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->channelCount:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 156
    const/high16 v0, 0x7f000000

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 157
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->sampleSize:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 158
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->lpcmFlags:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 159
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->bytesPerFrame:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 160
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->samplesPerPkt:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 163
    :cond_2
    :goto_1
    invoke-virtual {p0, p1}, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->writeExtensions(Ljava/nio/ByteBuffer;)V

    .line 164
    return-void
.end method

.method public getBytesPerFrame()I
    .locals 1

    .line 190
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->bytesPerFrame:I

    return v0
.end method

.method public getBytesPerSample()I
    .locals 1

    .line 194
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->bytesPerSample:I

    return v0
.end method

.method public getChannelCount()S
    .locals 1

    .line 167
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->channelCount:S

    return v0
.end method

.method public getEndian()Ljava/nio/ByteOrder;
    .locals 4

    .line 202
    const-class v0, Lorg/jcodec/containers/mp4/boxes/EndianBox;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/WaveExtension;->fourcc()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/EndianBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {p0, v0, v1}, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->findFirstPath(Lorg/jcodec/containers/mp4/boxes/NodeBox;Ljava/lang/Class;[Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v0

    check-cast v0, Lorg/jcodec/containers/mp4/boxes/EndianBox;

    .line 203
    if-nez v0, :cond_4

    .line 204
    const-string v0, "twos"

    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->header:Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-virtual {v1}, Lorg/jcodec/containers/mp4/boxes/Header;->getFourcc()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 205
    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    return-object v0

    .line 206
    :cond_0
    const-string v0, "lpcm"

    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->header:Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-virtual {v1}, Lorg/jcodec/containers/mp4/boxes/Header;->getFourcc()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 207
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->lpcmFlags:I

    sget v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->kAudioFormatFlagIsBigEndian:I

    and-int/2addr v0, v1

    if-eqz v0, :cond_1

    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    goto :goto_0

    :cond_1
    sget-object v0, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    :goto_0
    return-object v0

    .line 208
    :cond_2
    const-string v0, "sowt"

    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->header:Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-virtual {v1}, Lorg/jcodec/containers/mp4/boxes/Header;->getFourcc()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 209
    sget-object v0, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    return-object v0

    .line 211
    :cond_3
    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    return-object v0

    .line 213
    :cond_4
    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/boxes/EndianBox;->getEndian()Ljava/nio/ByteOrder;

    move-result-object v0

    return-object v0
.end method

.method public getFormat()Lorg/jcodec/common/AudioFormat;
    .locals 7

    .line 239
    new-instance v6, Lorg/jcodec/common/AudioFormat;

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->sampleRate:F

    float-to-int v1, v0

    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->calcSampleSize()I

    move-result v0

    shl-int/lit8 v2, v0, 0x3

    iget-short v3, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->channelCount:S

    .line 240
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->getEndian()Ljava/nio/ByteOrder;

    move-result-object v0

    sget-object v4, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v0, v4, :cond_0

    const/4 v0, 0x1

    :goto_0
    move v5, v0

    goto :goto_1

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :goto_1
    const/4 v4, 0x1

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lorg/jcodec/common/AudioFormat;-><init>(IIIZZ)V

    return-object v6
.end method

.method public getLabels()[Lorg/jcodec/common/model/ChannelLabel;
    .locals 5

    .line 244
    const-class v0, Lorg/jcodec/containers/mp4/boxes/ChannelBox;

    const-string v1, "chan"

    invoke-static {p0, v0, v1}, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->findFirst(Lorg/jcodec/containers/mp4/boxes/NodeBox;Ljava/lang/Class;Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v0

    check-cast v0, Lorg/jcodec/containers/mp4/boxes/ChannelBox;

    .line 245
    const/4 v1, 0x2

    if-eqz v0, :cond_1

    .line 246
    invoke-static {v0}, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->getLabelsFromChan(Lorg/jcodec/containers/mp4/boxes/ChannelBox;)[Lorg/jcodec/common/model/Label;

    move-result-object v0

    .line 247
    iget-short v2, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->channelCount:S

    if-ne v2, v1, :cond_0

    .line 248
    sget-object v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->translationStereo:Ljava/util/Map;

    invoke-direct {p0, v1, v0}, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->translate(Ljava/util/Map;[Lorg/jcodec/common/model/Label;)[Lorg/jcodec/common/model/ChannelLabel;

    move-result-object v0

    return-object v0

    .line 250
    :cond_0
    sget-object v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->translationSurround:Ljava/util/Map;

    invoke-direct {p0, v1, v0}, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->translate(Ljava/util/Map;[Lorg/jcodec/common/model/Label;)[Lorg/jcodec/common/model/ChannelLabel;

    move-result-object v0

    return-object v0

    .line 252
    :cond_1
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->channelCount:S

    const/4 v2, 0x6

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eq v0, v2, :cond_2

    packed-switch v0, :pswitch_data_0

    .line 261
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->channelCount:S

    new-array v0, v0, [Lorg/jcodec/common/model/ChannelLabel;

    .line 262
    sget-object v1, Lorg/jcodec/common/model/ChannelLabel;->MONO:Lorg/jcodec/common/model/ChannelLabel;

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 263
    return-object v0

    .line 256
    :pswitch_0
    new-array v0, v1, [Lorg/jcodec/common/model/ChannelLabel;

    sget-object v1, Lorg/jcodec/common/model/ChannelLabel;->STEREO_LEFT:Lorg/jcodec/common/model/ChannelLabel;

    aput-object v1, v0, v4

    sget-object v1, Lorg/jcodec/common/model/ChannelLabel;->STEREO_RIGHT:Lorg/jcodec/common/model/ChannelLabel;

    aput-object v1, v0, v3

    return-object v0

    .line 254
    :pswitch_1
    new-array v0, v3, [Lorg/jcodec/common/model/ChannelLabel;

    sget-object v1, Lorg/jcodec/common/model/ChannelLabel;->MONO:Lorg/jcodec/common/model/ChannelLabel;

    aput-object v1, v0, v4

    return-object v0

    .line 258
    :cond_2
    new-array v0, v2, [Lorg/jcodec/common/model/ChannelLabel;

    sget-object v2, Lorg/jcodec/common/model/ChannelLabel;->FRONT_LEFT:Lorg/jcodec/common/model/ChannelLabel;

    aput-object v2, v0, v4

    sget-object v2, Lorg/jcodec/common/model/ChannelLabel;->FRONT_RIGHT:Lorg/jcodec/common/model/ChannelLabel;

    aput-object v2, v0, v3

    sget-object v2, Lorg/jcodec/common/model/ChannelLabel;->CENTER:Lorg/jcodec/common/model/ChannelLabel;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lorg/jcodec/common/model/ChannelLabel;->LFE:Lorg/jcodec/common/model/ChannelLabel;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Lorg/jcodec/common/model/ChannelLabel;->REAR_LEFT:Lorg/jcodec/common/model/ChannelLabel;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    sget-object v2, Lorg/jcodec/common/model/ChannelLabel;->REAR_RIGHT:Lorg/jcodec/common/model/ChannelLabel;

    aput-object v2, v0, v1

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getSampleRate()F
    .locals 1

    .line 186
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->sampleRate:F

    return v0
.end method

.method public getSampleSize()S
    .locals 1

    .line 182
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->sampleSize:S

    return v0
.end method

.method public getVersion()S
    .locals 1

    .line 198
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->version:S

    return v0
.end method

.method public isFloat()Z
    .locals 2

    .line 217
    const-string v0, "fl32"

    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->header:Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-virtual {v1}, Lorg/jcodec/containers/mp4/boxes/Header;->getFourcc()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "fl64"

    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->header:Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-virtual {v1}, Lorg/jcodec/containers/mp4/boxes/Header;->getFourcc()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "lpcm"

    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->header:Lorg/jcodec/containers/mp4/boxes/Header;

    .line 218
    invoke-virtual {v1}, Lorg/jcodec/containers/mp4/boxes/Header;->getFourcc()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->lpcmFlags:I

    sget v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->kAudioFormatFlagIsFloat:I

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public isPCM()Z
    .locals 2

    .line 235
    sget-object v0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->pcms:Ljava/util/Set;

    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->header:Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-virtual {v1}, Lorg/jcodec/containers/mp4/boxes/Header;->getFourcc()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 2

    .line 89
    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/SampleEntry;->parse(Ljava/nio/ByteBuffer;)V

    .line 91
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    iput-short v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->version:S

    .line 92
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    iput-short v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->revision:S

    .line 93
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->vendor:I

    .line 95
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    iput-short v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->channelCount:S

    .line 96
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    iput-short v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->sampleSize:S

    .line 98
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->compressionId:I

    .line 99
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->pktSize:I

    .line 101
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    invoke-static {v0}, Lorg/jcodec/platform/Platform;->unsignedInt(I)J

    move-result-wide v0

    .line 102
    long-to-float v0, v0

    const/high16 v1, 0x47800000    # 65536.0f

    div-float/2addr v0, v1

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->sampleRate:F

    .line 104
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->version:S

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 105
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->samplesPerPkt:I

    .line 106
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->bytesPerPkt:I

    .line 107
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->bytesPerFrame:I

    .line 108
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->bytesPerSample:I

    goto :goto_0

    .line 109
    :cond_0
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->version:S

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 110
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    .line 111
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v0

    double-to-float v0, v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->sampleRate:F

    .line 112
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    int-to-short v0, v0

    iput-short v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->channelCount:S

    .line 113
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    .line 114
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    int-to-short v0, v0

    iput-short v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->sampleSize:S

    .line 115
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->lpcmFlags:I

    .line 116
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->bytesPerFrame:I

    .line 117
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->samplesPerPkt:I

    .line 119
    :cond_1
    :goto_0
    invoke-virtual {p0, p1}, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->parseExtensions(Ljava/nio/ByteBuffer;)V

    .line 120
    return-void
.end method
