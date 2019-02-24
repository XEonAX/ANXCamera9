.class public Lcom/ss/android/ugc/effectmanager/effect/model/Effect;
.super Ljava/lang/Object;
.source "Effect.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private app_version:Ljava/lang/String;

.field private childEffects:Ljava/util/List;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;"
        }
    .end annotation
.end field

.field private children:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private designer_id:Ljava/lang/String;

.field private device_platform:Ljava/lang/String;

.field private downloaded:Z

.field private effect_id:Ljava/lang/String;

.field private effect_type:I

.field private file_url:Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

.field private hint:Ljava/lang/String;

.field private hint_icon:Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

.field private icon_url:Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

.field private id:Ljava/lang/String;

.field private name:Ljava/lang/String;

.field private parent:Ljava/lang/String;

.field private schema:Ljava/lang/String;

.field private sdk_version:Ljava/lang/String;

.field private source:I

.field private tags:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private tags_updated_at:Ljava/lang/String;

.field private type:Ljava/lang/String;

.field private types:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private unzipPath:Ljava/lang/String;

.field private zipPath:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 328
    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect$1;

    invoke-direct {v0}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect$1;-><init>()V

    sput-object v0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 265
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 266
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    .line 301
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 302
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->name:Ljava/lang/String;

    .line 303
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->hint:Ljava/lang/String;

    .line 304
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->sdk_version:Ljava/lang/String;

    .line 305
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->app_version:Ljava/lang/String;

    .line 306
    const-class v0, Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->file_url:Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    .line 307
    const-class v0, Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->icon_url:Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    .line 308
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->id:Ljava/lang/String;

    .line 309
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->effect_id:Ljava/lang/String;

    .line 310
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->type:Ljava/lang/String;

    .line 311
    invoke-virtual {p1}, Landroid/os/Parcel;->createStringArrayList()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->types:Ljava/util/List;

    .line 312
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->device_platform:Ljava/lang/String;

    .line 313
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->zipPath:Ljava/lang/String;

    .line 314
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->unzipPath:Ljava/lang/String;

    .line 315
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->downloaded:Z

    .line 316
    invoke-virtual {p1}, Landroid/os/Parcel;->createStringArrayList()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->tags:Ljava/util/List;

    .line 317
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->tags_updated_at:Ljava/lang/String;

    .line 318
    const-class v0, Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->hint_icon:Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    .line 319
    invoke-virtual {p1}, Landroid/os/Parcel;->createStringArrayList()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->children:Ljava/util/List;

    .line 320
    sget-object v0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->childEffects:Ljava/util/List;

    .line 321
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->effect_type:I

    .line 322
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->parent:Ljava/lang/String;

    .line 323
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->source:I

    .line 324
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->designer_id:Ljava/lang/String;

    .line 325
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->schema:Ljava/lang/String;

    .line 326
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .line 270
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 245
    instance-of v0, p1, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    if-eqz v0, :cond_0

    .line 246
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->effect_id:Ljava/lang/String;

    check-cast p1, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    iget-object p1, p1, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->effect_id:Ljava/lang/String;

    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    return p1

    .line 248
    :cond_0
    invoke-super {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public getAppVersion()Ljava/lang/String;
    .locals 1

    .line 84
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->app_version:Ljava/lang/String;

    return-object v0
.end method

.method public getChildEffects()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;"
        }
    .end annotation

    .line 196
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->childEffects:Ljava/util/List;

    return-object v0
.end method

.method public getChildren()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 188
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->children:Ljava/util/List;

    return-object v0
.end method

.method public getDesignerId()Ljava/lang/String;
    .locals 1

    .line 228
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->designer_id:Ljava/lang/String;

    return-object v0
.end method

.method public getDevicePlatform()Ljava/lang/String;
    .locals 1

    .line 140
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->device_platform:Ljava/lang/String;

    return-object v0
.end method

.method public getEffectId()Ljava/lang/String;
    .locals 1

    .line 116
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->effect_id:Ljava/lang/String;

    return-object v0
.end method

.method public getEffectType()I
    .locals 1

    .line 204
    iget v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->effect_type:I

    return v0
.end method

.method public getFileUrl()Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;
    .locals 1

    .line 92
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->file_url:Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    return-object v0
.end method

.method public getHint()Ljava/lang/String;
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->hint:Ljava/lang/String;

    return-object v0
.end method

.method public getHintIcon()Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;
    .locals 1

    .line 68
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->hint_icon:Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    return-object v0
.end method

.method public getIconUrl()Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;
    .locals 1

    .line 100
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->icon_url:Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .line 108
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 52
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getParentId()Ljava/lang/String;
    .locals 1

    .line 212
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->parent:Ljava/lang/String;

    return-object v0
.end method

.method public getSchema()Ljava/lang/String;
    .locals 1

    .line 236
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->schema:Ljava/lang/String;

    return-object v0
.end method

.method public getSdkVersion()Ljava/lang/String;
    .locals 1

    .line 76
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->sdk_version:Ljava/lang/String;

    return-object v0
.end method

.method public getSource()I
    .locals 1

    .line 220
    iget v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->source:I

    return v0
.end method

.method public getTags()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 172
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->tags:Ljava/util/List;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->tags:Ljava/util/List;

    :goto_0
    return-object v0
.end method

