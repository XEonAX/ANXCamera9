.class public Lcom/bumptech/glide/request/target/a;
.super Lcom/bumptech/glide/request/target/l;
.source "AppWidgetTarget.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bumptech/glide/request/target/l<",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field private final componentName:Landroid/content/ComponentName;

.field private final context:Landroid/content/Context;

.field private final oq:[I

.field private final remoteViews:Landroid/widget/RemoteViews;

.field private final viewId:I


# direct methods
.method public constructor <init>(Landroid/content/Context;IIILandroid/widget/RemoteViews;Landroid/content/ComponentName;)V
    .locals 0

    .line 85
    invoke-direct {p0, p2, p3}, Lcom/bumptech/glide/request/target/l;-><init>(II)V

    .line 86
    const-string p2, "Context can not be null!"

    invoke-static {p1, p2}, Lcom/bumptech/glide/util/i;->a(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/Context;

    iput-object p1, p0, Lcom/bumptech/glide/request/target/a;->context:Landroid/content/Context;

    .line 87
    const-string p1, "RemoteViews object can not be null!"

    .line 88
    invoke-static {p5, p1}, Lcom/bumptech/glide/util/i;->a(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/widget/RemoteViews;

    iput-object p1, p0, Lcom/bumptech/glide/request/target/a;->remoteViews:Landroid/widget/RemoteViews;

    .line 89
    const-string p1, "ComponentName can not be null!"

    .line 90
    invoke-static {p6, p1}, Lcom/bumptech/glide/util/i;->a(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/ComponentName;

    iput-object p1, p0, Lcom/bumptech/glide/request/target/a;->componentName:Landroid/content/ComponentName;

    .line 91
    iput p4, p0, Lcom/bumptech/glide/request/target/a;->viewId:I

    .line 92
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/bumptech/glide/request/target/a;->oq:[I

    .line 93
    return-void
.end method

.method public varargs constructor <init>(Landroid/content/Context;IIILandroid/widget/RemoteViews;[I)V
    .locals 0

    .line 44
    invoke-direct {p0, p2, p3}, Lcom/bumptech/glide/request/target/l;-><init>(II)V

    .line 45
    array-length p2, p6

    if-eqz p2, :cond_0

    .line 48
    const-string p2, "Context can not be null!"

    invoke-static {p1, p2}, Lcom/bumptech/glide/util/i;->a(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/Context;

    iput-object p1, p0, Lcom/bumptech/glide/request/target/a;->context:Landroid/content/Context;

    .line 49
    const-string p1, "RemoteViews object can not be null!"

    .line 50
    invoke-static {p5, p1}, Lcom/bumptech/glide/util/i;->a(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/widget/RemoteViews;

    iput-object p1, p0, Lcom/bumptech/glide/request/target/a;->remoteViews:Landroid/widget/RemoteViews;

    .line 51
    const-string p1, "WidgetIds can not be null!"

    invoke-static {p6, p1}, Lcom/bumptech/glide/util/i;->a(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [I

    iput-object p1, p0, Lcom/bumptech/glide/request/target/a;->oq:[I

    .line 52
    iput p4, p0, Lcom/bumptech/glide/request/target/a;->viewId:I

    .line 53
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/bumptech/glide/request/target/a;->componentName:Landroid/content/ComponentName;

    .line 54
    return-void

    .line 46
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "WidgetIds must have length > 0"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>(Landroid/content/Context;ILandroid/widget/RemoteViews;Landroid/content/ComponentName;)V
    .locals 7

    .line 107
    const/high16 v2, -0x80000000

    const/high16 v3, -0x80000000

    move-object v0, p0

    move-object v1, p1

    move v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/bumptech/glide/request/target/a;-><init>(Landroid/content/Context;IIILandroid/widget/RemoteViews;Landroid/content/ComponentName;)V

    .line 108
    return-void
.end method

.method public varargs constructor <init>(Landroid/content/Context;ILandroid/widget/RemoteViews;[I)V
    .locals 7

    .line 67
    const/high16 v2, -0x80000000

    const/high16 v3, -0x80000000

    move-object v0, p0

    move-object v1, p1

    move v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/bumptech/glide/request/target/a;-><init>(Landroid/content/Context;IIILandroid/widget/RemoteViews;[I)V

    .line 68
    return-void
.end method

.method private update()V
    .locals 3

    .line 114
    iget-object v0, p0, Lcom/bumptech/glide/request/target/a;->context:Landroid/content/Context;

    invoke-static {v0}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    move-result-object v0

    .line 115
    iget-object v1, p0, Lcom/bumptech/glide/request/target/a;->componentName:Landroid/content/ComponentName;

    if-eqz v1, :cond_0

    .line 116
    iget-object v1, p0, Lcom/bumptech/glide/request/target/a;->componentName:Landroid/content/ComponentName;

    iget-object v2, p0, Lcom/bumptech/glide/request/target/a;->remoteViews:Landroid/widget/RemoteViews;

    invoke-virtual {v0, v1, v2}, Landroid/appwidget/AppWidgetManager;->updateAppWidget(Landroid/content/ComponentName;Landroid/widget/RemoteViews;)V

    goto :goto_0

    .line 118
    :cond_0
    iget-object v1, p0, Lcom/bumptech/glide/request/target/a;->oq:[I

    iget-object v2, p0, Lcom/bumptech/glide/request/target/a;->remoteViews:Landroid/widget/RemoteViews;

    invoke-virtual {v0, v1, v2}, Landroid/appwidget/AppWidgetManager;->updateAppWidget([ILandroid/widget/RemoteViews;)V

    .line 120
    :goto_0
    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/Bitmap;Lcom/bumptech/glide/request/a/f;)V
    .locals 1
    .param p1    # Landroid/graphics/Bitmap;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/request/a/f;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Bitmap;",
            "Lcom/bumptech/glide/request/a/f<",
            "-",
            "Landroid/graphics/Bitmap;",
            ">;)V"
        }
    .end annotation

    .line 125
    iget-object p2, p0, Lcom/bumptech/glide/request/target/a;->remoteViews:Landroid/widget/RemoteViews;

    iget v0, p0, Lcom/bumptech/glide/request/target/a;->viewId:I

    invoke-virtual {p2, v0, p1}, Landroid/widget/RemoteViews;->setImageViewBitmap(ILandroid/graphics/Bitmap;)V

    .line 126
    invoke-direct {p0}, Lcom/bumptech/glide/request/target/a;->update()V

    .line 127
    return-void
.end method

.method public bridge synthetic a(Ljava/lang/Object;Lcom/bumptech/glide/request/a/f;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/request/a/f;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 21
    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1, p2}, Lcom/bumptech/glide/request/target/a;->a(Landroid/graphics/Bitmap;Lcom/bumptech/glide/request/a/f;)V

    return-void
.end method
