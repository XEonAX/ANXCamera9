.class public Lcom/android/camera/UserDefineWatermarkActivity;
.super Lmiui/app/Activity;
.source "UserDefineWatermarkActivity.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/UserDefineWatermarkActivity$AllCapTransformationMethod;,
        Lcom/android/camera/UserDefineWatermarkActivity$UiHandler;,
        Lcom/android/camera/UserDefineWatermarkActivity$BackgroundHandler;
    }
.end annotation


# static fields
.field private static final MSG_BG_FILTER_WORDS:I = 0x1

.field private static final MSG_MT_UI:I = 0x2

.field private static final PROP_NAME_MAX:I = 0xc

.field private static final TAG:Ljava/lang/String; = "UserDefineWatermarkActivity"


# instance fields
.field protected mBackgroundHandler:Lcom/android/camera/UserDefineWatermarkActivity$BackgroundHandler;

.field private mEtUserDefineWords:Landroid/widget/EditText;

.field private mFlagBeyondLimit:Z

.field private mTextLast:Ljava/lang/String;

.field private mThreadBg:Landroid/os/HandlerThread;

.field protected mUiHandler:Lcom/android/camera/UserDefineWatermarkActivity$UiHandler;

.field private mUserDefineWords:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Lmiui/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lcom/android/camera/UserDefineWatermarkActivity;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Lcom/android/camera/UserDefineWatermarkActivity;->onCancel()V

    return-void
.end method

