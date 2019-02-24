.class public Lcom/android/camera/fragment/CtaNoticeFragment;
.super Landroid/app/DialogFragment;
.source "CtaNoticeFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/CtaNoticeFragment$OnCtaNoticeClickListener;,
        Lcom/android/camera/fragment/CtaNoticeFragment$Licence;,
        Lcom/android/camera/fragment/CtaNoticeFragment$CTA;
    }
.end annotation


# static fields
.field public static final TAG:Ljava/lang/String; = "CtaNoticeFragment"


# instance fields
.field private mClickListener:Lcom/android/camera/fragment/CtaNoticeFragment$OnCtaNoticeClickListener;

.field private mShowRemindButton:Z


# direct methods
.method public constructor <init>(ZLcom/android/camera/fragment/CtaNoticeFragment$OnCtaNoticeClickListener;)V
    .locals 0

    .line 86
    invoke-direct {p0}, Landroid/app/DialogFragment;-><init>()V

    .line 87
    iput-boolean p1, p0, Lcom/android/camera/fragment/CtaNoticeFragment;->mShowRemindButton:Z

    .line 88
    iput-object p2, p0, Lcom/android/camera/fragment/CtaNoticeFragment;->mClickListener:Lcom/android/camera/fragment/CtaNoticeFragment$OnCtaNoticeClickListener;

    .line 89
    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/CtaNoticeFragment;)Z
    .locals 0

    .line 28
    iget-boolean p0, p0, Lcom/android/camera/fragment/CtaNoticeFragment;->mShowRemindButton:Z

    return p0
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/CtaNoticeFragment;)Lcom/android/camera/fragment/CtaNoticeFragment$OnCtaNoticeClickListener;
    .locals 0

    .line 28
    iget-object p0, p0, Lcom/android/camera/fragment/CtaNoticeFragment;->mClickListener:Lcom/android/camera/fragment/CtaNoticeFragment$OnCtaNoticeClickListener;

    return-object p0
.end method

