.class public final Lcom/android/camera/network/download/Request;
.super Ljava/lang/Object;
.source "Request.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/network/download/Request$Constants;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Request"


# instance fields
.field private mAllowedOverMetered:Z

.field private mDestination:Ljava/io/File;

.field private mMaxRetryTimes:I

.field private mTag:Ljava/lang/String;

.field private mUri:Landroid/net/Uri;

.field private mVerifier:Lcom/android/camera/network/download/Verifier;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/net/Uri;Ljava/io/File;)V
    .locals 1

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    const/4 v0, 0x3

    iput v0, p0, Lcom/android/camera/network/download/Request;->mMaxRetryTimes:I

    .line 24
    iput-object p1, p0, Lcom/android/camera/network/download/Request;->mTag:Ljava/lang/String;

    .line 25
    iput-object p2, p0, Lcom/android/camera/network/download/Request;->mUri:Landroid/net/Uri;

    .line 26
    invoke-virtual {p2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p1

    .line 27
    const-string p2, "http"

    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_1

    const-string p2, "https"

    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_0

    goto :goto_0

    .line 28
    :cond_0
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "not support scheme: "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 31
    :cond_1
    :goto_0
    invoke-virtual {p3}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 32
    invoke-virtual {p3}, Ljava/io/File;->isDirectory()Z

    move-result p1

    if-nez p1, :cond_2

    .line 36
    const-string p1, "Request"

    const-string p2, "output file will be overwritten"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 33
    :cond_2
    const-string p1, "Request"

    const-string p2, "output file is a directory"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "dst file exists, is a directory"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 39
    :cond_3
    :goto_1
    iput-object p3, p0, Lcom/android/camera/network/download/Request;->mDestination:Ljava/io/File;

    .line 40
    return-void
.end method


# virtual methods
.method public getDestination()Ljava/io/File;
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/android/camera/network/download/Request;->mDestination:Ljava/io/File;

    return-object v0
.end method

.method public getMaxRetryTimes()I
    .locals 1

    .line 71
    iget v0, p0, Lcom/android/camera/network/download/Request;->mMaxRetryTimes:I

    return v0
.end method

.method getNetworkType()I
    .locals 1

    .line 79
    iget-boolean v0, p0, Lcom/android/camera/network/download/Request;->mAllowedOverMetered:Z

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public getTag()Ljava/lang/String;
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/android/camera/network/download/Request;->mTag:Ljava/lang/String;

    return-object v0
.end method

.method public getUri()Landroid/net/Uri;
    .locals 1

    .line 47
    iget-object v0, p0, Lcom/android/camera/network/download/Request;->mUri:Landroid/net/Uri;

    return-object v0
.end method

.method public getVerifier()Lcom/android/camera/network/download/Verifier;
    .locals 1

    .line 63
    iget-object v0, p0, Lcom/android/camera/network/download/Request;->mVerifier:Lcom/android/camera/network/download/Verifier;

    return-object v0
.end method

.method public isAllowedOverMetered()Z
    .locals 1

    .line 55
    iget-boolean v0, p0, Lcom/android/camera/network/download/Request;->mAllowedOverMetered:Z

    return v0
.end method

.method public setAllowedOverMetered(Z)V
    .locals 0

    .line 59
    iput-boolean p1, p0, Lcom/android/camera/network/download/Request;->mAllowedOverMetered:Z

    .line 60
    return-void
.end method

.method public setMaxRetryTimes(I)V
    .locals 0

    .line 75
    iput p1, p0, Lcom/android/camera/network/download/Request;->mMaxRetryTimes:I

    .line 76
    return-void
.end method

.method public setVerifier(Lcom/android/camera/network/download/Verifier;)V
    .locals 0

    .line 67
    iput-object p1, p0, Lcom/android/camera/network/download/Request;->mVerifier:Lcom/android/camera/network/download/Verifier;

    .line 68
    return-void
.end method
