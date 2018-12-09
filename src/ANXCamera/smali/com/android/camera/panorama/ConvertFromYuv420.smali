.class public Lcom/android/camera/panorama/ConvertFromYuv420;
.super Ljava/lang/Object;
.source "ConvertFromYuv420.java"

# interfaces
.implements Lcom/android/camera/panorama/IImage2BytesConverter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/panorama/ConvertFromYuv420$ConvertFromYuv420Null;
    }
.end annotation


# instance fields
.field private mImage2BytesConverter:Lcom/android/camera/panorama/IImage2BytesConverter;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    new-instance v0, Lcom/android/camera/panorama/ConvertFromYuv420$ConvertFromYuv420Null;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/camera/panorama/ConvertFromYuv420$ConvertFromYuv420Null;-><init>(Lcom/android/camera/panorama/ConvertFromYuv420;Lcom/android/camera/panorama/ConvertFromYuv420$1;)V

    iput-object v0, p0, Lcom/android/camera/panorama/ConvertFromYuv420;->mImage2BytesConverter:Lcom/android/camera/panorama/IImage2BytesConverter;

    .line 10
    return-void
.end method

.method static synthetic access$100(Lcom/android/camera/panorama/ConvertFromYuv420;)Lcom/android/camera/panorama/IImage2BytesConverter;
    .locals 0

    .line 5
    iget-object p0, p0, Lcom/android/camera/panorama/ConvertFromYuv420;->mImage2BytesConverter:Lcom/android/camera/panorama/IImage2BytesConverter;

    return-object p0
.end method

.method static synthetic access$102(Lcom/android/camera/panorama/ConvertFromYuv420;Lcom/android/camera/panorama/IImage2BytesConverter;)Lcom/android/camera/panorama/IImage2BytesConverter;
    .locals 0

    .line 5
    iput-object p1, p0, Lcom/android/camera/panorama/ConvertFromYuv420;->mImage2BytesConverter:Lcom/android/camera/panorama/IImage2BytesConverter;

    return-object p1
.end method


# virtual methods
.method public image2bytes(Landroid/media/Image;)[B
    .locals 1

    .line 14
    iget-object v0, p0, Lcom/android/camera/panorama/ConvertFromYuv420;->mImage2BytesConverter:Lcom/android/camera/panorama/IImage2BytesConverter;

    invoke-interface {v0, p1}, Lcom/android/camera/panorama/IImage2BytesConverter;->image2bytes(Landroid/media/Image;)[B

    move-result-object p1

    return-object p1
.end method
