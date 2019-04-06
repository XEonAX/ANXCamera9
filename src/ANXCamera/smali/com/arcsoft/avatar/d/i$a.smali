.class final Lcom/arcsoft/avatar/d/i$a;
.super Ljava/lang/Object;
.source "MediaUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/arcsoft/avatar/d/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "a"
.end annotation


# static fields
.field public static final a:Ljava/lang/String; = "_id"

.field public static final b:Ljava/lang/String; = "_data"

.field public static final c:Ljava/lang/String; = "_size"

.field public static final cJ:Ljava/lang/String; = "longitude"

.field public static final cM:Ljava/lang/String; = "duration"

.field public static final cN:Ljava/lang/String; = "resolution"

.field public static final d:Ljava/lang/String; = "datetaken"

.field public static final e:Ljava/lang/String;

.field public static final ep:Ljava/lang/String; = "date_modified"

.field public static final f:Ljava/lang/String; = "bucket_id"

.field public static final fo:Ljava/lang/String; = "latitude"

.field public static final fp:Ljava/lang/String; = "orientation"

.field public static final fq:Ljava/lang/String; = "media_type"

.field public static final fr:Ljava/lang/String; = "tags"

.field public static final fs:Ljava/lang/String; = "height"

.field public static final ft:Ljava/lang/String; = "title"

.field public static final g:Ljava/lang/String; = "mime_type"

.field public static final p:Ljava/lang/String; = "width"

.field public static final s:Ljava/lang/String; = "_display_name"


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "case media_type when 1 then \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "\" else \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "\" end"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/arcsoft/avatar/d/i$a;->e:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
