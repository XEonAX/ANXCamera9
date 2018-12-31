.class Lcom/miui/filtersdk/filter/NewBeautificationFilter$1;
.super Ljava/lang/Object;
.source "NewBeautificationFilter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/filtersdk/filter/NewBeautificationFilter;->passPreviewFrameToTexture([BII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/filtersdk/filter/NewBeautificationFilter;

.field final synthetic val$data:[B

.field final synthetic val$height:I

.field final synthetic val$width:I


# direct methods
.method constructor <init>(Lcom/miui/filtersdk/filter/NewBeautificationFilter;[BII)V
    .locals 0

    .line 215
    iput-object p1, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter$1;->this$0:Lcom/miui/filtersdk/filter/NewBeautificationFilter;

    iput-object p2, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter$1;->val$data:[B

    iput p3, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter$1;->val$width:I

    iput p4, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter$1;->val$height:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 218
    iget-object v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter$1;->this$0:Lcom/miui/filtersdk/filter/NewBeautificationFilter;

    iget-object v1, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter$1;->this$0:Lcom/miui/filtersdk/filter/NewBeautificationFilter;

    invoke-static {v1}, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->access$100(Lcom/miui/filtersdk/filter/NewBeautificationFilter;)Lcom/miui/filtersdk/beauty/BeautyProcessor;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter$1;->val$data:[B

    iget v3, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter$1;->val$width:I

    iget v4, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter$1;->val$height:I

    invoke-virtual {v1, v2, v3, v4}, Lcom/miui/filtersdk/beauty/BeautyProcessor;->beautify([BII)I

    move-result v1

    invoke-static {v0, v1}, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->access$002(Lcom/miui/filtersdk/filter/NewBeautificationFilter;I)I

    .line 219
    iget-object v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter$1;->this$0:Lcom/miui/filtersdk/filter/NewBeautificationFilter;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->access$202(Lcom/miui/filtersdk/filter/NewBeautificationFilter;Z)Z

    .line 220
    return-void
.end method
