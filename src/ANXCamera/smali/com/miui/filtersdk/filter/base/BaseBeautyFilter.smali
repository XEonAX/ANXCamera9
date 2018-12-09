.class public abstract Lcom/miui/filtersdk/filter/base/BaseBeautyFilter;
.super Lcom/miui/filtersdk/filter/base/GPUImageFilter;
.source "BaseBeautyFilter.java"


# instance fields
.field protected mBeautyProcessor:Lcom/miui/filtersdk/beauty/BeautyProcessor;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;-><init>()V

    return-void
.end method


# virtual methods
.method public beautyEnable()Z
    .locals 1

    .line 13
    iget-object v0, p0, Lcom/miui/filtersdk/filter/base/BaseBeautyFilter;->mBeautyProcessor:Lcom/miui/filtersdk/beauty/BeautyProcessor;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public abstract initBeautyProcessor(II)V
.end method

.method public setBeautyProcessor(Lcom/miui/filtersdk/beauty/BeautyProcessor;)V
    .locals 0

    .line 9
    iput-object p1, p0, Lcom/miui/filtersdk/filter/base/BaseBeautyFilter;->mBeautyProcessor:Lcom/miui/filtersdk/beauty/BeautyProcessor;

    .line 10
    return-void
.end method
