.class final Lcom/ss/android/vesdk/VEEditorModel$1;
.super Ljava/lang/Object;
.source "VEEditorModel.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/vesdk/VEEditorModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/ss/android/vesdk/VEEditorModel;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/ss/android/vesdk/VEEditorModel;
    .locals 1

    .line 101
    new-instance v0, Lcom/ss/android/vesdk/VEEditorModel;

    invoke-direct {v0, p1}, Lcom/ss/android/vesdk/VEEditorModel;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 98
    invoke-virtual {p0, p1}, Lcom/ss/android/vesdk/VEEditorModel$1;->createFromParcel(Landroid/os/Parcel;)Lcom/ss/android/vesdk/VEEditorModel;

    move-result-object p1

    return-object p1
.end method

.method public newArray(I)[Lcom/ss/android/vesdk/VEEditorModel;
    .locals 0

    .line 106
    new-array p1, p1, [Lcom/ss/android/vesdk/VEEditorModel;

    return-object p1
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 98
    invoke-virtual {p0, p1}, Lcom/ss/android/vesdk/VEEditorModel$1;->newArray(I)[Lcom/ss/android/vesdk/VEEditorModel;

    move-result-object p1

    return-object p1
.end method
