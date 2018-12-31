.class public Lcom/android/camera/fragment/FragmentVertical;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentVertical.java"

# interfaces
.implements Lcom/android/camera/protocol/ModeProtocol$VerticalProtocol;


# instance fields
.field private mLeftAlertStatus:Landroid/widget/TextView;

.field private mLeftLightingPattern:Landroid/widget/TextView;

.field private mRightAlertStatus:Landroid/widget/TextView;

.field private mRightLightingPattern:Landroid/widget/TextView;

.field private mStateValueText:Ljava/lang/String;

.field private mVerticalViewMenu:Landroid/view/View;

.field private oldDegree:I

.field private stringLightingRes:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 28
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    .line 38
    const-string v0, ""

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentVertical;->mStateValueText:Ljava/lang/String;

    return-void
.end method

.method private adjustViewHeight(Landroid/view/View;)V
    .locals 2

    .line 61
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentVertical;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 62
    int-to-float v0, v0

    const/high16 v1, 0x3f400000    # 0.75f

    div-float/2addr v0, v1

    float-to-int v0, v0

    .line 63
    sget v1, Lcom/android/camera/Util;->sWindowHeight:I

    sub-int/2addr v1, v0

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentVertical;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/Util;->getBottomHeight(Landroid/content/res/Resources;)I

    move-result v0

    sub-int/2addr v1, v0

    .line 64
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 65
    iput v1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 66
    return-void
.end method

