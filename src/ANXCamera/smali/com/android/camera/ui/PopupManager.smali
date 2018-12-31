.class public Lcom/android/camera/ui/PopupManager;
.super Ljava/lang/Object;
.source "PopupManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/ui/PopupManager$OnOtherPopupShowedListener;
    }
.end annotation


# static fields
.field public static final LEVEL_ONE:I = 0x1

.field public static final LEVEL_TWO:I = 0x2

.field private static sMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Landroid/content/Context;",
            "Lcom/android/camera/ui/PopupManager;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mLastListener:Lcom/android/camera/ui/PopupManager$OnOtherPopupShowedListener;

.field private mListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/camera/ui/PopupManager$OnOtherPopupShowedListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 32
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/android/camera/ui/PopupManager;->sMap:Ljava/util/HashMap;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/PopupManager;->mListeners:Ljava/util/ArrayList;

    .line 41
    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/android/camera/ui/PopupManager;
    .locals 2

    .line 82
    sget-object v0, Lcom/android/camera/ui/PopupManager;->sMap:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/PopupManager;

    .line 83
    if-nez v0, :cond_0

    .line 84
    new-instance v0, Lcom/android/camera/ui/PopupManager;

    invoke-direct {v0}, Lcom/android/camera/ui/PopupManager;-><init>()V

    .line 85
    sget-object v1, Lcom/android/camera/ui/PopupManager;->sMap:Ljava/util/HashMap;

    invoke-virtual {v1, p0, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    :cond_0
    return-object v0
.end method

.method public static removeInstance(Landroid/content/Context;)V
    .locals 1

    .line 91
    sget-object v0, Lcom/android/camera/ui/PopupManager;->sMap:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/PopupManager;

    .line 92
    if-eqz v0, :cond_0

    .line 93
    sget-object v0, Lcom/android/camera/ui/PopupManager;->sMap:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    :cond_0
    return-void
.end method


# virtual methods
.method public clearRecoveredPopupListenerIfNeeded(Lcom/android/camera/ui/PopupManager$OnOtherPopupShowedListener;)V
    .locals 1

    .line 62
    iget-object v0, p0, Lcom/android/camera/ui/PopupManager;->mLastListener:Lcom/android/camera/ui/PopupManager$OnOtherPopupShowedListener;

    if-ne v0, p1, :cond_0

    .line 63
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/android/camera/ui/PopupManager;->mLastListener:Lcom/android/camera/ui/PopupManager$OnOtherPopupShowedListener;

    .line 65
    :cond_0
    return-void
.end method

.method public getLastOnOtherPopupShowedListener()Lcom/android/camera/ui/PopupManager$OnOtherPopupShowedListener;
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/android/camera/ui/PopupManager;->mLastListener:Lcom/android/camera/ui/PopupManager$OnOtherPopupShowedListener;

    return-object v0
.end method

.method public notifyDismissPopup()V
    .locals 1

    .line 55
    iget-object v0, p0, Lcom/android/camera/ui/PopupManager;->mLastListener:Lcom/android/camera/ui/PopupManager$OnOtherPopupShowedListener;

    if-eqz v0, :cond_0

    .line 56
    iget-object v0, p0, Lcom/android/camera/ui/PopupManager;->mLastListener:Lcom/android/camera/ui/PopupManager$OnOtherPopupShowedListener;

    invoke-interface {v0}, Lcom/android/camera/ui/PopupManager$OnOtherPopupShowedListener;->recoverIfNeeded()V

    .line 57
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/ui/PopupManager;->mLastListener:Lcom/android/camera/ui/PopupManager$OnOtherPopupShowedListener;

    .line 59
    :cond_0
    return-void
.end method

.method public notifyShowPopup(Landroid/view/View;I)V
    .locals 3

    .line 47
    iget-object v0, p0, Lcom/android/camera/ui/PopupManager;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/ui/PopupManager$OnOtherPopupShowedListener;

    .line 48
    move-object v2, v1

    check-cast v2, Landroid/view/View;

    if-eq v2, p1, :cond_0

    invoke-interface {v1, p2}, Lcom/android/camera/ui/PopupManager$OnOtherPopupShowedListener;->onOtherPopupShowed(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 49
    iput-object v1, p0, Lcom/android/camera/ui/PopupManager;->mLastListener:Lcom/android/camera/ui/PopupManager$OnOtherPopupShowedListener;

    .line 51
    :cond_0
    goto :goto_0

    .line 52
    :cond_1
    return-void
.end method

.method public removeOnOtherPopupShowedListener(Lcom/android/camera/ui/PopupManager$OnOtherPopupShowedListener;)V
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/android/camera/ui/PopupManager;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 79
    return-void
.end method

.method public setOnOtherPopupShowedListener(Lcom/android/camera/ui/PopupManager$OnOtherPopupShowedListener;)V
    .locals 1

    .line 68
    iget-object v0, p0, Lcom/android/camera/ui/PopupManager;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 69
    iget-object v0, p0, Lcom/android/camera/ui/PopupManager;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 71
    :cond_0
    return-void
.end method
