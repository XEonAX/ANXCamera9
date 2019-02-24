.class public final Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "LensSdkParamsProto.java"

# interfaces
.implements Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParamsOrBuilder;


# annotations
.annotation build Lcom/google/protobuf/ProtoMessage;
    checkInitialized = {}
    messageSetWireFormat = false
    protoSyntax = .enum Lcom/google/protobuf/ProtoSyntax;->PROTO2:Lcom/google/protobuf/ProtoSyntax;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "LensSdkParams"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;,
        Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$LensAvailabilityStatus;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;",
        "Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;",
        ">;",
        "Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParamsOrBuilder;"
    }
.end annotation


# static fields
.field public static final AGSA_VERSION_NAME_FIELD_NUMBER:I = 0x2

.field public static final AR_STICKERS_AVAILABILITY_STATUS_FIELD_NUMBER:I = 0x4

.field private static final DEFAULT_INSTANCE:Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

.field public static final LENS_AVAILABILITY_STATUS_FIELD_NUMBER:I = 0x3

.field public static final LENS_SDK_VERSION_FIELD_NUMBER:I = 0x1

.field private static volatile PARSER:Lcom/google/protobuf/Parser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private agsaVersionName_:Ljava/lang/String;
    .annotation build Lcom/google/protobuf/ProtoField;
        fieldNumber = 0x2
        isEnforceUtf8 = false
        isRequired = false
        type = .enum Lcom/google/protobuf/FieldType;->STRING:Lcom/google/protobuf/FieldType;
    .end annotation

    .annotation build Lcom/google/protobuf/ProtoPresenceCheckedField;
        mask = 0x2
        presenceBitsId = 0x0
    .end annotation
.end field

.field private arStickersAvailabilityStatus_:I
    .annotation build Lcom/google/protobuf/ProtoField;
        fieldNumber = 0x4
        isRequired = false
        type = .enum Lcom/google/protobuf/FieldType;->ENUM:Lcom/google/protobuf/FieldType;
    .end annotation

    .annotation build Lcom/google/protobuf/ProtoPresenceCheckedField;
        mask = 0x8
        presenceBitsId = 0x0
    .end annotation
.end field

.field private bitField0_:I
    .annotation build Lcom/google/protobuf/ProtoPresenceBits;
        id = 0x0
    .end annotation
.end field

.field private lensAvailabilityStatus_:I
    .annotation build Lcom/google/protobuf/ProtoField;
        fieldNumber = 0x3
        isRequired = false
        type = .enum Lcom/google/protobuf/FieldType;->ENUM:Lcom/google/protobuf/FieldType;
    .end annotation

    .annotation build Lcom/google/protobuf/ProtoPresenceCheckedField;
        mask = 0x4
        presenceBitsId = 0x0
    .end annotation
.end field

