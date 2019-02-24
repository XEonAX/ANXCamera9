.class public final Lmiui/R$array;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/R;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "array"
.end annotation


# static fields
.field public static preloaded_drawables:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 19
    const/high16 v0, 0x10060000

    sput v0, Lmiui/R$array;->preloaded_drawables:I

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
