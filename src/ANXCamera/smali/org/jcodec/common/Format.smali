.class public final Lorg/jcodec/common/Format;
.super Ljava/lang/Object;
.source "Format.java"


# static fields
.field public static final AVI:Lorg/jcodec/common/Format;

.field public static final FLV:Lorg/jcodec/common/Format;

.field public static final H264:Lorg/jcodec/common/Format;

.field public static final IMG:Lorg/jcodec/common/Format;

.field public static final IVF:Lorg/jcodec/common/Format;

.field public static final MJPEG:Lorg/jcodec/common/Format;

.field public static final MKV:Lorg/jcodec/common/Format;

.field public static final MOV:Lorg/jcodec/common/Format;

.field public static final MPEG_AUDIO:Lorg/jcodec/common/Format;

.field public static final MPEG_PS:Lorg/jcodec/common/Format;

.field public static final MPEG_TS:Lorg/jcodec/common/Format;

.field public static final RAW:Lorg/jcodec/common/Format;

.field public static final WAV:Lorg/jcodec/common/Format;

.field public static final WEBP:Lorg/jcodec/common/Format;

.field public static final Y4M:Lorg/jcodec/common/Format;

.field private static final _values:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/jcodec/common/Format;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final audio:Z

.field private final name:Ljava/lang/String;