.method private updateLightingRelativeView(ZZ)V
    .locals 2

    .line 188
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentVertical;->mRightAlertStatus:Landroid/widget/TextView;

    invoke-static {v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 189
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentVertical;->mRightLightingPattern:Landroid/widget/TextView;

    invoke-static {v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 190
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentVertical;->mLeftAlertStatus:Landroid/widget/TextView;

    invoke-static {v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 191
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentVertical;->mLeftLightingPattern:Landroid/widget/TextView;

    invoke-static {v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 192
    if-eqz p1, :cond_0

    .line 193
    const/4 p1, -0x2

    iput p1, p0, Lcom/android/camera/fragment/FragmentVertical;->stringLightingRes:I

    .line 194
    const-string p1, ""

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentVertical;->mStateValueText:Ljava/lang/String;

    .line 195
    return-void

    .line 197
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningLighting()Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    move-result-object p1

    const/16 v0, 0xab

    .line 198
    invoke-virtual {p1, v0}, Lcom/android/camera/data/data/runing/ComponentRunningLighting;->getComponentValue(I)Ljava/lang/String;

    move-result-object p1

    .line 199
    const-string v0, "0"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 200
    return-void

    .line 202
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentVertical;->isLandScape()Z

    move-result p1

    if-eqz p1, :cond_5

    .line 203
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentVertical;->isLeftLandScape()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 204
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentVertical;->mStateValueText:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_2

    .line 205
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentVertical;->mLeftAlertStatus:Landroid/widget/TextView;

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/FragmentVertical;->startAnimateViewVisible(Landroid/view/View;Z)V

    .line 207
    :cond_2
    iget p1, p0, Lcom/android/camera/fragment/FragmentVertical;->stringLightingRes:I

    if-lez p1, :cond_7

    .line 208
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentVertical;->mLeftLightingPattern:Landroid/widget/TextView;

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/FragmentVertical;->startAnimateViewVisible(Landroid/view/View;Z)V

    goto :goto_0

    .line 210
    :cond_3
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentVertical;->isRightLandScape()Z

    move-result p1

    if-eqz p1, :cond_7

    .line 211
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentVertical;->mStateValueText:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_4

    .line 212
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentVertical;->mRightAlertStatus:Landroid/widget/TextView;

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/FragmentVertical;->startAnimateViewVisible(Landroid/view/View;Z)V

    .line 214
    :cond_4
    iget p1, p0, Lcom/android/camera/fragment/FragmentVertical;->stringLightingRes:I

    if-lez p1, :cond_7

    .line 215
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentVertical;->mRightLightingPattern:Landroid/widget/TextView;

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/FragmentVertical;->startAnimateViewVisible(Landroid/view/View;Z)V

    goto :goto_0

    .line 219
    :cond_5
    iget p1, p0, Lcom/android/camera/fragment/FragmentVertical;->oldDegree:I

    const/16 v0, 0x5a

    const/4 v1, 0x0

    if-ne p1, v0, :cond_6

    .line 220
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentVertical;->mRightAlertStatus:Landroid/widget/TextView;

    invoke-virtual {p0, p1, v1}, Lcom/android/camera/fragment/FragmentVertical;->starAnimatetViewGone(Landroid/view/View;Z)V

    .line 221
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentVertical;->mRightLightingPattern:Landroid/widget/TextView;

    invoke-virtual {p0, p1, v1}, Lcom/android/camera/fragment/FragmentVertical;->starAnimatetViewGone(Landroid/view/View;Z)V

    .line 222
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentVertical;->mLeftAlertStatus:Landroid/widget/TextView;

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/FragmentVertical;->starAnimatetViewGone(Landroid/view/View;Z)V

    .line 223
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentVertical;->mLeftLightingPattern:Landroid/widget/TextView;

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/FragmentVertical;->starAnimatetViewGone(Landroid/view/View;Z)V

    goto :goto_0

    .line 224
    :cond_6
    iget p1, p0, Lcom/android/camera/fragment/FragmentVertical;->oldDegree:I

    const/16 v0, 0x10e

    if-ne p1, v0, :cond_7

    .line 225
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentVertical;->mLeftAlertStatus:Landroid/widget/TextView;

    invoke-virtual {p0, p1, v1}, Lcom/android/camera/fragment/FragmentVertical;->starAnimatetViewGone(Landroid/view/View;Z)V

    .line 226
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentVertical;->mLeftLightingPattern:Landroid/widget/TextView;

    invoke-virtual {p0, p1, v1}, Lcom/android/camera/fragment/FragmentVertical;->starAnimatetViewGone(Landroid/view/View;Z)V

    .line 227
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentVertical;->mRightAlertStatus:Landroid/widget/TextView;

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/FragmentVertical;->starAnimatetViewGone(Landroid/view/View;Z)V

    .line 228
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentVertical;->mRightLightingPattern:Landroid/widget/TextView;

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/FragmentVertical;->starAnimatetViewGone(Landroid/view/View;Z)V

    .line 231
    :cond_7
    :goto_0
    iget p1, p0, Lcom/android/camera/fragment/FragmentVertical;->mDegree:I

    iput p1, p0, Lcom/android/camera/fragment/FragmentVertical;->oldDegree:I

    .line 232
    return-void
.end method


# virtual methods
.method public alertLightingHint(I)V
    .locals 1

    .line 154
    nop

    .line 155
    const/4 v0, -0x1

    packed-switch p1, :pswitch_data_0

    .line 169
    move p1, v0

    goto :goto_0

    .line 157
    :pswitch_0
    const p1, 0x7f0b0203

    .line 158
    goto :goto_0

    .line 163
    :pswitch_1
    const p1, 0x7f0b0204

    .line 164
    goto :goto_0

    .line 160
    :pswitch_2
    const p1, 0x7f0b0205

    .line 161
    nop

    .line 169
    :goto_0
    if-ne p1, v0, :cond_0

    .line 170
    const-string p1, ""

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentVertical;->mStateValueText:Ljava/lang/String;

    .line 171
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentVertical;->mRightAlertStatus:Landroid/widget/TextView;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 172
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentVertical;->mLeftAlertStatus:Landroid/widget/TextView;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_1

    .line 174
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentVertical;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentVertical;->mStateValueText:Ljava/lang/String;

    .line 175
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentVertical;->mRightAlertStatus:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentVertical;->mStateValueText:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 176
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentVertical;->mLeftAlertStatus:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentVertical;->mStateValueText:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 177
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentVertical;->isLeftLandScape()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 178
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentVertical;->mLeftAlertStatus:Landroid/widget/TextView;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_1

    .line 179
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentVertical;->isRightLandScape()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 180
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentVertical;->mRightAlertStatus:Landroid/widget/TextView;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 183
    :cond_2
    :goto_1
    return-void

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getFragmentInto()I
    .locals 1

    .line 75
    const/16 v0, 0xff8

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .line 70
    const v0, 0x7f040034

    return v0
.end method

.method protected initView(Landroid/view/View;)V
    .locals 1

    .line 43
    const v0, 0x7f0d00b1

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentVertical;->mVerticalViewMenu:Landroid/view/View;

    .line 44
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentVertical;->mVerticalViewMenu:Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/FragmentVertical;->adjustViewHeight(Landroid/view/View;)V

    .line 45
    const v0, 0x7f0d00b2

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentVertical;->mLeftAlertStatus:Landroid/widget/TextView;

    .line 46
    const v0, 0x7f0d00b3

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentVertical;->mLeftLightingPattern:Landroid/widget/TextView;

    .line 47
    const v0, 0x7f0d00b4

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentVertical;->mRightAlertStatus:Landroid/widget/TextView;

    .line 48
    const v0, 0x7f0d00b5

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentVertical;->mRightLightingPattern:Landroid/widget/TextView;

    .line 50
    iget p1, p0, Lcom/android/camera/fragment/FragmentVertical;->mDegree:I

    iput p1, p0, Lcom/android/camera/fragment/FragmentVertical;->oldDegree:I

    .line 53
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentVertical;->mLeftAlertStatus:Landroid/widget/TextView;

    const/high16 v0, 0x42b40000    # 90.0f

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setRotation(Landroid/view/View;F)V

    .line 54
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentVertical;->mLeftLightingPattern:Landroid/widget/TextView;

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setRotation(Landroid/view/View;F)V

    .line 56
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentVertical;->mRightAlertStatus:Landroid/widget/TextView;

    const/high16 v0, 0x43870000    # 270.0f

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setRotation(Landroid/view/View;F)V

    .line 57
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentVertical;->mRightLightingPattern:Landroid/widget/TextView;

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setRotation(Landroid/view/View;F)V

    .line 58
    return-void
.end method

.method public isAnyViewVisible()Z
    .locals 1

    .line 235
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentVertical;->mLeftAlertStatus:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentVertical;->mRightAlertStatus:Landroid/widget/TextView;

    .line 236
    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentVertical;->mLeftLightingPattern:Landroid/widget/TextView;

    .line 237
    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentVertical;->mRightLightingPattern:Landroid/widget/TextView;

    .line 238
    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 235
    :goto_1
    return v0
.end method

.method public provideAnimateElement(ILjava/util/List;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lio/reactivex/Completable;",
            ">;Z)V"
        }
    .end annotation

    .line 92
    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;Z)V

    .line 93
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentVertical;->isAnyViewVisible()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 94
    const/4 p1, 0x0

    invoke-direct {p0, p3, p1}, Lcom/android/camera/fragment/FragmentVertical;->updateLightingRelativeView(ZZ)V

    .line 96
    :cond_0
    return-void
.end method

.method public provideRotateItem(Ljava/util/List;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;I)V"
        }
    .end annotation

    .line 100
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->provideRotateItem(Ljava/util/List;I)V

    .line 101
    iget p1, p0, Lcom/android/camera/fragment/FragmentVertical;->mCurrentMode:I

    const/16 p2, 0xab

    if-eq p1, p2, :cond_0

    .line 102
    return-void

    .line 104
    :cond_0
    const/4 p1, 0x0

    const/4 p2, 0x1

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/FragmentVertical;->updateLightingRelativeView(ZZ)V

    .line 105
    return-void
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1

    .line 80
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 81
    const/16 v0, 0xc6

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 82
    return-void
.end method

.method public setLightingPattern(Ljava/lang/String;)V
    .locals 1

    .line 109
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    const-string v0, "7"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x7

    goto :goto_1

    :pswitch_1
    const-string v0, "6"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x6

    goto :goto_1

    :pswitch_2
    const-string v0, "5"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x5

    goto :goto_1

    :pswitch_3
    const-string v0, "4"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x4

    goto :goto_1

    :pswitch_4
    const-string v0, "3"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x3

    goto :goto_1

    :pswitch_5
    const-string v0, "2"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x2

    goto :goto_1

    :pswitch_6
    const-string v0, "1"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_1

    :pswitch_7
    const-string v0, "0"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    goto :goto_1

    :cond_0
    :goto_0
    const/4 p1, -0x1

    :goto_1
    const/4 v0, -0x2

    packed-switch p1, :pswitch_data_1

    goto :goto_2

    .line 132
    :pswitch_8
    const p1, 0x7f0b020b

    iput p1, p0, Lcom/android/camera/fragment/FragmentVertical;->stringLightingRes:I

    .line 133
    goto :goto_2

    .line 129
    :pswitch_9
    const p1, 0x7f0b020c

    iput p1, p0, Lcom/android/camera/fragment/FragmentVertical;->stringLightingRes:I

    .line 130
    goto :goto_2

    .line 126
    :pswitch_a
    const p1, 0x7f0b020d

    iput p1, p0, Lcom/android/camera/fragment/FragmentVertical;->stringLightingRes:I

    .line 127
    goto :goto_2

    .line 123
    :pswitch_b
    const p1, 0x7f0b020a

    iput p1, p0, Lcom/android/camera/fragment/FragmentVertical;->stringLightingRes:I

    .line 124
    goto :goto_2

    .line 120
    :pswitch_c
    const p1, 0x7f0b0209

    iput p1, p0, Lcom/android/camera/fragment/FragmentVertical;->stringLightingRes:I

    .line 121
    goto :goto_2

    .line 117
    :pswitch_d
    const p1, 0x7f0b0208

    iput p1, p0, Lcom/android/camera/fragment/FragmentVertical;->stringLightingRes:I

    .line 118
    goto :goto_2

    .line 114
    :pswitch_e
    const p1, 0x7f0b0207

    iput p1, p0, Lcom/android/camera/fragment/FragmentVertical;->stringLightingRes:I

    .line 115
    goto :goto_2

    .line 111
    :pswitch_f
    iput v0, p0, Lcom/android/camera/fragment/FragmentVertical;->stringLightingRes:I

    .line 112
    nop

    .line 138
    :goto_2
    iget p1, p0, Lcom/android/camera/fragment/FragmentVertical;->stringLightingRes:I

    if-ne p1, v0, :cond_1

    .line 139
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentVertical;->mLeftLightingPattern:Landroid/widget/TextView;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 140
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentVertical;->mRightLightingPattern:Landroid/widget/TextView;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_3

    .line 142
    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentVertical;->mLeftLightingPattern:Landroid/widget/TextView;

    iget v0, p0, Lcom/android/camera/fragment/FragmentVertical;->stringLightingRes:I

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 143
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentVertical;->mRightLightingPattern:Landroid/widget/TextView;

    iget v0, p0, Lcom/android/camera/fragment/FragmentVertical;->stringLightingRes:I

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 144
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentVertical;->isLeftLandScape()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 145
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentVertical;->mLeftLightingPattern:Landroid/widget/TextView;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_3

    .line 146
    :cond_2
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentVertical;->isRightLandScape()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 147
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentVertical;->mRightLightingPattern:Landroid/widget/TextView;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 150
    :cond_3
    :goto_3
    return-void

    :pswitch_data_0
    .packed-switch 0x30
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
    .end packed-switch
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1

    .line 86
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 87
    const/16 v0, 0xc6

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 88
    return-void
.end method
