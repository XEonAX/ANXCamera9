.class public Lcom/bumptech/glide/load/model/u$a;
.super Ljava/lang/Object;
.source "UnitModelLoader.java"

# interfaces
.implements Lcom/bumptech/glide/load/model/n;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/model/u;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Model:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/model/n<",
        "TModel;TModel;>;"
    }
.end annotation


# static fields
.field private static final jI:Lcom/bumptech/glide/load/model/u$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/model/u$a<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 93
    new-instance v0, Lcom/bumptech/glide/load/model/u$a;

    invoke-direct {v0}, Lcom/bumptech/glide/load/model/u$a;-><init>()V

    sput-object v0, Lcom/bumptech/glide/load/model/u$a;->jI:Lcom/bumptech/glide/load/model/u$a;

    return-void
.end method

.method public constructor <init>()V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 104
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 106
    return-void
.end method

.method public static ce()Lcom/bumptech/glide/load/model/u$a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lcom/bumptech/glide/load/model/u$a<",
            "TT;>;"
        }
    .end annotation

    .line 97
    sget-object v0, Lcom/bumptech/glide/load/model/u$a;->jI:Lcom/bumptech/glide/load/model/u$a;

    return-object v0
.end method


# virtual methods
.method public a(Lcom/bumptech/glide/load/model/q;)Lcom/bumptech/glide/load/model/m;
    .locals 0
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/model/q;",
            ")",
            "Lcom/bumptech/glide/load/model/m<",
            "TModel;TModel;>;"
        }
    .end annotation

    .line 111
    invoke-static {}, Lcom/bumptech/glide/load/model/u;->cd()Lcom/bumptech/glide/load/model/u;

    move-result-object p1

    return-object p1
.end method

.method public bR()V
    .locals 0

    .line 117
    return-void
.end method
