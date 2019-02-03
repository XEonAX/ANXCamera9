.class final Landroid/support/v4/app/FragmentTransitionCompat21$2;
.super Ljava/lang/Object;
.source "FragmentTransitionCompat21.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/app/FragmentTransitionCompat21;->addTransitionTargets(Ljava/lang/Object;Ljava/lang/Object;Landroid/view/View;Landroid/support/v4/app/FragmentTransitionCompat21$ViewRetriever;Landroid/view/View;Landroid/support/v4/app/FragmentTransitionCompat21$EpicenterView;Ljava/util/Map;Ljava/util/ArrayList;Ljava/util/Map;Ljava/util/Map;Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$container:Landroid/view/View;

.field final synthetic val$enterTransition:Landroid/transition/Transition;

.field final synthetic val$enteringViews:Ljava/util/ArrayList;

.field final synthetic val$inFragment:Landroid/support/v4/app/FragmentTransitionCompat21$ViewRetriever;

.field final synthetic val$nameOverrides:Ljava/util/Map;

.field final synthetic val$nonExistentView:Landroid/view/View;

.field final synthetic val$renamedViews:Ljava/util/Map;


# direct methods
.method constructor <init>(Landroid/view/View;Landroid/transition/Transition;Landroid/view/View;Landroid/support/v4/app/FragmentTransitionCompat21$ViewRetriever;Ljava/util/Map;Ljava/util/Map;Ljava/util/ArrayList;)V
    .registers 8

    .line 124
    iput-object p1, p0, Landroid/support/v4/app/FragmentTransitionCompat21$2;->val$container:Landroid/view/View;

    iput-object p2, p0, Landroid/support/v4/app/FragmentTransitionCompat21$2;->val$enterTransition:Landroid/transition/Transition;

    iput-object p3, p0, Landroid/support/v4/app/FragmentTransitionCompat21$2;->val$nonExistentView:Landroid/view/View;

    iput-object p4, p0, Landroid/support/v4/app/FragmentTransitionCompat21$2;->val$inFragment:Landroid/support/v4/app/FragmentTransitionCompat21$ViewRetriever;

    iput-object p5, p0, Landroid/support/v4/app/FragmentTransitionCompat21$2;->val$nameOverrides:Ljava/util/Map;

    iput-object p6, p0, Landroid/support/v4/app/FragmentTransitionCompat21$2;->val$renamedViews:Ljava/util/Map;

    iput-object p7, p0, Landroid/support/v4/app/FragmentTransitionCompat21$2;->val$enteringViews:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .registers 7

    .line 126
    iget-object v0, p0, Landroid/support/v4/app/FragmentTransitionCompat21$2;->val$container:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 127
    iget-object v0, p0, Landroid/support/v4/app/FragmentTransitionCompat21$2;->val$enterTransition:Landroid/transition/Transition;

    if-eqz v0, :cond_14

    .line 128
    iget-object v0, p0, Landroid/support/v4/app/FragmentTransitionCompat21$2;->val$enterTransition:Landroid/transition/Transition;

    iget-object v1, p0, Landroid/support/v4/app/FragmentTransitionCompat21$2;->val$nonExistentView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/transition/Transition;->removeTarget(Landroid/view/View;)Landroid/transition/Transition;

    .line 130
    :cond_14
    iget-object v0, p0, Landroid/support/v4/app/FragmentTransitionCompat21$2;->val$inFragment:Landroid/support/v4/app/FragmentTransitionCompat21$ViewRetriever;

    invoke-interface {v0}, Landroid/support/v4/app/FragmentTransitionCompat21$ViewRetriever;->getView()Landroid/view/View;

    move-result-object v0

    .line 131
    .local v0, "fragmentView":Landroid/view/View;
    if-eqz v0, :cond_8a

    .line 132
    iget-object v1, p0, Landroid/support/v4/app/FragmentTransitionCompat21$2;->val$nameOverrides:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_68

    .line 133
    iget-object v1, p0, Landroid/support/v4/app/FragmentTransitionCompat21$2;->val$renamedViews:Ljava/util/Map;

    invoke-static {v1, v0}, Landroid/support/v4/app/FragmentTransitionCompat21;->findNamedViews(Ljava/util/Map;Landroid/view/View;)V

    .line 134
    iget-object v1, p0, Landroid/support/v4/app/FragmentTransitionCompat21$2;->val$renamedViews:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    iget-object v2, p0, Landroid/support/v4/app/FragmentTransitionCompat21$2;->val$nameOverrides:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->retainAll(Ljava/util/Collection;)Z

    .line 135
    iget-object v1, p0, Landroid/support/v4/app/FragmentTransitionCompat21$2;->val$nameOverrides:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_42
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_68

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 136
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 137
    .local v3, "to":Ljava/lang/String;
    iget-object v4, p0, Landroid/support/v4/app/FragmentTransitionCompat21$2;->val$renamedViews:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    .line 138
    .local v4, "view":Landroid/view/View;
    if-eqz v4, :cond_67

    .line 139
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 140
    .local v5, "from":Ljava/lang/String;
    invoke-virtual {v4, v5}, Landroid/view/View;->setTransitionName(Ljava/lang/String;)V

    .line 142
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3    # "to":Ljava/lang/String;
    .end local v4    # "view":Landroid/view/View;
    .end local v5    # "from":Ljava/lang/String;
    :cond_67
    goto :goto_42

    .line 144
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_68
    iget-object v1, p0, Landroid/support/v4/app/FragmentTransitionCompat21$2;->val$enterTransition:Landroid/transition/Transition;

    if-eqz v1, :cond_8a

    .line 145
    iget-object v1, p0, Landroid/support/v4/app/FragmentTransitionCompat21$2;->val$enteringViews:Ljava/util/ArrayList;

    # invokes: Landroid/support/v4/app/FragmentTransitionCompat21;->captureTransitioningViews(Ljava/util/ArrayList;Landroid/view/View;)V
    invoke-static {v1, v0}, Landroid/support/v4/app/FragmentTransitionCompat21;->access$000(Ljava/util/ArrayList;Landroid/view/View;)V

    .line 146
    iget-object v1, p0, Landroid/support/v4/app/FragmentTransitionCompat21$2;->val$enteringViews:Ljava/util/ArrayList;

    iget-object v2, p0, Landroid/support/v4/app/FragmentTransitionCompat21$2;->val$renamedViews:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 147
    iget-object v1, p0, Landroid/support/v4/app/FragmentTransitionCompat21$2;->val$enteringViews:Ljava/util/ArrayList;

    iget-object v2, p0, Landroid/support/v4/app/FragmentTransitionCompat21$2;->val$nonExistentView:Landroid/view/View;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 148
    iget-object v1, p0, Landroid/support/v4/app/FragmentTransitionCompat21$2;->val$enterTransition:Landroid/transition/Transition;

    iget-object v2, p0, Landroid/support/v4/app/FragmentTransitionCompat21$2;->val$enteringViews:Ljava/util/ArrayList;

    invoke-static {v1, v2}, Landroid/support/v4/app/FragmentTransitionCompat21;->addTargets(Ljava/lang/Object;Ljava/util/ArrayList;)V

    .line 151
    :cond_8a
    const/4 v1, 0x1

    return v1
.end method
