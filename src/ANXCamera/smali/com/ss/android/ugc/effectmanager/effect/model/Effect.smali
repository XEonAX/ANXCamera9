.class public Lcom/ss/android/ugc/effectmanager/effect/model/Effect;
.super Ljava/lang/Object;
.source "Effect.java"


# instance fields
.field private app_version:Ljava/lang/String;

.field private device_platform:Ljava/lang/String;

.field private downloaded:Z

.field private effect_id:Ljava/lang/String;

.field private file_url:Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

.field private hint:Ljava/lang/String;

.field private icon_url:Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

.field private id:Ljava/lang/String;

.field private name:Ljava/lang/String;

.field private sdk_version:Ljava/lang/String;

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
.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 162
    instance-of v0, p1, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    if-eqz v0, :cond_0

    .line 163
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->effect_id:Ljava/lang/String;

    check-cast p1, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    iget-object p1, p1, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->effect_id:Ljava/lang/String;

    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    return p1

    .line 165
    :cond_0
    invoke-super {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public getAppVersion()Ljava/lang/String;
    .locals 1

    .line 57
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->app_version:Ljava/lang/String;

    return-object v0
.end method

.method public getDevicePlatform()Ljava/lang/String;
    .locals 1

    .line 113
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->device_platform:Ljava/lang/String;

    return-object v0
.end method

.method public getEffectId()Ljava/lang/String;
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->effect_id:Ljava/lang/String;

    return-object v0
.end method

.method public getFileUrl()Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;
    .locals 1

    .line 65
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->file_url:Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    return-object v0
.end method

.method public getHint()Ljava/lang/String;
    .locals 1

    .line 41
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->hint:Ljava/lang/String;

    return-object v0
.end method

.method public getIconUrl()Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;
    .locals 1

    .line 73
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->icon_url:Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .line 81
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 33
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getSdkVersion()Ljava/lang/String;
    .locals 1

    .line 49
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->sdk_version:Ljava/lang/String;

    return-object v0
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

    .line 145
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

.method public getTags_updated_at()Ljava/lang/String;
    .locals 1

    .line 153
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->tags_updated_at:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .line 97
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

    .line 105
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->types:Ljava/util/List;

    return-object v0
.end method

.method public getUnzipPath()Ljava/lang/String;
    .locals 1

    .line 129
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->unzipPath:Ljava/lang/String;

    return-object v0
.end method

.method public getZipPath()Ljava/lang/String;
    .locals 1

    .line 121
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->zipPath:Ljava/lang/String;

    return-object v0
.end method

.method public isDownloaded()Z
    .locals 1

    .line 137
    iget-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->downloaded:Z

    return v0
.end method

.method public setApp_version(Ljava/lang/String;)V
    .locals 0

    .line 61
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->app_version:Ljava/lang/String;

    .line 62
    return-void
.end method

.method public setDevicePlatform(Ljava/lang/String;)V
    .locals 0

    .line 117
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->device_platform:Ljava/lang/String;

    .line 118
    return-void
.end method

.method public setDownloaded(Z)V
    .locals 0

    .line 141
    iput-boolean p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->downloaded:Z

    .line 142
    return-void
.end method

.method public setEffectId(Ljava/lang/String;)V
    .locals 0

    .line 93
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->effect_id:Ljava/lang/String;

    .line 94
    return-void
.end method

.method public setFileUrl(Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;)V
    .locals 0

    .line 69
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->file_url:Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    .line 70
    return-void
.end method

.method public setHint(Ljava/lang/String;)V
    .locals 0

    .line 45
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->hint:Ljava/lang/String;

    .line 46
    return-void
.end method

.method public setIconUrl(Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;)V
    .locals 0

    .line 77
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->icon_url:Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    .line 78
    return-void
.end method

.method public setId(Ljava/lang/String;)V
    .locals 0

    .line 85
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->id:Ljava/lang/String;

    .line 86
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    .line 37
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->name:Ljava/lang/String;

    .line 38
    return-void
.end method

.method public setSdkVersion(Ljava/lang/String;)V
    .locals 0

    .line 53
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->sdk_version:Ljava/lang/String;

    .line 54
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

    .line 149
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->tags:Ljava/util/List;

    .line 150
    return-void
.end method

.method public setTagsUpdatedAt(Ljava/lang/String;)V
    .locals 0

    .line 157
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->tags_updated_at:Ljava/lang/String;

    .line 158
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0

    .line 101
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->type:Ljava/lang/String;

    .line 102
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

    .line 109
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->types:Ljava/util/List;

    .line 110
    return-void
.end method

.method public setUnzipPath(Ljava/lang/String;)V
    .locals 0

    .line 133
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->unzipPath:Ljava/lang/String;

    .line 134
    return-void
.end method

.method public setZipPath(Ljava/lang/String;)V
    .locals 0

    .line 125
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->zipPath:Ljava/lang/String;

    .line 126
    return-void
.end method
