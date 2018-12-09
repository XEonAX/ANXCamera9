.class public Lcom/android/camera/ui/ModeSelectView;
.super Landroid/widget/LinearLayout;
.source "ModeSelectView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/ui/ModeSelectView$onModeClickedListener;
    }
.end annotation


# instance fields
.field private mLastActivateTextView:Lcom/android/camera/ui/ColorActivateTextView;

.field private mOnModeClickedListener:Lcom/android/camera/ui/ModeSelectView$onModeClickedListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 35
    invoke-virtual {p0}, Lcom/android/camera/ui/ModeSelectView;->initView()V

    .line 36
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 39
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 40
    invoke-virtual {p0}, Lcom/android/camera/ui/ModeSelectView;->initView()V

    .line 41
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 44
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 45
    invoke-virtual {p0}, Lcom/android/camera/ui/ModeSelectView;->initView()V

    .line 46
    return-void
.end method

.method private static final getChildMeasureWidth(Landroid/view/View;)I
    .locals 2

    .line 126
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 127
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr v1, v0

    .line 129
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    .line 130
    if-lez v0, :cond_0

    .line 131
    add-int/2addr v0, v1

    return v0

    .line 133
    :cond_0
    const/4 v0, 0x0

    invoke-static {v0, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    .line 134
    invoke-virtual {p0, v0, v0}, Landroid/view/View;->measure(II)V

    .line 135
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result p0

    add-int/2addr p0, v1

    return p0
.end method

.method private scrollTo(ILjava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lio/reactivex/Completable;",
            ">;)V"
        }
    .end annotation

    .line 139
    if-nez p2, :cond_0

    .line 140
    invoke-static {p0, p1}, Lcom/android/camera/animation/type/TranslateXOnSubscribe;->directSetResult(Landroid/view/View;I)V

    goto :goto_0

    .line 142
    :cond_0
    new-instance v0, Lcom/android/camera/animation/type/TranslateXOnSubscribe;

    invoke-direct {v0, p0, p1}, Lcom/android/camera/animation/type/TranslateXOnSubscribe;-><init>(Landroid/view/View;I)V

    const/16 p1, 0x12c

    .line 143
    invoke-virtual {v0, p1}, Lcom/android/camera/animation/type/TranslateXOnSubscribe;->setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    .line 142
    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 145
    :goto_0
    return-void
.end method

.method private setSelection(ILjava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lio/reactivex/Completable;",
            ">;)V"
        }
    .end annotation

    .line 101
    iget-object v0, p0, Lcom/android/camera/ui/ModeSelectView;->mLastActivateTextView:Lcom/android/camera/ui/ColorActivateTextView;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 102
    iget-object v0, p0, Lcom/android/camera/ui/ModeSelectView;->mLastActivateTextView:Lcom/android/camera/ui/ColorActivateTextView;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/ColorActivateTextView;->setActivated(Z)V

    .line 105
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/camera/ui/ModeSelectView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/ColorActivateTextView;

    .line 106
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/android/camera/ui/ColorActivateTextView;->setActivated(Z)V

    .line 107
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 108
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/android/camera/ui/ColorActivateTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    invoke-virtual {p0}, Lcom/android/camera/ui/ModeSelectView;->getContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f0b00e9

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 108
    invoke-virtual {v0, v2}, Lcom/android/camera/ui/ColorActivateTextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 110
    const/16 v2, 0x80

    invoke-virtual {v0, v2}, Lcom/android/camera/ui/ColorActivateTextView;->sendAccessibilityEvent(I)V

    .line 112
    :cond_1
    iput-object v0, p0, Lcom/android/camera/ui/ModeSelectView;->mLastActivateTextView:Lcom/android/camera/ui/ColorActivateTextView;

    .line 114
    nop

    .line 115
    move v2, v1

    :goto_0
    if-ge v1, p1, :cond_2

    .line 116
    invoke-virtual {p0, v1}, Lcom/android/camera/ui/ModeSelectView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-static {v3}, Lcom/android/camera/Util;->getChildMeasureWidth(Landroid/view/View;)I

    move-result v3

    add-int/2addr v2, v3

    .line 115
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 118
    :cond_2
    invoke-static {v0}, Lcom/android/camera/ui/ModeSelectView;->getChildMeasureWidth(Landroid/view/View;)I

    move-result p1

    div-int/lit8 p1, p1, 0x2

    add-int/2addr v2, p1

    .line 119
    invoke-virtual {p0}, Lcom/android/camera/ui/ModeSelectView;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    div-int/lit8 p1, p1, 0x2

    .line 120
    sub-int/2addr p1, v2

    .line 121
    invoke-virtual {p0}, Lcom/android/camera/ui/ModeSelectView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/Util;->isLayoutRTL(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_3

    neg-int p1, p1

    .line 122
    :cond_3
    invoke-direct {p0, p1, p2}, Lcom/android/camera/ui/ModeSelectView;->scrollTo(ILjava/util/List;)V

    .line 123
    return-void
.end method


# virtual methods
.method public init(Lcom/android/camera/data/data/global/ComponentModuleList;I)V
    .locals 5

    .line 61
    invoke-virtual {p0}, Lcom/android/camera/ui/ModeSelectView;->removeAllViews()V

    .line 64
    invoke-virtual {p1}, Lcom/android/camera/data/data/global/ComponentModuleList;->getItems()Ljava/util/List;

    move-result-object p1

    .line 65
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 66
    invoke-virtual {p0}, Lcom/android/camera/ui/ModeSelectView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    .line 67
    const v4, 0x7f040026

    .line 68
    invoke-virtual {v3, v4, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/android/camera/ui/ColorActivateTextView;

    .line 70
    invoke-virtual {v2, p0}, Lcom/android/camera/ui/ColorActivateTextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 71
    const v3, -0x66000001

    invoke-virtual {v2, v3}, Lcom/android/camera/ui/ColorActivateTextView;->setNormalCor(I)V

    .line 73
    iget-object v3, v1, Lcom/android/camera/data/data/ComponentDataItem;->mValue:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 74
    nop

    .line 76
    const v4, -0xff5701

    invoke-virtual {v2, v4}, Lcom/android/camera/ui/ColorActivateTextView;->setActivateColor(I)V

    .line 80
    iget v1, v1, Lcom/android/camera/data/data/ComponentDataItem;->mDisplayNameRes:I

    invoke-virtual {v2, v1}, Lcom/android/camera/ui/ColorActivateTextView;->setText(I)V

    .line 81
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/android/camera/ui/ColorActivateTextView;->setTag(Ljava/lang/Object;)V

    .line 82
    invoke-virtual {p0, v2}, Lcom/android/camera/ui/ModeSelectView;->addView(Landroid/view/View;)V

    .line 83
    goto :goto_0

    .line 86
    :cond_0
    const/16 v0, 0xa8

    if-eq p2, v0, :cond_1

    const/16 v0, 0xaa

    if-eq p2, v0, :cond_1

    const/16 v0, 0xa9

    if-ne p2, v0, :cond_2

    .line 89
    :cond_1
    const/16 p2, 0xa2

    .line 92
    :cond_2
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-ge v2, v0, :cond_4

    .line 93
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/ComponentDataItem;

    iget-object v0, v0, Lcom/android/camera/data/data/ComponentDataItem;->mValue:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne v0, p2, :cond_3

    .line 94
    const/4 p1, 0x0

    invoke-direct {p0, v2, p1}, Lcom/android/camera/ui/ModeSelectView;->setSelection(ILjava/util/List;)V

    .line 95
    goto :goto_2

    .line 92
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 98
    :cond_4
    :goto_2
    return-void
.end method

.method public initView()V
    .locals 0

    .line 50
    return-void
.end method

.method public judgePosition(ILjava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lio/reactivex/Completable;",
            ">;)V"
        }
    .end annotation

    .line 160
    iget-object v0, p0, Lcom/android/camera/ui/ModeSelectView;->mLastActivateTextView:Lcom/android/camera/ui/ColorActivateTextView;

    if-nez v0, :cond_0

    .line 161
    return-void

    .line 164
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/ModeSelectView;->mLastActivateTextView:Lcom/android/camera/ui/ColorActivateTextView;

    invoke-virtual {v0}, Lcom/android/camera/ui/ColorActivateTextView;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 165
    if-ne v0, p1, :cond_1

    .line 166
    return-void

    .line 169
    :cond_1
    const/16 v0, 0xa8

    if-eq p1, v0, :cond_2

    const/16 v0, 0xaa

    if-eq p1, v0, :cond_2

    const/16 v0, 0xa9

    if-ne p1, v0, :cond_3

    .line 172
    :cond_2
    const/16 p1, 0xa2

    .line 175
    :cond_3
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/ui/ModeSelectView;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_6

    .line 176
    invoke-virtual {p0, v0}, Lcom/android/camera/ui/ModeSelectView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 177
    if-ne p1, v1, :cond_4

    .line 178
    invoke-direct {p0, v0, p2}, Lcom/android/camera/ui/ModeSelectView;->setSelection(ILjava/util/List;)V

    goto :goto_1

    .line 180
    :cond_4
    invoke-virtual {p0, v0}, Lcom/android/camera/ui/ModeSelectView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/camera/ui/ColorActivateTextView;

    .line 181
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 182
    invoke-virtual {v1}, Lcom/android/camera/ui/ColorActivateTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/ColorActivateTextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 175
    :cond_5
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 186
    :cond_6
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 149
    invoke-virtual {p0}, Lcom/android/camera/ui/ModeSelectView;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 150
    return-void

    .line 152
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/ModeSelectView;->mOnModeClickedListener:Lcom/android/camera/ui/ModeSelectView$onModeClickedListener;

    if-eqz v0, :cond_1

    .line 153
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 154
    iget-object v0, p0, Lcom/android/camera/ui/ModeSelectView;->mOnModeClickedListener:Lcom/android/camera/ui/ModeSelectView$onModeClickedListener;

    invoke-interface {v0, p1}, Lcom/android/camera/ui/ModeSelectView$onModeClickedListener;->onModeClicked(I)V

    .line 156
    :cond_1
    return-void
.end method

.method public setOnModeClickedListener(Lcom/android/camera/ui/ModeSelectView$onModeClickedListener;)V
    .locals 0

    .line 57
    iput-object p1, p0, Lcom/android/camera/ui/ModeSelectView;->mOnModeClickedListener:Lcom/android/camera/ui/ModeSelectView$onModeClickedListener;

    .line 58
    return-void
.end method
