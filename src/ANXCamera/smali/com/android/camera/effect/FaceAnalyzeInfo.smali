.class public Lcom/android/camera/effect/FaceAnalyzeInfo;
.super Ljava/lang/Object;
.source "FaceAnalyzeInfo.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/android/camera/effect/FaceAnalyzeInfo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public mAge:[F

.field public mFaceNum:I

.field public mFaceScore:[F

.field public mGender:[F

.field public mProp:[F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 51
    new-instance v0, Lcom/android/camera/effect/FaceAnalyzeInfo$1;

    invoke-direct {v0}, Lcom/android/camera/effect/FaceAnalyzeInfo$1;-><init>()V

    sput-object v0, Lcom/android/camera/effect/FaceAnalyzeInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/FaceAnalyzeInfo;->mFaceNum:I

    .line 45
    iget-object v0, p0, Lcom/android/camera/effect/FaceAnalyzeInfo;->mGender:[F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readFloatArray([F)V

    .line 46
    iget-object v0, p0, Lcom/android/camera/effect/FaceAnalyzeInfo;->mAge:[F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readFloatArray([F)V

    .line 47
    iget-object v0, p0, Lcom/android/camera/effect/FaceAnalyzeInfo;->mFaceScore:[F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readFloatArray([F)V

    .line 48
    iget-object v0, p0, Lcom/android/camera/effect/FaceAnalyzeInfo;->mProp:[F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readFloatArray([F)V

    .line 49
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .line 28
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .line 22
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v1, "face num: %d | gender: %d | age: %d | facescore: %d"

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    iget v3, p0, Lcom/android/camera/effect/FaceAnalyzeInfo;->mFaceNum:I

    .line 23
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    iget-object v3, p0, Lcom/android/camera/effect/FaceAnalyzeInfo;->mGender:[F

    aget v3, v3, v4

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    const/4 v5, 0x1

    aput-object v3, v2, v5

    iget-object v3, p0, Lcom/android/camera/effect/FaceAnalyzeInfo;->mAge:[F

    aget v3, v3, v4

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    const/4 v5, 0x2

    aput-object v3, v2, v5

    iget-object v3, p0, Lcom/android/camera/effect/FaceAnalyzeInfo;->mFaceScore:[F

    aget v3, v3, v4

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    const/4 v4, 0x3

    aput-object v3, v2, v4

    .line 22
    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 33
    iget p2, p0, Lcom/android/camera/effect/FaceAnalyzeInfo;->mFaceNum:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 34
    iget-object p2, p0, Lcom/android/camera/effect/FaceAnalyzeInfo;->mGender:[F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloatArray([F)V

    .line 35
    iget-object p2, p0, Lcom/android/camera/effect/FaceAnalyzeInfo;->mAge:[F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloatArray([F)V

    .line 36
    iget-object p2, p0, Lcom/android/camera/effect/FaceAnalyzeInfo;->mFaceScore:[F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloatArray([F)V

    .line 37
    iget-object p2, p0, Lcom/android/camera/effect/FaceAnalyzeInfo;->mProp:[F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloatArray([F)V

    .line 38
    return-void
.end method
