.class public final Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$Builder;
.source "LensServiceEventData.java"

# interfaces
.implements Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventDataOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$Builder<",
        "Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData;",
        "Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData$Builder;",
        ">;",
        "Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventDataOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 174
    invoke-static {}, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData;->access$000()Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/protobuf/GeneratedMessageLite$Builder;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 175
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData$1;)V
    .locals 0

    .line 167
    invoke-direct {p0}, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearServiceApiVersion()Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData$Builder;
    .locals 1

    .line 228
    invoke-virtual {p0}, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData$Builder;->copyOnWrite()V

    .line 229
    iget-object v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData;

    invoke-static {v0}, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData;->access$200(Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData;)V

    .line 230
    return-object p0
.end method

.method public getServiceApiVersion()I
    .locals 1

    .line 202
    iget-object v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData;

    invoke-virtual {v0}, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData;->getServiceApiVersion()I

    move-result v0

    return v0
.end method

.method public hasServiceApiVersion()Z
    .locals 1

    .line 189
    iget-object v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData;

    invoke-virtual {v0}, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData;->hasServiceApiVersion()Z

    move-result v0

    return v0
.end method

.method public setServiceApiVersion(I)Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData$Builder;
    .locals 1

    .line 214
    invoke-virtual {p0}, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData$Builder;->copyOnWrite()V

    .line 215
    iget-object v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData;

    invoke-static {v0, p1}, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData;->access$100(Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData;I)V

    .line 216
    return-object p0
.end method
