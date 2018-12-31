.class public final Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$ExtendableBuilder;
.source "ServiceEventProto.java"

# interfaces
.implements Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProtoOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$ExtendableBuilder<",
        "Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;",
        "Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto$Builder;",
        ">;",
        "Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProtoOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 176
    invoke-static {}, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->access$000()Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/protobuf/GeneratedMessageLite$ExtendableBuilder;-><init>(Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;)V

    .line 177
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto$1;)V
    .locals 0

    .line 169
    invoke-direct {p0}, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearEventId()Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto$Builder;
    .locals 1

    .line 222
    invoke-virtual {p0}, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto$Builder;->copyOnWrite()V

    .line 223
    iget-object v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    invoke-static {v0}, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->access$200(Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;)V

    .line 224
    return-object p0
.end method

.method public getEventId()I
    .locals 1

    .line 200
    iget-object v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    invoke-virtual {v0}, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->getEventId()I

    move-result v0

    return v0
.end method

.method public hasEventId()Z
    .locals 1

    .line 189
    iget-object v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    invoke-virtual {v0}, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->hasEventId()Z

    move-result v0

    return v0
.end method

.method public setEventId(I)Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto$Builder;
    .locals 1

    .line 210
    invoke-virtual {p0}, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto$Builder;->copyOnWrite()V

    .line 211
    iget-object v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    invoke-static {v0, p1}, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->access$100(Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;I)V

    .line 212
    return-object p0
.end method
