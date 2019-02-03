.class public Lcom/android/camera/fragment/beauty/BeautyValues;
.super Ljava/lang/Object;
.source "BeautyValues.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/android/camera/fragment/beauty/BeautyValues;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public mBeautyBlusher:I

.field public mBeautyBodySlim:I

.field public mBeautyChin:I

.field public mBeautyEnlargeEye:I

.field public mBeautyEyebrowDye:I

.field public mBeautyHeadSlim:I

.field public mBeautyJellyLips:I

.field public mBeautyLegSlim:I

.field public mBeautyLevel:Ljava/lang/String;

.field public mBeautyLips:I

.field public mBeautyNeck:I

.field public mBeautyNose:I

.field public mBeautyPupilLine:I

.field public mBeautyRisorius:I

.field public mBeautyShoulderSlim:I

.field public mBeautySkinColor:I

.field public mBeautySkinSmooth:I

.field public mBeautySlimFace:I

.field public mBeautySlimNose:I

.field public mBeautySmile:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 195
    new-instance v0, Lcom/android/camera/fragment/beauty/BeautyValues$1;

    invoke-direct {v0}, Lcom/android/camera/fragment/beauty/BeautyValues$1;-><init>()V

    sput-object v0, Lcom/android/camera/fragment/beauty/BeautyValues;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 92
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 93
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    .line 121
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 122
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    .line 124
    invoke-static {}, Lcom/mi/config/b;->hR()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 125
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySlimFace:I

    .line 126
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyEnlargeEye:I

    .line 127
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyNose:I

    .line 128
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyRisorius:I

    .line 129
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLips:I

    .line 130
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyChin:I

    .line 131
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyNeck:I

    .line 132
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySmile:I

    .line 133
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySlimNose:I

    .line 134
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyEyebrowDye:I

    .line 135
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyPupilLine:I

    .line 136
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyJellyLips:I

    .line 137
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyBlusher:I

    .line 138
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyHeadSlim:I

    .line 139
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyBodySlim:I

    .line 140
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyShoulderSlim:I

    .line 141
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLegSlim:I

    goto :goto_0

    .line 143
    :cond_0
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySkinColor:I

    .line 144
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySlimFace:I

    .line 145
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySkinSmooth:I

    .line 146
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyEnlargeEye:I

    .line 148
    :goto_0
    return-void
.end method

.method public constructor <init>(Lcom/android/camera/fragment/beauty/BeautyValues;)V
    .locals 1

    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 96
    if-eqz p1, :cond_0

    .line 97
    iget-object v0, p1, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    .line 98
    iget v0, p1, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySkinColor:I

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySkinColor:I

    .line 99
    iget v0, p1, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySlimFace:I

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySlimFace:I

    .line 100
    iget v0, p1, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySkinSmooth:I

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySkinSmooth:I

    .line 101
    iget v0, p1, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyEnlargeEye:I

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyEnlargeEye:I

    .line 103
    iget v0, p1, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyNose:I

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyNose:I

    .line 104
    iget v0, p1, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyRisorius:I

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyRisorius:I

    .line 105
    iget v0, p1, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLips:I

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLips:I

    .line 106
    iget v0, p1, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyChin:I

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyChin:I

    .line 107
    iget v0, p1, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyNeck:I

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyNeck:I

    .line 108
    iget v0, p1, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySmile:I

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySmile:I

    .line 109
    iget v0, p1, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySlimNose:I

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySlimNose:I

    .line 110
    iget v0, p1, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyEyebrowDye:I

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyEyebrowDye:I

    .line 111
    iget v0, p1, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyPupilLine:I

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyPupilLine:I

    .line 112
    iget v0, p1, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyJellyLips:I

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyJellyLips:I

    .line 113
    iget v0, p1, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyBlusher:I

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyBlusher:I

    .line 114
    iget v0, p1, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyHeadSlim:I

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyHeadSlim:I

    .line 115
    iget v0, p1, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyBodySlim:I

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyBodySlim:I

    .line 116
    iget v0, p1, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyShoulderSlim:I

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyShoulderSlim:I

    .line 117
    iget p1, p1, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLegSlim:I

    iput p1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLegSlim:I

    .line 119
    :cond_0
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .line 59
    const/4 v0, 0x0

    return v0
.end method

