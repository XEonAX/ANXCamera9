.class public Lcom/ss/android/ugc/effectmanager/effect/model/ComposerHelper;
.super Ljava/lang/Object;
.source "ComposerHelper.java"


# static fields
.field public static final COMPOSER_CHILDREN:Ljava/lang/String; = "nodes"

.field public static final COMPOSER_CONTENT:Ljava/lang/String; = "content"

.field public static final COMPOSER_DEFAULT_VALUE:Ljava/lang/String; = "default_value"

.field public static final COMPOSER_EXTRA_INFO:Ljava/lang/String; = "extra_info"

.field public static final COMPOSER_ICON:Ljava/lang/String; = "icon"

.field public static final COMPOSER_MAX_VALUE:Ljava/lang/String; = "max_value"

.field public static final COMPOSER_MIN_VALUE:Ljava/lang/String; = "min_value"

.field public static final COMPOSER_NODES:Ljava/lang/String; = "nodes"

.field public static final COMPOSER_PATH:Ljava/lang/String; = "file"

.field public static final COMPOSER_SWITCH_MODE:Ljava/lang/String; = "switch_mode"

.field public static final COMPOSER_TAG_NAME:Ljava/lang/String; = "tag_name"

.field public static final COMPOSER_TYPE:Ljava/lang/String; = "type"

.field public static final COMPOSER_UI_NAME:Ljava/lang/String; = "UI_name"

.field public static final COMPOSER_VERSION:Ljava/lang/String; = "version"

.field public static final CONFIG_EFFECT:Ljava/lang/String; = "effect"

.field public static final CONFIG_FILE_NAME:Ljava/lang/String; = "config.json"

.field public static final CONFIG_LINK:Ljava/lang/String; = "Link"

.field public static final CONFIG_PATH:Ljava/lang/String; = "path"

.field public static final CONFIG_TYPE:Ljava/lang/String; = "type"

.field public static final CONFIG_TYPE_COMPOSER:Ljava/lang/String; = "composer"

.field public static final CONTENT_FILE_NAME:Ljava/lang/String; = "content.json"

.field public static final DEFAULT_SERVER_URL1:Ljava/lang/String; = "https://sf1-hscdn-tos.pstatp.com/obj/ies.fe.effect/"

.field public static final DEFAULT_SERVER_URL2:Ljava/lang/String; = "https://sf3-hscdn-tos.pstatp.com/obj/ies.fe.effect/"

.field public static final DEFAULT_SERVER_URL3:Ljava/lang/String; = "https://sf6-hscdn-tos.pstatp.com/obj/ies.fe.effect/"

.field private static serverURLs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 52
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerHelper;->serverURLs:Ljava/util/List;

    .line 53
    sget-object v0, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerHelper;->serverURLs:Ljava/util/List;

    const-string v1, "https://sf1-hscdn-tos.pstatp.com/obj/ies.fe.effect/"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 54
    sget-object v0, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerHelper;->serverURLs:Ljava/util/List;

    const-string v1, "https://sf3-hscdn-tos.pstatp.com/obj/ies.fe.effect/"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    sget-object v0, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerHelper;->serverURLs:Ljava/util/List;

    const-string v1, "https://sf6-hscdn-tos.pstatp.com/obj/ies.fe.effect/"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getServerUrls()Ljava/util/List;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 64
    sget-object v0, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerHelper;->serverURLs:Ljava/util/List;

    return-object v0
.end method

