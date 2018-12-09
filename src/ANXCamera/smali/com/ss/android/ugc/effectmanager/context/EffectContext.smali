.class public Lcom/ss/android/ugc/effectmanager/context/EffectContext;
.super Ljava/lang/Object;
.source "EffectContext.java"


# instance fields
.field private mEffectConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

.field private mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;


# direct methods
.method public constructor <init>(Lcom/ss/android/ugc/effectmanager/EffectConfiguration;)V
    .locals 1
    .param p1    # Lcom/ss/android/ugc/effectmanager/EffectConfiguration;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->mEffectConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    .line 18
    new-instance v0, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    invoke-direct {v0, p0}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;-><init>(Lcom/ss/android/ugc/effectmanager/context/EffectContext;)V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    .line 19
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getLinkSelectorConfiguration()Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->linkSelectorConfigure(Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;)V

    .line 21
    return-void
.end method


# virtual methods
.method public getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;
    .locals 1

    .line 24
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->mEffectConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    return-object v0
.end method

.method public getLinkSelector()Lcom/ss/android/ugc/effectmanager/link/LinkSelector;
    .locals 1

    .line 28
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    return-object v0
.end method
