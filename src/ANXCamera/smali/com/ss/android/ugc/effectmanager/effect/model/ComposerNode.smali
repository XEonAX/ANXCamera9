.class public Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;
.super Ljava/lang/Object;
.source "ComposerNode.java"


# static fields
.field public static final NODE_TYPE_FOLDER_0:I = 0x4

.field public static final NODE_TYPE_FOLDER_1:I = 0x1

.field public static final NODE_TYPE_ITEM_0:I = -0x1

.field public static final NODE_TYPE_ITEM_1:I = 0x0

.field public static final NODE_TYPE_ITEM_BAR_0:I = 0x2

.field public static final NODE_TYPE_ITEM_BAR_1:I = 0x3

.field public static final TYPE_LOCAL:Ljava/lang/String; = "ComposerNode"


# instance fields
.field public UI_name:Ljava/lang/String;

.field public children:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;",
            ">;"
        }
    .end annotation
.end field

.field public default_value:F

.field public effect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

.field public file:Ljava/lang/String;

.field public icon:Ljava/lang/String;

.field public max_value:F

.field public min_value:F

.field public parent:Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;

.field public switch_mode:I

.field public tag_name:Ljava/lang/String;

.field public type:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    const/4 v0, 0x0

    iput v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->type:I

    .line 29
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->effect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    return-void
.end method


# virtual methods
.method public isLeaf()Z
    .locals 2

    .line 32
    iget v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->type:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->type:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 35
    :cond_0
    return v1

    .line 33
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method
