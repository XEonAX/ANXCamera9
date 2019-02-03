.class public final Lcom/android/camera2/DetachableClickListener;
.super Ljava/lang/Object;
.source "DetachableClickListener.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private delegateOrNull:Landroid/content/DialogInterface$OnClickListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 10
    const-class v0, Lcom/android/camera2/DetachableClickListener;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera2/DetachableClickListener;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Landroid/content/DialogInterface$OnClickListener;)V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/android/camera2/DetachableClickListener;->delegateOrNull:Landroid/content/DialogInterface$OnClickListener;

    .line 20
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .line 9
    sget-object v0, Lcom/android/camera2/DetachableClickListener;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$102(Lcom/android/camera2/DetachableClickListener;Landroid/content/DialogInterface$OnClickListener;)Landroid/content/DialogInterface$OnClickListener;
    .locals 0

    .line 9
    iput-object p1, p0, Lcom/android/camera2/DetachableClickListener;->delegateOrNull:Landroid/content/DialogInterface$OnClickListener;

    return-object p1
.end method

.method public static wrap(Landroid/content/DialogInterface$OnClickListener;)Lcom/android/camera2/DetachableClickListener;
    .locals 1

    .line 13
    new-instance v0, Lcom/android/camera2/DetachableClickListener;

    invoke-direct {v0, p0}, Lcom/android/camera2/DetachableClickListener;-><init>(Landroid/content/DialogInterface$OnClickListener;)V

    return-object v0
.end method


# virtual methods
.method public clearOnDetach(Landroid/app/Dialog;)V
    .locals 1

    .line 30
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    .line 31
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    .line 32
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    new-instance v0, Lcom/android/camera2/DetachableClickListener$1;

    invoke-direct {v0, p0}, Lcom/android/camera2/DetachableClickListener$1;-><init>(Lcom/android/camera2/DetachableClickListener;)V

    .line 33
    invoke-virtual {p1, v0}, Landroid/view/ViewTreeObserver;->addOnWindowAttachListener(Landroid/view/ViewTreeObserver$OnWindowAttachListener;)V

    .line 44
    return-void
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 24
    iget-object v0, p0, Lcom/android/camera2/DetachableClickListener;->delegateOrNull:Landroid/content/DialogInterface$OnClickListener;

    if-eqz v0, :cond_0

    .line 25
    iget-object v0, p0, Lcom/android/camera2/DetachableClickListener;->delegateOrNull:Landroid/content/DialogInterface$OnClickListener;

    invoke-interface {v0, p1, p2}, Landroid/content/DialogInterface$OnClickListener;->onClick(Landroid/content/DialogInterface;I)V

    .line 27
    :cond_0
    return-void
.end method
