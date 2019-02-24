.class public final Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEvent;
.super Ljava/lang/Object;
.source "LensServiceEvent.java"


# static fields
.field public static final LENS_SERVICE_EVENT_DATA_FIELD_NUMBER:I = 0x9198308

.field public static final lensServiceEventData:Lcom/google/protobuf/GeneratedMessageLite$GeneratedExtension;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/GeneratedMessageLite$GeneratedExtension<",
            "Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;",
            "Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 21
    invoke-static {}, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->getDefaultInstance()Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    move-result-object v0

    .line 22
    invoke-static {}, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData;->getDefaultInstance()Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData;

    move-result-object v1

    .line 23
    invoke-static {}, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData;->getDefaultInstance()Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData;

    move-result-object v2

    sget-object v5, Lcom/google/protobuf/WireFormat$FieldType;->MESSAGE:Lcom/google/protobuf/WireFormat$FieldType;

    const-class v6, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData;

    .line 20
    const/4 v3, 0x0

    const v4, 0x9198308

    invoke-static/range {v0 .. v6}, Lcom/google/protobuf/GeneratedMessageLite;->newSingularGeneratedExtension(Lcom/google/protobuf/MessageLite;Ljava/lang/Object;Lcom/google/protobuf/MessageLite;Lcom/google/protobuf/Internal$EnumLiteMap;ILcom/google/protobuf/WireFormat$FieldType;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessageLite$GeneratedExtension;

    move-result-object v0

    sput-object v0, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEvent;->lensServiceEventData:Lcom/google/protobuf/GeneratedMessageLite$GeneratedExtension;

    .line 30
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static registerAllExtensions(Lcom/google/protobuf/ExtensionRegistryLite;)V
    .locals 1

    .line 10
    sget-object v0, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEvent;->lensServiceEventData:Lcom/google/protobuf/GeneratedMessageLite$GeneratedExtension;

    invoke-virtual {p0, v0}, Lcom/google/protobuf/ExtensionRegistryLite;->add(Lcom/google/protobuf/GeneratedMessageLite$GeneratedExtension;)V

    .line 11
    return-void
.end method