.method public getTagsUpdatedAt()Ljava/lang/String;
    .locals 1

    .line 180
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->tags_updated_at:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .line 124
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->type:Ljava/lang/String;

    return-object v0
.end method

.method public getTypes()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 132
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->types:Ljava/util/List;

    return-object v0
.end method

.method public getUnzipPath()Ljava/lang/String;
    .locals 1

    .line 156
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->unzipPath:Ljava/lang/String;

    return-object v0
.end method

.method public getZipPath()Ljava/lang/String;
    .locals 1

    .line 148
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->zipPath:Ljava/lang/String;

    return-object v0
.end method

.method public isDownloaded()Z
    .locals 1

    .line 164
    iget-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->downloaded:Z

    return v0
.end method

.method public setAppVersion(Ljava/lang/String;)V
    .locals 0

    .line 88
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->app_version:Ljava/lang/String;

    .line 89
    return-void
.end method

.method public setChildEffects(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;)V"
        }
    .end annotation

    .line 200
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->childEffects:Ljava/util/List;

    .line 201
    return-void
.end method

.method public setChildren(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 192
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->children:Ljava/util/List;

    .line 193
    return-void
.end method

.method public setDesignerId(Ljava/lang/String;)V
    .locals 0

    .line 232
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->designer_id:Ljava/lang/String;

    .line 233
    return-void
.end method

.method public setDevicePlatform(Ljava/lang/String;)V
    .locals 0

    .line 144
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->device_platform:Ljava/lang/String;

    .line 145
    return-void
.end method

.method public setDownloaded(Z)V
    .locals 0

    .line 168
    iput-boolean p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->downloaded:Z

    .line 169
    return-void
.end method

.method public setEffectId(Ljava/lang/String;)V
    .locals 0

    .line 120
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->effect_id:Ljava/lang/String;

    .line 121
    return-void
.end method

.method public setEffectType(I)V
    .locals 0

    .line 208
    iput p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->effect_type:I

    .line 209
    return-void
.end method

.method public setFileUrl(Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;)V
    .locals 0

    .line 96
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->file_url:Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    .line 97
    return-void
.end method

.method public setHint(Ljava/lang/String;)V
    .locals 0

    .line 64
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->hint:Ljava/lang/String;

    .line 65
    return-void
.end method

.method public setHintIcon(Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;)V
    .locals 0

    .line 72
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->hint_icon:Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    .line 73
    return-void
.end method

.method public setIconUrl(Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;)V
    .locals 0

    .line 104
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->icon_url:Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    .line 105
    return-void
.end method

.method public setId(Ljava/lang/String;)V
    .locals 0

    .line 112
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->id:Ljava/lang/String;

    .line 113
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    .line 56
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->name:Ljava/lang/String;

    .line 57
    return-void
.end method

.method public setParentId(Ljava/lang/String;)V
    .locals 0

    .line 216
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->parent:Ljava/lang/String;

    .line 217
    return-void
.end method

.method public setSchema(Ljava/lang/String;)V
    .locals 0

    .line 240
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->schema:Ljava/lang/String;

    .line 241
    return-void
.end method

.method public setSdkVersion(Ljava/lang/String;)V
    .locals 0

    .line 80
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->sdk_version:Ljava/lang/String;

    .line 81
    return-void
.end method

.method public setSource(I)V
    .locals 0

    .line 224
    iput p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->source:I

    .line 225
    return-void
.end method

.method public setTags(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 176
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->tags:Ljava/util/List;

    .line 177
    return-void
.end method

.method public setTagsUpdatedAt(Ljava/lang/String;)V
    .locals 0

    .line 184
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->tags_updated_at:Ljava/lang/String;

    .line 185
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0

    .line 128
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->type:Ljava/lang/String;

    .line 129
    return-void
.end method

.method public setTypes(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 136
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->types:Ljava/util/List;

    .line 137
    return-void
.end method

.method public setUnzipPath(Ljava/lang/String;)V
    .locals 0

    .line 160
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->unzipPath:Ljava/lang/String;

    .line 161
    return-void
.end method

.method public setZipPath(Ljava/lang/String;)V
    .locals 0

    .line 152
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->zipPath:Ljava/lang/String;

    .line 153
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 254
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Effect{name=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", effect_id=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->effect_id:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", type=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->type:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", unzipPath=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->unzipPath:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v1, ", children="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->children:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", effectType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->effect_type:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", parentId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->parent:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    .line 275
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 276
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->hint:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 277
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->sdk_version:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 278
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->app_version:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 279
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->file_url:Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 280
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->icon_url:Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 281
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->id:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 282
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->effect_id:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 283
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->type:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 284
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->types:Ljava/util/List;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeStringList(Ljava/util/List;)V

    .line 285
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->device_platform:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 286
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->zipPath:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 287
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->unzipPath:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 288
    iget-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->downloaded:Z

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 289
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->tags:Ljava/util/List;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeStringList(Ljava/util/List;)V

    .line 290
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->tags_updated_at:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 291
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->hint_icon:Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 292
    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->children:Ljava/util/List;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeStringList(Ljava/util/List;)V

    .line 293
    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->childEffects:Ljava/util/List;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 294
    iget p2, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->effect_type:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 295
    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->parent:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 296
    iget p2, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->source:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 297
    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->designer_id:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 298
    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->schema:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 299
    return-void
.end method
