.class Landroid/support/v4/provider/RawDocumentFile;
.super Landroid/support/v4/provider/DocumentFile;
.source "RawDocumentFile.java"


# instance fields
.field private mFile:Ljava/io/File;


# direct methods
.method constructor <init>(Landroid/support/v4/provider/DocumentFile;Ljava/io/File;)V
    .registers 3
    .param p1, "parent"    # Landroid/support/v4/provider/DocumentFile;
    .param p2, "file"    # Ljava/io/File;

    .line 31
    invoke-direct {p0, p1}, Landroid/support/v4/provider/DocumentFile;-><init>(Landroid/support/v4/provider/DocumentFile;)V

    .line 32
    iput-object p2, p0, Landroid/support/v4/provider/RawDocumentFile;->mFile:Ljava/io/File;

    .line 33
    return-void
.end method

.method private static deleteContents(Ljava/io/File;)Z
    .registers 10
    .param p0, "dir"    # Ljava/io/File;

    .line 159
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .line 160
    .local v0, "files":[Ljava/io/File;
    const/4 v1, 0x1

    .line 161
    .local v1, "success":Z
    if-eqz v0, :cond_39

    .line 162
    move-object v2, v0

    .local v2, "arr$":[Ljava/io/File;
    array-length v3, v2

    .local v3, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_a
    if-ge v4, v3, :cond_39

    aget-object v5, v2, v4

    .line 163
    .local v5, "file":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_19

    .line 164
    invoke-static {v5}, Landroid/support/v4/provider/RawDocumentFile;->deleteContents(Ljava/io/File;)Z

    move-result v6

    and-int/2addr v1, v6

    .line 166
    :cond_19
    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    move-result v6

    if-nez v6, :cond_36

    .line 167
    const-string v6, "DocumentFile"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Failed to delete "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    const/4 v1, 0x0

    .line 162
    .end local v5    # "file":Ljava/io/File;
    :cond_36
    add-int/lit8 v4, v4, 0x1

    goto :goto_a

    .line 172
    .end local v2    # "arr$":[Ljava/io/File;
    .end local v3    # "len$":I
    .end local v4    # "i$":I
    :cond_39
    return v1
.end method

.method private static getTypeForName(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "name"    # Ljava/lang/String;

    .line 146
    const/16 v0, 0x2e

    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 147
    .local v0, "lastDot":I
    if-ltz v0, :cond_1d

    .line 148
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    .line 149
    .local v1, "extension":Ljava/lang/String;
    invoke-static {}, Landroid/webkit/MimeTypeMap;->getSingleton()Landroid/webkit/MimeTypeMap;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/webkit/MimeTypeMap;->getMimeTypeFromExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 150
    .local v2, "mime":Ljava/lang/String;
    if-eqz v2, :cond_1d

    .line 151
    return-object v2

    .line 155
    .end local v1    # "extension":Ljava/lang/String;
    .end local v2    # "mime":Ljava/lang/String;
    :cond_1d
    const-string v1, "application/octet-stream"

    return-object v1
.end method


# virtual methods
.method public canRead()Z
    .registers 2

    .line 103
    iget-object v0, p0, Landroid/support/v4/provider/RawDocumentFile;->mFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->canRead()Z

    move-result v0

    return v0
.end method

.method public canWrite()Z
    .registers 2

    .line 108
    iget-object v0, p0, Landroid/support/v4/provider/RawDocumentFile;->mFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->canWrite()Z

    move-result v0

    return v0
.end method

.method public createDirectory(Ljava/lang/String;)Landroid/support/v4/provider/DocumentFile;
    .registers 4
    .param p1, "displayName"    # Ljava/lang/String;

    .line 54
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Landroid/support/v4/provider/RawDocumentFile;->mFile:Ljava/io/File;

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 55
    .local v0, "target":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-nez v1, :cond_16

    invoke-virtual {v0}, Ljava/io/File;->mkdir()Z

    move-result v1

    if-eqz v1, :cond_14

    goto :goto_16

    .line 58
    :cond_14
    const/4 v1, 0x0

    return-object v1

    .line 56
    :cond_16
    :goto_16
    new-instance v1, Landroid/support/v4/provider/RawDocumentFile;

    invoke-direct {v1, p0, v0}, Landroid/support/v4/provider/RawDocumentFile;-><init>(Landroid/support/v4/provider/DocumentFile;Ljava/io/File;)V

    return-object v1
.end method

.method public createFile(Ljava/lang/String;Ljava/lang/String;)Landroid/support/v4/provider/DocumentFile;
    .registers 9
    .param p1, "mimeType"    # Ljava/lang/String;
    .param p2, "displayName"    # Ljava/lang/String;

    .line 38
    invoke-static {}, Landroid/webkit/MimeTypeMap;->getSingleton()Landroid/webkit/MimeTypeMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/webkit/MimeTypeMap;->getExtensionFromMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 39
    .local v0, "extension":Ljava/lang/String;
    if-eqz v0, :cond_1e

    .line 40
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 42
    :cond_1e
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Landroid/support/v4/provider/RawDocumentFile;->mFile:Ljava/io/File;

    invoke-direct {v1, v2, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 44
    .local v1, "target":Ljava/io/File;
    :try_start_25
    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z

    .line 45
    new-instance v2, Landroid/support/v4/provider/RawDocumentFile;

    invoke-direct {v2, p0, v1}, Landroid/support/v4/provider/RawDocumentFile;-><init>(Landroid/support/v4/provider/DocumentFile;Ljava/io/File;)V
    :try_end_2d
    .catch Ljava/io/IOException; {:try_start_25 .. :try_end_2d} :catch_2e

    return-object v2

    .line 46
    :catch_2e
    move-exception v2

    .line 47
    .local v2, "e":Ljava/io/IOException;
    const-string v3, "DocumentFile"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed to createFile: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    const/4 v3, 0x0

    return-object v3
.end method

.method public delete()Z
    .registers 2

    .line 113
    iget-object v0, p0, Landroid/support/v4/provider/RawDocumentFile;->mFile:Ljava/io/File;

    invoke-static {v0}, Landroid/support/v4/provider/RawDocumentFile;->deleteContents(Ljava/io/File;)Z

    .line 114
    iget-object v0, p0, Landroid/support/v4/provider/RawDocumentFile;->mFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v0

    return v0
.end method

.method public exists()Z
    .registers 2

    .line 119
    iget-object v0, p0, Landroid/support/v4/provider/RawDocumentFile;->mFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    return v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .line 69
    iget-object v0, p0, Landroid/support/v4/provider/RawDocumentFile;->mFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .registers 2

    .line 74
    iget-object v0, p0, Landroid/support/v4/provider/RawDocumentFile;->mFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 75
    const/4 v0, 0x0

    return-object v0

    .line 77
    :cond_a
    iget-object v0, p0, Landroid/support/v4/provider/RawDocumentFile;->mFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/provider/RawDocumentFile;->getTypeForName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUri()Landroid/net/Uri;
    .registers 2

    .line 64
    iget-object v0, p0, Landroid/support/v4/provider/RawDocumentFile;->mFile:Ljava/io/File;

    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public isDirectory()Z
    .registers 2

    .line 83
    iget-object v0, p0, Landroid/support/v4/provider/RawDocumentFile;->mFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    return v0
.end method

.method public isFile()Z
    .registers 2

    .line 88
    iget-object v0, p0, Landroid/support/v4/provider/RawDocumentFile;->mFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v0

    return v0
.end method

.method public lastModified()J
    .registers 3

    .line 93
    iget-object v0, p0, Landroid/support/v4/provider/RawDocumentFile;->mFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    return-wide v0
.end method

.method public length()J
    .registers 3

    .line 98
    iget-object v0, p0, Landroid/support/v4/provider/RawDocumentFile;->mFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    return-wide v0
.end method

.method public listFiles()[Landroid/support/v4/provider/DocumentFile;
    .registers 8

    .line 124
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 125
    .local v0, "results":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/support/v4/provider/DocumentFile;>;"
    iget-object v1, p0, Landroid/support/v4/provider/RawDocumentFile;->mFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 126
    .local v1, "files":[Ljava/io/File;
    if-eqz v1, :cond_1f

    .line 127
    move-object v2, v1

    .local v2, "arr$":[Ljava/io/File;
    array-length v3, v2

    .local v3, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_10
    if-ge v4, v3, :cond_1f

    aget-object v5, v2, v4

    .line 128
    .local v5, "file":Ljava/io/File;
    new-instance v6, Landroid/support/v4/provider/RawDocumentFile;

    invoke-direct {v6, p0, v5}, Landroid/support/v4/provider/RawDocumentFile;-><init>(Landroid/support/v4/provider/DocumentFile;Ljava/io/File;)V

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 127
    .end local v5    # "file":Ljava/io/File;
    add-int/lit8 v4, v4, 0x1

    goto :goto_10

    .line 131
    .end local v2    # "arr$":[Ljava/io/File;
    .end local v3    # "len$":I
    .end local v4    # "i$":I
    :cond_1f
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-array v2, v2, [Landroid/support/v4/provider/DocumentFile;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Landroid/support/v4/provider/DocumentFile;

    return-object v2
.end method

.method public renameTo(Ljava/lang/String;)Z
    .registers 4
    .param p1, "displayName"    # Ljava/lang/String;

    .line 136
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Landroid/support/v4/provider/RawDocumentFile;->mFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 137
    .local v0, "target":Ljava/io/File;
    iget-object v1, p0, Landroid/support/v4/provider/RawDocumentFile;->mFile:Ljava/io/File;

    invoke-virtual {v1, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v1

    if-eqz v1, :cond_17

    .line 138
    iput-object v0, p0, Landroid/support/v4/provider/RawDocumentFile;->mFile:Ljava/io/File;

    .line 139
    const/4 v1, 0x1

    return v1

    .line 141
    :cond_17
    const/4 v1, 0x0

    return v1
.end method