.method static synthetic access$200(Lcom/android/camera/UserDefineWatermarkActivity;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Lcom/android/camera/UserDefineWatermarkActivity;->onSave()V

    return-void
.end method

.method static synthetic access$300(Lcom/android/camera/UserDefineWatermarkActivity;Landroid/os/Message;)V
    .locals 0

    .line 22
    invoke-direct {p0, p1}, Lcom/android/camera/UserDefineWatermarkActivity;->doInBackground(Landroid/os/Message;)V

    return-void
.end method

.method static synthetic access$400(Lcom/android/camera/UserDefineWatermarkActivity;Landroid/os/Message;)V
    .locals 0

    .line 22
    invoke-direct {p0, p1}, Lcom/android/camera/UserDefineWatermarkActivity;->doInMainThread(Landroid/os/Message;)V

    return-void
.end method

.method private checkContentlegal(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 1

    .line 123
    invoke-static {}, Lcom/android/camera/sensitive/SensitiveFilter;->getInstance()Lcom/android/camera/sensitive/SensitiveFilter;

    move-result-object v0

    .line 124
    check-cast p1, Ljava/lang/String;

    invoke-virtual {v0, p1}, Lcom/android/camera/sensitive/SensitiveFilter;->getSensitiveWord(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private checkContentlength()Z
    .locals 4

    .line 141
    nop

    .line 142
    iget-object v0, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mEtUserDefineWords:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mUserDefineWords:Ljava/lang/String;

    .line 143
    iget-object v0, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mUserDefineWords:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/android/camera/UserDefineWatermarkActivity;->getTextLength(Ljava/lang/CharSequence;)D

    move-result-wide v0

    .line 144
    const-wide/high16 v2, 0x4028000000000000L    # 12.0

    cmpl-double v0, v0, v2

    const/4 v1, 0x1

    if-lez v0, :cond_0

    .line 145
    const/4 v0, 0x0

    .line 146
    iput-boolean v1, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mFlagBeyondLimit:Z

    .line 147
    iget-object v1, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mEtUserDefineWords:Landroid/widget/EditText;

    iget-object v2, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mTextLast:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 148
    iget-object v1, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mEtUserDefineWords:Landroid/widget/EditText;

    iget-object v2, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mTextLast:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setSelection(I)V

    .line 149
    const v1, 0x7f0b0128

    invoke-static {p0, v1}, Lcom/android/camera/ToastUtils;->showToast(Landroid/content/Context;I)V

    goto :goto_0

    .line 151
    :cond_0
    move v0, v1

    :goto_0
    return v0
.end method

.method private doInBackground(Landroid/os/Message;)V
    .locals 3

    .line 172
    iget p1, p1, Landroid/os/Message;->what:I

    const/4 v0, 0x1

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 174
    :cond_0
    iget-object p1, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mUserDefineWords:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/android/camera/UserDefineWatermarkActivity;->checkContentlegal(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 175
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    .line 176
    const/4 v1, 0x2

    iput v1, v0, Landroid/os/Message;->what:I

    .line 177
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 178
    const-string v2, "LEGAL_WORD"

    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 179
    invoke-virtual {v0, v1}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 180
    iget-object p1, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mUiHandler:Lcom/android/camera/UserDefineWatermarkActivity$UiHandler;

    invoke-virtual {p1, v0}, Lcom/android/camera/UserDefineWatermarkActivity$UiHandler;->sendMessage(Landroid/os/Message;)Z

    .line 181
    nop

    .line 185
    :goto_0
    return-void
.end method

.method private doInMainThread(Landroid/os/Message;)V
    .locals 3

    .line 188
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 190
    :cond_0
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object p1

    .line 191
    const-string v0, "LEGAL_WORD"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 192
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 193
    invoke-direct {p0}, Lcom/android/camera/UserDefineWatermarkActivity;->getCustomWords()Ljava/lang/String;

    move-result-object p1

    .line 194
    invoke-static {}, Lcom/android/camera/CameraSettings;->getCustomWatermark()Ljava/lang/String;

    move-result-object v0

    .line 195
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 197
    invoke-static {p1}, Lcom/android/camera/CameraSettings;->setCustomWatermark(Ljava/lang/String;)V

    .line 198
    invoke-static {}, Lcom/android/camera/Util;->generateCustomWatermark2File()Landroid/graphics/Bitmap;

    .line 200
    :cond_1
    const p1, 0x7f0b0126

    invoke-static {p0, p1}, Lcom/android/camera/ToastUtils;->showToast(Landroid/content/Context;I)V

    .line 201
    invoke-virtual {p0}, Lcom/android/camera/UserDefineWatermarkActivity;->finish()V

    .line 202
    goto :goto_0

    .line 203
    :cond_2
    const v0, 0x7f0b0127

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/UserDefineWatermarkActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 205
    invoke-static {p0, p1}, Lcom/android/camera/ToastUtils;->showToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 207
    nop

    .line 212
    :goto_0
    return-void
.end method

.method private getCustomWords()Ljava/lang/String;
    .locals 3

    .line 155
    iget-object v0, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mEtUserDefineWords:Landroid/widget/EditText;

    const v1, 0x7f0b0129

    if-nez v0, :cond_0

    .line 156
    invoke-virtual {p0}, Lcom/android/camera/UserDefineWatermarkActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 158
    :cond_0
    iget-object v0, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mEtUserDefineWords:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 159
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 160
    invoke-virtual {p0}, Lcom/android/camera/UserDefineWatermarkActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 162
    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    .line 163
    return-object v0
.end method

.method private initTitle()V
    .locals 4

    .line 60
    invoke-virtual {p0}, Lcom/android/camera/UserDefineWatermarkActivity;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    .line 61
    if-nez v0, :cond_0

    .line 62
    return-void

    .line 64
    :cond_0
    const/16 v1, 0x10

    invoke-virtual {v0, v1, v1}, Landroid/app/ActionBar;->setDisplayOptions(II)V

    .line 65
    sget v1, Lmiui/R$layout;->edit_mode_title:I

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setCustomView(I)V

    .line 67
    invoke-virtual {v0}, Landroid/app/ActionBar;->getCustomView()Landroid/view/View;

    move-result-object v0

    .line 68
    const v1, 0x1020016

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/camera/UserDefineWatermarkActivity;->getTitle()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    const v1, 0x1020019

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 70
    sget v2, Lmiui/R$drawable;->action_mode_title_button_cancel_light:I

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 71
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 72
    const/high16 v3, 0x1040000

    invoke-virtual {p0, v3}, Lcom/android/camera/UserDefineWatermarkActivity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 73
    new-instance v3, Lcom/android/camera/UserDefineWatermarkActivity$1;

    invoke-direct {v3, p0}, Lcom/android/camera/UserDefineWatermarkActivity$1;-><init>(Lcom/android/camera/UserDefineWatermarkActivity;)V

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 79
    const v1, 0x102001a

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 80
    sget v1, Lmiui/R$drawable;->action_mode_title_button_confirm_light:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 81
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 82
    const v1, 0x104000a

    invoke-virtual {p0, v1}, Lcom/android/camera/UserDefineWatermarkActivity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 83
    new-instance v1, Lcom/android/camera/UserDefineWatermarkActivity$2;

    invoke-direct {v1, p0}, Lcom/android/camera/UserDefineWatermarkActivity$2;-><init>(Lcom/android/camera/UserDefineWatermarkActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 89
    invoke-virtual {p0}, Lcom/android/camera/UserDefineWatermarkActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0b0123

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/UserDefineWatermarkActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 91
    return-void
.end method

.method private onCancel()V
    .locals 0

    .line 94
    invoke-virtual {p0}, Lcom/android/camera/UserDefineWatermarkActivity;->finish()V

    .line 95
    return-void
.end method

.method private onSave()V
    .locals 2

    .line 98
    invoke-direct {p0}, Lcom/android/camera/UserDefineWatermarkActivity;->checkContentlength()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 99
    iget-object v0, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mBackgroundHandler:Lcom/android/camera/UserDefineWatermarkActivity$BackgroundHandler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/UserDefineWatermarkActivity$BackgroundHandler;->sendEmptyMessage(I)Z

    .line 101
    :cond_0
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0

    .line 169
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 129
    iget-boolean p2, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mFlagBeyondLimit:Z

    if-nez p2, :cond_0

    .line 130
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mTextLast:Ljava/lang/String;

    .line 132
    :cond_0
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mFlagBeyondLimit:Z

    .line 133
    return-void
.end method

.method public getTextLength(Ljava/lang/CharSequence;)D
    .locals 13

    .line 237
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 238
    nop

    .line 239
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    .line 240
    nop

    .line 241
    nop

    .line 242
    const/4 v2, 0x0

    const-wide/16 v3, 0x0

    const/4 v5, -0x1

    move v6, v5

    move-wide v4, v3

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_7

    .line 243
    invoke-interface {p1, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v7

    .line 244
    const-string v8, "[^\\x00-\\xff]"

    invoke-virtual {v7, v8}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 245
    nop

    .line 249
    move v8, v2

    goto :goto_1

    .line 247
    :cond_0
    nop

    .line 249
    const/4 v8, 0x1

    :goto_1
    const-wide/high16 v9, 0x3ff4000000000000L    # 1.25

    if-gez v6, :cond_1

    .line 250
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 251
    :cond_1
    if-ne v8, v6, :cond_2

    .line 252
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 253
    :cond_2
    if-eq v8, v6, :cond_4

    .line 254
    if-nez v6, :cond_3

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v11

    int-to-double v11, v11

    goto :goto_2

    .line 255
    :cond_3
    nop

    .line 254
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v11

    int-to-double v11, v11

    div-double/2addr v11, v9

    .line 256
    :goto_2
    add-double/2addr v4, v11

    .line 257
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v11

    invoke-virtual {v0, v2, v11}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 258
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 260
    :cond_4
    :goto_3
    add-int/lit8 v11, v1, -0x1

    if-ne v3, v11, :cond_6

    .line 261
    if-nez v6, :cond_5

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    int-to-double v9, v6

    goto :goto_4

    .line 262
    :cond_5
    nop

    .line 261
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    int-to-double v11, v6

    div-double v9, v11, v9

    .line 263
    :goto_4
    add-double/2addr v4, v9

    .line 264
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    invoke-virtual {v0, v2, v6}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 265
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 267
    :cond_6
    nop

    .line 242
    add-int/lit8 v3, v3, 0x1

    move v6, v8

    goto :goto_0

    .line 269
    :cond_7
    return-wide v4
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 37
    invoke-super {p0, p1}, Lmiui/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 38
    const p1, 0x7f040032

    invoke-virtual {p0, p1}, Lcom/android/camera/UserDefineWatermarkActivity;->setContentView(I)V

    .line 39
    const p1, 0x7f0d00a3

    invoke-virtual {p0, p1}, Lcom/android/camera/UserDefineWatermarkActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mEtUserDefineWords:Landroid/widget/EditText;

    .line 40
    iget-object p1, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mEtUserDefineWords:Landroid/widget/EditText;

    invoke-virtual {p1, p0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 41
    iget-object p1, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mEtUserDefineWords:Landroid/widget/EditText;

    new-instance v0, Lcom/android/camera/UserDefineWatermarkActivity$AllCapTransformationMethod;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/camera/UserDefineWatermarkActivity$AllCapTransformationMethod;-><init>(Lcom/android/camera/UserDefineWatermarkActivity;Lcom/android/camera/UserDefineWatermarkActivity$1;)V

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    .line 42
    invoke-static {}, Lcom/android/camera/CameraSettings;->getCustomWatermark()Ljava/lang/String;

    move-result-object p1

    .line 43
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 44
    iget-object v0, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mEtUserDefineWords:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 45
    iget-object v0, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mEtUserDefineWords:Landroid/widget/EditText;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setSelection(I)V

    .line 47
    :cond_0
    new-instance p1, Landroid/os/HandlerThread;

    const-string v0, "UserDefineWatermarkActivity"

    const/16 v1, 0xa

    invoke-direct {p1, v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    iput-object p1, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mThreadBg:Landroid/os/HandlerThread;

    .line 48
    iget-object p1, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mThreadBg:Landroid/os/HandlerThread;

    invoke-virtual {p1}, Landroid/os/HandlerThread;->start()V

    .line 49
    new-instance p1, Lcom/android/camera/UserDefineWatermarkActivity$BackgroundHandler;

    iget-object v0, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mThreadBg:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, p0, v0}, Lcom/android/camera/UserDefineWatermarkActivity$BackgroundHandler;-><init>(Lcom/android/camera/UserDefineWatermarkActivity;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mBackgroundHandler:Lcom/android/camera/UserDefineWatermarkActivity$BackgroundHandler;

    .line 50
    new-instance p1, Lcom/android/camera/UserDefineWatermarkActivity$UiHandler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, p0, v0}, Lcom/android/camera/UserDefineWatermarkActivity$UiHandler;-><init>(Lcom/android/camera/UserDefineWatermarkActivity;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mUiHandler:Lcom/android/camera/UserDefineWatermarkActivity$UiHandler;

    .line 51
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .line 110
    invoke-super {p0}, Lmiui/app/Activity;->onDestroy()V

    .line 111
    iget-object v0, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mBackgroundHandler:Lcom/android/camera/UserDefineWatermarkActivity$BackgroundHandler;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 112
    iget-object v0, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mBackgroundHandler:Lcom/android/camera/UserDefineWatermarkActivity$BackgroundHandler;

    invoke-virtual {v0, v1}, Lcom/android/camera/UserDefineWatermarkActivity$BackgroundHandler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 114
    :cond_0
    iget-object v0, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mUiHandler:Lcom/android/camera/UserDefineWatermarkActivity$UiHandler;

    if-eqz v0, :cond_1

    .line 115
    iget-object v0, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mUiHandler:Lcom/android/camera/UserDefineWatermarkActivity$UiHandler;

    invoke-virtual {v0, v1}, Lcom/android/camera/UserDefineWatermarkActivity$UiHandler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 117
    :cond_1
    iget-object v0, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mThreadBg:Landroid/os/HandlerThread;

    if-eqz v0, :cond_2

    .line 118
    iget-object v0, p0, Lcom/android/camera/UserDefineWatermarkActivity;->mThreadBg:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 120
    :cond_2
    return-void
.end method

.method protected onPause()V
    .locals 0

    .line 105
    invoke-super {p0}, Lmiui/app/Activity;->onPause()V

    .line 106
    return-void
.end method

.method protected onStart()V
    .locals 0

    .line 55
    invoke-super {p0}, Lmiui/app/Activity;->onStart()V

    .line 56
    invoke-direct {p0}, Lcom/android/camera/UserDefineWatermarkActivity;->initTitle()V

    .line 57
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 137
    invoke-direct {p0}, Lcom/android/camera/UserDefineWatermarkActivity;->checkContentlength()Z

    .line 138
    return-void
.end method
