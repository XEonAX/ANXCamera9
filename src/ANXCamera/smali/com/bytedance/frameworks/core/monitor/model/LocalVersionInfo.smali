.class public Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;
.super Ljava/lang/Object;
.source "LocalVersionInfo.java"


# instance fields
.field public id:J

.field public manifestVersionCode:Ljava/lang/String;

.field public updateVersionCode:Ljava/lang/String;

.field public versionCode:Ljava/lang/String;

.field public versionName:Ljava/lang/String;


# direct methods
.method public constructor <init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-wide p1, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->id:J

    .line 18
    iput-object p3, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->versionCode:Ljava/lang/String;

    .line 19
    iput-object p4, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->versionName:Ljava/lang/String;

    .line 20
    iput-object p5, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->manifestVersionCode:Ljava/lang/String;

    .line 21
    iput-object p6, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->updateVersionCode:Ljava/lang/String;

    .line 22
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->versionCode:Ljava/lang/String;

    .line 26
    iput-object p2, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->versionName:Ljava/lang/String;

    .line 27
    iput-object p3, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->manifestVersionCode:Ljava/lang/String;

    .line 28
    iput-object p4, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->updateVersionCode:Ljava/lang/String;

    .line 29
    return-void
.end method

.method private static hashCode(Ljava/lang/Object;)I
    .locals 0

    .line 50
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 33
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 34
    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 35
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_2

    return v1

    .line 36
    :cond_2
    check-cast p1, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;

    .line 38
    iget-object v2, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->versionCode:Ljava/lang/String;

    iget-object v3, p1, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->versionCode:Ljava/lang/String;

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->versionName:Ljava/lang/String;

    iget-object v3, p1, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->versionName:Ljava/lang/String;

    .line 39
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->manifestVersionCode:Ljava/lang/String;

    iget-object v3, p1, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->manifestVersionCode:Ljava/lang/String;

    .line 40
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->updateVersionCode:Ljava/lang/String;

    iget-object p1, p1, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->updateVersionCode:Ljava/lang/String;

    .line 41
    invoke-static {v2, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    .line 38
    :cond_3
    move v0, v1

    :goto_0
    return v0
.end method

.method public hashCode()I
    .locals 2

    .line 46
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->versionCode:Ljava/lang/String;

    invoke-static {v0}, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->hashCode(Ljava/lang/Object;)I

    move-result v0

    iget-object v1, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->versionName:Ljava/lang/String;

    invoke-static {v1}, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->hashCode(Ljava/lang/Object;)I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->manifestVersionCode:Ljava/lang/String;

    invoke-static {v1}, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->hashCode(Ljava/lang/Object;)I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->updateVersionCode:Ljava/lang/String;

    invoke-static {v1}, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->hashCode(Ljava/lang/Object;)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method
