.class Lcom/xiaomi/engine/MiaNodeJNI$InstanceHolder;
.super Ljava/lang/Object;
.source "MiaNodeJNI.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/engine/MiaNodeJNI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "InstanceHolder"
.end annotation


# static fields
.field static INSTANCE:Lcom/xiaomi/engine/MiaNodeJNI;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 30
    new-instance v0, Lcom/xiaomi/engine/MiaNodeJNI;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/xiaomi/engine/MiaNodeJNI;-><init>(Lcom/xiaomi/engine/MiaNodeJNI$1;)V

    sput-object v0, Lcom/xiaomi/engine/MiaNodeJNI$InstanceHolder;->INSTANCE:Lcom/xiaomi/engine/MiaNodeJNI;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