.method private static buildUserNotice(Landroid/content/Context;I)Landroid/text/SpannableStringBuilder;
    .locals 6

    .line 145
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 146
    const v1, 0x7f0901e6

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 147
    const v2, 0x7f0901e7

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 148
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v1, v3, v4

    const/4 v4, 0x1

    aput-object v2, v3, v4

    invoke-virtual {v0, p1, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 151
    new-instance v0, Lcom/android/camera/fragment/CtaNoticeFragment$3;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/CtaNoticeFragment$3;-><init>(Landroid/content/Context;)V

    .line 158
    new-instance v3, Lcom/android/camera/fragment/CtaNoticeFragment$4;

    invoke-direct {v3, p0}, Lcom/android/camera/fragment/CtaNoticeFragment$4;-><init>(Landroid/content/Context;)V

    .line 165
    new-instance p0, Landroid/text/SpannableStringBuilder;

    invoke-direct {p0, p1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 166
    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    .line 167
    new-instance v5, Lcom/android/camera/ui/UrlSpan;

    invoke-direct {v5, v0}, Lcom/android/camera/ui/UrlSpan;-><init>(Lcom/android/camera/ui/UrlSpan$UrlSpanOnClickListener;)V

    .line 169
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    add-int/2addr v0, v4

    .line 167
    const/16 v1, 0x21

    invoke-virtual {p0, v5, v4, v0, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 171
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p1

    .line 172
    new-instance v0, Lcom/android/camera/ui/UrlSpan;

    invoke-direct {v0, v3}, Lcom/android/camera/ui/UrlSpan;-><init>(Lcom/android/camera/ui/UrlSpan$UrlSpanOnClickListener;)V

    .line 174
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v2, p1

    .line 172
    invoke-virtual {p0, v0, p1, v2, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 175
    return-object p0
.end method

.method public static checkCta(Landroid/app/FragmentManager;)Z
    .locals 1

    .line 83
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/android/camera/fragment/CtaNoticeFragment;->checkCta(Landroid/app/FragmentManager;Z)Z

    move-result p0

    return p0
.end method

.method public static checkCta(Landroid/app/FragmentManager;Z)Z
    .locals 1

    .line 79
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/android/camera/fragment/CtaNoticeFragment;->checkCta(Landroid/app/FragmentManager;ZLcom/android/camera/fragment/CtaNoticeFragment$OnCtaNoticeClickListener;)Z

    move-result p0

    return p0
.end method

.method public static checkCta(Landroid/app/FragmentManager;ZLcom/android/camera/fragment/CtaNoticeFragment$OnCtaNoticeClickListener;)Z
    .locals 0

    .line 75
    invoke-static {p0, p1, p2}, Lcom/android/camera/fragment/CtaNoticeFragment;->showCta(Landroid/app/FragmentManager;ZLcom/android/camera/fragment/CtaNoticeFragment$OnCtaNoticeClickListener;)Lcom/android/camera/fragment/CtaNoticeFragment;

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static showCta(Landroid/app/FragmentManager;ZLcom/android/camera/fragment/CtaNoticeFragment$OnCtaNoticeClickListener;)Lcom/android/camera/fragment/CtaNoticeFragment;
    .locals 1

    .line 61
    invoke-static {}, Lcom/android/camera/fragment/CtaNoticeFragment$CTA;->canConnectNetwork()Z

    move-result v0

    if-nez v0, :cond_1

    .line 62
    const-string v0, "CtaNoticeFragment"

    invoke-virtual {p0, v0}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    .line 63
    if-nez v0, :cond_0

    .line 64
    new-instance v0, Lcom/android/camera/fragment/CtaNoticeFragment;

    invoke-direct {v0, p1, p2}, Lcom/android/camera/fragment/CtaNoticeFragment;-><init>(ZLcom/android/camera/fragment/CtaNoticeFragment$OnCtaNoticeClickListener;)V

    .line 65
    const-string p1, "CtaNoticeFragment"

    invoke-virtual {v0, p0, p1}, Lcom/android/camera/fragment/CtaNoticeFragment;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    .line 66
    return-object v0

    .line 68
    :cond_0
    check-cast v0, Lcom/android/camera/fragment/CtaNoticeFragment;

    return-object v0

    .line 70
    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 93
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 94
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/CtaNoticeFragment;->setCancelable(Z)V

    .line 95
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 3

    .line 99
    invoke-virtual {p0}, Lcom/android/camera/fragment/CtaNoticeFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const v0, 0x7f0901ea

    invoke-static {p1, v0}, Lcom/android/camera/fragment/CtaNoticeFragment;->buildUserNotice(Landroid/content/Context;I)Landroid/text/SpannableStringBuilder;

    move-result-object p1

    .line 102
    new-instance v0, Lmiui/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/android/camera/fragment/CtaNoticeFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lmiui/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 103
    const v1, 0x7f0901ec

    invoke-virtual {v0, v1}, Lmiui/app/AlertDialog$Builder;->setTitle(I)Lmiui/app/AlertDialog$Builder;

    move-result-object v0

    .line 104
    invoke-virtual {v0, p1}, Lmiui/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v0, Lcom/android/camera/fragment/CtaNoticeFragment$2;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/CtaNoticeFragment$2;-><init>(Lcom/android/camera/fragment/CtaNoticeFragment;)V

    .line 105
    const v1, 0x7f0901e8

    invoke-virtual {p1, v1, v0}, Lmiui/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v0, Lcom/android/camera/fragment/CtaNoticeFragment$1;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/CtaNoticeFragment$1;-><init>(Lcom/android/camera/fragment/CtaNoticeFragment;)V

    .line 114
    const/high16 v1, 0x1040000

    invoke-virtual {p1, v1, v0}, Lmiui/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    .line 124
    iget-boolean v0, p0, Lcom/android/camera/fragment/CtaNoticeFragment;->mShowRemindButton:Z

    if-eqz v0, :cond_0

    .line 125
    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/android/camera/fragment/CtaNoticeFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const v2, 0x7f0901e9

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lmiui/app/AlertDialog$Builder;->setCheckBox(ZLjava/lang/CharSequence;)Lmiui/app/AlertDialog$Builder;

    .line 128
    :cond_0
    invoke-virtual {p1}, Lmiui/app/AlertDialog$Builder;->create()Lmiui/app/AlertDialog;

    move-result-object p1

    .line 129
    return-object p1
.end method

.method public onStart()V
    .locals 2

    .line 135
    invoke-super {p0}, Landroid/app/DialogFragment;->onStart()V

    .line 137
    invoke-virtual {p0}, Lcom/android/camera/fragment/CtaNoticeFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    .line 138
    if-eqz v0, :cond_0

    .line 139
    check-cast v0, Lmiui/app/AlertDialog;

    invoke-virtual {v0}, Lmiui/app/AlertDialog;->getMessageView()Landroid/widget/TextView;

    move-result-object v0

    .line 140
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 142
    :cond_0
    return-void
.end method
