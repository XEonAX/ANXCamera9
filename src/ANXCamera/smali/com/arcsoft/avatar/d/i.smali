.class public Lcom/arcsoft/avatar/d/i;
.super Ljava/lang/Object;
.source "MediaUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/arcsoft/avatar/d/i$a;,
        Lcom/arcsoft/avatar/d/i$b;
    }
.end annotation


# static fields
.field public static final EXTERNAL_CONTENT_URI:Landroid/net/Uri;

.field public static final ID_COLUMN_INDEX:I = 0x0

.field public static final TYPE_VIDEO:I = 0x3

.field public static final URI_COLUMN_INDEX:I = 0x4

.field private static final a:Ljava/lang/String;

.field public static final eT:Ljava/lang/String;

.field public static final eU:I = 0x1

.field public static final eV:I = 0x1

.field public static final eW:I = 0x2

.field public static final eX:I = 0x3

.field public static final eY:I = 0x5

.field public static final eZ:I = 0x6

.field public static final fa:I = 0x7

.field public static final fb:I = 0x8

.field public static final fc:I = 0x9

.field public static final fd:I = 0xa

.field public static final fe:I = 0xb

.field public static final ff:I = 0xc

.field public static final fg:I = 0xd

.field public static final fh:I = 0xe

.field private static fi:Lcom/arcsoft/avatar/d/i;

