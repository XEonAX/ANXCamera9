.class public final Lcom/bumptech/glide/load/engine/a/l$a;
.super Ljava/lang/Object;
.source "MemorySizeCalculator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/engine/a/l;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# static fields
.field static final MEMORY_CACHE_TARGET_SCREENS:I = 0x2
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation
.end field

.field static final hB:I

.field static final hC:F = 0.4f

.field static final hD:F = 0.33f

.field static final hE:I = 0x400000


# instance fields
.field final context:Landroid/content/Context;

.field hF:Landroid/app/ActivityManager;

.field hG:Lcom/bumptech/glide/load/engine/a/l$c;

.field hH:F

.field hI:F

.field hJ:F

.field hK:F

.field hL:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 146
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-ge v0, v1, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    sput v0, Lcom/bumptech/glide/load/engine/a/l$a;->hB:I

    .line 145
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 165
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 159
    const/high16 v0, 0x40000000    # 2.0f

    iput v0, p0, Lcom/bumptech/glide/load/engine/a/l$a;->hH:F

    .line 160
    sget v0, Lcom/bumptech/glide/load/engine/a/l$a;->hB:I

    int-to-float v0, v0

    iput v0, p0, Lcom/bumptech/glide/load/engine/a/l$a;->hI:F

    .line 161
    const v0, 0x3ecccccd    # 0.4f

    iput v0, p0, Lcom/bumptech/glide/load/engine/a/l$a;->hJ:F

    .line 162
    const v0, 0x3ea8f5c3    # 0.33f

    iput v0, p0, Lcom/bumptech/glide/load/engine/a/l$a;->hK:F

    .line 163
    const/high16 v0, 0x400000

    iput v0, p0, Lcom/bumptech/glide/load/engine/a/l$a;->hL:I

    .line 166
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/a/l$a;->context:Landroid/content/Context;

    .line 167
    const-string v0, "activity"

    .line 168
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/a/l$a;->hF:Landroid/app/ActivityManager;

    .line 169
    new-instance v0, Lcom/bumptech/glide/load/engine/a/l$b;

    .line 170
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/bumptech/glide/load/engine/a/l$b;-><init>(Landroid/util/DisplayMetrics;)V

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/a/l$a;->hG:Lcom/bumptech/glide/load/engine/a/l$c;

    .line 176
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x1a

    if-lt p1, v0, :cond_0

    iget-object p1, p0, Lcom/bumptech/glide/load/engine/a/l$a;->hF:Landroid/app/ActivityManager;

    invoke-static {p1}, Lcom/bumptech/glide/load/engine/a/l;->a(Landroid/app/ActivityManager;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 177
    const/4 p1, 0x0

    iput p1, p0, Lcom/bumptech/glide/load/engine/a/l$a;->hI:F

    .line 179
    :cond_0
    return-void
.end method


# virtual methods
.method public bD()Lcom/bumptech/glide/load/engine/a/l;
    .locals 1

    .line 260
    new-instance v0, Lcom/bumptech/glide/load/engine/a/l;

    invoke-direct {v0, p0}, Lcom/bumptech/glide/load/engine/a/l;-><init>(Lcom/bumptech/glide/load/engine/a/l$a;)V

    return-object v0
.end method

.method public c(F)Lcom/bumptech/glide/load/engine/a/l$a;
    .locals 2

    .line 187
    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "Memory cache screens must be greater than or equal to 0"

    invoke-static {v0, v1}, Lcom/bumptech/glide/util/i;->a(ZLjava/lang/String;)V

    .line 189
    iput p1, p0, Lcom/bumptech/glide/load/engine/a/l$a;->hH:F

    .line 190
    return-object p0
.end method

.method public d(F)Lcom/bumptech/glide/load/engine/a/l$a;
    .locals 2

    .line 199
    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "Bitmap pool screens must be greater than or equal to 0"

    invoke-static {v0, v1}, Lcom/bumptech/glide/util/i;->a(ZLjava/lang/String;)V

    .line 201
    iput p1, p0, Lcom/bumptech/glide/load/engine/a/l$a;->hI:F

    .line 202
    return-object p0
.end method

.method public e(F)Lcom/bumptech/glide/load/engine/a/l$a;
    .locals 2

    .line 212
    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-ltz v0, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    cmpg-float v0, p1, v0

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "Size multiplier must be between 0 and 1"

    invoke-static {v0, v1}, Lcom/bumptech/glide/util/i;->a(ZLjava/lang/String;)V

    .line 214
    iput p1, p0, Lcom/bumptech/glide/load/engine/a/l$a;->hJ:F

    .line 215
    return-object p0
.end method

.method public f(F)Lcom/bumptech/glide/load/engine/a/l$a;
    .locals 2

    .line 227
    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-ltz v0, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    cmpg-float v0, p1, v0

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "Low memory max size multiplier must be between 0 and 1"

    invoke-static {v0, v1}, Lcom/bumptech/glide/util/i;->a(ZLjava/lang/String;)V

    .line 230
    iput p1, p0, Lcom/bumptech/glide/load/engine/a/l$a;->hK:F

    .line 231
    return-object p0
.end method

.method setActivityManager(Landroid/app/ActivityManager;)Lcom/bumptech/glide/load/engine/a/l$a;
    .locals 0
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    .line 249
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/a/l$a;->hF:Landroid/app/ActivityManager;

    .line 250
    return-object p0
.end method

.method setScreenDimensions(Lcom/bumptech/glide/load/engine/a/l$c;)Lcom/bumptech/glide/load/engine/a/l$a;
    .locals 0
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    .line 255
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/a/l$a;->hG:Lcom/bumptech/glide/load/engine/a/l$c;

    .line 256
    return-object p0
.end method

.method public t(I)Lcom/bumptech/glide/load/engine/a/l$a;
    .locals 0

    .line 243
    iput p1, p0, Lcom/bumptech/glide/load/engine/a/l$a;->hL:I

    .line 244
    return-object p0
.end method