.method public static parseComposerMaterial(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;
    .locals 5
    .param p0    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 70
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "config.json"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/ss/android/ugc/effectmanager/common/utils/FileUtils;->getFileContent(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 72
    const/4 v1, 0x0

    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 73
    const-string v0, "effect"

    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 74
    const-string v2, "Link"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 75
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-gtz v2, :cond_0

    .line 76
    return-object v1

    .line 78
    :cond_0
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "path"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 79
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v4, "type"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 80
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v4, "composer"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 81
    return-object v1

    .line 84
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p0, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "content.json"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/ss/android/ugc/effectmanager/common/utils/FileUtils;->getFileContent(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 86
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 87
    new-instance p0, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;

    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;-><init>()V

    .line 88
    const-string v3, "root"

    iput-object v3, p0, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->tag_name:Ljava/lang/String;

    .line 89
    const-string v3, "Composer"

    iput-object v3, p0, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->UI_name:Ljava/lang/String;

    .line 90
    const/4 v3, 0x4

    iput v3, p0, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->type:I

    .line 91
    const-string v3, "content"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 93
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->children:Ljava/util/List;

    .line 94
    const-string v3, "nodes"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 95
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_3

    .line 96
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    invoke-static {v3, p1, p2}, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerHelper;->parseComposerNode(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;

    move-result-object v3

    .line 97
    if-eqz v3, :cond_2

    .line 98
    iput-object p0, v3, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->parent:Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;

    .line 100
    :cond_2
    iget-object v4, p0, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->children:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 95
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 102
    :cond_3
    return-object p0

    .line 103
    :catch_0
    move-exception p0

    .line 104
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 106
    return-object v1
.end method

.method public static parseComposerNode(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;
    .locals 7
    .param p0    # Lorg/json/JSONObject;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 112
    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;

    invoke-direct {v1}, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;-><init>()V

    .line 113
    const-string v2, "type"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    iput v2, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->type:I

    .line 114
    const-string v2, "file"

    const-string v3, ""

    invoke-virtual {p0, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->file:Ljava/lang/String;

    .line 115
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "https://sf1-hscdn-tos.pstatp.com/obj/ies.fe.effect/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "icon"

    invoke-virtual {p0, v3, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->icon:Ljava/lang/String;

    .line 116
    const-string v2, "UI_name"

    invoke-virtual {p0, v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->UI_name:Ljava/lang/String;

    .line 117
    const-string v2, "tag_name"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->tag_name:Ljava/lang/String;

    .line 118
    const-string v2, "default_value"

    const-wide/16 v3, 0x0

    invoke-virtual {p0, v2, v3, v4}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    move-result-wide v5

    double-to-float v2, v5

    iput v2, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->default_value:F

    .line 119
    const-string v2, "min_value"

    invoke-virtual {p0, v2, v3, v4}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    move-result-wide v5

    double-to-float v2, v5

    iput v2, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->min_value:F

    .line 120
    const-string v2, "max_value"

    invoke-virtual {p0, v2, v3, v4}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    move-result-wide v2

    double-to-float v2, v2

    iput v2, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->max_value:F

    .line 121
    const-string v2, "switch_mode"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->switch_mode:I

    .line 122
    const-string v2, "nodes"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 123
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->children:Ljava/util/List;

    .line 124
    const-string v2, "nodes"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    .line 125
    move v2, v3

    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v2, v4, :cond_1

    .line 126
    invoke-virtual {p0, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    invoke-static {v4, p1, p2}, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerHelper;->parseComposerNode(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;

    move-result-object v4

    .line 127
    if-eqz v4, :cond_0

    .line 128
    iput-object v1, v4, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->parent:Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;

    .line 129
    iget-object v5, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->children:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 125
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 133
    :cond_1
    iget-object p0, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->children:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    if-eqz p0, :cond_3

    iget-object p0, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->children:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    const/4 p1, 0x1

    if-ne p0, p1, :cond_2

    iget-object p0, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->children:Ljava/util/List;

    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;

    iget p0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->type:I

    const/4 p1, -0x1

    if-ne p0, p1, :cond_2

    goto :goto_1

    .line 136
    :cond_2
    goto/16 :goto_3

    .line 134
    :cond_3
    :goto_1
    return-object v0

    .line 137
    :cond_4
    invoke-static {}, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerHelper;->getServerUrls()Ljava/util/List;

    move-result-object v2

    .line 138
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 139
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 140
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->file:Ljava/lang/String;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 141
    goto :goto_2

    .line 142
    :cond_5
    new-instance v2, Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    invoke-direct {v2}, Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;-><init>()V

    .line 143
    invoke-virtual {v2, v3}, Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;->setUrlList(Ljava/util/List;)V

    .line 144
    iget-object v3, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->file:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;->setUri(Ljava/lang/String;)V

    .line 146
    new-instance v3, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    invoke-direct {v3}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;-><init>()V

    .line 147
    invoke-virtual {v3, v2}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->setFileUrl(Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;)V

    .line 149
    iget-object v2, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->file:Ljava/lang/String;

    invoke-virtual {v3, v2}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->setId(Ljava/lang/String;)V

    .line 150
    iget-object v2, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->file:Ljava/lang/String;

    invoke-virtual {v3, v2}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->setEffectId(Ljava/lang/String;)V

    .line 151
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->getId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ".zip"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->setZipPath(Ljava/lang/String;)V

    .line 152
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->getId()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v3, p2}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->setUnzipPath(Ljava/lang/String;)V

    .line 154
    iput-object v3, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->effect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    .line 156
    const-string p2, "extra_info"

    invoke-virtual {p0, p2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    .line 157
    const-string p2, "0"

    .line 158
    if-eqz p0, :cond_6

    .line 159
    const-string p2, "version"

    const-string v2, "0"

    invoke-virtual {p0, p2, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 161
    :cond_6
    invoke-static {p1, p2}, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerHelper;->versionCompare(Ljava/lang/String;Ljava/lang/String;)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-gez p0, :cond_7

    .line 162
    return-object v0

    .line 165
    :cond_7
    :goto_3
    return-object v1

    .line 166
    :catch_0
    move-exception p0

    .line 167
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 169
    return-object v0
.end method

.method public static setServerUrls(Ljava/util/List;)V
    .locals 0
    .param p0    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 59
    sput-object p0, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerHelper;->serverURLs:Ljava/util/List;

    .line 60
    return-void
.end method

.method public static versionCompare(Ljava/lang/String;Ljava/lang/String;)I
    .locals 3
    .param p0    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 186
    const-string v0, "\\."

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    .line 187
    const-string v0, "\\."

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    .line 188
    nop

    .line 190
    const/4 v0, 0x0

    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_0

    array-length v1, p1

    if-ge v0, v1, :cond_0

    aget-object v1, p0, v0

    aget-object v2, p1, v0

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 191
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 194
    :cond_0
    array-length v1, p0

    if-ge v0, v1, :cond_1

    array-length v1, p1

    if-ge v0, v1, :cond_1

    .line 195
    aget-object p0, p0, v0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p0

    aget-object p1, p1, v0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/Integer;->compareTo(Ljava/lang/Integer;)I

    move-result p0

    .line 196
    invoke-static {p0}, Ljava/lang/Integer;->signum(I)I

    move-result p0

    return p0

    .line 200
    :cond_1
    array-length p0, p0

    array-length p1, p1

    sub-int/2addr p0, p1

    invoke-static {p0}, Ljava/lang/Integer;->signum(I)I

    move-result p0

    return p0
.end method
