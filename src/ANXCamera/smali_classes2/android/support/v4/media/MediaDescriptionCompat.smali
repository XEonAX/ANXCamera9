.class public final Landroid/support/v4/media/MediaDescriptionCompat;
.super Ljava/lang/Object;
.source "MediaDescriptionCompat.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/media/MediaDescriptionCompat$Builder;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Landroid/support/v4/media/MediaDescriptionCompat;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mDescription:Ljava/lang/CharSequence;

.field private mDescriptionObj:Ljava/lang/Object;

.field private final mExtras:Landroid/os/Bundle;

.field private final mIcon:Landroid/graphics/Bitmap;

.field private final mIconUri:Landroid/net/Uri;

.field private final mMediaId:Ljava/lang/String;

.field private final mMediaUri:Landroid/net/Uri;

.field private final mSubtitle:Ljava/lang/CharSequence;

.field private final mTitle:Ljava/lang/CharSequence;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 263
    new-instance v0, Landroid/support/v4/media/MediaDescriptionCompat$1;

    invoke-direct {v0}, Landroid/support/v4/media/MediaDescriptionCompat$1;-><init>()V

    sput-object v0, Landroid/support/v4/media/MediaDescriptionCompat;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .registers 4
    .param p1, "in"    # Landroid/os/Parcel;

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mMediaId:Ljava/lang/String;

    .line 85
    sget-object v0, Landroid/text/TextUtils;->CHAR_SEQUENCE_CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    iput-object v0, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mTitle:Ljava/lang/CharSequence;

    .line 86
    sget-object v0, Landroid/text/TextUtils;->CHAR_SEQUENCE_CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    iput-object v0, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mSubtitle:Ljava/lang/CharSequence;

    .line 87
    sget-object v0, Landroid/text/TextUtils;->CHAR_SEQUENCE_CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    iput-object v0, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mDescription:Ljava/lang/CharSequence;

    .line 88
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/graphics/Bitmap;

    iput-object v1, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mIcon:Landroid/graphics/Bitmap;

    .line 89
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/net/Uri;

    iput-object v1, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mIconUri:Landroid/net/Uri;

    .line 90
    invoke-virtual {p1}, Landroid/os/Parcel;->readBundle()Landroid/os/Bundle;

    move-result-object v1

    iput-object v1, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mExtras:Landroid/os/Bundle;

    .line 91
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    iput-object v0, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mMediaUri:Landroid/net/Uri;

    .line 92
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Landroid/support/v4/media/MediaDescriptionCompat$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Landroid/support/v4/media/MediaDescriptionCompat$1;

    .line 32
    invoke-direct {p0, p1}, Landroid/support/v4/media/MediaDescriptionCompat;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/graphics/Bitmap;Landroid/net/Uri;Landroid/os/Bundle;Landroid/net/Uri;)V
    .registers 9
    .param p1, "mediaId"    # Ljava/lang/String;
    .param p2, "title"    # Ljava/lang/CharSequence;
    .param p3, "subtitle"    # Ljava/lang/CharSequence;
    .param p4, "description"    # Ljava/lang/CharSequence;
    .param p5, "icon"    # Landroid/graphics/Bitmap;
    .param p6, "iconUri"    # Landroid/net/Uri;
    .param p7, "extras"    # Landroid/os/Bundle;
    .param p8, "mediaUri"    # Landroid/net/Uri;

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    iput-object p1, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mMediaId:Ljava/lang/String;

    .line 74
    iput-object p2, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mTitle:Ljava/lang/CharSequence;

    .line 75
    iput-object p3, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mSubtitle:Ljava/lang/CharSequence;

    .line 76
    iput-object p4, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mDescription:Ljava/lang/CharSequence;

    .line 77
    iput-object p5, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mIcon:Landroid/graphics/Bitmap;

    .line 78
    iput-object p6, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mIconUri:Landroid/net/Uri;

    .line 79
    iput-object p7, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mExtras:Landroid/os/Bundle;

    .line 80
    iput-object p8, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mMediaUri:Landroid/net/Uri;

    .line 81
    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/graphics/Bitmap;Landroid/net/Uri;Landroid/os/Bundle;Landroid/net/Uri;Landroid/support/v4/media/MediaDescriptionCompat$1;)V
    .registers 10
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Ljava/lang/CharSequence;
    .param p3, "x2"    # Ljava/lang/CharSequence;
    .param p4, "x3"    # Ljava/lang/CharSequence;
    .param p5, "x4"    # Landroid/graphics/Bitmap;
    .param p6, "x5"    # Landroid/net/Uri;
    .param p7, "x6"    # Landroid/os/Bundle;
    .param p8, "x7"    # Landroid/net/Uri;
    .param p9, "x8"    # Landroid/support/v4/media/MediaDescriptionCompat$1;

    .line 32
    invoke-direct/range {p0 .. p8}, Landroid/support/v4/media/MediaDescriptionCompat;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/graphics/Bitmap;Landroid/net/Uri;Landroid/os/Bundle;Landroid/net/Uri;)V

    return-void
