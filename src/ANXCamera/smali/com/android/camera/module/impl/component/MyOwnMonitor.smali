.class public Lcom/android/camera/module/impl/component/MyOwnMonitor;
.super Ljava/lang/Object;
.source "MyOwnMonitor.java"

# interfaces
.implements Lcom/ss/android/vesdk/runtime/VEExternalMonitorListener;


# static fields
.field public static Instance:Lcom/android/camera/module/impl/component/MyOwnMonitor;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 8
    new-instance v0, Lcom/android/camera/module/impl/component/MyOwnMonitor;

    invoke-direct {v0}, Lcom/android/camera/module/impl/component/MyOwnMonitor;-><init>()V

    sput-object v0, Lcom/android/camera/module/impl/component/MyOwnMonitor;->Instance:Lcom/android/camera/module/impl/component/MyOwnMonitor;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    return-void
.end method


# virtual methods
.method public onMonitorInvoked(Ljava/lang/String;ILjava/lang/String;)V
    .locals 2

    .line 15
    const-string v0, "LiveLog"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    return-void
.end method
