.class Lcom/android/camera/ui/ObjectView$EndAction;
.super Ljava/lang/Object;
.source "ObjectView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/ui/ObjectView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "EndAction"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/ui/ObjectView;


# direct methods
.method private constructor <init>(Lcom/android/camera/ui/ObjectView;)V
    .locals 0

    .line 536
    iput-object p1, p0, Lcom/android/camera/ui/ObjectView$EndAction;->this$0:Lcom/android/camera/ui/ObjectView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/camera/ui/ObjectView;Lcom/android/camera/ui/ObjectView$1;)V
    .locals 0

    .line 536
    invoke-direct {p0, p1}, Lcom/android/camera/ui/ObjectView$EndAction;-><init>(Lcom/android/camera/ui/ObjectView;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 539
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView$EndAction;->this$0:Lcom/android/camera/ui/ObjectView;

    const/4 v1, 0x5

    invoke-static {v0, v1}, Lcom/android/camera/ui/ObjectView;->access$502(Lcom/android/camera/ui/ObjectView;I)I

    .line 540
    return-void
.end method
