.class public final Lcom/bumptech/glide/load/engine/a/l;
.super Ljava/lang/Object;
.source "MemorySizeCalculator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/load/engine/a/l$b;,
        Lcom/bumptech/glide/load/engine/a/l$a;,
        Lcom/bumptech/glide/load/engine/a/l$c;
    }
.end annotation


# static fields
.field static final BYTES_PER_ARGB_8888_PIXEL:I = 0x4
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "MemorySizeCalculator"

.field private static final hx:I = 0x2


# instance fields
.field private final context:Landroid/content/Context;

.field private final hA:I

.field private final hy:I

.field private final hz:I


# direct methods
.method constructor <init>(Lcom/bumptech/glide/load/engine/a/l$a;)V
    .locals 5

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iget-object v0, p1, Lcom/bumptech/glide/load/engine/a/l$a;->context:Landroid/content/Context;

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/a/l;->context:Landroid/content/Context;

    .line 38
    nop

    .line 39
    iget-object v0, p1, Lcom/bumptech/glide/load/engine/a/l$a;->hF:Landroid/app/ActivityManager;

    invoke-static {v0}, Lcom/bumptech/glide/load/engine/a/l;->a(Landroid/app/ActivityManager;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 40
    iget v0, p1, Lcom/bumptech/glide/load/engine/a/l$a;->hL:I

    div-int/lit8 v0, v0, 0x2

    goto :goto_0

    .line 41
    :cond_0
    iget v0, p1, Lcom/bumptech/glide/load/engine/a/l$a;->hL:I

    :goto_0
    iput v0, p0, Lcom/bumptech/glide/load/engine/a/l;->hA:I

    .line 42
    iget-object v0, p1, Lcom/bumptech/glide/load/engine/a/l$a;->hF:Landroid/app/ActivityManager;

    iget v1, p1, Lcom/bumptech/glide/load/engine/a/l$a;->hJ:F

    iget v2, p1, Lcom/bumptech/glide/load/engine/a/l$a;->hK:F

    .line 43
    invoke-static {v0, v1, v2}, Lcom/bumptech/glide/load/engine/a/l;->a(Landroid/app/ActivityManager;FF)I

    move-result v0

    .line 46
    iget-object v1, p1, Lcom/bumptech/glide/load/engine/a/l$a;->hG:Lcom/bumptech/glide/load/engine/a/l$c;

    invoke-interface {v1}, Lcom/bumptech/glide/load/engine/a/l$c;->bE()I

    move-result v1

    .line 47
    iget-object v2, p1, Lcom/bumptech/glide/load/engine/a/l$a;->hG:Lcom/bumptech/glide/load/engine/a/l$c;

    invoke-interface {v2}, Lcom/bumptech/glide/load/engine/a/l$c;->bF()I

    move-result v2

    .line 48
    mul-int/2addr v1, v2

    mul-int/lit8 v1, v1, 0x4

    .line 50
    int-to-float v1, v1

    iget v2, p1, Lcom/bumptech/glide/load/engine/a/l$a;->hI:F

    mul-float/2addr v2, v1

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    .line 52
    iget v3, p1, Lcom/bumptech/glide/load/engine/a/l$a;->hH:F

    mul-float/2addr v1, v3

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 53
    iget v3, p0, Lcom/bumptech/glide/load/engine/a/l;->hA:I

    sub-int v3, v0, v3

    .line 55
    add-int v4, v1, v2

    if-gt v4, v3, :cond_1

    .line 56
    iput v1, p0, Lcom/bumptech/glide/load/engine/a/l;->hz:I

    .line 57
    iput v2, p0, Lcom/bumptech/glide/load/engine/a/l;->hy:I

    goto :goto_1

    .line 59
    :cond_1
    int-to-float v1, v3

    iget v2, p1, Lcom/bumptech/glide/load/engine/a/l$a;->hI:F

    iget v3, p1, Lcom/bumptech/glide/load/engine/a/l$a;->hH:F

    add-float/2addr v2, v3

    div-float/2addr v1, v2

    .line 60
    iget v2, p1, Lcom/bumptech/glide/load/engine/a/l$a;->hH:F

    mul-float/2addr v2, v1

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    iput v2, p0, Lcom/bumptech/glide/load/engine/a/l;->hz:I

    .line 61
    iget v2, p1, Lcom/bumptech/glide/load/engine/a/l$a;->hI:F

    mul-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    iput v1, p0, Lcom/bumptech/glide/load/engine/a/l;->hy:I

    .line 64
    :goto_1
    const-string v1, "MemorySizeCalculator"

    const/4 v2, 0x3

    invoke-static {v1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 65
    const-string v1, "MemorySizeCalculator"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Calculation complete, Calculated memory cache size: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/bumptech/glide/load/engine/a/l;->hz:I

    .line 69
    invoke-direct {p0, v3}, Lcom/bumptech/glide/load/engine/a/l;->s(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ", pool size: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/bumptech/glide/load/engine/a/l;->hy:I

    .line 71
    invoke-direct {p0, v3}, Lcom/bumptech/glide/load/engine/a/l;->s(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ", byte array size: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/bumptech/glide/load/engine/a/l;->hA:I

    .line 73
    invoke-direct {p0, v3}, Lcom/bumptech/glide/load/engine/a/l;->s(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ", memory class limited? "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-le v4, v0, :cond_2

    const/4 v3, 0x1

    goto :goto_2

    :cond_2
    const/4 v3, 0x0

    :goto_2
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v3, ", max size: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    invoke-direct {p0, v0}, Lcom/bumptech/glide/load/engine/a/l;->s(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", memoryClass: "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p1, Lcom/bumptech/glide/load/engine/a/l$a;->hF:Landroid/app/ActivityManager;

    .line 79
    invoke-virtual {v0}, Landroid/app/ActivityManager;->getMemoryClass()I

    move-result v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", isLowMemoryDevice: "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p1, Lcom/bumptech/glide/load/engine/a/l$a;->hF:Landroid/app/ActivityManager;

    .line 81
    invoke-static {p1}, Lcom/bumptech/glide/load/engine/a/l;->a(Landroid/app/ActivityManager;)Z

    move-result p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 65
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    :cond_3
    return-void
.end method

.method private static a(Landroid/app/ActivityManager;FF)I
    .locals 1

    .line 108
    invoke-virtual {p0}, Landroid/app/ActivityManager;->getMemoryClass()I

    move-result v0

    mul-int/lit16 v0, v0, 0x400

    mul-int/lit16 v0, v0, 0x400

    .line 109
    invoke-static {p0}, Lcom/bumptech/glide/load/engine/a/l;->a(Landroid/app/ActivityManager;)Z

    move-result p0

    .line 110
    int-to-float v0, v0

    if-eqz p0, :cond_0

    .line 111
    move p1, p2

    nop

    :cond_0
    mul-float/2addr v0, p1

    .line 110
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method static a(Landroid/app/ActivityManager;)Z
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x13
    .end annotation

    .line 123
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_0

    .line 124
    invoke-virtual {p0}, Landroid/app/ActivityManager;->isLowRamDevice()Z

    move-result p0

    return p0

    .line 126
    :cond_0
    const/4 p0, 0x1

    return p0
.end method

.method private s(I)Ljava/lang/String;
    .locals 3

    .line 115
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/a/l;->context:Landroid/content/Context;

    int-to-long v1, p1

    invoke-static {v0, v1, v2}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public bA()I
    .locals 1

    .line 89
    iget v0, p0, Lcom/bumptech/glide/load/engine/a/l;->hz:I

    return v0
.end method

.method public bB()I
    .locals 1

    .line 96
    iget v0, p0, Lcom/bumptech/glide/load/engine/a/l;->hy:I

    return v0
.end method

.method public bC()I
    .locals 1

    .line 103
    iget v0, p0, Lcom/bumptech/glide/load/engine/a/l;->hA:I

    return v0
.end method
