.class public final Lcom/android/camera/network/download/Verifier$Sha1;
.super Lcom/android/camera/network/download/Verifier;
.source "Verifier.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/network/download/Verifier;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Sha1"
.end annotation


# static fields
.field private static final ALGORITHM:Ljava/lang/String; = "SHA-1"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 53
    const-string v0, "SHA-1"

    const/16 v1, 0x28

    invoke-static {p1, v1}, Lcom/android/camera/network/download/Verifier;->access$000(Ljava/lang/String;I)[B

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lcom/android/camera/network/download/Verifier;-><init>(Ljava/lang/String;[B)V

    .line 54
    return-void
.end method

.method constructor <init>([B)V
    .locals 1

    .line 57
    const-string v0, "SHA-1"

    invoke-direct {p0, v0, p1}, Lcom/android/camera/network/download/Verifier;-><init>(Ljava/lang/String;[B)V

    .line 58
    return-void
.end method
