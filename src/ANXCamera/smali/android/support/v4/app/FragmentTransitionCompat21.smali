.class Landroid/support/v4/app/FragmentTransitionCompat21;
.super Ljava/lang/Object;
.source "FragmentTransitionCompat21.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/app/FragmentTransitionCompat21$EpicenterView;,
        Landroid/support/v4/app/FragmentTransitionCompat21$ViewRetriever;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 450
    return-void
.end method

.method static synthetic access$000(Ljava/util/ArrayList;Landroid/view/View;)V
    .registers 2
    .param p0, "x0"    # Ljava/util/ArrayList;
    .param p1, "x1"    # Landroid/view/View;

    .line 31
    invoke-static {p0, p1}, Landroid/support/v4/app/FragmentTransitionCompat21;->captureTransitioningViews(Ljava/util/ArrayList;Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$100(Landroid/view/View;)Landroid/graphics/Rect;
    .registers 2
    .param p0, "x0"    # Landroid/view/View;

    .line 31
    invoke-static {p0}, Landroid/support/v4/app/FragmentTransitionCompat21;->getBoundsOnScreen(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v0

    return-object v0
.end method

.method public static addTargets(Ljava/lang/Object;Ljava/util/ArrayList;)V
    .registers 7
    .param p0, "transitionObject"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 416
    .local p1, "views":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    move-object v0, p0

    check-cast v0, Landroid/transition/Transition;

    .line 417
    .local v0, "transition":Landroid/transition/Transition;
    instance-of v1, v0, Landroid/transition/TransitionSet;

    const/4 v2, 0x0

    if-eqz v1, :cond_1d

    .line 418
    move-object v1, v0

    check-cast v1, Landroid/transition/TransitionSet;

    .line 419
    .local v1, "set":Landroid/transition/TransitionSet;
    invoke-virtual {v1}, Landroid/transition/TransitionSet;->getTransitionCount()I

    move-result v3

    .line 420
    .local v3, "numTransitions":I
    nop

    .local v2, "i":I
    :goto_10
    if-ge v2, v3, :cond_1c

    .line 421
    invoke-virtual {v1, v2}, Landroid/transition/TransitionSet;->getTransitionAt(I)Landroid/transition/Transition;

    move-result-object v4

    .line 422
    .local v4, "child":Landroid/transition/Transition;
    invoke-static {v4, p1}, Landroid/support/v4/app/FragmentTransitionCompat21;->addTargets(Ljava/lang/Object;Ljava/util/ArrayList;)V

    .line 420
    .end local v4    # "child":Landroid/transition/Transition;
    add-int/lit8 v2, v2, 0x1

    goto :goto_10

    .line 424
    .end local v1    # "set":Landroid/transition/TransitionSet;
    .end local v2    # "i":I
    .end local v3    # "numTransitions":I
    :cond_1c
    goto :goto_40

    :cond_1d
    invoke-static {v0}, Landroid/support/v4/app/FragmentTransitionCompat21;->hasSimpleTarget(Landroid/transition/Transition;)Z

    move-result v1

    if-nez v1, :cond_40

    .line 425
    invoke-virtual {v0}, Landroid/transition/Transition;->getTargets()Ljava/util/List;

    move-result-object v1

    .line 426
    .local v1, "targets":Ljava/util/List;, "Ljava/util/List<Landroid/view/View;>;"
    invoke-static {v1}, Landroid/support/v4/app/FragmentTransitionCompat21;->isNullOrEmpty(Ljava/util/List;)Z

    move-result v3

    if-eqz v3, :cond_40

    .line 428
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 429
    .local v3, "numViews":I
    nop

    .restart local v2    # "i":I
    :goto_32
    if-ge v2, v3, :cond_40

    .line 430
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/transition/Transition;->addTarget(Landroid/view/View;)Landroid/transition/Transition;

    .line 429
    add-int/lit8 v2, v2, 0x1

    goto :goto_32

    .line 434
    .end local v1    # "targets":Ljava/util/List;, "Ljava/util/List<Landroid/view/View;>;"
    .end local v2    # "i":I
    .end local v3    # "numViews":I
    :cond_40
    :goto_40
    return-void
.end method

.method public static addTransitionTargets(Ljava/lang/Object;Ljava/lang/Object;Landroid/view/View;Landroid/support/v4/app/FragmentTransitionCompat21$ViewRetriever;Landroid/view/View;Landroid/support/v4/app/FragmentTransitionCompat21$EpicenterView;Ljava/util/Map;Ljava/util/ArrayList;Ljava/util/Map;Ljava/util/Map;Ljava/util/ArrayList;)V
    .registers 27
    .param p0, "enterTransitionObject"    # Ljava/lang/Object;
    .param p1, "sharedElementTransitionObject"    # Ljava/lang/Object;
    .param p2, "container"    # Landroid/view/View;
    .param p3, "inFragment"    # Landroid/support/v4/app/FragmentTransitionCompat21$ViewRetriever;
    .param p4, "nonExistentView"    # Landroid/view/View;
    .param p5, "epicenterView"    # Landroid/support/v4/app/FragmentTransitionCompat21$EpicenterView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Landroid/view/View;",
            "Landroid/support/v4/app/FragmentTransitionCompat21$ViewRetriever;",
            "Landroid/view/View;",
            "Landroid/support/v4/app/FragmentTransitionCompat21$EpicenterView;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .local p6, "nameOverrides":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p7, "enteringViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .local p8, "namedViews":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroid/view/View;>;"
    .local p9, "renamedViews":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroid/view/View;>;"
    .local p10, "sharedElementTargets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    move-object/from16 v1, p1

    move-object/from16 v10, p4

    .line 112
    if-nez p0, :cond_10

    if-eqz v1, :cond_9

    goto :goto_10

    .line 157
    :cond_9
    move-object/from16 v0, p5

    move-object/from16 v12, p8

    move-object/from16 v13, p10

    goto :goto_48

    .line 113
    :cond_10
    :goto_10
    move-object/from16 v11, p0

    check-cast v11, Landroid/transition/Transition;

    .line 114
    .local v11, "enterTransition":Landroid/transition/Transition;
    if-eqz v11, :cond_19

    .line 115
    invoke-virtual {v11, v10}, Landroid/transition/Transition;->addTarget(Landroid/view/View;)Landroid/transition/Transition;

    .line 117
    :cond_19
    if-eqz v1, :cond_23

    .line 118
    move-object/from16 v12, p8

    move-object/from16 v13, p10

    invoke-static {v1, v10, v12, v13}, Landroid/support/v4/app/FragmentTransitionCompat21;->setSharedElementTargets(Ljava/lang/Object;Landroid/view/View;Ljava/util/Map;Ljava/util/ArrayList;)V

    goto :goto_27

    .line 122
    :cond_23
    move-object/from16 v12, p8

    move-object/from16 v13, p10

    :goto_27
    if-eqz p3, :cond_43

    .line 123
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v14

    new-instance v9, Landroid/support/v4/app/FragmentTransitionCompat21$2;

    move-object v2, v9

    move-object/from16 v3, p2

    move-object v4, v11

    move-object v5, v10

    move-object/from16 v6, p3

    move-object/from16 v7, p6

    move-object/from16 v8, p9

    move-object v0, v9

    move-object/from16 v9, p7

    invoke-direct/range {v2 .. v9}, Landroid/support/v4/app/FragmentTransitionCompat21$2;-><init>(Landroid/view/View;Landroid/transition/Transition;Landroid/view/View;Landroid/support/v4/app/FragmentTransitionCompat21$ViewRetriever;Ljava/util/Map;Ljava/util/Map;Ljava/util/ArrayList;)V

    invoke-virtual {v14, v0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 155
    :cond_43
    move-object/from16 v0, p5

    invoke-static {v11, v0}, Landroid/support/v4/app/FragmentTransitionCompat21;->setSharedElementEpicenter(Landroid/transition/Transition;Landroid/support/v4/app/FragmentTransitionCompat21$EpicenterView;)V

    .line 157
    .end local v11    # "enterTransition":Landroid/transition/Transition;
    :goto_48
    return-void
.end method

.method public static beginDelayedTransition(Landroid/view/ViewGroup;Ljava/lang/Object;)V
    .registers 3
    .param p0, "sceneRoot"    # Landroid/view/ViewGroup;
    .param p1, "transitionObject"    # Ljava/lang/Object;

    .line 66
    move-object v0, p1

    check-cast v0, Landroid/transition/Transition;

    .line 67
    .local v0, "transition":Landroid/transition/Transition;
    invoke-static {p0, v0}, Landroid/transition/TransitionManager;->beginDelayedTransition(Landroid/view/ViewGroup;Landroid/transition/Transition;)V

    .line 68
    return-void
.end method

.method private static bfsAddViewChildren(Ljava/util/List;Landroid/view/View;)V
    .registers 10
    .param p1, "startView"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;",
            "Landroid/view/View;",
            ")V"
        }
    .end annotation

    .line 246
    .local p0, "views":Ljava/util/List;, "Ljava/util/List<Landroid/view/View;>;"
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    .line 247
    .local v0, "startIndex":I
    invoke-static {p0, p1, v0}, Landroid/support/v4/app/FragmentTransitionCompat21;->containedBeforeIndex(Ljava/util/List;Landroid/view/View;I)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 248
    return-void

    .line 250
    :cond_b
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 251
    move v1, v0

    .local v1, "index":I
    :goto_f
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_3c

    .line 252
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 253
    .local v2, "view":Landroid/view/View;
    instance-of v3, v2, Landroid/view/ViewGroup;

    if-eqz v3, :cond_39

    .line 254
    move-object v3, v2

    check-cast v3, Landroid/view/ViewGroup;

    .line 255
    .local v3, "viewGroup":Landroid/view/ViewGroup;
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    .line 256
    .local v4, "childCount":I
    const/4 v5, 0x0

    .local v5, "childIndex":I
    :goto_27
    if-ge v5, v4, :cond_39

    .line 257
    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 258
    .local v6, "child":Landroid/view/View;
    invoke-static {p0, v6, v0}, Landroid/support/v4/app/FragmentTransitionCompat21;->containedBeforeIndex(Ljava/util/List;Landroid/view/View;I)Z

    move-result v7

    if-nez v7, :cond_36

    .line 259
    invoke-interface {p0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 256
    .end local v6    # "child":Landroid/view/View;
    :cond_36
    add-int/lit8 v5, v5, 0x1

    goto :goto_27

    .line 251
    .end local v2    # "view":Landroid/view/View;
    .end local v3    # "viewGroup":Landroid/view/ViewGroup;
    .end local v4    # "childCount":I
    .end local v5    # "childIndex":I
    :cond_39
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    .line 264
    .end local v1    # "index":I
    :cond_3c
    return-void
.end method

.method public static captureExitingViews(Ljava/lang/Object;Landroid/view/View;Ljava/util/ArrayList;Ljava/util/Map;Landroid/view/View;)Ljava/lang/Object;
    .registers 6
    .param p0, "exitTransition"    # Ljava/lang/Object;
    .param p1, "root"    # Landroid/view/View;
    .param p4, "nonExistentView"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Landroid/view/View;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;",
            "Landroid/view/View;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 45
    .local p2, "viewList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .local p3, "namedViews":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroid/view/View;>;"
    if-eqz p0, :cond_1f

    .line 46
    invoke-static {p2, p1}, Landroid/support/v4/app/FragmentTransitionCompat21;->captureTransitioningViews(Ljava/util/ArrayList;Landroid/view/View;)V

    .line 47
    if-eqz p3, :cond_e

    .line 48
    invoke-interface {p3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 50
    :cond_e
    invoke-virtual {p2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_16

    .line 51
    const/4 p0, 0x0

    goto :goto_1f

    .line 53
    :cond_16
    invoke-virtual {p2, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 54
    move-object v0, p0

    check-cast v0, Landroid/transition/Transition;

    invoke-static {v0, p2}, Landroid/support/v4/app/FragmentTransitionCompat21;->addTargets(Ljava/lang/Object;Ljava/util/ArrayList;)V

    .line 57
    :cond_1f
    :goto_1f
    return-object p0
.end method

.method private static captureTransitioningViews(Ljava/util/ArrayList;Landroid/view/View;)V
    .registers 6
    .param p1, "view"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Landroid/view/View;",
            ")V"
        }
    .end annotation

    .line 306
    .local p0, "transitioningViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_2c

    .line 307
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_29

    .line 308
    move-object v0, p1

    check-cast v0, Landroid/view/ViewGroup;

    .line 309
    .local v0, "viewGroup":Landroid/view/ViewGroup;
    invoke-virtual {v0}, Landroid/view/ViewGroup;->isTransitionGroup()Z

    move-result v1

    if-eqz v1, :cond_17

    .line 310
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_28

    .line 312
    :cond_17
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    .line 313
    .local v1, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1c
    if-ge v2, v1, :cond_28

    .line 314
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 315
    .local v3, "child":Landroid/view/View;
    invoke-static {p0, v3}, Landroid/support/v4/app/FragmentTransitionCompat21;->captureTransitioningViews(Ljava/util/ArrayList;Landroid/view/View;)V

    .line 313
    .end local v3    # "child":Landroid/view/View;
    add-int/lit8 v2, v2, 0x1

    goto :goto_1c

    .line 318
    .end local v0    # "viewGroup":Landroid/view/ViewGroup;
    .end local v1    # "count":I
    .end local v2    # "i":I
    :cond_28
    :goto_28
    goto :goto_2c

    .line 319
    :cond_29
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 322
    :cond_2c
    :goto_2c
    return-void
.end method

.method public static cleanupTransitions(Landroid/view/View;Landroid/view/View;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/Map;)V
    .registers 29
    .param p0, "sceneRoot"    # Landroid/view/View;
    .param p1, "nonExistentView"    # Landroid/view/View;
    .param p2, "enterTransitionObject"    # Ljava/lang/Object;
    .param p4, "exitTransitionObject"    # Ljava/lang/Object;
    .param p6, "sharedElementTransitionObject"    # Ljava/lang/Object;
    .param p8, "overallTransitionObject"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Landroid/view/View;",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 347
    .local p3, "enteringViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .local p5, "exitingViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .local p7, "sharedElementTargets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .local p9, "hiddenViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .local p10, "renamedViews":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroid/view/View;>;"
    move-object/from16 v13, p2

    check-cast v13, Landroid/transition/Transition;

    .line 348
    .local v13, "enterTransition":Landroid/transition/Transition;
    move-object/from16 v14, p4

    check-cast v14, Landroid/transition/Transition;

    .line 349
    .local v14, "exitTransition":Landroid/transition/Transition;
    move-object/from16 v15, p6

    check-cast v15, Landroid/transition/Transition;

    .line 350
    .local v15, "sharedElementTransition":Landroid/transition/Transition;
    move-object/from16 v16, p8

    check-cast v16, Landroid/transition/Transition;

    .line 351
    .local v16, "overallTransition":Landroid/transition/Transition;
    if-eqz v16, :cond_37

    .line 352
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v12

    new-instance v11, Landroid/support/v4/app/FragmentTransitionCompat21$4;

    move-object v1, v11

    move-object/from16 v2, p0

    move-object v3, v13

    move-object/from16 v4, p3

    move-object v5, v14

    move-object/from16 v6, p5

    move-object v7, v15

    move-object/from16 v8, p7

    move-object/from16 v9, p10

    move-object/from16 v10, p9

    move-object v0, v11

    move-object/from16 v11, v16

    move-object/from16 v17, v13

    move-object v13, v12

    move-object/from16 v12, p1

    .end local v13    # "enterTransition":Landroid/transition/Transition;
    .local v17, "enterTransition":Landroid/transition/Transition;
    invoke-direct/range {v1 .. v12}, Landroid/support/v4/app/FragmentTransitionCompat21$4;-><init>(Landroid/view/View;Landroid/transition/Transition;Ljava/util/ArrayList;Landroid/transition/Transition;Ljava/util/ArrayList;Landroid/transition/Transition;Ljava/util/ArrayList;Ljava/util/Map;Ljava/util/ArrayList;Landroid/transition/Transition;Landroid/view/View;)V

    invoke-virtual {v13, v0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    goto :goto_39

    .line 379
    .end local v17    # "enterTransition":Landroid/transition/Transition;
    .restart local v13    # "enterTransition":Landroid/transition/Transition;
    :cond_37
    move-object/from16 v17, v13

    .end local v13    # "enterTransition":Landroid/transition/Transition;
    .restart local v17    # "enterTransition":Landroid/transition/Transition;
    :goto_39
    return-void
.end method

.method public static cloneTransition(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .param p0, "transition"    # Ljava/lang/Object;

    .line 37
    if-eqz p0, :cond_9

    .line 38
    move-object v0, p0

    check-cast v0, Landroid/transition/Transition;

    invoke-virtual {v0}, Landroid/transition/Transition;->clone()Landroid/transition/Transition;

    move-result-object p0

    .line 40
    :cond_9
    return-object p0
.end method

.method private static containedBeforeIndex(Ljava/util/List;Landroid/view/View;I)Z
    .registers 6
    .param p1, "view"    # Landroid/view/View;
    .param p2, "maxIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;",
            "Landroid/view/View;",
            "I)Z"
        }
    .end annotation

    .line 271
    .local p0, "views":Ljava/util/List;, "Ljava/util/List<Landroid/view/View;>;"
    const/4 v0, 0x0

    move v1, v0

    .local v1, "i":I
    :goto_2
    if-ge v1, p2, :cond_f

    .line 272
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, p1, :cond_c

    .line 273
    const/4 v0, 0x1

    return v0

    .line 271
    :cond_c
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 276
    .end local v1    # "i":I
    :cond_f
    return v0
.end method

.method public static excludeTarget(Ljava/lang/Object;Landroid/view/View;Z)V
    .registers 4
    .param p0, "transitionObject"    # Ljava/lang/Object;
    .param p1, "view"    # Landroid/view/View;
    .param p2, "exclude"    # Z

    .line 61
    move-object v0, p0

    check-cast v0, Landroid/transition/Transition;

    .line 62
    .local v0, "transition":Landroid/transition/Transition;
    invoke-virtual {v0, p1, p2}, Landroid/transition/Transition;->excludeTarget(Landroid/view/View;Z)Landroid/transition/Transition;

    .line 63
    return-void
.end method

.method public static findNamedViews(Ljava/util/Map;Landroid/view/View;)V
    .registers 7
    .param p1, "view"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;",
            "Landroid/view/View;",
            ")V"
        }
    .end annotation

    .line 325
    .local p0, "namedViews":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroid/view/View;>;"
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_27

    .line 326
    invoke-virtual {p1}, Landroid/view/View;->getTransitionName()Ljava/lang/String;

    move-result-object v0

    .line 327
    .local v0, "transitionName":Ljava/lang/String;
    if-eqz v0, :cond_f

    .line 328
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 330
    :cond_f
    instance-of v1, p1, Landroid/view/ViewGroup;

    if-eqz v1, :cond_27

    .line 331
    move-object v1, p1

    check-cast v1, Landroid/view/ViewGroup;

    .line 332
    .local v1, "viewGroup":Landroid/view/ViewGroup;
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    .line 333
    .local v2, "count":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1b
    if-ge v3, v2, :cond_27

    .line 334
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 335
    .local v4, "child":Landroid/view/View;
    invoke-static {p0, v4}, Landroid/support/v4/app/FragmentTransitionCompat21;->findNamedViews(Ljava/util/Map;Landroid/view/View;)V

    .line 333
    .end local v4    # "child":Landroid/view/View;
    add-int/lit8 v3, v3, 0x1

    goto :goto_1b

    .line 339
    .end local v0    # "transitionName":Ljava/lang/String;
    .end local v1    # "viewGroup":Landroid/view/ViewGroup;
    .end local v2    # "count":I
    .end local v3    # "i":I
    :cond_27
    return-void
.end method

.method private static getBoundsOnScreen(Landroid/view/View;)Landroid/graphics/Rect;
    .registers 8
    .param p0, "view"    # Landroid/view/View;

    .line 297
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 298
    .local v0, "epicenter":Landroid/graphics/Rect;
    const/4 v1, 0x2

    new-array v1, v1, [I

    .line 299
    .local v1, "loc":[I
    invoke-virtual {p0, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 301
    const/4 v2, 0x0

    aget v3, v1, v2

    const/4 v4, 0x1

    aget v5, v1, v4

    aget v2, v1, v2

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v6

    add-int/2addr v2, v6

    aget v4, v1, v4

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v6

    add-int/2addr v4, v6

    invoke-virtual {v0, v3, v5, v2, v4}, Landroid/graphics/Rect;->set(IIII)V

    .line 302
    return-object v0
.end method

.method public static getTransitionName(Landroid/view/View;)Ljava/lang/String;
    .registers 2
    .param p0, "view"    # Landroid/view/View;

    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getTransitionName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static hasSimpleTarget(Landroid/transition/Transition;)Z
    .registers 2
    .param p0, "transition"    # Landroid/transition/Transition;

    .line 437
    invoke-virtual {p0}, Landroid/transition/Transition;->getTargetIds()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/app/FragmentTransitionCompat21;->isNullOrEmpty(Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_21

    invoke-virtual {p0}, Landroid/transition/Transition;->getTargetNames()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/app/FragmentTransitionCompat21;->isNullOrEmpty(Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_21

    invoke-virtual {p0}, Landroid/transition/Transition;->getTargetTypes()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/app/FragmentTransitionCompat21;->isNullOrEmpty(Ljava/util/List;)Z

    move-result v0

    if-nez v0, :cond_1f

    goto :goto_21

    :cond_1f
    const/4 v0, 0x0

    goto :goto_22

    :cond_21
    :goto_21
    const/4 v0, 0x1

    :goto_22
    return v0
.end method

.method private static isNullOrEmpty(Ljava/util/List;)Z
    .registers 2
    .param p0, "list"    # Ljava/util/List;

    .line 443
    if-eqz p0, :cond_b

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    goto :goto_b

    :cond_9
    const/4 v0, 0x0

    goto :goto_c

    :cond_b
    :goto_b
    const/4 v0, 0x1

    :goto_c
    return v0
.end method

.method public static mergeTransitions(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Z)Ljava/lang/Object;
    .registers 11
    .param p0, "enterTransitionObject"    # Ljava/lang/Object;
    .param p1, "exitTransitionObject"    # Ljava/lang/Object;
    .param p2, "sharedElementTransitionObject"    # Ljava/lang/Object;
    .param p3, "allowOverlap"    # Z

    .line 162
    const/4 v0, 0x1

    .line 163
    .local v0, "overlap":Z
    move-object v1, p0

    check-cast v1, Landroid/transition/Transition;

    .line 164
    .local v1, "enterTransition":Landroid/transition/Transition;
    move-object v2, p1

    check-cast v2, Landroid/transition/Transition;

    .line 165
    .local v2, "exitTransition":Landroid/transition/Transition;
    move-object v3, p2

    check-cast v3, Landroid/transition/Transition;

    .line 167
    .local v3, "sharedElementTransition":Landroid/transition/Transition;
    if-eqz v1, :cond_f

    if-eqz v2, :cond_f

    .line 168
    move v0, p3

    .line 176
    :cond_f
    if-eqz v0, :cond_27

    .line 178
    new-instance v4, Landroid/transition/TransitionSet;

    invoke-direct {v4}, Landroid/transition/TransitionSet;-><init>()V

    .line 179
    .local v4, "transitionSet":Landroid/transition/TransitionSet;
    if-eqz v1, :cond_1b

    .line 180
    invoke-virtual {v4, v1}, Landroid/transition/TransitionSet;->addTransition(Landroid/transition/Transition;)Landroid/transition/TransitionSet;

    .line 182
    :cond_1b
    if-eqz v2, :cond_20

    .line 183
    invoke-virtual {v4, v2}, Landroid/transition/TransitionSet;->addTransition(Landroid/transition/Transition;)Landroid/transition/TransitionSet;

    .line 185
    :cond_20
    if-eqz v3, :cond_25

    .line 186
    invoke-virtual {v4, v3}, Landroid/transition/TransitionSet;->addTransition(Landroid/transition/Transition;)Landroid/transition/TransitionSet;

    .line 188
    :cond_25
    nop

    .line 189
    .local v4, "transition":Landroid/transition/Transition;
    goto :goto_59

    .line 192
    .end local v4    # "transition":Landroid/transition/Transition;
    :cond_27
    const/4 v4, 0x0

    .line 193
    .local v4, "staggered":Landroid/transition/Transition;
    if-eqz v2, :cond_3f

    if-eqz v1, :cond_3f

    .line 194
    new-instance v5, Landroid/transition/TransitionSet;

    invoke-direct {v5}, Landroid/transition/TransitionSet;-><init>()V

    invoke-virtual {v5, v2}, Landroid/transition/TransitionSet;->addTransition(Landroid/transition/Transition;)Landroid/transition/TransitionSet;

    move-result-object v5

    invoke-virtual {v5, v1}, Landroid/transition/TransitionSet;->addTransition(Landroid/transition/Transition;)Landroid/transition/TransitionSet;

    move-result-object v5

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Landroid/transition/TransitionSet;->setOrdering(I)Landroid/transition/TransitionSet;

    move-result-object v4

    goto :goto_46

    .line 198
    :cond_3f
    if-eqz v2, :cond_43

    .line 199
    move-object v4, v2

    goto :goto_46

    .line 200
    :cond_43
    if-eqz v1, :cond_46

    .line 201
    move-object v4, v1

    .line 203
    :cond_46
    :goto_46
    if-eqz v3, :cond_59

    .line 204
    new-instance v5, Landroid/transition/TransitionSet;

    invoke-direct {v5}, Landroid/transition/TransitionSet;-><init>()V

    .line 205
    .local v5, "together":Landroid/transition/TransitionSet;
    if-eqz v4, :cond_52

    .line 206
    invoke-virtual {v5, v4}, Landroid/transition/TransitionSet;->addTransition(Landroid/transition/Transition;)Landroid/transition/TransitionSet;

    .line 208
    :cond_52
    invoke-virtual {v5, v3}, Landroid/transition/TransitionSet;->addTransition(Landroid/transition/Transition;)Landroid/transition/TransitionSet;

    .line 209
    nop

    .line 210
    .local v5, "transition":Landroid/transition/Transition;
    nop

    .line 211
    move-object v4, v5

    nop

    .line 214
    .end local v5    # "transition":Landroid/transition/Transition;
    .local v4, "transition":Landroid/transition/Transition;
    :cond_59
    :goto_59
    return-object v4
.end method

.method public static removeTargets(Ljava/lang/Object;Ljava/util/ArrayList;)V
    .registers 7
    .param p0, "transitionObject"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 387
    .local p1, "views":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    move-object v0, p0

    check-cast v0, Landroid/transition/Transition;

    .line 388
    .local v0, "transition":Landroid/transition/Transition;
    instance-of v1, v0, Landroid/transition/TransitionSet;

    if-eqz v1, :cond_1c

    .line 389
    move-object v1, v0

    check-cast v1, Landroid/transition/TransitionSet;

    .line 390
    .local v1, "set":Landroid/transition/TransitionSet;
    invoke-virtual {v1}, Landroid/transition/TransitionSet;->getTransitionCount()I

    move-result v2

    .line 391
    .local v2, "numTransitions":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_f
    if-ge v3, v2, :cond_1b

    .line 392
    invoke-virtual {v1, v3}, Landroid/transition/TransitionSet;->getTransitionAt(I)Landroid/transition/Transition;

    move-result-object v4

    .line 393
    .local v4, "child":Landroid/transition/Transition;
    invoke-static {v4, p1}, Landroid/support/v4/app/FragmentTransitionCompat21;->removeTargets(Ljava/lang/Object;Ljava/util/ArrayList;)V

    .line 391
    .end local v4    # "child":Landroid/transition/Transition;
    add-int/lit8 v3, v3, 0x1

    goto :goto_f

    .line 395
    .end local v1    # "set":Landroid/transition/TransitionSet;
    .end local v2    # "numTransitions":I
    .end local v3    # "i":I
    :cond_1b
    goto :goto_4c

    :cond_1c
    invoke-static {v0}, Landroid/support/v4/app/FragmentTransitionCompat21;->hasSimpleTarget(Landroid/transition/Transition;)Z

    move-result v1

    if-nez v1, :cond_4c

    .line 396
    invoke-virtual {v0}, Landroid/transition/Transition;->getTargets()Ljava/util/List;

    move-result-object v1

    .line 397
    .local v1, "targets":Ljava/util/List;, "Ljava/util/List<Landroid/view/View;>;"
    if-eqz v1, :cond_4c

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ne v2, v3, :cond_4c

    invoke-interface {v1, p1}, Ljava/util/List;->containsAll(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_4c

    .line 400
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    .local v2, "i":I
    :goto_3e
    if-ltz v2, :cond_4c

    .line 401
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/transition/Transition;->removeTarget(Landroid/view/View;)Landroid/transition/Transition;

    .line 400
    add-int/lit8 v2, v2, -0x1

    goto :goto_3e

    .line 405
    .end local v1    # "targets":Ljava/util/List;, "Ljava/util/List<Landroid/view/View;>;"
    .end local v2    # "i":I
    :cond_4c
    :goto_4c
    return-void
.end method

.method public static setEpicenter(Ljava/lang/Object;Landroid/view/View;)V
    .registers 5
    .param p0, "transitionObject"    # Ljava/lang/Object;
    .param p1, "view"    # Landroid/view/View;

    .line 71
    move-object v0, p0

    check-cast v0, Landroid/transition/Transition;

    .line 72
    .local v0, "transition":Landroid/transition/Transition;
    invoke-static {p1}, Landroid/support/v4/app/FragmentTransitionCompat21;->getBoundsOnScreen(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v1

    .line 74
    .local v1, "epicenter":Landroid/graphics/Rect;
    new-instance v2, Landroid/support/v4/app/FragmentTransitionCompat21$1;

    invoke-direct {v2, v1}, Landroid/support/v4/app/FragmentTransitionCompat21$1;-><init>(Landroid/graphics/Rect;)V

    invoke-virtual {v0, v2}, Landroid/transition/Transition;->setEpicenterCallback(Landroid/transition/Transition$EpicenterCallback;)V

    .line 80
    return-void
.end method

.method private static setSharedElementEpicenter(Landroid/transition/Transition;Landroid/support/v4/app/FragmentTransitionCompat21$EpicenterView;)V
    .registers 3
    .param p0, "transition"    # Landroid/transition/Transition;
    .param p1, "epicenterView"    # Landroid/support/v4/app/FragmentTransitionCompat21$EpicenterView;

    .line 281
    if-eqz p0, :cond_a

    .line 282
    new-instance v0, Landroid/support/v4/app/FragmentTransitionCompat21$3;

    invoke-direct {v0, p1}, Landroid/support/v4/app/FragmentTransitionCompat21$3;-><init>(Landroid/support/v4/app/FragmentTransitionCompat21$EpicenterView;)V

    invoke-virtual {p0, v0}, Landroid/transition/Transition;->setEpicenterCallback(Landroid/transition/Transition$EpicenterCallback;)V

    .line 294
    :cond_a
    return-void
.end method

.method public static setSharedElementTargets(Ljava/lang/Object;Landroid/view/View;Ljava/util/Map;Ljava/util/ArrayList;)V
    .registers 9
    .param p0, "transitionObj"    # Ljava/lang/Object;
    .param p1, "nonExistentView"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Landroid/view/View;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 226
    .local p2, "namedViews":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroid/view/View;>;"
    .local p3, "sharedElementTargets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    move-object v0, p0

    check-cast v0, Landroid/transition/TransitionSet;

    .line 227
    .local v0, "transition":Landroid/transition/TransitionSet;
    invoke-virtual {p3}, Ljava/util/ArrayList;->clear()V

    .line 228
    invoke-interface {p2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-virtual {p3, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 230
    invoke-virtual {v0}, Landroid/transition/TransitionSet;->getTargets()Ljava/util/List;

    move-result-object v1

    .line 231
    .local v1, "views":Ljava/util/List;, "Ljava/util/List<Landroid/view/View;>;"
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 232
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 233
    .local v2, "count":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_19
    if-ge v3, v2, :cond_27

    .line 234
    invoke-virtual {p3, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    .line 235
    .local v4, "view":Landroid/view/View;
    invoke-static {v1, v4}, Landroid/support/v4/app/FragmentTransitionCompat21;->bfsAddViewChildren(Ljava/util/List;Landroid/view/View;)V

    .line 233
    .end local v4    # "view":Landroid/view/View;
    add-int/lit8 v3, v3, 0x1

    goto :goto_19

    .line 237
    .end local v3    # "i":I
    :cond_27
    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 238
    invoke-static {v0, p3}, Landroid/support/v4/app/FragmentTransitionCompat21;->addTargets(Ljava/lang/Object;Ljava/util/ArrayList;)V

    .line 239
    return-void
.end method

.method public static wrapSharedElementTransition(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p0, "transitionObj"    # Ljava/lang/Object;

    .line 83
    const/4 v0, 0x0

    if-nez p0, :cond_4

    .line 84
    return-object v0

    .line 86
    :cond_4
    move-object v1, p0

    check-cast v1, Landroid/transition/Transition;

    .line 87
    .local v1, "transition":Landroid/transition/Transition;
    if-nez v1, :cond_a

    .line 88
    return-object v0

    .line 90
    :cond_a
    new-instance v0, Landroid/transition/TransitionSet;

    invoke-direct {v0}, Landroid/transition/TransitionSet;-><init>()V

    .line 91
    .local v0, "transitionSet":Landroid/transition/TransitionSet;
    invoke-virtual {v0, v1}, Landroid/transition/TransitionSet;->addTransition(Landroid/transition/Transition;)Landroid/transition/TransitionSet;

    .line 92
    return-object v0
.end method
