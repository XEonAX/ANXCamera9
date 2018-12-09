.class Lcom/android/camera/fragment/CtaNoticeFragment$Licence;
.super Ljava/lang/Object;
.source "CtaNoticeFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/CtaNoticeFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Licence"
.end annotation


# static fields
.field private static URL_MIUI_PRIVACY_POLICY:Ljava/lang/String;

.field private static URL_MIUI_USER_AGREEMENT:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 137
    const-string v0, "http://www.miui.com/res/doc/eula.html"

    sput-object v0, Lcom/android/camera/fragment/CtaNoticeFragment$Licence;->URL_MIUI_USER_AGREEMENT:Ljava/lang/String;

    .line 138
    const-string v0, "http://www.miui.com/res/doc/privacy.html"

    sput-object v0, Lcom/android/camera/fragment/CtaNoticeFragment$Licence;->URL_MIUI_PRIVACY_POLICY:Ljava/lang/String;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 136
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getPrivacyIntent()Landroid/content/Intent;
    .locals 2

    .line 147
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 148
    sget-object v1, Lcom/android/camera/fragment/CtaNoticeFragment$Licence;->URL_MIUI_PRIVACY_POLICY:Ljava/lang/String;

    invoke-static {v1}, Lcom/android/camera/fragment/CtaNoticeFragment$Licence;->getUrlByLocale(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 149
    return-object v0
.end method

.method private static getUrlByLocale(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 153
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "?lang="

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object p0

    const-string v1, "zh"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const-string p0, "zh_CN"

    goto :goto_0

    :cond_0
    const-string p0, "en_US"

    :goto_0
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getUserAgreementIntent()Landroid/content/Intent;
    .locals 2

    .line 141
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 142
    sget-object v1, Lcom/android/camera/fragment/CtaNoticeFragment$Licence;->URL_MIUI_USER_AGREEMENT:Ljava/lang/String;

    invoke-static {v1}, Lcom/android/camera/fragment/CtaNoticeFragment$Licence;->getUrlByLocale(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 143
    return-object v0
.end method
