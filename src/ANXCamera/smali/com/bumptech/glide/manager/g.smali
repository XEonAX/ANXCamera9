.class final Lcom/bumptech/glide/manager/g;
.super Ljava/lang/Object;
.source "EmptyRequestManagerTreeNode.java"

# interfaces
.implements Lcom/bumptech/glide/manager/m;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public cQ()Ljava/util/Set;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/bumptech/glide/i;",
            ">;"
        }
    .end annotation

    .line 15
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method
