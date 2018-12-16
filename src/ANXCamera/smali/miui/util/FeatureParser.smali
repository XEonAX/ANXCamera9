.class public Lmiui/util/FeatureParser;
.super Ljava/lang/Object;
.source "FeatureParser.java"


# static fields
.field private static final ASSET_DIR:Ljava/lang/String; = "device_features/"

.field private static final SYSTEM_DIR:Ljava/lang/String; = "/sdcard/etc/device_features"

.field private static final TAG:Ljava/lang/String; = "FeatureParser"

.field private static final TAG_BOOL:Ljava/lang/String; = "bool"

.field private static final TAG_FLOAT:Ljava/lang/String; = "float"

.field private static final TAG_INTEGER:Ljava/lang/String; = "integer"

.field private static final TAG_INTEGER_ARRAY:Ljava/lang/String; = "integer-array"

.field private static final TAG_ITEM:Ljava/lang/String; = "item"

.field private static final TAG_STRING:Ljava/lang/String; = "string"

.field private static final TAG_STRING_ARRAY:Ljava/lang/String; = "string-array"

.field public static final TYPE_BOOL:I = 0x1

.field public static final TYPE_FLOAT:I = 0x6

.field public static final TYPE_INTEGER:I = 0x2

.field public static final TYPE_INTEGER_ARRAY:I = 0x5

.field public static final TYPE_STRING:I = 0x3

.field public static final TYPE_STRING_ARRAY:I = 0x4

.field private static sBooleanMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static sFloatMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private static sIntArrMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field private static sIntMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static sStrArrMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private static sStrMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 52
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lmiui/util/FeatureParser;->sIntMap:Ljava/util/HashMap;

    .line 53
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lmiui/util/FeatureParser;->sBooleanMap:Ljava/util/HashMap;

    .line 54
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lmiui/util/FeatureParser;->sStrMap:Ljava/util/HashMap;

    .line 55
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lmiui/util/FeatureParser;->sIntArrMap:Ljava/util/HashMap;

    .line 56
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lmiui/util/FeatureParser;->sStrArrMap:Ljava/util/HashMap;

    .line 57
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lmiui/util/FeatureParser;->sFloatMap:Ljava/util/HashMap;

    .line 58
    invoke-static {}, Lmiui/util/FeatureParser;->read()V

    .line 59
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getBoolean(Ljava/lang/String;Z)Z
    .registers 4
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "defaultValue"    # Z

    .line 63
    sget-object v0, Lmiui/util/FeatureParser;->sBooleanMap:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    .line 64
    .local v0, "value":Ljava/lang/Boolean;
    if-eqz v0, :cond_f

    .line 65
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    return v1

    .line 67
    :cond_f
    return p1
.end method

.method public static getFloat(Ljava/lang/String;F)Ljava/lang/Float;
    .registers 4
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "defaultValue"    # F

    .line 104
    sget-object v0, Lmiui/util/FeatureParser;->sFloatMap:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    .line 105
    .local v0, "value":Ljava/lang/Float;
    if-eqz v0, :cond_f

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v1

    goto :goto_10

    :cond_f
    move v1, p1

    :goto_10
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    return-object v1
.end method

