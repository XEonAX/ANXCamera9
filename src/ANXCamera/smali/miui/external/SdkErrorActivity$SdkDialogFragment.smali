.class Lmiui/external/SdkErrorActivity$SdkDialogFragment;
.super Landroid/app/DialogFragment;
.source "SdkErrorActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/external/SdkErrorActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SdkDialogFragment"
.end annotation


# instance fields
.field private mDialog:Landroid/app/Dialog;

.field final synthetic this$0:Lmiui/external/SdkErrorActivity;


# direct methods
.method public constructor <init>(Lmiui/external/SdkErrorActivity;Landroid/app/Dialog;)V
    .locals 0

    .line 107
    iput-object p1, p0, Lmiui/external/SdkErrorActivity$SdkDialogFragment;->this$0:Lmiui/external/SdkErrorActivity;

    invoke-direct {p0}, Landroid/app/DialogFragment;-><init>()V

    .line 108
    iput-object p2, p0, Lmiui/external/SdkErrorActivity$SdkDialogFragment;->mDialog:Landroid/app/Dialog;

    .line 109
    return-void
.end method


# virtual methods
.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 0

    .line 113
    iget-object p1, p0, Lmiui/external/SdkErrorActivity$SdkDialogFragment;->mDialog:Landroid/app/Dialog;

    return-object p1
.end method
