.class public Lcom/ss/android/vesdk/VEEditor_LifecycleAdapter;
.super Ljava/lang/Object;
.source "VEEditor_LifecycleAdapter.java"

# interfaces
.implements Landroid/arch/lifecycle/GeneratedAdapter;


# instance fields
.field final mReceiver:Lcom/ss/android/vesdk/VEEditor;


# direct methods
.method constructor <init>(Lcom/ss/android/vesdk/VEEditor;)V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lcom/ss/android/vesdk/VEEditor_LifecycleAdapter;->mReceiver:Lcom/ss/android/vesdk/VEEditor;

    .line 14
    return-void
.end method


# virtual methods
.method public callMethods(Landroid/arch/lifecycle/LifecycleOwner;Landroid/arch/lifecycle/Lifecycle$Event;ZLandroid/arch/lifecycle/MethodCallsLogger;)V
    .locals 1

    .line 19
    const/4 p1, 0x1

    if-eqz p4, :cond_0

    .line 20
    move v0, p1

    goto :goto_0

    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    :goto_0
    if-eqz p3, :cond_1

    .line 21
    return-void

    .line 23
    :cond_1
    sget-object p3, Landroid/arch/lifecycle/Lifecycle$Event;->ON_DESTROY:Landroid/arch/lifecycle/Lifecycle$Event;

    if-ne p2, p3, :cond_4

    .line 24
    if-eqz v0, :cond_2

    const-string p2, "destroy"

    invoke-virtual {p4, p2, p1}, Landroid/arch/lifecycle/MethodCallsLogger;->approveCall(Ljava/lang/String;I)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 25
    :cond_2
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor_LifecycleAdapter;->mReceiver:Lcom/ss/android/vesdk/VEEditor;

    invoke-virtual {p1}, Lcom/ss/android/vesdk/VEEditor;->destroy()V

    .line 27
    :cond_3
    return-void

    .line 29
    :cond_4
    return-void
.end method