.method public static getIntArray(Ljava/lang/String;)[I
    .registers 6
    .param p0, "name"    # Ljava/lang/String;

    .line 83
    sget-object v0, Lmiui/util/FeatureParser;->sIntArrMap:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 84
    .local v0, "intList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    if-eqz v0, :cond_23

    .line 85
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 86
    .local v1, "length":I
    new-array v2, v1, [I

    .line 87
    .local v2, "intArr":[I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_11
    if-ge v3, v1, :cond_22

    .line 88
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    aput v4, v2, v3

    .line 87
    add-int/lit8 v3, v3, 0x1

    goto :goto_11

    .line 90
    .end local v3    # "i":I
    :cond_22
    return-object v2

    .line 92
    .end local v1    # "length":I
    .end local v2    # "intArr":[I
    :cond_23
    const/4 v1, 0x0

    return-object v1
.end method

.method public static getInteger(Ljava/lang/String;I)I
    .registers 4
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "defaultValue"    # I

    .line 75
    sget-object v0, Lmiui/util/FeatureParser;->sIntMap:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 76
    .local v0, "value":Ljava/lang/Integer;
    if-eqz v0, :cond_f

    .line 77
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    return v1

    .line 79
    :cond_f
    return p1
.end method

.method public static getString(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .line 71
    sget-object v0, Lmiui/util/FeatureParser;->sStrMap:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public static getStringArray(Ljava/lang/String;)[Ljava/lang/String;
    .registers 3
    .param p0, "name"    # Ljava/lang/String;

    .line 96
    sget-object v0, Lmiui/util/FeatureParser;->sStrArrMap:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 97
    .local v0, "strList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-eqz v0, :cond_14

    .line 98
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    return-object v1

    .line 100
    :cond_14
    const/4 v1, 0x0

    return-object v1
.end method

.method public static hasFeature(Ljava/lang/String;I)Z
    .registers 4
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "type"    # I

    .line 109
    const/4 v0, 0x0

    .line 110
    .local v0, "result":Z
    packed-switch p1, :pswitch_data_30

    goto :goto_2f

    .line 127
    :pswitch_5
    sget-object v1, Lmiui/util/FeatureParser;->sFloatMap:Ljava/util/HashMap;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    .line 128
    goto :goto_2f

    .line 121
    :pswitch_c
    sget-object v1, Lmiui/util/FeatureParser;->sIntArrMap:Ljava/util/HashMap;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    .line 122
    goto :goto_2f

    .line 124
    :pswitch_13
    sget-object v1, Lmiui/util/FeatureParser;->sStrArrMap:Ljava/util/HashMap;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    .line 125
    goto :goto_2f

    .line 118
    :pswitch_1a
    sget-object v1, Lmiui/util/FeatureParser;->sStrMap:Ljava/util/HashMap;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    .line 119
    goto :goto_2f

    .line 115
    :pswitch_21
    sget-object v1, Lmiui/util/FeatureParser;->sIntMap:Ljava/util/HashMap;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    .line 116
    goto :goto_2f

    .line 112
    :pswitch_28
    sget-object v1, Lmiui/util/FeatureParser;->sBooleanMap:Ljava/util/HashMap;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    .line 113
    nop

    .line 132
    :goto_2f
    return v0

    :pswitch_data_30
    .packed-switch 0x1
        :pswitch_28
        :pswitch_21
        :pswitch_1a
        :pswitch_13
        :pswitch_c
        :pswitch_5
    .end packed-switch
.end method

.method private static read()V
    .registers 11

    .line 137
    const/4 v0, 0x0

    move-object v1, v0

    .line 139
    .local v1, "inputStream":Ljava/io/InputStream;
    const/4 v2, 0x0

    .line 140
    .local v2, "fileName":Ljava/lang/String;
    :try_start_3
    const-string v3, "cancro"

    sget-object v4, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_29

    .line 141
    sget-object v3, Lmiui/os/Build;->MODEL:Ljava/lang/String;

    const-string v4, "MI 3"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1b

    .line 142
    const-string v3, "cancro_MI3.xml"

    move-object v2, v3

    goto :goto_3d

    .line 143
    :cond_1b
    sget-object v3, Lmiui/os/Build;->MODEL:Ljava/lang/String;

    const-string v4, "MI 4"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3d

    .line 144
    const-string v3, "cancro_MI4.xml"

    move-object v2, v3

    goto :goto_3d

    .line 146
    :cond_29
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ".xml"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3
    :try_end_3c
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3c} :catch_1c3
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_3 .. :try_end_3c} :catch_1bc
    .catchall {:try_start_3 .. :try_end_3c} :catchall_1b3

    move-object v2, v3

    .line 150
    :cond_3d
    :goto_3d
    :try_start_3d
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "device_features/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3
    :try_end_5a
    .catch Ljava/io/IOException; {:try_start_3d .. :try_end_5a} :catch_5c
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_3d .. :try_end_5a} :catch_1bc
    .catchall {:try_start_3d .. :try_end_5a} :catchall_1b3

    move-object v1, v3

    .line 154
    goto :goto_87

    .line 151
    :catch_5c
    move-exception v3

    .line 152
    .local v3, "e":Ljava/io/IOException;
    :try_start_5d
    const-string v4, "FeatureParser"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "can\'t find "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " in assets/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "device_features/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ",it may be in "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "/system/etc/device_features"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 155
    .end local v3    # "e":Ljava/io/IOException;
    :goto_87
    if-nez v1, :cond_bb

    .line 156
    new-instance v3, Ljava/io/File;

    const-string v4, "/sdcard/etc/device_features"

    invoke-direct {v3, v4, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    .local v3, "file":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_9d

    .line 158
    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    move-object v1, v4

    goto :goto_bb

    .line 160
    :cond_9d
    const-string v0, "FeatureParser"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "both assets/device_features/ and /system/etc/device_features don\'t exist "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_b3
    .catch Ljava/io/IOException; {:try_start_5d .. :try_end_b3} :catch_1c3
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_5d .. :try_end_b3} :catch_1bc
    .catchall {:try_start_5d .. :try_end_b3} :catchall_1b3

    .line 220
    if-eqz v1, :cond_ba

    .line 222
    :try_start_b5
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_b8
    .catch Ljava/io/IOException; {:try_start_b5 .. :try_end_b8} :catch_b9

    .line 225
    goto :goto_ba

    .line 223
    :catch_b9
    move-exception v0

    .line 162
    :cond_ba
    :goto_ba
    return-void

    .line 165
    .end local v3    # "file":Ljava/io/File;
    :cond_bb
    :goto_bb
    :try_start_bb
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v3

    .line 166
    .local v3, "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    invoke-virtual {v3}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v4

    .line 167
    .local v4, "parser":Lorg/xmlpull/v1/XmlPullParser;
    const-string v5, "UTF-8"

    invoke-interface {v4, v1, v5}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 169
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v5

    .line 170
    .local v5, "type":I
    const/4 v6, 0x0

    .line 171
    .local v6, "tagName":Ljava/lang/String;
    const/4 v7, 0x0

    .line 172
    .local v7, "keyName":Ljava/lang/String;
    const/4 v8, 0x0

    .line 173
    .local v8, "intList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    nop

    .line 174
    .local v0, "strList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :goto_d0
    const/4 v9, 0x1

    if-eq v9, v5, :cond_1ab

    .line 175
    packed-switch v5, :pswitch_data_1cc

    goto/16 :goto_1a4

    .line 202
    :pswitch_d8
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v9

    .line 203
    .local v9, "end_tag_name":Ljava/lang/String;
    const-string v10, "integer-array"

    invoke-virtual {v10, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_ec

    .line 204
    sget-object v10, Lmiui/util/FeatureParser;->sIntArrMap:Ljava/util/HashMap;

    invoke-virtual {v10, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    const/4 v8, 0x0

    goto/16 :goto_1a4

    .line 206
    :cond_ec
    const-string v10, "string-array"

    invoke-virtual {v10, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1a4

    .line 207
    sget-object v10, Lmiui/util/FeatureParser;->sStrArrMap:Ljava/util/HashMap;

    invoke-virtual {v10, v7, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    const/4 v0, 0x0

    goto/16 :goto_1a4

    .line 177
    .end local v9    # "end_tag_name":Ljava/lang/String;
    :pswitch_fc
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v9

    move-object v6, v9

    .line 178
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v9

    if-lez v9, :cond_10d

    .line 179
    const/4 v9, 0x0

    invoke-interface {v4, v9}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v9

    move-object v7, v9

    .line 181
    :cond_10d
    const-string v9, "integer-array"

    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_11d

    .line 182
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    move-object v8, v9

    goto/16 :goto_1a4

    .line 183
    :cond_11d
    const-string v9, "string-array"

    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_12d

    .line 184
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    move-object v0, v9

    goto/16 :goto_1a4

    .line 185
    :cond_12d
    const-string v9, "bool"

    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_143

    .line 186
    sget-object v9, Lmiui/util/FeatureParser;->sBooleanMap:Ljava/util/HashMap;

    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v10

    invoke-virtual {v9, v7, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1a4

    .line 187
    :cond_143
    const-string v9, "integer"

    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_159

    .line 188
    sget-object v9, Lmiui/util/FeatureParser;->sIntMap:Ljava/util/HashMap;

    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v9, v7, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1a4

    .line 189
    :cond_159
    const-string v9, "string"

    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_16b

    .line 190
    sget-object v9, Lmiui/util/FeatureParser;->sStrMap:Ljava/util/HashMap;

    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v7, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1a4

    .line 191
    :cond_16b
    const-string v9, "float"

    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_185

    .line 192
    sget-object v9, Lmiui/util/FeatureParser;->sFloatMap:Ljava/util/HashMap;

    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v10

    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    invoke-virtual {v9, v7, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1a4

    .line 193
    :cond_185
    const-string v9, "item"

    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1a4

    .line 194
    if-eqz v8, :cond_19b

    .line 195
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1a4

    .line 196
    :cond_19b
    if-eqz v0, :cond_1a4

    .line 197
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 214
    :cond_1a4
    :goto_1a4
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v9
    :try_end_1a8
    .catch Ljava/io/IOException; {:try_start_bb .. :try_end_1a8} :catch_1c3
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_bb .. :try_end_1a8} :catch_1bc
    .catchall {:try_start_bb .. :try_end_1a8} :catchall_1b3

    move v5, v9

    goto/16 :goto_d0

    .line 220
    .end local v0    # "strList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v2    # "fileName":Ljava/lang/String;
    .end local v3    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v4    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v5    # "type":I
    .end local v6    # "tagName":Ljava/lang/String;
    .end local v7    # "keyName":Ljava/lang/String;
    .end local v8    # "intList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :cond_1ab
    if-eqz v1, :cond_1ca

    .line 222
    :try_start_1ad
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_1b0
    .catch Ljava/io/IOException; {:try_start_1ad .. :try_end_1b0} :catch_1b1

    .line 225
    :goto_1b0
    goto :goto_1ca

    .line 223
    :catch_1b1
    move-exception v0

    goto :goto_1b0

    .line 220
    :catchall_1b3
    move-exception v0

    if-eqz v1, :cond_1bb

    .line 222
    :try_start_1b6
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_1b9
    .catch Ljava/io/IOException; {:try_start_1b6 .. :try_end_1b9} :catch_1ba

    .line 225
    goto :goto_1bb

    .line 223
    :catch_1ba
    move-exception v2

    .line 225
    :cond_1bb
    :goto_1bb
    throw v0

    .line 218
    :catch_1bc
    move-exception v0

    .line 220
    if-eqz v1, :cond_1ca

    .line 222
    :try_start_1bf
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    goto :goto_1b0

    .line 217
    :catch_1c3
    move-exception v0

    .line 220
    if-eqz v1, :cond_1ca

    .line 222
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_1c9
    .catch Ljava/io/IOException; {:try_start_1bf .. :try_end_1c9} :catch_1b1

    goto :goto_1b0

    .line 229
    :cond_1ca
    :goto_1ca
    return-void

    nop

    :pswitch_data_1cc
    .packed-switch 0x2
        :pswitch_fc
        :pswitch_d8
    .end packed-switch
.end method
