.class public Lcom/android/camera/data/data/config/TopViewPositionArray;
.super Ljava/lang/Object;
.source "TopViewPositionArray.java"


# static fields
.field private static sCurrentUsePostion:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static sViewPositionArray:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 14
    const/16 v0, 0xb

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/android/camera/data/data/config/TopViewPositionArray;->sViewPositionArray:[I

    .line 21
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/android/camera/data/data/config/TopViewPositionArray;->sCurrentUsePostion:Ljava/util/Map;

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x1
        0x2
        0x3
        0x4
        0x5
        0x6
        0x7
        0x8
        0x9
        0xa
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static fillNotUseViewPosition(Ljava/util/List;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/data/data/config/TopConfigItem;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/android/camera/data/data/config/TopConfigItem;",
            ">;"
        }
    .end annotation

    .line 30
    if-nez p0, :cond_0

    .line 31
    return-object p0

    .line 34
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    sget-object v1, Lcom/android/camera/data/data/config/TopViewPositionArray;->sCurrentUsePostion:Ljava/util/Map;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 35
    sget-object v1, Lcom/android/camera/data/data/config/TopViewPositionArray;->sCurrentUsePostion:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 36
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/data/data/config/TopConfigItem;

    .line 37
    iget v3, v2, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    .line 38
    if-eqz v3, :cond_1

    .line 39
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, v2, Lcom/android/camera/data/data/config/TopConfigItem;->bindViewPosition:I

    .line 40
    sget-object v4, Lcom/android/camera/data/data/config/TopViewPositionArray;->sCurrentUsePostion:Ljava/util/Map;

    iget v2, v2, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v4, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    goto :goto_0

    .line 44
    :cond_1
    sget-object v3, Lcom/android/camera/data/data/config/TopViewPositionArray;->sViewPositionArray:[I

    array-length v4, v3

    const/4 v5, 0x0

    :goto_1
    if-ge v5, v4, :cond_3

    aget v6, v3, v5

    .line 45
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v0, v7}, Ljava/util/Map;->containsValue(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2

    sget-object v7, Lcom/android/camera/data/data/config/TopViewPositionArray;->sCurrentUsePostion:Ljava/util/Map;

    .line 46
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/Map;->containsValue(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2

    .line 47
    iput v6, v2, Lcom/android/camera/data/data/config/TopConfigItem;->bindViewPosition:I

    .line 48
    sget-object v3, Lcom/android/camera/data/data/config/TopViewPositionArray;->sCurrentUsePostion:Ljava/util/Map;

    iget v2, v2, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    goto :goto_2

    .line 44
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 52
    :cond_3
    :goto_2
    goto :goto_0

    .line 53
    :cond_4
    return-object p0
.end method

.method public static getCurrentUseViewPositionFromConfig(I)I
    .locals 1

    .line 57
    sget-object v0, Lcom/android/camera/data/data/config/TopViewPositionArray;->sCurrentUsePostion:Ljava/util/Map;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    .line 58
    if-nez p0, :cond_0

    .line 59
    const/4 p0, 0x0

    return p0

    .line 61
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    return p0
.end method
