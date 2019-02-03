.class public Lcom/ss/android/medialib/LibsConfig;
.super Ljava/lang/Object;
.source "LibsConfig.java"


# static fields
.field public static LIBS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 7
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/ss/android/medialib/LibsConfig;->LIBS:Ljava/util/List;

    .line 10
    sget-object v0, Lcom/ss/android/medialib/LibsConfig;->LIBS:Ljava/util/List;

    const-string v1, "ttffmpeg"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 11
    sget-object v0, Lcom/ss/android/medialib/LibsConfig;->LIBS:Ljava/util/List;

    const-string v1, "yuv"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    sget-object v0, Lcom/ss/android/medialib/LibsConfig;->LIBS:Ljava/util/List;

    const-string v1, "effect"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    sget-object v0, Lcom/ss/android/medialib/LibsConfig;->LIBS:Ljava/util/List;

    const-string v1, "ttffmpeg-invoker"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 14
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