.field private final video:Z


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 16
    new-instance v0, Lorg/jcodec/common/Format;

    const-string v1, "MOV"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2, v2}, Lorg/jcodec/common/Format;-><init>(Ljava/lang/String;ZZ)V

    sput-object v0, Lorg/jcodec/common/Format;->MOV:Lorg/jcodec/common/Format;

    .line 17
    new-instance v0, Lorg/jcodec/common/Format;

    const-string v1, "MPEG_PS"

    invoke-direct {v0, v1, v2, v2}, Lorg/jcodec/common/Format;-><init>(Ljava/lang/String;ZZ)V

    sput-object v0, Lorg/jcodec/common/Format;->MPEG_PS:Lorg/jcodec/common/Format;

    .line 18
    new-instance v0, Lorg/jcodec/common/Format;

    const-string v1, "MPEG_TS"

    invoke-direct {v0, v1, v2, v2}, Lorg/jcodec/common/Format;-><init>(Ljava/lang/String;ZZ)V

    sput-object v0, Lorg/jcodec/common/Format;->MPEG_TS:Lorg/jcodec/common/Format;

    .line 19
    new-instance v0, Lorg/jcodec/common/Format;

    const-string v1, "MKV"

    invoke-direct {v0, v1, v2, v2}, Lorg/jcodec/common/Format;-><init>(Ljava/lang/String;ZZ)V

    sput-object v0, Lorg/jcodec/common/Format;->MKV:Lorg/jcodec/common/Format;

    .line 20
    new-instance v0, Lorg/jcodec/common/Format;

    const-string v1, "H264"

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lorg/jcodec/common/Format;-><init>(Ljava/lang/String;ZZ)V

    sput-object v0, Lorg/jcodec/common/Format;->H264:Lorg/jcodec/common/Format;

    .line 21
    new-instance v0, Lorg/jcodec/common/Format;

    const-string v1, "RAW"

    invoke-direct {v0, v1, v2, v2}, Lorg/jcodec/common/Format;-><init>(Ljava/lang/String;ZZ)V

    sput-object v0, Lorg/jcodec/common/Format;->RAW:Lorg/jcodec/common/Format;

    .line 22
    new-instance v0, Lorg/jcodec/common/Format;

    const-string v1, "FLV"

    invoke-direct {v0, v1, v2, v2}, Lorg/jcodec/common/Format;-><init>(Ljava/lang/String;ZZ)V

    sput-object v0, Lorg/jcodec/common/Format;->FLV:Lorg/jcodec/common/Format;

    .line 23
    new-instance v0, Lorg/jcodec/common/Format;

    const-string v1, "AVI"

    invoke-direct {v0, v1, v2, v2}, Lorg/jcodec/common/Format;-><init>(Ljava/lang/String;ZZ)V

    sput-object v0, Lorg/jcodec/common/Format;->AVI:Lorg/jcodec/common/Format;

    .line 24
    new-instance v0, Lorg/jcodec/common/Format;

    const-string v1, "IMG"

    invoke-direct {v0, v1, v2, v3}, Lorg/jcodec/common/Format;-><init>(Ljava/lang/String;ZZ)V

    sput-object v0, Lorg/jcodec/common/Format;->IMG:Lorg/jcodec/common/Format;

    .line 25
    new-instance v0, Lorg/jcodec/common/Format;

    const-string v1, "IVF"

    invoke-direct {v0, v1, v2, v3}, Lorg/jcodec/common/Format;-><init>(Ljava/lang/String;ZZ)V

    sput-object v0, Lorg/jcodec/common/Format;->IVF:Lorg/jcodec/common/Format;

    .line 26
    new-instance v0, Lorg/jcodec/common/Format;

    const-string v1, "MJPEG"

    invoke-direct {v0, v1, v2, v3}, Lorg/jcodec/common/Format;-><init>(Ljava/lang/String;ZZ)V

    sput-object v0, Lorg/jcodec/common/Format;->MJPEG:Lorg/jcodec/common/Format;

    .line 27
    new-instance v0, Lorg/jcodec/common/Format;

    const-string v1, "Y4M"

    invoke-direct {v0, v1, v2, v3}, Lorg/jcodec/common/Format;-><init>(Ljava/lang/String;ZZ)V

    sput-object v0, Lorg/jcodec/common/Format;->Y4M:Lorg/jcodec/common/Format;

    .line 28
    new-instance v0, Lorg/jcodec/common/Format;

    const-string v1, "WAV"

    invoke-direct {v0, v1, v3, v2}, Lorg/jcodec/common/Format;-><init>(Ljava/lang/String;ZZ)V

    sput-object v0, Lorg/jcodec/common/Format;->WAV:Lorg/jcodec/common/Format;

    .line 29
    new-instance v0, Lorg/jcodec/common/Format;

    const-string v1, "WEBP"

    invoke-direct {v0, v1, v2, v3}, Lorg/jcodec/common/Format;-><init>(Ljava/lang/String;ZZ)V

    sput-object v0, Lorg/jcodec/common/Format;->WEBP:Lorg/jcodec/common/Format;

    .line 30
    new-instance v0, Lorg/jcodec/common/Format;

    const-string v1, "MPEG_AUDIO"

    invoke-direct {v0, v1, v3, v2}, Lorg/jcodec/common/Format;-><init>(Ljava/lang/String;ZZ)V

    sput-object v0, Lorg/jcodec/common/Format;->MPEG_AUDIO:Lorg/jcodec/common/Format;

    .line 32
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lorg/jcodec/common/Format;->_values:Ljava/util/Map;

    .line 34
    sget-object v0, Lorg/jcodec/common/Format;->_values:Ljava/util/Map;

    const-string v1, "MOV"

    sget-object v2, Lorg/jcodec/common/Format;->MOV:Lorg/jcodec/common/Format;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    sget-object v0, Lorg/jcodec/common/Format;->_values:Ljava/util/Map;

    const-string v1, "MPEG_PS"

    sget-object v2, Lorg/jcodec/common/Format;->MPEG_PS:Lorg/jcodec/common/Format;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    sget-object v0, Lorg/jcodec/common/Format;->_values:Ljava/util/Map;

    const-string v1, "MPEG_TS"

    sget-object v2, Lorg/jcodec/common/Format;->MPEG_TS:Lorg/jcodec/common/Format;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    sget-object v0, Lorg/jcodec/common/Format;->_values:Ljava/util/Map;

    const-string v1, "MKV"

    sget-object v2, Lorg/jcodec/common/Format;->MKV:Lorg/jcodec/common/Format;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    sget-object v0, Lorg/jcodec/common/Format;->_values:Ljava/util/Map;

    const-string v1, "H264"

    sget-object v2, Lorg/jcodec/common/Format;->H264:Lorg/jcodec/common/Format;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    sget-object v0, Lorg/jcodec/common/Format;->_values:Ljava/util/Map;

    const-string v1, "RAW"

    sget-object v2, Lorg/jcodec/common/Format;->RAW:Lorg/jcodec/common/Format;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    sget-object v0, Lorg/jcodec/common/Format;->_values:Ljava/util/Map;

    const-string v1, "FLV"

    sget-object v2, Lorg/jcodec/common/Format;->FLV:Lorg/jcodec/common/Format;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    sget-object v0, Lorg/jcodec/common/Format;->_values:Ljava/util/Map;

    const-string v1, "AVI"

    sget-object v2, Lorg/jcodec/common/Format;->AVI:Lorg/jcodec/common/Format;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    sget-object v0, Lorg/jcodec/common/Format;->_values:Ljava/util/Map;

    const-string v1, "IMG"

    sget-object v2, Lorg/jcodec/common/Format;->IMG:Lorg/jcodec/common/Format;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    sget-object v0, Lorg/jcodec/common/Format;->_values:Ljava/util/Map;

    const-string v1, "IVF"

    sget-object v2, Lorg/jcodec/common/Format;->IVF:Lorg/jcodec/common/Format;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    sget-object v0, Lorg/jcodec/common/Format;->_values:Ljava/util/Map;

    const-string v1, "MJPEG"

    sget-object v2, Lorg/jcodec/common/Format;->MJPEG:Lorg/jcodec/common/Format;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    sget-object v0, Lorg/jcodec/common/Format;->_values:Ljava/util/Map;

    const-string v1, "Y4M"

    sget-object v2, Lorg/jcodec/common/Format;->Y4M:Lorg/jcodec/common/Format;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    sget-object v0, Lorg/jcodec/common/Format;->_values:Ljava/util/Map;

    const-string v1, "WAV"

    sget-object v2, Lorg/jcodec/common/Format;->WAV:Lorg/jcodec/common/Format;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    sget-object v0, Lorg/jcodec/common/Format;->_values:Ljava/util/Map;

    const-string v1, "WEBP"

    sget-object v2, Lorg/jcodec/common/Format;->WEBP:Lorg/jcodec/common/Format;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    sget-object v0, Lorg/jcodec/common/Format;->_values:Ljava/util/Map;

    const-string v1, "MPEG_AUDIO"

    sget-object v2, Lorg/jcodec/common/Format;->MPEG_AUDIO:Lorg/jcodec/common/Format;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ZZ)V
    .locals 0

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput-object p1, p0, Lorg/jcodec/common/Format;->name:Ljava/lang/String;

    .line 57
    iput-boolean p2, p0, Lorg/jcodec/common/Format;->video:Z

    .line 58
    iput-boolean p3, p0, Lorg/jcodec/common/Format;->audio:Z

    .line 59
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/jcodec/common/Format;
    .locals 1

    .line 70
    sget-object v0, Lorg/jcodec/common/Format;->_values:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/jcodec/common/Format;

    return-object p0
.end method


# virtual methods
.method public isAudio()Z
    .locals 1

    .line 62
    iget-boolean v0, p0, Lorg/jcodec/common/Format;->audio:Z

    return v0
.end method

.method public isVideo()Z
    .locals 1

    .line 66
    iget-boolean v0, p0, Lorg/jcodec/common/Format;->video:Z

    return v0
.end method
