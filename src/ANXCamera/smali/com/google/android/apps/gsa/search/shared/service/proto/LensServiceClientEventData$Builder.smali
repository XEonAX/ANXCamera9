.class public final Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceClientEventData$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$Builder;
.source "LensServiceClientEventData.java"

# interfaces
.implements Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceClientEventDataOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceClientEventData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$Builder<",
        "Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceClientEventData;",
        "Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceClientEventData$Builder;",
        ">;",
        "Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceClientEventDataOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 174
    invoke-static {}, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceClientEventData;->access$000()Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceClientEventData;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/protobuf/GeneratedMessageLite$Builder;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 175
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceClientEventData$1;)V
    .locals 0

    .line 167
    invoke-direct {p0}, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceClientEventData$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearTargetServiceApiVersion()Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceClientEventData$Builder;
    .locals 1

    .line 228
    invoke-virtual {p0}, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceClientEventData$Builder;->copyOnWrite()V

    .line 229
    iget-object v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceClientEventData$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceClientEventData;

    invoke-static {v0}, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceClientEventData;->access$200(Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceClientEventData;)V

    .line 230
    return-object p0
.end method

.method public getTargetServiceApiVersion()I
    .locals 1

    .line 202
    iget-object v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceClientEventData$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceClientEventData;

    invoke-virtual {v0}, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceClientEventData;->getTargetServiceApiVersion()I

    move-result v0

    return v0
.end method

.method public hasTargetServiceApiVersion()Z
    .locals 1

    .line 189
    iget-object v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceClientEventData$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceClientEventData;

    invoke-virtual {v0}, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceClientEventData;->hasTargetServiceApiVersion()Z

    move-result v0

    return v0
.end method

.method public setTargetServiceApiVersion(I)Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceClientEventData$Builder;
    .locals 1

    .line 214
    invoke-virtual {p0}, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceClientEventData$Builder;->copyOnWrite()V

    .line 215
    iget-object v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceClientEventData$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceClientEventData;

    invoke-static {v0, p1}, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceClientEventData;->access$100(Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceClientEventData;I)V

    .line 216
    return-object p0
.end method
