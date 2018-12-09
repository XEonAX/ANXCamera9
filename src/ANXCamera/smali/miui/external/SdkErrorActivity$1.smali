.class Lmiui/external/SdkErrorActivity$1;
.super Ljava/lang/Object;
.source "SdkErrorActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/external/SdkErrorActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lmiui/external/SdkErrorActivity;


# direct methods
.method constructor <init>(Lmiui/external/SdkErrorActivity;)V
    .locals 0

    .line 61
    iput-object p1, p0, Lmiui/external/SdkErrorActivity$1;->this$0:Lmiui/external/SdkErrorActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 64
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 65
    iget-object p1, p0, Lmiui/external/SdkErrorActivity$1;->this$0:Lmiui/external/SdkErrorActivity;

    invoke-virtual {p1}, Lmiui/external/SdkErrorActivity;->finish()V

    .line 66
    const/4 p1, 0x0

    invoke-static {p1}, Ljava/lang/System;->exit(I)V

    .line 67
    return-void
.end method
