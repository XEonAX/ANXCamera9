.class Lcom/google/android/apps/gsa/search/shared/service/proto/ClientEventId$1;
.super Ljava/lang/Object;
.source "ClientEventId.java"

# interfaces
.implements Lcom/google/protobuf/Internal$EnumLiteMap;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/apps/gsa/search/shared/service/proto/ClientEventId;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/protobuf/Internal$EnumLiteMap<",
        "Lcom/google/android/apps/gsa/search/shared/service/proto/ClientEventId;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 6141
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public findValueByNumber(I)Lcom/google/android/apps/gsa/search/shared/service/proto/ClientEventId;
    .locals 0

    .line 6144
    invoke-static {p1}, Lcom/google/android/apps/gsa/search/shared/service/proto/ClientEventId;->forNumber(I)Lcom/google/android/apps/gsa/search/shared/service/proto/ClientEventId;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic findValueByNumber(I)Lcom/google/protobuf/Internal$EnumLite;
    .locals 0

    .line 6141
    invoke-virtual {p0, p1}, Lcom/google/android/apps/gsa/search/shared/service/proto/ClientEventId$1;->findValueByNumber(I)Lcom/google/android/apps/gsa/search/shared/service/proto/ClientEventId;

    move-result-object p1

    return-object p1
.end method
