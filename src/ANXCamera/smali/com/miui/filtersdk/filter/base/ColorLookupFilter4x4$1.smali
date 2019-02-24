.class Lcom/miui/filtersdk/filter/base/ColorLookupFilter4x4$1;
.super Ljava/lang/Object;
.source "ColorLookupFilter4x4.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/filtersdk/filter/base/ColorLookupFilter4x4;->onInitialized()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/filtersdk/filter/base/ColorLookupFilter4x4;


# direct methods
.method constructor <init>(Lcom/miui/filtersdk/filter/base/ColorLookupFilter4x4;)V
    .locals 0

    .line 75
    iput-object p1, p0, Lcom/miui/filtersdk/filter/base/ColorLookupFilter4x4$1;->this$0:Lcom/miui/filtersdk/filter/base/ColorLookupFilter4x4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 77
    iget-object v0, p0, Lcom/miui/filtersdk/filter/base/ColorLookupFilter4x4$1;->this$0:Lcom/miui/filtersdk/filter/base/ColorLookupFilter4x4;

    sget-object v1, Lcom/miui/filtersdk/BeautificationSDK;->sContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/miui/filtersdk/filter/base/ColorLookupFilter4x4$1;->this$0:Lcom/miui/filtersdk/filter/base/ColorLookupFilter4x4;

    iget-object v2, v2, Lcom/miui/filtersdk/filter/base/ColorLookupFilter4x4;->mTable:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/miui/filtersdk/utils/OpenGlUtils;->loadTexture(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Lcom/miui/filtersdk/filter/base/ColorLookupFilter4x4;->mLookupSourceTexture:I

    .line 78
    return-void
.end method
