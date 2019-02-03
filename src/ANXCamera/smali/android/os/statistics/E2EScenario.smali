.class public final Landroid/os/statistics/E2EScenario;
.super Ljava/lang/Object;
.source "E2EScenario.java"

# interfaces
.implements Landroid/os/Parcelable;
.implements Ljava/io/Serializable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Landroid/os/statistics/E2EScenario;",
            ">;"
        }
    .end annotation
.end field

.field public static final DEFAULT_CATEGORY:Ljava/lang/String; = "default"

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field public category:Ljava/lang/String;

.field public name:Ljava/lang/String;

.field public namespace:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 118
    new-instance v0, Landroid/os/statistics/E2EScenario$1;

    invoke-direct {v0}, Landroid/os/statistics/E2EScenario$1;-><init>()V

    sput-object v0, Landroid/os/statistics/E2EScenario;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method protected constructor <init>()V
    .registers 2

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    const-string v0, ""

    iput-object v0, p0, Landroid/os/statistics/E2EScenario;->namespace:Ljava/lang/String;

    .line 34
    const-string v0, ""

    iput-object v0, p0, Landroid/os/statistics/E2EScenario;->category:Ljava/lang/String;

    .line 35
    const-string v0, ""

    iput-object v0, p0, Landroid/os/statistics/E2EScenario;->name:Ljava/lang/String;

    .line 36
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .registers 6
    .param p1, "source"    # Landroid/os/Parcel;

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    .line 49
    .local v0, "_namespace":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 50
    .local v1, "_category":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 51
    .local v2, "_name":Ljava/lang/String;
    if-nez v0, :cond_14

    const-string v3, ""

    goto :goto_15

    :cond_14
    move-object v3, v0

    :goto_15
    iput-object v3, p0, Landroid/os/statistics/E2EScenario;->namespace:Ljava/lang/String;

    .line 52
    if-nez v1, :cond_1c

    const-string v3, ""

    goto :goto_1d

    :cond_1c
    move-object v3, v1

    :goto_1d
    iput-object v3, p0, Landroid/os/statistics/E2EScenario;->category:Ljava/lang/String;

    .line 53
    if-nez v2, :cond_24

    const-string v3, ""

    goto :goto_25

    :cond_24
    move-object v3, v2

    :goto_25
    iput-object v3, p0, Landroid/os/statistics/E2EScenario;->name:Ljava/lang/String;

    .line 54
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "namespace"    # Ljava/lang/String;
    .param p2, "category"    # Ljava/lang/String;
    .param p3, "name"    # Ljava/lang/String;

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    if-nez p1, :cond_8

    const-string v0, ""

    goto :goto_9

    :cond_8
    move-object v0, p1

    :goto_9
    iput-object v0, p0, Landroid/os/statistics/E2EScenario;->namespace:Ljava/lang/String;

    .line 40
    if-nez p2, :cond_10

    const-string v0, ""

    goto :goto_11

    :cond_10
    move-object v0, p2

    :goto_11
    iput-object v0, p0, Landroid/os/statistics/E2EScenario;->category:Ljava/lang/String;

    .line 41
    if-nez p3, :cond_18

    const-string v0, ""

    goto :goto_19

    :cond_18
    move-object v0, p3

    :goto_19
    iput-object v0, p0, Landroid/os/statistics/E2EScenario;->name:Ljava/lang/String;

    .line 42
    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    .line 93
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "obj"    # Ljava/lang/Object;

    .line 70
    const/4 v0, 0x0

    if-eqz p1, :cond_2c

    instance-of v1, p1, Landroid/os/statistics/E2EScenario;

    if-nez v1, :cond_8

    goto :goto_2c

    .line 73
    :cond_8
    move-object v1, p1

    check-cast v1, Landroid/os/statistics/E2EScenario;

    .line 74
    .local v1, "other":Landroid/os/statistics/E2EScenario;
    iget-object v2, p0, Landroid/os/statistics/E2EScenario;->namespace:Ljava/lang/String;

    iget-object v3, v1, Landroid/os/statistics/E2EScenario;->namespace:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2b

    iget-object v2, p0, Landroid/os/statistics/E2EScenario;->category:Ljava/lang/String;

    iget-object v3, v1, Landroid/os/statistics/E2EScenario;->category:Ljava/lang/String;

    .line 75
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2b

    iget-object v2, p0, Landroid/os/statistics/E2EScenario;->name:Ljava/lang/String;

    iget-object v3, v1, Landroid/os/statistics/E2EScenario;->name:Ljava/lang/String;

    .line 76
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2b

    const/4 v0, 0x1

    nop

    .line 74
    :cond_2b
    return v0

    .line 71
    .end local v1    # "other":Landroid/os/statistics/E2EScenario;
    :cond_2c
    :goto_2c
    return v0
.end method

.method public hashCode()I
    .registers 3

    .line 81
    iget-object v0, p0, Landroid/os/statistics/E2EScenario;->namespace:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    iget-object v1, p0, Landroid/os/statistics/E2EScenario;->category:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Landroid/os/statistics/E2EScenario;->name:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public isValid()Z
    .registers 2

    .line 88
    iget-object v0, p0, Landroid/os/statistics/E2EScenario;->name:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public normalize(Ljava/lang/String;)V
    .registers 3
    .param p1, "packageName"    # Ljava/lang/String;

    .line 60
    iget-object v0, p0, Landroid/os/statistics/E2EScenario;->namespace:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 61
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_11

    const-string v0, "android"

    goto :goto_12

    :cond_11
    move-object v0, p1

    :goto_12
    iput-object v0, p0, Landroid/os/statistics/E2EScenario;->namespace:Ljava/lang/String;

    .line 63
    :cond_14
    iget-object v0, p0, Landroid/os/statistics/E2EScenario;->category:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_20

    .line 64
    const-string v0, "default"

    iput-object v0, p0, Landroid/os/statistics/E2EScenario;->category:Ljava/lang/String;

    .line 66
    :cond_20
    return-void
.end method

.method public toJson()Lorg/json/JSONObject;
    .registers 4

    .line 107
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 109
    .local v0, "json":Lorg/json/JSONObject;
    :try_start_5
    const-string/jumbo v1, "namespace"

    iget-object v2, p0, Landroid/os/statistics/E2EScenario;->namespace:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 110
    const-string v1, "category"

    iget-object v2, p0, Landroid/os/statistics/E2EScenario;->category:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 111
    const-string/jumbo v1, "name"

    iget-object v2, p0, Landroid/os/statistics/E2EScenario;->name:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1c
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_1c} :catch_1d

    .line 114
    goto :goto_21

    .line 112
    :catch_1d
    move-exception v1

    .line 113
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 115
    .end local v1    # "e":Lorg/json/JSONException;
    :goto_21
    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .line 98
    iget-object v0, p0, Landroid/os/statistics/E2EScenario;->namespace:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 99
    iget-object v0, p0, Landroid/os/statistics/E2EScenario;->category:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 100
    iget-object v0, p0, Landroid/os/statistics/E2EScenario;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 101
    return-void
.end method
