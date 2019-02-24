.class public abstract Landroid/support/v4/provider/DocumentFile;
.super Ljava/lang/Object;
.source "DocumentFile.java"


# static fields
.field static final TAG:Ljava/lang/String; = "DocumentFile"


# instance fields
.field private final mParent:Landroid/support/v4/provider/DocumentFile;


# direct methods
.method constructor <init>(Landroid/support/v4/provider/DocumentFile;)V
    .registers 2
    .param p1, "parent"    # Landroid/support/v4/provider/DocumentFile;

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    iput-object p1, p0, Landroid/support/v4/provider/DocumentFile;->mParent:Landroid/support/v4/provider/DocumentFile;

    .line 85
    return-void
.end method

.method public static fromFile(Ljava/io/File;)Landroid/support/v4/provider/DocumentFile;
    .registers 3
    .param p0, "file"    # Ljava/io/File;

    .line 96
    new-instance v0, Landroid/support/v4/provider/RawDocumentFile;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p0}, Landroid/support/v4/provider/RawDocumentFile;-><init>(Landroid/support/v4/provider/DocumentFile;Ljava/io/File;)V

    return-object v0
.end method

.method public static fromSingleUri(Landroid/content/Context;Landroid/net/Uri;)Landroid/support/v4/provider/DocumentFile;
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "singleUri"    # Landroid/net/Uri;

    .line 110
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 111
    .local v0, "version":I
    const/4 v1, 0x0

    const/16 v2, 0x13

    if-lt v0, v2, :cond_d

    .line 112
    new-instance v2, Landroid/support/v4/provider/SingleDocumentFile;

    invoke-direct {v2, v1, p0, p1}, Landroid/support/v4/provider/SingleDocumentFile;-><init>(Landroid/support/v4/provider/DocumentFile;Landroid/content/Context;Landroid/net/Uri;)V

    return-object v2

    .line 114
    :cond_d
    return-object v1
.end method

.method public static fromTreeUri(Landroid/content/Context;Landroid/net/Uri;)Landroid/support/v4/provider/DocumentFile;
    .registers 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "treeUri"    # Landroid/net/Uri;

    .line 128
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 129
    .local v0, "version":I
    const/4 v1, 0x0

    const/16 v2, 0x15

    if-lt v0, v2, :cond_11

    .line 130
    new-instance v2, Landroid/support/v4/provider/TreeDocumentFile;

    invoke-static {p1}, Landroid/support/v4/provider/DocumentsContractApi21;->prepareTreeUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v2, v1, p0, v3}, Landroid/support/v4/provider/TreeDocumentFile;-><init>(Landroid/support/v4/provider/DocumentFile;Landroid/content/Context;Landroid/net/Uri;)V

    return-object v2

    .line 133
    :cond_11
    return-object v1
.end method

.method public static isDocumentUri(Landroid/content/Context;Landroid/net/Uri;)Z
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "uri"    # Landroid/net/Uri;

    .line 142
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 143
    .local v0, "version":I
    const/16 v1, 0x13

    if-lt v0, v1, :cond_b

    .line 144
    invoke-static {p0, p1}, Landroid/support/v4/provider/DocumentsContractApi19;->isDocumentUri(Landroid/content/Context;Landroid/net/Uri;)Z

    move-result v1

    return v1

    .line 146
    :cond_b
    const/4 v1, 0x0

    return v1
.end method


# virtual methods
.method public abstract canRead()Z
.end method

.method public abstract canWrite()Z
.end method

.method public abstract createDirectory(Ljava/lang/String;)Landroid/support/v4/provider/DocumentFile;
.end method

.method public abstract createFile(Ljava/lang/String;Ljava/lang/String;)Landroid/support/v4/provider/DocumentFile;
.end method

.method public abstract delete()Z
.end method

.method public abstract exists()Z
.end method

.method public findFile(Ljava/lang/String;)Landroid/support/v4/provider/DocumentFile;
    .registers 7
    .param p1, "displayName"    # Ljava/lang/String;

    .line 316
    invoke-virtual {p0}, Landroid/support/v4/provider/DocumentFile;->listFiles()[Landroid/support/v4/provider/DocumentFile;

    move-result-object v0

    .local v0, "arr$":[Landroid/support/v4/provider/DocumentFile;
    array-length v1, v0

    .local v1, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_6
    if-ge v2, v1, :cond_18

    aget-object v3, v0, v2

    .line 317
    .local v3, "doc":Landroid/support/v4/provider/DocumentFile;
    invoke-virtual {v3}, Landroid/support/v4/provider/DocumentFile;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_15

    .line 318
    return-object v3

    .line 316
    .end local v3    # "doc":Landroid/support/v4/provider/DocumentFile;
    :cond_15
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 321
    .end local v0    # "arr$":[Landroid/support/v4/provider/DocumentFile;
    .end local v1    # "len$":I
    .end local v2    # "i$":I
    :cond_18
    const/4 v0, 0x0

    return-object v0
.end method

.method public abstract getName()Ljava/lang/String;
.end method

.method public getParentFile()Landroid/support/v4/provider/DocumentFile;
    .registers 2

    .line 217
    iget-object v0, p0, Landroid/support/v4/provider/DocumentFile;->mParent:Landroid/support/v4/provider/DocumentFile;

    return-object v0
.end method

.method public abstract getType()Ljava/lang/String;
.end method

.method public abstract getUri()Landroid/net/Uri;
.end method

.method public abstract isDirectory()Z
.end method

.method public abstract isFile()Z
.end method

.method public abstract lastModified()J
.end method

.method public abstract length()J
.end method

.method public abstract listFiles()[Landroid/support/v4/provider/DocumentFile;
.end method

.method public abstract renameTo(Ljava/lang/String;)Z
.end method
