.class public Lcom/arcsoft/avatar/AvatarConfig$g;
.super Ljava/lang/Object;
.source "AvatarConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/arcsoft/avatar/AvatarConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "g"
.end annotation


# static fields
.field private static final a:I = 0x9a

.field private static final b:I = 0x3f


# instance fields
.field public bk:I

.field public bl:I

.field public bm:[Lcom/arcsoft/avatar/AvatarConfig$i;

.field public bn:[F

.field public bo:Lcom/arcsoft/avatar/AvatarConfig$j;

.field public bp:[F

.field public bq:[F

.field public br:[F

.field public bs:[F

.field public bt:[F

.field public bu:F

.field public faceCount:I

.field public isMirror:Z

.field public orientation:I

.field public result:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x9a

    new-array v0, v0, [Lcom/arcsoft/avatar/AvatarConfig$i;

    iput-object v0, p0, Lcom/arcsoft/avatar/AvatarConfig$g;->bm:[Lcom/arcsoft/avatar/AvatarConfig$i;

    return-void
.end method
