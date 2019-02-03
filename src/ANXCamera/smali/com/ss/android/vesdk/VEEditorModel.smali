.class public Lcom/ss/android/vesdk/VEEditorModel;
.super Ljava/lang/Object;
.source "VEEditorModel.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/ss/android/vesdk/VEEditorModel;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public audioEffectFilterIndex:I

.field public audioPaths:[Ljava/lang/String;

.field public backgroundColor:I
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation
.end field

.field public colorFilterIndex:I

.field public colorFilterIntensity:F

.field public colorFilterLeftPath:Ljava/lang/String;

.field public colorFilterPosition:F

.field public colorFilterRightPath:Ljava/lang/String;

.field public inPoint:I

.field public masterTrackIndex:I

.field public modelDir:Ljava/lang/String;

.field public outputFile:Ljava/lang/String;

.field public outputPoint:I

.field public projectXML:Ljava/lang/String;

.field public reverseDone:Z

.field public separateAV:Z

.field public transitions:[Ljava/lang/String;

.field public videoOutRes:Lcom/ss/android/vesdk/VEEditor$VIDEO_RATIO;

.field public videoPaths:[Ljava/lang/String;

.field public watermarkFile:Ljava/lang/String;

.field public watermarkHeight:D

.field public watermarkOffsetX:D

.field public watermarkOffsetY:D

.field public watermarkWidth:D


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 98
    new-instance v0, Lcom/ss/android/vesdk/VEEditorModel$1;

    invoke-direct {v0}, Lcom/ss/android/vesdk/VEEditorModel$1;-><init>()V

    sput-object v0, Lcom/ss/android/vesdk/VEEditorModel;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 4

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditorModel;->projectXML:Ljava/lang/String;

    .line 49
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/ss/android/vesdk/VEEditorModel;->inPoint:I

    .line 50
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/ss/android/vesdk/VEEditorModel;->outputPoint:I

    .line 51
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEEditorModel;->reverseDone:Z

    .line 52
    invoke-static {}, Lcom/ss/android/vesdk/VEEditor$VIDEO_RATIO;->values()[Lcom/ss/android/vesdk/VEEditor$VIDEO_RATIO;

    move-result-object v0

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    aget-object v0, v0, v3

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditorModel;->videoOutRes:Lcom/ss/android/vesdk/VEEditor$VIDEO_RATIO;

    .line 53
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-ne v0, v2, :cond_1

    move v1, v2

    nop

    :cond_1
    iput-boolean v1, p0, Lcom/ss/android/vesdk/VEEditorModel;->separateAV:Z

    .line 54
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/ss/android/vesdk/VEEditorModel;->masterTrackIndex:I

    .line 55
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/ss/android/vesdk/VEEditorModel;->audioEffectFilterIndex:I

    .line 56
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditorModel;->modelDir:Ljava/lang/String;

    .line 57
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/ss/android/vesdk/VEEditorModel;->colorFilterIndex:I

    .line 59
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 60
    const/4 v1, 0x0

    const/4 v2, -0x1

    if-eq v0, v2, :cond_2

    .line 61
    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditorModel;->videoPaths:[Ljava/lang/String;

    .line 62
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditorModel;->videoPaths:[Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readStringArray([Ljava/lang/String;)V

    goto :goto_1

    .line 64
    :cond_2
    iput-object v1, p0, Lcom/ss/android/vesdk/VEEditorModel;->videoPaths:[Ljava/lang/String;

    .line 67
    :goto_1
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 68
    if-eq v0, v2, :cond_3

    .line 69
    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditorModel;->audioPaths:[Ljava/lang/String;

    .line 70
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditorModel;->audioPaths:[Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readStringArray([Ljava/lang/String;)V

    goto :goto_2

    .line 72
    :cond_3
    iput-object v1, p0, Lcom/ss/android/vesdk/VEEditorModel;->audioPaths:[Ljava/lang/String;

    .line 75
    :goto_2
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 76
    if-eq v0, v2, :cond_4

    .line 77
    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditorModel;->transitions:[Ljava/lang/String;

    .line 78
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditorModel;->transitions:[Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readStringArray([Ljava/lang/String;)V

    goto :goto_3

    .line 80
    :cond_4
    iput-object v1, p0, Lcom/ss/android/vesdk/VEEditorModel;->transitions:[Ljava/lang/String;

    .line 83
    :goto_3
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/ss/android/vesdk/VEEditorModel;->backgroundColor:I

    .line 84
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditorModel;->outputFile:Ljava/lang/String;

    .line 86
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditorModel;->watermarkFile:Ljava/lang/String;

    .line 87
    invoke-virtual {p1}, Landroid/os/Parcel;->readDouble()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/ss/android/vesdk/VEEditorModel;->watermarkWidth:D

    .line 88
    invoke-virtual {p1}, Landroid/os/Parcel;->readDouble()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/ss/android/vesdk/VEEditorModel;->watermarkHeight:D

    .line 89
    invoke-virtual {p1}, Landroid/os/Parcel;->readDouble()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/ss/android/vesdk/VEEditorModel;->watermarkOffsetX:D

    .line 90
    invoke-virtual {p1}, Landroid/os/Parcel;->readDouble()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/ss/android/vesdk/VEEditorModel;->watermarkOffsetY:D

    .line 92
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditorModel;->colorFilterLeftPath:Ljava/lang/String;

    .line 93
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditorModel;->colorFilterRightPath:Ljava/lang/String;

    .line 94
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/ss/android/vesdk/VEEditorModel;->colorFilterPosition:F

    .line 95
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result p1

    iput p1, p0, Lcom/ss/android/vesdk/VEEditorModel;->colorFilterIntensity:F

    .line 96
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .line 112
    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2

    .line 117
    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditorModel;->projectXML:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 118
    iget p2, p0, Lcom/ss/android/vesdk/VEEditorModel;->inPoint:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 119
    iget p2, p0, Lcom/ss/android/vesdk/VEEditorModel;->outputPoint:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 120
    iget-boolean p2, p0, Lcom/ss/android/vesdk/VEEditorModel;->reverseDone:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 121
    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditorModel;->videoOutRes:Lcom/ss/android/vesdk/VEEditor$VIDEO_RATIO;

    invoke-virtual {p2}, Lcom/ss/android/vesdk/VEEditor$VIDEO_RATIO;->ordinal()I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 122
    iget-boolean p2, p0, Lcom/ss/android/vesdk/VEEditorModel;->separateAV:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 123
    iget p2, p0, Lcom/ss/android/vesdk/VEEditorModel;->masterTrackIndex:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 124
    iget p2, p0, Lcom/ss/android/vesdk/VEEditorModel;->audioEffectFilterIndex:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 125
    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditorModel;->modelDir:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 126
    iget p2, p0, Lcom/ss/android/vesdk/VEEditorModel;->colorFilterIndex:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 128
    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditorModel;->videoPaths:[Ljava/lang/String;

    const/4 v0, -0x1

    if-eqz p2, :cond_0

    .line 129
    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditorModel;->videoPaths:[Ljava/lang/String;

    array-length p2, p2

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 130
    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditorModel;->videoPaths:[Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeStringArray([Ljava/lang/String;)V

    goto :goto_0

    .line 132
    :cond_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 135
    :goto_0
    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditorModel;->audioPaths:[Ljava/lang/String;

    if-eqz p2, :cond_1

    .line 136
    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditorModel;->audioPaths:[Ljava/lang/String;

    array-length p2, p2

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 137
    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditorModel;->audioPaths:[Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeStringArray([Ljava/lang/String;)V

    goto :goto_1

    .line 139
    :cond_1
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 142
    :goto_1
    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditorModel;->transitions:[Ljava/lang/String;

    if-eqz p2, :cond_2

    .line 143
    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditorModel;->transitions:[Ljava/lang/String;

    array-length p2, p2

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 144
    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditorModel;->transitions:[Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeStringArray([Ljava/lang/String;)V

    goto :goto_2

    .line 146
    :cond_2
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 149
    :goto_2
    iget p2, p0, Lcom/ss/android/vesdk/VEEditorModel;->backgroundColor:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 150
    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditorModel;->outputFile:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 152
    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditorModel;->watermarkFile:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 153
    iget-wide v0, p0, Lcom/ss/android/vesdk/VEEditorModel;->watermarkWidth:D

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeDouble(D)V

    .line 154
    iget-wide v0, p0, Lcom/ss/android/vesdk/VEEditorModel;->watermarkHeight:D

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeDouble(D)V

    .line 155
    iget-wide v0, p0, Lcom/ss/android/vesdk/VEEditorModel;->watermarkOffsetX:D

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeDouble(D)V

    .line 156
    iget-wide v0, p0, Lcom/ss/android/vesdk/VEEditorModel;->watermarkOffsetY:D

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeDouble(D)V

    .line 158
    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditorModel;->colorFilterLeftPath:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 159
    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditorModel;->colorFilterRightPath:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 160
    iget p2, p0, Lcom/ss/android/vesdk/VEEditorModel;->colorFilterPosition:F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    .line 161
    iget p2, p0, Lcom/ss/android/vesdk/VEEditorModel;->colorFilterIntensity:F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    .line 162
    return-void
.end method
