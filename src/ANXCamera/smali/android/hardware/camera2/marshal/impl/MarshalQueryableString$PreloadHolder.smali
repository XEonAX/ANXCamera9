.class Landroid/hardware/camera2/marshal/impl/MarshalQueryableString$PreloadHolder;
.super Ljava/lang/Object;
.source "MarshalQueryableString.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/hardware/camera2/marshal/impl/MarshalQueryableString;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PreloadHolder"
.end annotation


# static fields
.field public static final UTF8_CHARSET:Ljava/nio/charset/Charset;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 37
    const-string v0, "UTF-8"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Landroid/hardware/camera2/marshal/impl/MarshalQueryableString$PreloadHolder;->UTF8_CHARSET:Ljava/nio/charset/Charset;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
