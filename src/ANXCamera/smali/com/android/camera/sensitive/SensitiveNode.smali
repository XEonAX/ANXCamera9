.class public Lcom/android/camera/sensitive/SensitiveNode;
.super Ljava/lang/Object;
.source "SensitiveNode.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field protected final headTwoCharMix:I

.field protected next:Lcom/android/camera/sensitive/SensitiveNode;

.field protected final words:Ljava/util/TreeSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/TreeSet<",
            "Lcom/android/camera/sensitive/StringPointer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v0, Ljava/util/TreeSet;

    invoke-direct {v0}, Ljava/util/TreeSet;-><init>()V

    iput-object v0, p0, Lcom/android/camera/sensitive/SensitiveNode;->words:Ljava/util/TreeSet;

    .line 29
    iput p1, p0, Lcom/android/camera/sensitive/SensitiveNode;->headTwoCharMix:I

    .line 30
    return-void
.end method

.method public constructor <init>(ILcom/android/camera/sensitive/SensitiveNode;)V
    .locals 1

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v0, Ljava/util/TreeSet;

    invoke-direct {v0}, Ljava/util/TreeSet;-><init>()V

    iput-object v0, p0, Lcom/android/camera/sensitive/SensitiveNode;->words:Ljava/util/TreeSet;

    .line 33
    iput p1, p0, Lcom/android/camera/sensitive/SensitiveNode;->headTwoCharMix:I

    .line 34
    iput-object p0, p2, Lcom/android/camera/sensitive/SensitiveNode;->next:Lcom/android/camera/sensitive/SensitiveNode;

    .line 35
    return-void
.end method
