.class public Lcom/ss/android/ugc/effectmanager/common/EffectRequest;
.super Ljava/lang/Object;
.source "EffectRequest.java"


# static fields
.field public static final DEFAULT_PARAMS_ENCODING:Ljava/lang/String; = "UTF-8"


# instance fields
.field protected isCancel:Z

.field private mBodyParams:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private mContentType:Ljava/lang/String;

.field private mHeaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field mHttpMethod:Ljava/lang/String;

.field private mUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/common/EffectRequest;->isCancel:Z

    .line 19
    const-string v0, ""

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/common/EffectRequest;->mUrl:Ljava/lang/String;

    .line 21
    const-string v0, "GET"

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/common/EffectRequest;->mHttpMethod:Ljava/lang/String;

    .line 23
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/common/EffectRequest;->mHeaders:Ljava/util/Map;

    .line 25
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/common/EffectRequest;->mBodyParams:Ljava/util/Map;

    .line 26
    const-string v0, "application/x-www-form-urlencoded"

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/common/EffectRequest;->mContentType:Ljava/lang/String;

    .line 37
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/common/EffectRequest;->mHttpMethod:Ljava/lang/String;

    .line 38
    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/common/EffectRequest;->mUrl:Ljava/lang/String;

    .line 39
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .line 75
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/common/EffectRequest;->isCancel:Z

    .line 76
    return-void
.end method

.method public getBodyContentType()Ljava/lang/String;
    .locals 2

    .line 51
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "application/x-www-form-urlencoded; charset="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/common/EffectRequest;->getParamsEncoding()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getContentType()Ljava/lang/String;
    .locals 1

    .line 29
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/common/EffectRequest;->mContentType:Ljava/lang/String;

    return-object v0
.end method

.method public getHeaders()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 59
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/common/EffectRequest;->mHeaders:Ljava/util/Map;

    return-object v0
.end method

.method public getHttpMethod()Ljava/lang/String;
    .locals 1

    .line 55
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/common/EffectRequest;->mHttpMethod:Ljava/lang/String;

    return-object v0
.end method

.method public getParams()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 63
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/common/EffectRequest;->mBodyParams:Ljava/util/Map;

    return-object v0
.end method

.method protected getParamsEncoding()Ljava/lang/String;
    .locals 1

    .line 47
    const-string v0, "UTF-8"

    return-object v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/common/EffectRequest;->mUrl:Ljava/lang/String;

    return-object v0
.end method

.method public isCanceled()Z
    .locals 1

    .line 79
    iget-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/common/EffectRequest;->isCancel:Z

    return v0
.end method

.method public setBodyParams(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 71
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/common/EffectRequest;->mBodyParams:Ljava/util/Map;

    .line 72
    return-void
.end method

.method public setContentType(Ljava/lang/String;)V
    .locals 0

    .line 33
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/common/EffectRequest;->mContentType:Ljava/lang/String;

    .line 34
    return-void
.end method

.method public setHeaders(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 67
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/common/EffectRequest;->mHeaders:Ljava/util/Map;

    .line 68
    return-void
.end method