.method public get(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)I
    .locals 1

    .line 151
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautyValues$2;->$SwitchMap$com$android$camera$fragment$beauty$BeautyParameters$Type:[I

    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    .line 191
    const/4 p1, 0x0

    return p1

    .line 189
    :pswitch_0
    iget p1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLegSlim:I

    return p1

    .line 187
    :pswitch_1
    iget p1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyShoulderSlim:I

    return p1

    .line 185
    :pswitch_2
    iget p1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyBodySlim:I

    return p1

    .line 183
    :pswitch_3
    iget p1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyHeadSlim:I

    return p1

    .line 181
    :pswitch_4
    iget p1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyBlusher:I

    return p1

    .line 179
    :pswitch_5
    iget p1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyJellyLips:I

    return p1

    .line 177
    :pswitch_6
    iget p1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyPupilLine:I

    return p1

    .line 175
    :pswitch_7
    iget p1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyEyebrowDye:I

    return p1

    .line 173
    :pswitch_8
    iget p1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySlimNose:I

    return p1

    .line 171
    :pswitch_9
    iget p1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySmile:I

    return p1

    .line 169
    :pswitch_a
    iget p1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyNeck:I

    return p1

    .line 167
    :pswitch_b
    iget p1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyChin:I

    return p1

    .line 165
    :pswitch_c
    iget p1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLips:I

    return p1

    .line 163
    :pswitch_d
    iget p1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyRisorius:I

    return p1

    .line 161
    :pswitch_e
    iget p1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyNose:I

    return p1

    .line 159
    :pswitch_f
    iget p1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySkinSmooth:I

    return p1

    .line 157
    :pswitch_10
    iget p1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyEnlargeEye:I

    return p1

    .line 155
    :pswitch_11
    iget p1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySlimFace:I

    return p1

    .line 153
    :pswitch_12
    iget p1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySkinColor:I

    return p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public toString()Ljava/lang/String;
    .locals 10

    .line 41
    invoke-static {}, Lcom/mi/config/b;->hR()Z

    move-result v0

    const/4 v1, 0x4

    const/4 v2, 0x3

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x5

    if-nez v0, :cond_0

    .line 42
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v7, "beauty level: %s | sc: %d | sf: %d | ss: %d | ee: %d "

    new-array v6, v6, [Ljava/lang/Object;

    iget-object v8, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    aput-object v8, v6, v5

    iget v5, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySkinColor:I

    .line 43
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v6, v4

    iget v4, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySlimFace:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v6, v3

    iget v3, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySkinSmooth:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v6, v2

    iget v2, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyEnlargeEye:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v6, v1

    .line 42
    invoke-static {v0, v7, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 45
    :cond_0
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v7, "3d beauty level: %s | sf: %d | ee: %d | ns: %d | rs: %d | lp: %d | cn: %d | nk: %d | se: %d | sn: %d | ed: %d | pl: %d | jl: %d | blusher: %d| headSlim: %d | bodySlim: %d | shoulderSlim: %d | legSlim: %d "

    const/16 v8, 0x12

    new-array v8, v8, [Ljava/lang/Object;

    iget-object v9, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    aput-object v9, v8, v5

    iget v5, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySlimFace:I

    .line 49
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v8, v4

    iget v4, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyEnlargeEye:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v8, v3

    iget v3, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyNose:I

    .line 50
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v8, v2

    iget v2, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyRisorius:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v8, v1

    iget v1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLips:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v8, v6

    const/4 v1, 0x6

    iget v2, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyChin:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v8, v1

    const/4 v1, 0x7

    iget v2, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyNeck:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v8, v1

    const/16 v1, 0x8

    iget v2, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySmile:I

    .line 51
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v8, v1

    const/16 v1, 0x9

    iget v2, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySlimNose:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v8, v1

    const/16 v1, 0xa

    iget v2, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyEyebrowDye:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v8, v1

    const/16 v1, 0xb

    iget v2, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyPupilLine:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v8, v1

    const/16 v1, 0xc

    iget v2, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyJellyLips:I

    .line 52
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v8, v1

    const/16 v1, 0xd

    iget v2, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyBlusher:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v8, v1

    const/16 v1, 0xe

    iget v2, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyHeadSlim:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v8, v1

    const/16 v1, 0xf

    iget v2, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyBodySlim:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v8, v1

    const/16 v1, 0x10

    iget v2, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyShoulderSlim:I

    .line 53
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v8, v1

    const/16 v1, 0x11

    iget v2, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLegSlim:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v8, v1

    .line 45
    invoke-static {v0, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 64
    iget-object p2, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 66
    invoke-static {}, Lcom/mi/config/b;->hR()Z

    move-result p2

    if-eqz p2, :cond_0

    .line 67
    iget p2, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySlimFace:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 68
    iget p2, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyEnlargeEye:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 69
    iget p2, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyNose:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 70
    iget p2, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyRisorius:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 71
    iget p2, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLips:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 72
    iget p2, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyChin:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 73
    iget p2, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyNeck:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 74
    iget p2, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySmile:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 75
    iget p2, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySlimNose:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 76
    iget p2, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyEyebrowDye:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 77
    iget p2, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyPupilLine:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 78
    iget p2, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyJellyLips:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 79
    iget p2, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyBlusher:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 80
    iget p2, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyHeadSlim:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 81
    iget p2, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyBodySlim:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 82
    iget p2, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyShoulderSlim:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 83
    iget p2, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLegSlim:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_0

    .line 85
    :cond_0
    iget p2, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySkinColor:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 86
    iget p2, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySlimFace:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 87
    iget p2, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySkinSmooth:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 88
    iget p2, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyEnlargeEye:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 90
    :goto_0
    return-void
.end method