.end method

.method public static fromMediaDescription(Ljava/lang/Object;)Landroid/support/v4/media/MediaDescriptionCompat;
    .registers 4
    .param p0, "descriptionObj"    # Ljava/lang/Object;

    .line 242
    if-eqz p0, :cond_53

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-ge v0, v1, :cond_9

    goto :goto_53

    .line 246
    :cond_9
    new-instance v0, Landroid/support/v4/media/MediaDescriptionCompat$Builder;

    invoke-direct {v0}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;-><init>()V

    .line 247
    .local v0, "bob":Landroid/support/v4/media/MediaDescriptionCompat$Builder;
    invoke-static {p0}, Landroid/support/v4/media/MediaDescriptionCompatApi21;->getMediaId(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;->setMediaId(Ljava/lang/String;)Landroid/support/v4/media/MediaDescriptionCompat$Builder;

    .line 248
    invoke-static {p0}, Landroid/support/v4/media/MediaDescriptionCompatApi21;->getTitle(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/support/v4/media/MediaDescriptionCompat$Builder;

    .line 249
    invoke-static {p0}, Landroid/support/v4/media/MediaDescriptionCompatApi21;->getSubtitle(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;->setSubtitle(Ljava/lang/CharSequence;)Landroid/support/v4/media/MediaDescriptionCompat$Builder;

    .line 250
    invoke-static {p0}, Landroid/support/v4/media/MediaDescriptionCompatApi21;->getDescription(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;->setDescription(Ljava/lang/CharSequence;)Landroid/support/v4/media/MediaDescriptionCompat$Builder;

    .line 251
    invoke-static {p0}, Landroid/support/v4/media/MediaDescriptionCompatApi21;->getIconBitmap(Ljava/lang/Object;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;->setIconBitmap(Landroid/graphics/Bitmap;)Landroid/support/v4/media/MediaDescriptionCompat$Builder;

    .line 252
    invoke-static {p0}, Landroid/support/v4/media/MediaDescriptionCompatApi21;->getIconUri(Ljava/lang/Object;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;->setIconUri(Landroid/net/Uri;)Landroid/support/v4/media/MediaDescriptionCompat$Builder;

    .line 253
    invoke-static {p0}, Landroid/support/v4/media/MediaDescriptionCompatApi21;->getExtras(Ljava/lang/Object;)Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;->setExtras(Landroid/os/Bundle;)Landroid/support/v4/media/MediaDescriptionCompat$Builder;

    .line 254
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x17

    if-lt v1, v2, :cond_4c

    .line 255
    invoke-static {p0}, Landroid/support/v4/media/MediaDescriptionCompatApi23;->getMediaUri(Ljava/lang/Object;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;->setMediaUri(Landroid/net/Uri;)Landroid/support/v4/media/MediaDescriptionCompat$Builder;

    .line 257
    :cond_4c
    invoke-virtual {v0}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;->build()Landroid/support/v4/media/MediaDescriptionCompat;

    move-result-object v1

    .line 258
    .local v1, "descriptionCompat":Landroid/support/v4/media/MediaDescriptionCompat;
    iput-object p0, v1, Landroid/support/v4/media/MediaDescriptionCompat;->mDescriptionObj:Ljava/lang/Object;

    .line 260
    return-object v1

    .line 243
    .end local v0    # "bob":Landroid/support/v4/media/MediaDescriptionCompat$Builder;
    .end local v1    # "descriptionCompat":Landroid/support/v4/media/MediaDescriptionCompat;
    :cond_53
    :goto_53
    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    .line 175
    const/4 v0, 0x0

    return v0
.end method

.method public getDescription()Ljava/lang/CharSequence;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 130
    iget-object v0, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mDescription:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getExtras()Landroid/os/Bundle;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 160
    iget-object v0, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mExtras:Landroid/os/Bundle;

    return-object v0
.end method

.method public getIconBitmap()Landroid/graphics/Bitmap;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 140
    iget-object v0, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mIcon:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getIconUri()Landroid/net/Uri;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 150
    iget-object v0, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mIconUri:Landroid/net/Uri;

    return-object v0
.end method

.method public getMediaDescription()Ljava/lang/Object;
    .registers 4

    .line 210
    iget-object v0, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mDescriptionObj:Ljava/lang/Object;

    if-nez v0, :cond_46

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-ge v0, v1, :cond_b

    goto :goto_46

    .line 213
    :cond_b
    invoke-static {}, Landroid/support/v4/media/MediaDescriptionCompatApi21$Builder;->newInstance()Ljava/lang/Object;

    move-result-object v0

    .line 214
    .local v0, "bob":Ljava/lang/Object;
    iget-object v1, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mMediaId:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/support/v4/media/MediaDescriptionCompatApi21$Builder;->setMediaId(Ljava/lang/Object;Ljava/lang/String;)V

    .line 215
    iget-object v1, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mTitle:Ljava/lang/CharSequence;

    invoke-static {v0, v1}, Landroid/support/v4/media/MediaDescriptionCompatApi21$Builder;->setTitle(Ljava/lang/Object;Ljava/lang/CharSequence;)V

    .line 216
    iget-object v1, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mSubtitle:Ljava/lang/CharSequence;

    invoke-static {v0, v1}, Landroid/support/v4/media/MediaDescriptionCompatApi21$Builder;->setSubtitle(Ljava/lang/Object;Ljava/lang/CharSequence;)V

    .line 217
    iget-object v1, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mDescription:Ljava/lang/CharSequence;

    invoke-static {v0, v1}, Landroid/support/v4/media/MediaDescriptionCompatApi21$Builder;->setDescription(Ljava/lang/Object;Ljava/lang/CharSequence;)V

    .line 218
    iget-object v1, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mIcon:Landroid/graphics/Bitmap;

    invoke-static {v0, v1}, Landroid/support/v4/media/MediaDescriptionCompatApi21$Builder;->setIconBitmap(Ljava/lang/Object;Landroid/graphics/Bitmap;)V

    .line 219
    iget-object v1, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mIconUri:Landroid/net/Uri;

    invoke-static {v0, v1}, Landroid/support/v4/media/MediaDescriptionCompatApi21$Builder;->setIconUri(Ljava/lang/Object;Landroid/net/Uri;)V

    .line 220
    iget-object v1, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mExtras:Landroid/os/Bundle;

    invoke-static {v0, v1}, Landroid/support/v4/media/MediaDescriptionCompatApi21$Builder;->setExtras(Ljava/lang/Object;Landroid/os/Bundle;)V

    .line 221
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x17

    if-lt v1, v2, :cond_3d

    .line 222
    iget-object v1, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mMediaUri:Landroid/net/Uri;

    invoke-static {v0, v1}, Landroid/support/v4/media/MediaDescriptionCompatApi23$Builder;->setMediaUri(Ljava/lang/Object;Landroid/net/Uri;)V

    .line 224
    :cond_3d
    invoke-static {v0}, Landroid/support/v4/media/MediaDescriptionCompatApi21$Builder;->build(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mDescriptionObj:Ljava/lang/Object;

    .line 226
    iget-object v1, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mDescriptionObj:Ljava/lang/Object;

    return-object v1

    .line 211
    .end local v0    # "bob":Ljava/lang/Object;
    :cond_46
    :goto_46
    iget-object v0, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mDescriptionObj:Ljava/lang/Object;

    return-object v0
.end method

.method public getMediaId()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 100
    iget-object v0, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mMediaId:Ljava/lang/String;

    return-object v0
.end method

.method public getMediaUri()Landroid/net/Uri;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 170
    iget-object v0, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mMediaUri:Landroid/net/Uri;

    return-object v0
.end method

.method public getSubtitle()Ljava/lang/CharSequence;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 120
    iget-object v0, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mSubtitle:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getTitle()Ljava/lang/CharSequence;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 110
    iget-object v0, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mTitle:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 195
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mTitle:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mSubtitle:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mDescription:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 5
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .line 180
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-ge v0, v1, :cond_2a

    .line 181
    iget-object v0, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mMediaId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 182
    iget-object v0, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mTitle:Ljava/lang/CharSequence;

    invoke-static {v0, p1, p2}, Landroid/text/TextUtils;->writeToParcel(Ljava/lang/CharSequence;Landroid/os/Parcel;I)V

    .line 183
    iget-object v0, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mSubtitle:Ljava/lang/CharSequence;

    invoke-static {v0, p1, p2}, Landroid/text/TextUtils;->writeToParcel(Ljava/lang/CharSequence;Landroid/os/Parcel;I)V

    .line 184
    iget-object v0, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mDescription:Ljava/lang/CharSequence;

    invoke-static {v0, p1, p2}, Landroid/text/TextUtils;->writeToParcel(Ljava/lang/CharSequence;Landroid/os/Parcel;I)V

    .line 185
    iget-object v0, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mIcon:Landroid/graphics/Bitmap;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 186
    iget-object v0, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mIconUri:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 187
    iget-object v0, p0, Landroid/support/v4/media/MediaDescriptionCompat;->mExtras:Landroid/os/Bundle;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeBundle(Landroid/os/Bundle;)V

    goto :goto_31

    .line 189
    :cond_2a
    invoke-virtual {p0}, Landroid/support/v4/media/MediaDescriptionCompat;->getMediaDescription()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, p1, p2}, Landroid/support/v4/media/MediaDescriptionCompatApi21;->writeToParcel(Ljava/lang/Object;Landroid/os/Parcel;I)V

    .line 191
    :goto_31
    return-void
.end method