.field private static final fn:[Ljava/lang/String;


# instance fields
.field private final e:Ljava/lang/String;

.field private final ep:Ljava/lang/String;

.field private final f:Ljava/lang/String;

.field private fj:Landroid/content/Context;

.field private fk:Landroid/content/ContentResolver;

.field private final fl:[Ljava/lang/String;

.field private final fm:[Ljava/lang/String;

.field private final g:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/DCIM/Avatar/Result"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/arcsoft/avatar/d/i;->a:Ljava/lang/String;

    sget-object v0, Lcom/arcsoft/avatar/d/i;->a:Ljava/lang/String;

    invoke-static {v0}, Lcom/arcsoft/avatar/d/i;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/arcsoft/avatar/d/i;->eT:Ljava/lang/String;

    const-string v0, "external"

    invoke-static {v0}, Landroid/provider/MediaStore$Files;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/arcsoft/avatar/d/i;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    const/4 v0, 0x0

    sput-object v0, Lcom/arcsoft/avatar/d/i;->fi:Lcom/arcsoft/avatar/d/i;

    const/16 v0, 0xf

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "max(_id) as newId"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string v1, "_data"

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const-string v1, "_size"

    const/4 v2, 0x2

    aput-object v1, v0, v2

    const-string v1, "datetaken"

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lcom/arcsoft/avatar/d/i$a;->e:Ljava/lang/String;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    const-string v1, "bucket_id"

    const/4 v2, 0x5

    aput-object v1, v0, v2

    const-string v1, "mime_type"

    const/4 v2, 0x6

    aput-object v1, v0, v2

    const-string v1, "date_modified"

    const/4 v2, 0x7

    aput-object v1, v0, v2

    const-string v1, "media_type"

    const/16 v2, 0x8

    aput-object v1, v0, v2

    const-string v1, "resolution"

    const/16 v2, 0x9

    aput-object v1, v0, v2

    const-string v1, "tags"

    const/16 v2, 0xa

    aput-object v1, v0, v2

    const-string v1, "width"

    const/16 v2, 0xb

    aput-object v1, v0, v2

    const-string v1, "height"

    const/16 v2, 0xc

    aput-object v1, v0, v2

    const-string v1, "orientation"

    const/16 v2, 0xd

    aput-object v1, v0, v2

    const-string v1, "duration"

    const/16 v2, 0xe

    aput-object v1, v0, v2

    sput-object v0, Lcom/arcsoft/avatar/d/i;->fn:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 18

    move-object/from16 v0, p0

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/arcsoft/avatar/d/i;->fj:Landroid/content/Context;

    iput-object v1, v0, Lcom/arcsoft/avatar/d/i;->fk:Landroid/content/ContentResolver;

    const-string v1, "image/jpeg"

    iput-object v1, v0, Lcom/arcsoft/avatar/d/i;->e:Ljava/lang/String;

    const-string v1, "image/gif"

    iput-object v1, v0, Lcom/arcsoft/avatar/d/i;->f:Ljava/lang/String;

    const-string v1, "video/3gpp"

    iput-object v1, v0, Lcom/arcsoft/avatar/d/i;->g:Ljava/lang/String;

    const-string v1, "video/mp4"

    iput-object v1, v0, Lcom/arcsoft/avatar/d/i;->ep:Ljava/lang/String;

    const-string v2, "_id"

    const-string v3, "bucket_id"

    const-string v4, "bucket_display_name"

    const-string v5, "_data"

    const-string v6, "_display_name"

    const-string v7, "width"

    const-string v8, "height"

    const-string v9, "_size"

    const-string v10, "mime_type"

    const-string v11, "datetaken"

    const-string v12, "date_modified"

    const-string v13, "date_added"

    const-string v14, "latitude"

    const-string v15, "longitude"

    const-string v16, "duration"

    const-string v17, "resolution"

    filled-new-array/range {v2 .. v17}, [Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/arcsoft/avatar/d/i;->fl:[Ljava/lang/String;

    const-string v2, "_id"

    const-string v3, "bucket_id"

    const-string v4, "bucket_display_name"

    const-string v5, "_data"

    const-string v6, "_display_name"

    const-string v7, "width"

    const-string v8, "height"

    const-string v9, "_size"

    const-string v10, "mime_type"

    const-string v11, "datetaken"

    const-string v12, "date_modified"

    const-string v13, "date_added"

    const-string v14, "latitude"

    const-string v15, "longitude"

    const-string v16, "orientation"

    filled-new-array/range {v2 .. v16}, [Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/arcsoft/avatar/d/i;->fm:[Ljava/lang/String;

    move-object/from16 v1, p1

    iput-object v1, v0, Lcom/arcsoft/avatar/d/i;->fj:Landroid/content/Context;

    iget-object v1, v0, Lcom/arcsoft/avatar/d/i;->fj:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iput-object v1, v0, Lcom/arcsoft/avatar/d/i;->fk:Landroid/content/ContentResolver;

    return-void
.end method

.method public static a(Landroid/content/ContentResolver;)Landroid/database/Cursor;
    .locals 6

    const-string v3, "(media_type=? or media_type=?) and bucket_id=? "

    const/4 v0, 0x3

    new-array v4, v0, [Ljava/lang/String;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    const/4 v5, 0x0

    aput-object v2, v4, v5

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v4, v1

    sget-object v0, Lcom/arcsoft/avatar/d/i;->eT:Ljava/lang/String;

    const/4 v1, 0x2

    aput-object v0, v4, v1

    sget-object v1, Lcom/arcsoft/avatar/d/i;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    sget-object v2, Lcom/arcsoft/avatar/d/i;->fn:[Ljava/lang/String;

    const-string v5, "_id DESC"

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    return-object p0
.end method

.method private static a(Landroid/database/Cursor;)Landroid/net/Uri;
    .locals 3

    const/4 v0, 0x4

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method private a(Landroid/database/Cursor;Z)Lcom/arcsoft/avatar/d/i$b;
    .locals 3

    if-eqz p1, :cond_2

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-gtz v0, :cond_0

    goto/16 :goto_1

    :cond_0
    new-instance v0, Lcom/arcsoft/avatar/d/i$b;

    invoke-direct {v0}, Lcom/arcsoft/avatar/d/i$b;-><init>()V

    invoke-static {v0, p2}, Lcom/arcsoft/avatar/d/i$b;->a(Lcom/arcsoft/avatar/d/i$b;Z)Z

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/arcsoft/avatar/d/i;->fl:[Ljava/lang/String;

    const-string v1, "_id"

    invoke-static {p2, v1}, Lcom/arcsoft/avatar/d/c;->b([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p2

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Lcom/arcsoft/avatar/d/i$b;->a(Lcom/arcsoft/avatar/d/i$b;J)J

    sget-object p2, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-static {v0}, Lcom/arcsoft/avatar/d/i$b;->a(Lcom/arcsoft/avatar/d/i$b;)J

    move-result-wide v1

    invoke-static {p2, v1, v2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/arcsoft/avatar/d/i$b;->a(Lcom/arcsoft/avatar/d/i$b;Landroid/net/Uri;)Landroid/net/Uri;

    iget-object p2, p0, Lcom/arcsoft/avatar/d/i;->fl:[Ljava/lang/String;

    const-string v1, "bucket_id"

    invoke-static {p2, v1}, Lcom/arcsoft/avatar/d/c;->b([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p2

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getInt(I)I

    move-result p2

    int-to-long v1, p2

    invoke-static {v0, v1, v2}, Lcom/arcsoft/avatar/d/i$b;->b(Lcom/arcsoft/avatar/d/i$b;J)J

    iget-object p2, p0, Lcom/arcsoft/avatar/d/i;->fl:[Ljava/lang/String;

    const-string v1, "bucket_display_name"

    invoke-static {p2, v1}, Lcom/arcsoft/avatar/d/c;->b([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p2

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/arcsoft/avatar/d/i$b;->a(Lcom/arcsoft/avatar/d/i$b;Ljava/lang/String;)Ljava/lang/String;

    iget-object p2, p0, Lcom/arcsoft/avatar/d/i;->fl:[Ljava/lang/String;

    const-string v1, "_data"

    invoke-static {p2, v1}, Lcom/arcsoft/avatar/d/c;->b([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p2

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/arcsoft/avatar/d/i$b;->b(Lcom/arcsoft/avatar/d/i$b;Ljava/lang/String;)Ljava/lang/String;

    iget-object p2, p0, Lcom/arcsoft/avatar/d/i;->fl:[Ljava/lang/String;

    const-string v1, "_display_name"

    invoke-static {p2, v1}, Lcom/arcsoft/avatar/d/c;->b([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p2

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/arcsoft/avatar/d/i$b;->c(Lcom/arcsoft/avatar/d/i$b;Ljava/lang/String;)Ljava/lang/String;

    iget-object p2, p0, Lcom/arcsoft/avatar/d/i;->fl:[Ljava/lang/String;

    const-string v1, "width"

    invoke-static {p2, v1}, Lcom/arcsoft/avatar/d/c;->b([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p2

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getInt(I)I

    move-result p2

    invoke-static {v0, p2}, Lcom/arcsoft/avatar/d/i$b;->a(Lcom/arcsoft/avatar/d/i$b;I)I

    iget-object p2, p0, Lcom/arcsoft/avatar/d/i;->fl:[Ljava/lang/String;

    const-string v1, "height"

    invoke-static {p2, v1}, Lcom/arcsoft/avatar/d/c;->b([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p2

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getInt(I)I

    move-result p2

    invoke-static {v0, p2}, Lcom/arcsoft/avatar/d/i$b;->b(Lcom/arcsoft/avatar/d/i$b;I)I

    iget-object p2, p0, Lcom/arcsoft/avatar/d/i;->fl:[Ljava/lang/String;

    const-string v1, "_size"

    invoke-static {p2, v1}, Lcom/arcsoft/avatar/d/c;->b([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p2

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Lcom/arcsoft/avatar/d/i$b;->c(Lcom/arcsoft/avatar/d/i$b;J)J

    iget-object p2, p0, Lcom/arcsoft/avatar/d/i;->fl:[Ljava/lang/String;

    const-string v1, "mime_type"

    invoke-static {p2, v1}, Lcom/arcsoft/avatar/d/c;->b([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p2

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/arcsoft/avatar/d/i$b;->d(Lcom/arcsoft/avatar/d/i$b;Ljava/lang/String;)Ljava/lang/String;

    iget-object p2, p0, Lcom/arcsoft/avatar/d/i;->fl:[Ljava/lang/String;

    const-string v1, "datetaken"

    invoke-static {p2, v1}, Lcom/arcsoft/avatar/d/c;->b([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p2

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/arcsoft/avatar/d/i$b;->e(Lcom/arcsoft/avatar/d/i$b;Ljava/lang/String;)Ljava/lang/String;

    iget-object p2, p0, Lcom/arcsoft/avatar/d/i;->fl:[Ljava/lang/String;

    const-string v1, "date_modified"

    invoke-static {p2, v1}, Lcom/arcsoft/avatar/d/c;->b([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p2

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/arcsoft/avatar/d/i$b;->f(Lcom/arcsoft/avatar/d/i$b;Ljava/lang/String;)Ljava/lang/String;

    iget-object p2, p0, Lcom/arcsoft/avatar/d/i;->fl:[Ljava/lang/String;

    const-string v1, "date_added"

    invoke-static {p2, v1}, Lcom/arcsoft/avatar/d/c;->b([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p2

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/arcsoft/avatar/d/i$b;->g(Lcom/arcsoft/avatar/d/i$b;Ljava/lang/String;)Ljava/lang/String;

    iget-object p2, p0, Lcom/arcsoft/avatar/d/i;->fl:[Ljava/lang/String;

    const-string v1, "latitude"

    invoke-static {p2, v1}, Lcom/arcsoft/avatar/d/c;->b([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p2

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v1

    invoke-static {v0, v1, v2}, Lcom/arcsoft/avatar/d/i$b;->a(Lcom/arcsoft/avatar/d/i$b;D)D

    iget-object p2, p0, Lcom/arcsoft/avatar/d/i;->fl:[Ljava/lang/String;

    const-string v1, "longitude"

    invoke-static {p2, v1}, Lcom/arcsoft/avatar/d/c;->b([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p2

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v1

    invoke-static {v0, v1, v2}, Lcom/arcsoft/avatar/d/i$b;->b(Lcom/arcsoft/avatar/d/i$b;D)D

    iget-object p2, p0, Lcom/arcsoft/avatar/d/i;->fl:[Ljava/lang/String;

    const-string v1, "duration"

    invoke-static {p2, v1}, Lcom/arcsoft/avatar/d/c;->b([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p2

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Lcom/arcsoft/avatar/d/i$b;->d(Lcom/arcsoft/avatar/d/i$b;J)J

    iget-object p2, p0, Lcom/arcsoft/avatar/d/i;->fl:[Ljava/lang/String;

    const-string v1, "resolution"

    invoke-static {p2, v1}, Lcom/arcsoft/avatar/d/c;->b([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p2

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/arcsoft/avatar/d/i$b;->h(Lcom/arcsoft/avatar/d/i$b;Ljava/lang/String;)Ljava/lang/String;

    goto/16 :goto_0

    :cond_1
    iget-object p2, p0, Lcom/arcsoft/avatar/d/i;->fm:[Ljava/lang/String;

    const-string v1, "_id"

    invoke-static {p2, v1}, Lcom/arcsoft/avatar/d/c;->b([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p2

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Lcom/arcsoft/avatar/d/i$b;->a(Lcom/arcsoft/avatar/d/i$b;J)J

    sget-object p2, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-static {v0}, Lcom/arcsoft/avatar/d/i$b;->a(Lcom/arcsoft/avatar/d/i$b;)J

    move-result-wide v1

    invoke-static {p2, v1, v2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/arcsoft/avatar/d/i$b;->a(Lcom/arcsoft/avatar/d/i$b;Landroid/net/Uri;)Landroid/net/Uri;

    iget-object p2, p0, Lcom/arcsoft/avatar/d/i;->fm:[Ljava/lang/String;

    const-string v1, "bucket_id"

    invoke-static {p2, v1}, Lcom/arcsoft/avatar/d/c;->b([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p2

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getInt(I)I

    move-result p2

    int-to-long v1, p2

    invoke-static {v0, v1, v2}, Lcom/arcsoft/avatar/d/i$b;->b(Lcom/arcsoft/avatar/d/i$b;J)J

    iget-object p2, p0, Lcom/arcsoft/avatar/d/i;->fm:[Ljava/lang/String;

    const-string v1, "bucket_display_name"

    invoke-static {p2, v1}, Lcom/arcsoft/avatar/d/c;->b([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p2

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/arcsoft/avatar/d/i$b;->a(Lcom/arcsoft/avatar/d/i$b;Ljava/lang/String;)Ljava/lang/String;

    iget-object p2, p0, Lcom/arcsoft/avatar/d/i;->fm:[Ljava/lang/String;

    const-string v1, "_data"

    invoke-static {p2, v1}, Lcom/arcsoft/avatar/d/c;->b([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p2

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/arcsoft/avatar/d/i$b;->b(Lcom/arcsoft/avatar/d/i$b;Ljava/lang/String;)Ljava/lang/String;

    iget-object p2, p0, Lcom/arcsoft/avatar/d/i;->fm:[Ljava/lang/String;

    const-string v1, "_display_name"

    invoke-static {p2, v1}, Lcom/arcsoft/avatar/d/c;->b([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p2

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/arcsoft/avatar/d/i$b;->c(Lcom/arcsoft/avatar/d/i$b;Ljava/lang/String;)Ljava/lang/String;

    iget-object p2, p0, Lcom/arcsoft/avatar/d/i;->fm:[Ljava/lang/String;

    const-string v1, "width"

    invoke-static {p2, v1}, Lcom/arcsoft/avatar/d/c;->b([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p2

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getInt(I)I

    move-result p2

    invoke-static {v0, p2}, Lcom/arcsoft/avatar/d/i$b;->a(Lcom/arcsoft/avatar/d/i$b;I)I

    iget-object p2, p0, Lcom/arcsoft/avatar/d/i;->fm:[Ljava/lang/String;

    const-string v1, "height"

    invoke-static {p2, v1}, Lcom/arcsoft/avatar/d/c;->b([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p2

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getInt(I)I

    move-result p2

    invoke-static {v0, p2}, Lcom/arcsoft/avatar/d/i$b;->b(Lcom/arcsoft/avatar/d/i$b;I)I

    iget-object p2, p0, Lcom/arcsoft/avatar/d/i;->fm:[Ljava/lang/String;

    const-string v1, "_size"

    invoke-static {p2, v1}, Lcom/arcsoft/avatar/d/c;->b([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p2

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Lcom/arcsoft/avatar/d/i$b;->c(Lcom/arcsoft/avatar/d/i$b;J)J

    iget-object p2, p0, Lcom/arcsoft/avatar/d/i;->fm:[Ljava/lang/String;

    const-string v1, "mime_type"

    invoke-static {p2, v1}, Lcom/arcsoft/avatar/d/c;->b([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p2

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/arcsoft/avatar/d/i$b;->d(Lcom/arcsoft/avatar/d/i$b;Ljava/lang/String;)Ljava/lang/String;

    iget-object p2, p0, Lcom/arcsoft/avatar/d/i;->fm:[Ljava/lang/String;

    const-string v1, "datetaken"

    invoke-static {p2, v1}, Lcom/arcsoft/avatar/d/c;->b([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p2

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/arcsoft/avatar/d/i$b;->e(Lcom/arcsoft/avatar/d/i$b;Ljava/lang/String;)Ljava/lang/String;

    iget-object p2, p0, Lcom/arcsoft/avatar/d/i;->fm:[Ljava/lang/String;

    const-string v1, "date_modified"

    invoke-static {p2, v1}, Lcom/arcsoft/avatar/d/c;->b([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p2

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/arcsoft/avatar/d/i$b;->f(Lcom/arcsoft/avatar/d/i$b;Ljava/lang/String;)Ljava/lang/String;

    iget-object p2, p0, Lcom/arcsoft/avatar/d/i;->fm:[Ljava/lang/String;

    const-string v1, "date_added"

    invoke-static {p2, v1}, Lcom/arcsoft/avatar/d/c;->b([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p2

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/arcsoft/avatar/d/i$b;->g(Lcom/arcsoft/avatar/d/i$b;Ljava/lang/String;)Ljava/lang/String;

    iget-object p2, p0, Lcom/arcsoft/avatar/d/i;->fm:[Ljava/lang/String;

    const-string v1, "latitude"

    invoke-static {p2, v1}, Lcom/arcsoft/avatar/d/c;->b([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p2

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v1

    invoke-static {v0, v1, v2}, Lcom/arcsoft/avatar/d/i$b;->a(Lcom/arcsoft/avatar/d/i$b;D)D

    iget-object p2, p0, Lcom/arcsoft/avatar/d/i;->fm:[Ljava/lang/String;

    const-string v1, "longitude"

    invoke-static {p2, v1}, Lcom/arcsoft/avatar/d/c;->b([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p2

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v1

    invoke-static {v0, v1, v2}, Lcom/arcsoft/avatar/d/i$b;->b(Lcom/arcsoft/avatar/d/i$b;D)D

    iget-object p2, p0, Lcom/arcsoft/avatar/d/i;->fm:[Ljava/lang/String;

    const-string v1, "orientation"

    invoke-static {p2, v1}, Lcom/arcsoft/avatar/d/c;->b([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p2

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getInt(I)I

    move-result p1

    invoke-static {v0, p1}, Lcom/arcsoft/avatar/d/i$b;->c(Lcom/arcsoft/avatar/d/i$b;I)I

    :goto_0
    return-object v0

    :cond_2
    :goto_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public static a(Landroid/content/Context;)Lcom/arcsoft/avatar/d/i;
    .locals 2

    sget-object v0, Lcom/arcsoft/avatar/d/i;->fi:Lcom/arcsoft/avatar/d/i;

    if-nez v0, :cond_1

    const-class v0, Lcom/arcsoft/avatar/d/i;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/arcsoft/avatar/d/i;->fi:Lcom/arcsoft/avatar/d/i;

    if-nez v1, :cond_0

    new-instance v1, Lcom/arcsoft/avatar/d/i;

    invoke-direct {v1, p0}, Lcom/arcsoft/avatar/d/i;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/arcsoft/avatar/d/i;->fi:Lcom/arcsoft/avatar/d/i;

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_1
    :goto_0
    sget-object p0, Lcom/arcsoft/avatar/d/i;->fi:Lcom/arcsoft/avatar/d/i;

    return-object p0
.end method

.method private a(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const/16 v0, 0x2e

    invoke-virtual {p1, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    const-string v0, ".jpg"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_5

    const-string v0, ".jpeg"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    const-string v0, ".gif"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p1, "image/gif"

    return-object p1

    :cond_1
    const-string v0, ".3gp"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    const-string v0, ".3gpp"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    :cond_2
    const-string v0, ".mp4"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3

    const-string p1, "video/mp4"

    return-object p1

    :cond_3
    const-string p1, ""

    return-object p1

    :cond_4
    :goto_0
    const-string p1, "video/3gpp"

    return-object p1

    :cond_5
    :goto_1
    const-string p1, "image/jpeg"

    return-object p1
.end method

.method private static b(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private c(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const/16 v1, 0x2e

    invoke-virtual {p1, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    if-ltz v1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ge v1, v2, :cond_1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_1
    return-object v0

    :cond_2
    :goto_0
    return-object v0
.end method

.method private d(Ljava/lang/String;)Z
    .locals 2

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    nop

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 v0, 0x1

    :cond_1
    nop

    return v0
.end method

.method private p(Ljava/lang/String;)J
    .locals 2

    invoke-direct {p0, p1}, Lcom/arcsoft/avatar/d/i;->d(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-wide/16 v0, -0x1

    return-wide v0

    :cond_0
    :try_start_0
    new-instance v0, Landroid/media/MediaMetadataRetriever;

    invoke-direct {v0}, Landroid/media/MediaMetadataRetriever;-><init>()V

    invoke-virtual {v0, p1}, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/lang/String;)V

    const/16 p1, 0x9

    invoke-virtual {v0, p1}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0}, Landroid/media/MediaMetadataRetriever;->release()V

    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    const-wide/16 v0, 0x0

    return-wide v0
.end method


# virtual methods
.method public T()Ljava/lang/String;
    .locals 2

    nop

    iget-object v0, p0, Lcom/arcsoft/avatar/d/i;->fk:Landroid/content/ContentResolver;

    invoke-static {v0}, Lcom/arcsoft/avatar/d/i;->a(Landroid/content/ContentResolver;)Landroid/database/Cursor;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-lez v1, :cond_0

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_1

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    nop

    :cond_1
    return-object v1
.end method

.method public U()Landroid/net/Uri;
    .locals 2

    nop

    iget-object v0, p0, Lcom/arcsoft/avatar/d/i;->fk:Landroid/content/ContentResolver;

    invoke-static {v0}, Lcom/arcsoft/avatar/d/i;->a(Landroid/content/ContentResolver;)Landroid/database/Cursor;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-lez v1, :cond_0

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    invoke-static {v0}, Lcom/arcsoft/avatar/d/i;->a(Landroid/database/Cursor;)Landroid/net/Uri;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_1

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    nop

    :cond_1
    return-object v1
.end method

.method public a(Ljava/lang/String;F)Landroid/graphics/Bitmap;
    .locals 2

    nop

    if-nez p1, :cond_0

    invoke-virtual {p0}, Lcom/arcsoft/avatar/d/i;->T()Ljava/lang/String;

    move-result-object p1

    :cond_0
    if-nez p1, :cond_1

    const/4 p1, 0x0

    return-object p1

    :cond_1
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v1, 0x0

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    int-to-float v1, v1

    div-float/2addr v1, p2

    float-to-int p2, v1

    if-gtz p2, :cond_2

    const/4 p2, 0x1

    :cond_2
    iput p2, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    invoke-static {p1, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1
.end method

.method public a(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .locals 4

    invoke-virtual {p0, p1}, Lcom/arcsoft/avatar/d/i;->l(Ljava/lang/String;)Lcom/arcsoft/avatar/d/i$b;

    move-result-object v0

    if-nez v0, :cond_2

    const/16 v0, 0x14

    :goto_0
    if-gtz v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    const-wide/16 v1, 0x64

    :try_start_0
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    :goto_1
    invoke-virtual {p0, p1}, Lcom/arcsoft/avatar/d/i;->l(Ljava/lang/String;)Lcom/arcsoft/avatar/d/i$b;

    move-result-object v1

    if-eqz v1, :cond_1

    nop

    move-object v0, v1

    goto :goto_2

    :cond_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_2
    :goto_2
    nop

    invoke-static {v0}, Lcom/arcsoft/avatar/d/i$b;->b(Lcom/arcsoft/avatar/d/i$b;)Z

    move-result p1

    const/4 v1, 0x3

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/arcsoft/avatar/d/i;->fk:Landroid/content/ContentResolver;

    invoke-static {v0}, Lcom/arcsoft/avatar/d/i$b;->a(Lcom/arcsoft/avatar/d/i$b;)J

    move-result-wide v2

    invoke-static {p1, v2, v3, v1, p2}, Landroid/provider/MediaStore$Video$Thumbnails;->getThumbnail(Landroid/content/ContentResolver;JILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p1

    goto :goto_3

    :cond_3
    iget-object p1, p0, Lcom/arcsoft/avatar/d/i;->fk:Landroid/content/ContentResolver;

    invoke-static {v0}, Lcom/arcsoft/avatar/d/i$b;->a(Lcom/arcsoft/avatar/d/i$b;)J

    move-result-wide v2

    invoke-static {p1, v2, v3, v1, p2}, Landroid/provider/MediaStore$Images$Thumbnails;->getThumbnail(Landroid/content/ContentResolver;JILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p1

    :goto_3
    return-object p1
.end method

.method public a(Ljava/lang/String;II)Landroid/net/Uri;
    .locals 6

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    invoke-virtual/range {v0 .. v5}, Lcom/arcsoft/avatar/d/i;->a(Ljava/lang/String;IILandroid/location/Location;I)Landroid/net/Uri;

    move-result-object p1

    return-object p1
.end method

.method public a(Ljava/lang/String;III)Landroid/net/Uri;
    .locals 6

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/arcsoft/avatar/d/i;->a(Ljava/lang/String;IILandroid/location/Location;I)Landroid/net/Uri;

    move-result-object p1

    return-object p1
.end method

.method public a(Ljava/lang/String;IILandroid/location/Location;)Landroid/net/Uri;
    .locals 6

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/arcsoft/avatar/d/i;->a(Ljava/lang/String;IILandroid/location/Location;I)Landroid/net/Uri;

    move-result-object p1

    return-object p1
.end method

.method public a(Ljava/lang/String;IILandroid/location/Location;I)Landroid/net/Uri;
    .locals 6

    invoke-virtual {p0, p1}, Lcom/arcsoft/avatar/d/i;->o(Ljava/lang/String;)Z

    move-result v0

    invoke-direct {p0, p1}, Lcom/arcsoft/avatar/d/i;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v4

    const/4 v5, 0x0

    invoke-virtual {v3, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Landroid/content/ContentValues;

    invoke-direct {v5}, Landroid/content/ContentValues;-><init>()V

    if-eqz v0, :cond_1

    const-string p5, "_data"

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p5, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p5, "_display_name"

    invoke-virtual {v5, p5, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p5, "title"

    invoke-virtual {v5, p5, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p5, "width"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v5, p5, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string p5, "height"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v5, p5, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string p5, "_size"

    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v5, p5, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string p5, "mime_type"

    invoke-virtual {v5, p5, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p5, "datetaken"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v5, p5, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    if-eqz p4, :cond_0

    const-string p5, "latitude"

    invoke-virtual {p4}, Landroid/location/Location;->getLatitude()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {v5, p5, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    const-string p5, "longitude"

    invoke-virtual {p4}, Landroid/location/Location;->getLongitude()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p4

    invoke-virtual {v5, p5, p4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    :cond_0
    const-string p4, "duration"

    invoke-direct {p0, p1}, Lcom/arcsoft/avatar/d/i;->p(Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v5, p4, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string p1, "resolution"

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, "x"

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v5, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/arcsoft/avatar/d/i;->fk:Landroid/content/ContentResolver;

    sget-object p2, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {p1, p2, v5}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object p1

    const-string p2, "android.hardware.action.NEW_VIDEO"

    goto :goto_0

    :cond_1
    const-string p1, "_data"

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "_display_name"

    invoke-virtual {v5, p1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "title"

    invoke-virtual {v5, p1, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "width"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {v5, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string p1, "height"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {v5, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string p1, "_size"

    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide p2

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-virtual {v5, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string p1, "mime_type"

    invoke-virtual {v5, p1, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "datetaken"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p2

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-virtual {v5, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    if-eqz p4, :cond_2

    const-string p1, "latitude"

    invoke-virtual {p4}, Landroid/location/Location;->getLatitude()D

    move-result-wide p2

    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p2

    invoke-virtual {v5, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    const-string p1, "longitude"

    invoke-virtual {p4}, Landroid/location/Location;->getLongitude()D

    move-result-wide p2

    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p2

    invoke-virtual {v5, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    :cond_2
    const-string p1, "orientation"

    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {v5, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object p1, p0, Lcom/arcsoft/avatar/d/i;->fk:Landroid/content/ContentResolver;

    sget-object p2, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {p1, p2, v5}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object p1

    const-string p2, "android.hardware.action.NEW_PICTURE"

    :goto_0
    sget p3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p4, 0xe

    if-lt p3, p4, :cond_3

    iget-object p3, p0, Lcom/arcsoft/avatar/d/i;->fj:Landroid/content/Context;

    new-instance p4, Landroid/content/Intent;

    invoke-direct {p4, p2, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p3, p4}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    :cond_3
    return-object p1
.end method

.method public a(Ljava/lang/String;Z)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/List<",
            "Lcom/arcsoft/avatar/d/i$b;",
            ">;"
        }
    .end annotation

    if-nez p1, :cond_0

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1

    return-object p1

    :cond_0
    nop

    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, v2

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_1
    nop

    :goto_0
    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v3, -0x1

    if-eq v3, v0, :cond_2

    add-int/2addr v0, v2

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    :cond_2
    nop

    if-eqz p2, :cond_3

    const-string v6, "bucket_display_name=?"

    new-array v7, v2, [Ljava/lang/String;

    aput-object p1, v7, v1

    const-string v8, "_id ASC"

    iget-object v3, p0, Lcom/arcsoft/avatar/d/i;->fk:Landroid/content/ContentResolver;

    sget-object v4, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    iget-object v5, p0, Lcom/arcsoft/avatar/d/i;->fl:[Ljava/lang/String;

    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    goto :goto_1

    :cond_3
    const-string v3, "bucket_display_name=?"

    new-array v4, v2, [Ljava/lang/String;

    aput-object p1, v4, v1

    const-string v5, "_id ASC"

    iget-object v0, p0, Lcom/arcsoft/avatar/d/i;->fk:Landroid/content/ContentResolver;

    sget-object v1, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    iget-object v2, p0, Lcom/arcsoft/avatar/d/i;->fm:[Ljava/lang/String;

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    :goto_1
    const/4 v0, 0x0

    if-eqz p1, :cond_4

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-lez v1, :cond_4

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    :goto_2
    invoke-interface {p1}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v1

    if-nez v1, :cond_4

    invoke-direct {p0, p1, p2}, Lcom/arcsoft/avatar/d/i;->a(Landroid/database/Cursor;Z)Lcom/arcsoft/avatar/d/i$b;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_2

    :cond_4
    if-eqz p1, :cond_5

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    nop

    :cond_5
    return-object v0
.end method

.method public g(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 6

    invoke-virtual {p0, p1}, Lcom/arcsoft/avatar/d/i;->l(Ljava/lang/String;)Lcom/arcsoft/avatar/d/i$b;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {p2, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v2

    nop

    const/4 v3, 0x1

    const/4 v4, -0x1

    if-eq v4, v2, :cond_1

    add-int/2addr v2, v3

    invoke-virtual {p2, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p2

    :cond_1
    nop

    nop

    const-string v2, "."

    invoke-virtual {p2, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v2

    if-eq v4, v2, :cond_2

    invoke-virtual {p2, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    nop

    move-object v5, p2

    move-object p2, p1

    move-object p1, v5

    goto :goto_0

    :cond_2
    nop

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "."

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0, p1}, Lcom/arcsoft/avatar/d/i;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_0
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    invoke-static {v0}, Lcom/arcsoft/avatar/d/i$b;->b(Lcom/arcsoft/avatar/d/i$b;)Z

    move-result v4

    if-eqz v4, :cond_3

    const-string v4, "_display_name"

    invoke-virtual {v2, v4, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "title"

    invoke-virtual {v2, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_3
    const-string v4, "_display_name"

    invoke-virtual {v2, v4, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "title"

    invoke-virtual {v2, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    iget-object p1, p0, Lcom/arcsoft/avatar/d/i;->fk:Landroid/content/ContentResolver;

    invoke-static {v0}, Lcom/arcsoft/avatar/d/i$b;->c(Lcom/arcsoft/avatar/d/i$b;)Landroid/net/Uri;

    move-result-object p2

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v2, v0, v0}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1

    if-lez p1, :cond_4

    return v3

    :cond_4
    return v1
.end method

.method public l(Ljava/lang/String;)Lcom/arcsoft/avatar/d/i$b;
    .locals 10

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    :cond_0
    invoke-virtual {p0, p1}, Lcom/arcsoft/avatar/d/i;->o(Ljava/lang/String;)Z

    move-result v1

    nop

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_1

    const-string v7, "_data=?"

    new-array v8, v3, [Ljava/lang/String;

    aput-object p1, v8, v2

    const-string v9, "_id DESC"

    iget-object v4, p0, Lcom/arcsoft/avatar/d/i;->fk:Landroid/content/ContentResolver;

    sget-object v5, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    iget-object v6, p0, Lcom/arcsoft/avatar/d/i;->fl:[Ljava/lang/String;

    invoke-virtual/range {v4 .. v9}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    goto :goto_0

    :cond_1
    const-string v5, "_data=?"

    new-array v6, v3, [Ljava/lang/String;

    aput-object p1, v6, v2

    const-string v7, "_id DESC"

    iget-object v2, p0, Lcom/arcsoft/avatar/d/i;->fk:Landroid/content/ContentResolver;

    sget-object v3, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    iget-object v4, p0, Lcom/arcsoft/avatar/d/i;->fm:[Ljava/lang/String;

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    :goto_0
    nop

    if-eqz p1, :cond_2

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-lez v2, :cond_2

    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    invoke-direct {p0, p1, v1}, Lcom/arcsoft/avatar/d/i;->a(Landroid/database/Cursor;Z)Lcom/arcsoft/avatar/d/i$b;

    move-result-object v0

    :cond_2
    if-eqz p1, :cond_3

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    nop

    :cond_3
    return-object v0
.end method

.method public m(Ljava/lang/String;)Z
    .locals 3

    invoke-virtual {p0, p1}, Lcom/arcsoft/avatar/d/i;->l(Ljava/lang/String;)Lcom/arcsoft/avatar/d/i$b;

    move-result-object p1

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    iget-object v1, p0, Lcom/arcsoft/avatar/d/i;->fk:Landroid/content/ContentResolver;

    invoke-static {p1}, Lcom/arcsoft/avatar/d/i$b;->c(Lcom/arcsoft/avatar/d/i$b;)Landroid/net/Uri;

    move-result-object p1

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2, v2}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1

    if-lez p1, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    return v0
.end method

.method public n(Ljava/lang/String;)I
    .locals 3

    nop

    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Landroid/media/ExifInterface;

    invoke-direct {v1, p1}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V

    const-string p1, "Orientation"

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v2}, Landroid/media/ExifInterface;->getAttributeInt(Ljava/lang/String;I)I

    move-result p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v1, 0x3

    if-eq p1, v1, :cond_2

    const/4 v1, 0x6

    if-eq p1, v1, :cond_1

    const/16 v1, 0x8

    if-eq p1, v1, :cond_0

    goto :goto_0

    :cond_0
    const/16 v0, 0x10e

    goto :goto_0

    :cond_1
    const/16 v0, 0x5a

    goto :goto_0

    :cond_2
    const/16 v0, 0xb4

    nop

    :goto_0
    nop

    return v0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    return v0
.end method

.method public o(Ljava/lang/String;)Z
    .locals 2

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    const/16 v1, 0x2e

    invoke-virtual {p1, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    const-string v1, ".3gp"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, ".mp4"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    goto :goto_0

    :cond_1
    return v0

    :cond_2
    :goto_0
    const/4 p1, 0x1

    return p1
.end method
