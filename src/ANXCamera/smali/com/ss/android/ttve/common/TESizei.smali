.class public Lcom/ss/android/ttve/common/TESizei;
.super Ljava/lang/Object;
.source "TESizei.java"


# instance fields
.field public height:I

.field public width:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    const/16 v0, 0x2d0

    iput v0, p0, Lcom/ss/android/ttve/common/TESizei;->width:I

    .line 9
    const/16 v0, 0x500

    iput v0, p0, Lcom/ss/android/ttve/common/TESizei;->height:I

    .line 12
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    const/16 v0, 0x2d0

    iput v0, p0, Lcom/ss/android/ttve/common/TESizei;->width:I

    .line 9
    const/16 v0, 0x500

    iput v0, p0, Lcom/ss/android/ttve/common/TESizei;->height:I

    .line 15
    iput p1, p0, Lcom/ss/android/ttve/common/TESizei;->width:I

    .line 16
    iput p2, p0, Lcom/ss/android/ttve/common/TESizei;->height:I

    .line 17
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 26
    instance-of v0, p1, Lcom/ss/android/ttve/common/TESizei;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 27
    return v1

    .line 29
    :cond_0
    check-cast p1, Lcom/ss/android/ttve/common/TESizei;

    .line 30
    iget v0, p0, Lcom/ss/android/ttve/common/TESizei;->width:I

    iget v2, p1, Lcom/ss/android/ttve/common/TESizei;->width:I

    if-ne v0, v2, :cond_1

    iget v0, p0, Lcom/ss/android/ttve/common/TESizei;->height:I

    iget p1, p1, Lcom/ss/android/ttve/common/TESizei;->height:I

    if-ne v0, p1, :cond_1

    const/4 v1, 0x1

    nop

    :cond_1
    return v1
.end method

.method public hashCode()I
    .locals 2

    .line 36
    iget v0, p0, Lcom/ss/android/ttve/common/TESizei;->width:I

    const v1, 0x10001

    mul-int/2addr v1, v0

    const/4 v0, 0x1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/ss/android/ttve/common/TESizei;->height:I

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p0, Lcom/ss/android/ttve/common/TESizei;->width:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/ss/android/ttve/common/TESizei;->height:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
