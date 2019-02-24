.class public Lcom/android/camera/data/data/config/TopViewPositionArray;
.super Ljava/lang/Object;
.source "TopViewPositionArray.java"


# static fields
.field private static final VIEW_POSITION_ARRAY:[[I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 25
    const/4 v0, 0x6

    new-array v1, v0, [[I

    const/4 v2, 0x1

    new-array v3, v2, [I

    const/4 v4, 0x0

    const/16 v5, 0xa

    aput v5, v3, v4

    aput-object v3, v1, v4

    const/4 v3, 0x2

    new-array v4, v3, [I

    fill-array-data v4, :array_0

    aput-object v4, v1, v2

    const/4 v2, 0x3

    new-array v4, v2, [I

    fill-array-data v4, :array_1

    aput-object v4, v1, v3

    const/4 v3, 0x4

    new-array v4, v3, [I

    fill-array-data v4, :array_2

    aput-object v4, v1, v2

    const/4 v2, 0x5

    new-array v4, v2, [I

    fill-array-data v4, :array_3

    aput-object v4, v1, v3

    new-array v0, v0, [I

    fill-array-data v0, :array_4

    aput-object v0, v1, v2

    sput-object v1, Lcom/android/camera/data/data/config/TopViewPositionArray;->VIEW_POSITION_ARRAY:[[I

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0xa
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x5
        0xa
    .end array-data

    :array_2
    .array-data 4
        0x0
        0x3
        0x7
        0xa
    .end array-data

    :array_3
    .array-data 4
        0x0
        0x2
        0x5
        0x8
        0xa
    .end array-data

    :array_4
    .array-data 4
        0x0
        0x1
        0x4
        0x6
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

.method public static fillNotUseViewPosition(Ljava/util/List;)Lcom/android/camera/data/data/config/SupportedConfigs;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/data/data/config/TopConfigItem;",
            ">;)",
            "Lcom/android/camera/data/data/config/SupportedConfigs;"
        }
    .end annotation

    .line 51
    if-nez p0, :cond_0

    .line 52
    new-instance p0, Lcom/android/camera/data/data/config/SupportedConfigs;

    invoke-direct {p0}, Lcom/android/camera/data/data/config/SupportedConfigs;-><init>()V

    return-object p0

    .line 56
    :cond_0
    new-instance v0, Lcom/android/camera/data/data/config/SupportedConfigs;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Lcom/android/camera/data/data/config/SupportedConfigs;-><init>(I)V

    .line 57
    new-instance v2, Lcom/android/camera/data/data/config/TopConfigItem;

    const/16 v3, 0xb0

    invoke-direct {v2, v3}, Lcom/android/camera/data/data/config/TopConfigItem;-><init>(I)V

    .line 60
    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v1, :cond_1

    .line 61
    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(Lcom/android/camera/data/data/config/TopConfigItem;)V

    .line 60
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 67
    :cond_1
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x2

    if-gt v1, v2, :cond_2

    .line 70
    const/4 v1, 0x1

    goto :goto_1

    .line 67
    :cond_2
    nop

    .line 70
    move v1, v3

    :goto_1
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    .line 71
    sget-object v4, Lcom/android/camera/data/data/config/TopViewPositionArray;->VIEW_POSITION_ARRAY:[[I

    add-int/lit8 v5, v2, -0x1

    aget-object v4, v4, v5

    .line 72
    :goto_2
    if-ge v3, v2, :cond_4

    .line 73
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/camera/data/data/config/TopConfigItem;

    .line 74
    iput v3, v5, Lcom/android/camera/data/data/config/TopConfigItem;->index:I

    .line 77
    if-eqz v1, :cond_3

    iget v6, v5, Lcom/android/camera/data/data/config/TopConfigItem;->gravity:I

    const/16 v7, 0x11

    if-ne v6, v7, :cond_3

    .line 78
    const/4 v6, 0x5

    iput v6, v5, Lcom/android/camera/data/data/config/TopConfigItem;->bindViewPosition:I

    goto :goto_3

    .line 80
    :cond_3
    aget v6, v4, v3

    iput v6, v5, Lcom/android/camera/data/data/config/TopConfigItem;->bindViewPosition:I

    .line 83
    :goto_3
    iget v6, v5, Lcom/android/camera/data/data/config/TopConfigItem;->bindViewPosition:I

    invoke-virtual {v0, v6, v5}, Lcom/android/camera/data/data/config/SupportedConfigs;->set(ILcom/android/camera/data/data/config/TopConfigItem;)V

    .line 72
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 86
    :cond_4
    return-object v0
.end method