.field private lensSdkVersion_:Ljava/lang/String;
    .annotation build Lcom/google/protobuf/ProtoField;
        fieldNumber = 0x1
        isEnforceUtf8 = false
        isRequired = false
        type = .enum Lcom/google/protobuf/FieldType;->STRING:Lcom/google/protobuf/FieldType;
    .end annotation

    .annotation build Lcom/google/protobuf/ProtoPresenceCheckedField;
        mask = 0x1
        presenceBitsId = 0x0
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 917
    new-instance v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-direct {v0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;-><init>()V

    sput-object v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->DEFAULT_INSTANCE:Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    .line 921
    const-class v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    sget-object v1, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->DEFAULT_INSTANCE:Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-static {v0, v1}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 923
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 101
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    .line 102
    const-string v0, ""

    iput-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->lensSdkVersion_:Ljava/lang/String;

    .line 103
    const-string v0, ""

    iput-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->agsaVersionName_:Ljava/lang/String;

    .line 104
    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->lensAvailabilityStatus_:I

    .line 105
    iput v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->arStickersAvailabilityStatus_:I

    .line 106
    return-void
.end method

.method static synthetic access$000()Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;
    .locals 1

    .line 96
    sget-object v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->DEFAULT_INSTANCE:Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;Ljava/lang/String;)V
    .locals 0

    .line 96
    invoke-direct {p0, p1}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->setLensSdkVersion(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;)V
    .locals 0

    .line 96
    invoke-direct {p0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->clearArStickersAvailabilityStatus()V

    return-void
.end method

.method static synthetic access$200(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;)V
    .locals 0

    .line 96
    invoke-direct {p0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->clearLensSdkVersion()V

    return-void
.end method

.method static synthetic access$300(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 96
    invoke-direct {p0, p1}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->setLensSdkVersionBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static synthetic access$400(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;Ljava/lang/String;)V
    .locals 0

    .line 96
    invoke-direct {p0, p1}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->setAgsaVersionName(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$500(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;)V
    .locals 0

    .line 96
    invoke-direct {p0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->clearAgsaVersionName()V

    return-void
.end method

.method static synthetic access$600(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 96
    invoke-direct {p0, p1}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->setAgsaVersionNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static synthetic access$700(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$LensAvailabilityStatus;)V
    .locals 0

    .line 96
    invoke-direct {p0, p1}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->setLensAvailabilityStatus(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$LensAvailabilityStatus;)V

    return-void
.end method

.method static synthetic access$800(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;)V
    .locals 0

    .line 96
    invoke-direct {p0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->clearLensAvailabilityStatus()V

    return-void
.end method

.method static synthetic access$900(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$LensAvailabilityStatus;)V
    .locals 0

    .line 96
    invoke-direct {p0, p1}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->setArStickersAvailabilityStatus(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$LensAvailabilityStatus;)V

    return-void
.end method

.method private clearAgsaVersionName()V
    .locals 1

    .line 444
    iget v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->bitField0_:I

    .line 445
    invoke-static {}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->getDefaultInstance()Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->getAgsaVersionName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->agsaVersionName_:Ljava/lang/String;

    .line 446
    return-void
.end method

.method private clearArStickersAvailabilityStatus()V
    .locals 1

    .line 543
    iget v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->bitField0_:I

    and-int/lit8 v0, v0, -0x9

    iput v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->bitField0_:I

    .line 544
    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->arStickersAvailabilityStatus_:I

    .line 545
    return-void
.end method

.method private clearLensAvailabilityStatus()V
    .locals 1

    .line 501
    iget v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->bitField0_:I

    and-int/lit8 v0, v0, -0x5

    iput v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->bitField0_:I

    .line 502
    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->lensAvailabilityStatus_:I

    .line 503
    return-void
.end method

.method private clearLensSdkVersion()V
    .locals 1

    .line 358
    iget v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->bitField0_:I

    .line 359
    invoke-static {}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->getDefaultInstance()Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->getLensSdkVersion()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->lensSdkVersion_:Ljava/lang/String;

    .line 360
    return-void
.end method

.method public static getDefaultInstance()Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;
    .locals 1

    .line 925
    sget-object v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->DEFAULT_INSTANCE:Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    return-object v0
.end method

.method public static newBuilder()Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;
    .locals 1

    .line 622
    sget-object v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->DEFAULT_INSTANCE:Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-virtual {v0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;)Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;
    .locals 1

    .line 625
    sget-object v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->DEFAULT_INSTANCE:Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-virtual {v0, p0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 599
    sget-object v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->DEFAULT_INSTANCE:Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-static {v0, p0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 605
    sget-object v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->DEFAULT_INSTANCE:Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-static {v0, p0, p1}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 563
    sget-object v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->DEFAULT_INSTANCE:Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 570
    sget-object v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->DEFAULT_INSTANCE:Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 610
    sget-object v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->DEFAULT_INSTANCE:Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 617
    sget-object v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->DEFAULT_INSTANCE:Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 587
    sget-object v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->DEFAULT_INSTANCE:Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 594
    sget-object v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->DEFAULT_INSTANCE:Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 550
    sget-object v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->DEFAULT_INSTANCE:Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 557
    sget-object v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->DEFAULT_INSTANCE:Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 575
    sget-object v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->DEFAULT_INSTANCE:Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 582
    sget-object v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->DEFAULT_INSTANCE:Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;",
            ">;"
        }
    .end annotation

    .line 931
    sget-object v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->DEFAULT_INSTANCE:Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-virtual {v0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private setAgsaVersionName(Ljava/lang/String;)V
    .locals 1

    .line 430
    if-eqz p1, :cond_0

    .line 433
    iget v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->bitField0_:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->bitField0_:I

    .line 434
    iput-object p1, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->agsaVersionName_:Ljava/lang/String;

    .line 435
    return-void

    .line 431
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    invoke-direct {p1}, Ljava/lang/NullPointerException;-><init>()V

    throw p1
.end method

.method private setAgsaVersionNameBytes(Lcom/google/protobuf/ByteString;)V
    .locals 1

    .line 456
    if-eqz p1, :cond_0

    .line 459
    iget v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->bitField0_:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->bitField0_:I

    .line 460
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->agsaVersionName_:Ljava/lang/String;

    .line 461
    return-void

    .line 457
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    invoke-direct {p1}, Ljava/lang/NullPointerException;-><init>()V

    throw p1
.end method

.method private setArStickersAvailabilityStatus(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$LensAvailabilityStatus;)V
    .locals 1

    .line 533
    if-eqz p1, :cond_0

    .line 536
    iget v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->bitField0_:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->bitField0_:I

    .line 537
    invoke-virtual {p1}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$LensAvailabilityStatus;->getNumber()I

    move-result p1

    iput p1, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->arStickersAvailabilityStatus_:I

    .line 538
    return-void

    .line 534
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    invoke-direct {p1}, Ljava/lang/NullPointerException;-><init>()V

    throw p1
.end method

.method private setLensAvailabilityStatus(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$LensAvailabilityStatus;)V
    .locals 1

    .line 491
    if-eqz p1, :cond_0

    .line 494
    iget v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->bitField0_:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->bitField0_:I

    .line 495
    invoke-virtual {p1}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$LensAvailabilityStatus;->getNumber()I

    move-result p1

    iput p1, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->lensAvailabilityStatus_:I

    .line 496
    return-void

    .line 492
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    invoke-direct {p1}, Ljava/lang/NullPointerException;-><init>()V

    throw p1
.end method

.method private setLensSdkVersion(Ljava/lang/String;)V
    .locals 1

    .line 344
    if-eqz p1, :cond_0

    .line 347
    iget v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->bitField0_:I

    .line 348
    iput-object p1, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->lensSdkVersion_:Ljava/lang/String;

    .line 349
    return-void

    .line 345
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    invoke-direct {p1}, Ljava/lang/NullPointerException;-><init>()V

    throw p1
.end method

.method private setLensSdkVersionBytes(Lcom/google/protobuf/ByteString;)V
    .locals 1

    .line 370
    if-eqz p1, :cond_0

    .line 373
    iget v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->bitField0_:I

    .line 374
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->lensSdkVersion_:Ljava/lang/String;

    .line 375
    return-void

    .line 371
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    invoke-direct {p1}, Ljava/lang/NullPointerException;-><init>()V

    throw p1
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 862
    sget-object p2, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 908
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    .line 905
    :pswitch_0
    return-object p3

    .line 902
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    .line 889
    :pswitch_2
    sget-object p1, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->PARSER:Lcom/google/protobuf/Parser;

    .line 890
    if-nez p1, :cond_1

    .line 891
    const-class p2, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    monitor-enter p2

    .line 892
    :try_start_0
    sget-object p1, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->PARSER:Lcom/google/protobuf/Parser;

    .line 893
    if-nez p1, :cond_0

    .line 894
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->DEFAULT_INSTANCE:Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 895
    sput-object p1, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->PARSER:Lcom/google/protobuf/Parser;

    .line 897
    :cond_0
    monitor-exit p2

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    .line 899
    :cond_1
    :goto_0
    return-object p1

    .line 886
    :pswitch_3
    sget-object p1, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->DEFAULT_INSTANCE:Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    return-object p1

    .line 870
    :pswitch_4
    const/4 p1, 0x7

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "bitField0_"

    aput-object v0, p1, p3

    const-string p3, "lensSdkVersion_"

    aput-object p3, p1, p2

    const/4 p2, 0x2

    const-string p3, "agsaVersionName_"

    aput-object p3, p1, p2

    const/4 p2, 0x3

    const-string p3, "lensAvailabilityStatus_"

    aput-object p3, p1, p2

    const/4 p2, 0x4

    .line 875
    invoke-static {}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$LensAvailabilityStatus;->internalGetValueMap()Lcom/google/protobuf/Internal$EnumLiteMap;

    move-result-object p3

    aput-object p3, p1, p2

    const/4 p2, 0x5

    const-string p3, "arStickersAvailabilityStatus_"

    aput-object p3, p1, p2

    const/4 p2, 0x6

    .line 877
    invoke-static {}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$LensAvailabilityStatus;->internalGetValueMap()Lcom/google/protobuf/Internal$EnumLiteMap;

    move-result-object p3

    aput-object p3, p1, p2

    .line 879
    const-string p2, "\u0001\u0004\u0000\u0001\u0001\u0004\u0004\u0005\u0000\u0000\u0000\u0001\u0008\u0000\u0002\u0008\u0001\u0003\u000c\u0002\u0004\u000c\u0003"

    .line 882
    sget-object p3, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->DEFAULT_INSTANCE:Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-static {p3, p2, p1}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 867
    :pswitch_5
    new-instance p1, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;

    invoke-direct {p1, p3}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;-><init>(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$1;)V

    return-object p1

    .line 864
    :pswitch_6
    new-instance p1, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-direct {p1}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;-><init>()V

    return-object p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getAgsaVersionName()Ljava/lang/String;
    .locals 1

    .line 407
    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->agsaVersionName_:Ljava/lang/String;

    return-object v0
.end method

.method public getAgsaVersionNameBytes()Lcom/google/protobuf/ByteString;
    .locals 1

    .line 419
    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->agsaVersionName_:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public getArStickersAvailabilityStatus()Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$LensAvailabilityStatus;
    .locals 1

    .line 526
    iget v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->arStickersAvailabilityStatus_:I

    invoke-static {v0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$LensAvailabilityStatus;->forNumber(I)Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$LensAvailabilityStatus;

    move-result-object v0

    .line 527
    if-nez v0, :cond_0

    sget-object v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$LensAvailabilityStatus;->LENS_AVAILABILITY_UNKNOWN:Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$LensAvailabilityStatus;

    :cond_0
    return-object v0
.end method

.method public getLensAvailabilityStatus()Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$LensAvailabilityStatus;
    .locals 1

    .line 484
    iget v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->lensAvailabilityStatus_:I

    invoke-static {v0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$LensAvailabilityStatus;->forNumber(I)Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$LensAvailabilityStatus;

    move-result-object v0

    .line 485
    if-nez v0, :cond_0

    sget-object v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$LensAvailabilityStatus;->LENS_AVAILABILITY_UNKNOWN:Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$LensAvailabilityStatus;

    :cond_0
    return-object v0
.end method

.method public getLensSdkVersion()Ljava/lang/String;
    .locals 1

    .line 321
    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->lensSdkVersion_:Ljava/lang/String;

    return-object v0
.end method

.method public getLensSdkVersionBytes()Lcom/google/protobuf/ByteString;
    .locals 1

    .line 333
    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->lensSdkVersion_:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public hasAgsaVersionName()Z
    .locals 2

    .line 396
    iget v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->bitField0_:I

    const/4 v1, 0x2

    and-int/2addr v0, v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasArStickersAvailabilityStatus()Z
    .locals 2

    .line 519
    iget v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->bitField0_:I

    const/16 v1, 0x8

    and-int/2addr v0, v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasLensAvailabilityStatus()Z
    .locals 2

    .line 477
    iget v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->bitField0_:I

    const/4 v1, 0x4

    and-int/2addr v0, v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasLensSdkVersion()Z
    .locals 2

    .line 310
    iget v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->bitField0_:I

    const/4 v1, 0x1

    and-int/2addr v0, v1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method
