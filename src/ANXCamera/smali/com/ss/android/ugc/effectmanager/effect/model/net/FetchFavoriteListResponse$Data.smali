.class Lcom/ss/android/ugc/effectmanager/effect/model/net/FetchFavoriteListResponse$Data;
.super Ljava/lang/Object;
.source "FetchFavoriteListResponse.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/ugc/effectmanager/effect/model/net/FetchFavoriteListResponse;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Data"
.end annotation


# instance fields
.field private effects:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/ss/android/ugc/effectmanager/effect/model/net/FetchFavoriteListResponse;

.field private type:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lcom/ss/android/ugc/effectmanager/effect/model/net/FetchFavoriteListResponse;)V
    .locals 0

    .line 25
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/net/FetchFavoriteListResponse$Data;->this$0:Lcom/ss/android/ugc/effectmanager/effect/model/net/FetchFavoriteListResponse;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/net/FetchFavoriteListResponse$Data;->effects:Ljava/util/List;

    .line 26
    return-void
.end method

.method static synthetic access$000(Lcom/ss/android/ugc/effectmanager/effect/model/net/FetchFavoriteListResponse$Data;)Ljava/lang/String;
    .locals 0

    .line 21
    iget-object p0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/net/FetchFavoriteListResponse$Data;->type:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcom/ss/android/ugc/effectmanager/effect/model/net/FetchFavoriteListResponse$Data;)Ljava/util/List;
    .locals 0

    .line 21
    iget-object p0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/net/FetchFavoriteListResponse$Data;->effects:Ljava/util/List;

    return-object p0
.end method
