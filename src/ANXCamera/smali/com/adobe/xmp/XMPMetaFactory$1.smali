.class final Lcom/adobe/xmp/XMPMetaFactory$1;
.super Ljava/lang/Object;
.source "XMPMetaFactory.java"

# interfaces
.implements Lcom/adobe/xmp/XMPVersionInfo;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/xmp/XMPMetaFactory;->getVersionInfo()Lcom/adobe/xmp/XMPVersionInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 274
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getBuild()I
    .locals 1

    .line 297
    const/4 v0, 0x3

    return v0
.end method

.method public getMajor()I
    .locals 1

    .line 277
    const/4 v0, 0x5

    return v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    .line 302
    const-string v0, "Adobe XMP Core 5.1.0-jc003"

    return-object v0
.end method

.method public getMicro()I
    .locals 1

    .line 287
    const/4 v0, 0x0

    return v0
.end method

.method public getMinor()I
    .locals 1

    .line 282
    const/4 v0, 0x1

    return v0
.end method

.method public isDebug()Z
    .locals 1

    .line 292
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 307
    const-string v0, "Adobe XMP Core 5.1.0-jc003"

    return-object v0
.end method
