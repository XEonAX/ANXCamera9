.class public Lcom/android/camera/data/data/global/ComponentGlobalRaw;
.super Lcom/android/camera/data/data/ComponentData;
.source "ComponentGlobalRaw.java"


# direct methods
.method public constructor <init>(Lcom/android/camera/data/data/global/DataItemGlobal;)V
    .locals 0

    .line 21
    invoke-direct {p0, p1}, Lcom/android/camera/data/data/ComponentData;-><init>(Lcom/android/camera/data/data/DataItemBase;)V

    .line 22
    return-void
.end method


# virtual methods
.method public getDefaultValue(I)Ljava/lang/String;
    .locals 0

    .line 36
    const/4 p1, 0x0

    return-object p1
.end method

.method public getDisplayTitleString()I
    .locals 1

    .line 26
    const v0, 0x7f09004f

    return v0
.end method

.method public getItems()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera/data/data/ComponentDataItem;",
            ">;"
        }
    .end annotation

    .line 41
    const/4 v0, 0x0

    return-object v0
.end method

.method public getKey(I)Ljava/lang/String;
    .locals 0

    .line 31
    const/4 p1, 0x0

    return-object p1
.end method
