.class Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventId$1;
.super Ljava/lang/Object;
.source "ServiceEventId.java"

# interfaces
.implements Lcom/google/protobuf/Internal$EnumLiteMap;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventId;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/protobuf/Internal$EnumLiteMap<",
        "Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventId;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 4077
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public findValueByNumber(I)Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventId;
    .locals 0

    .line 4080
    invoke-static {p1}, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventId;->forNumber(I)Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventId;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic findValueByNumber(I)Lcom/google/protobuf/Internal$EnumLite;
    .locals 0

    .line 4077
    invoke-virtual {p0, p1}, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventId$1;->findValueByNumber(I)Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventId;

    move-result-object p1

    return-object p1
.end method
