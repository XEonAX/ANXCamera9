.class public final Lmiui/R$plurals;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/R;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "plurals"
.end annotation


# static fields
.field public static items_selected:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 1805
    const/high16 v0, 0x10050000

    sput v0, Lmiui/R$plurals;->items_selected:I

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 1801
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
