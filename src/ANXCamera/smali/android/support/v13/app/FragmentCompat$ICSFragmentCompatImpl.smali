.class Landroid/support/v13/app/FragmentCompat$ICSFragmentCompatImpl;
.super Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl;
.source "FragmentCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v13/app/FragmentCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ICSFragmentCompatImpl"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 78
    invoke-direct {p0}, Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl;-><init>()V

    return-void
.end method


# virtual methods
.method public setMenuVisibility(Landroid/app/Fragment;Z)V
    .registers 3
    .param p1, "f"    # Landroid/app/Fragment;
    .param p2, "visible"    # Z

    .line 81
    invoke-static {p1, p2}, Landroid/support/v13/app/FragmentCompatICS;->setMenuVisibility(Landroid/app/Fragment;Z)V

    .line 82
    return-void
.end method
