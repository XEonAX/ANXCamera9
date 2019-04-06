.class public Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentMimojiEdit.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/AdapterView$OnItemClickListener;
.implements Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;
.implements Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;


# static fields
.field private static final FRAGMENT_INFO:I = 0xfff1

.field public static final TAG:Ljava/lang/String;


# instance fields
.field private mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

.field private mAvatarEngineManager:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

.field private mBackTextView:Landroid/widget/TextView;

.field private mColorRecyleView:Landroid/support/v7/widget/RecyclerView;

.field private mConfigThumbnailGridView:Landroid/widget/GridView;

.field private mConfirmTextView:Landroid/widget/TextView;

.field private mContext:Landroid/content/Context;

.field private mEditTextView:Landroid/widget/TextView;

.field private mHandler:Landroid/os/Handler;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "HandlerLeak"
        }
    .end annotation
.end field

.field private mMimojiConfigAdjustLayout:Landroid/view/View;

.field private mMimojiEditGLSurfaceView:Lcom/android/camera/ui/MimojiEditGLSurfaceView;

.field private mMimojiEditViewLayout:Landroid/view/View;

.field private mMimojiEditViewStub:Landroid/view/ViewStub;

.field private mMimojiThumbnailAdapter:Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;

.field private mMimojiTypeHorizonScrollView:Lcom/android/camera/ui/MimojiTypeHorizonScrollView;

.field private mMimojiTypeSelectView:Lcom/android/camera/ui/MimojiTypeSelectView;

.field private mOperateSelectLayout:Landroid/view/View;

.field private mReCaptureTextView:Landroid/widget/TextView;

.field private mSaveTextView:Landroid/widget/TextView;

.field private mTipsTextView:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    new-instance v0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$1;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$1;-><init>(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)V

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Lcom/arcsoft/avatar/AvatarEngine;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    return-object p0
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Landroid/widget/TextView;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mTipsTextView:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiThumbnailAdapter:Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;

    return-object p0
.end method

.method static synthetic access$300(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->backToMimojiCreate()V

    return-void
.end method

.method private backToMimojiCreate()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditGLSurfaceView:Lcom/android/camera/ui/MimojiEditGLSurfaceView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditViewLayout:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd9

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;->onBack(Z)V

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;->onMimojiCreate()V

    :cond_0
    return-void
.end method

.method private initConfigList()V
    .locals 2

    new-instance v0, Lcom/arcsoft/avatar/AvatarConfig$e;

    invoke-direct {v0}, Lcom/arcsoft/avatar/AvatarConfig$e;-><init>()V

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    invoke-virtual {v1, v0}, Lcom/arcsoft/avatar/AvatarEngine;->a(Lcom/arcsoft/avatar/AvatarConfig$e;)V

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatarEngineManager:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    invoke-virtual {v1, v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->setASAvatarConfigValue(Lcom/arcsoft/avatar/AvatarConfig$e;)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatarEngineManager:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    invoke-virtual {v1}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getASAvatarConfigValue()Lcom/arcsoft/avatar/AvatarConfig$e;

    move-result-object v1

    iget v1, v1, Lcom/arcsoft/avatar/AvatarConfig$e;->gender:I

    invoke-virtual {v0, v1}, Lcom/arcsoft/avatar/AvatarEngine;->a(I)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatarEngineManager:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    invoke-virtual {v1, v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->setConfigTypeList(Ljava/util/ArrayList;)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->onTypeConfigSelect(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiTypeSelectView:Lcom/android/camera/ui/MimojiTypeSelectView;

    invoke-virtual {v0}, Lcom/android/camera/ui/MimojiTypeSelectView;->init()V

    return-void
.end method

.method private initMimojiEdit(Landroid/view/View;)V
    .locals 2

    const v0, 0x7f0d00a7

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mReCaptureTextView:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mReCaptureTextView:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0d0016

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mEditTextView:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mEditTextView:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0d00a8

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mSaveTextView:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mSaveTextView:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0d00a2

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mBackTextView:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mBackTextView:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0d00a3

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mConfirmTextView:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mConfirmTextView:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0d00a4

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/MimojiEditGLSurfaceView;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditGLSurfaceView:Lcom/android/camera/ui/MimojiEditGLSurfaceView;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditGLSurfaceView:Lcom/android/camera/ui/MimojiEditGLSurfaceView;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->setmHandler(Landroid/os/Handler;)V

    const v0, 0x7f0d00a6

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mOperateSelectLayout:Landroid/view/View;

    const v0, 0x7f0d00a9

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiConfigAdjustLayout:Landroid/view/View;

    const v0, 0x7f0d00ab

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/MimojiTypeSelectView;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiTypeSelectView:Lcom/android/camera/ui/MimojiTypeSelectView;

    const v0, 0x7f0d00ad

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/GridView;

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mConfigThumbnailGridView:Landroid/widget/GridView;

    new-instance p1, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiThumbnailAdapter:Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mConfigThumbnailGridView:Landroid/widget/GridView;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiThumbnailAdapter:Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;

    invoke-virtual {p1, v0}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mConfigThumbnailGridView:Landroid/widget/GridView;

    invoke-virtual {p1, p0}, Landroid/widget/GridView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    invoke-direct {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->setupAvatar()V

    return-void
.end method

.method private onSaveConfig()V
    .locals 5

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiThumbnailAdapter:Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiThumbnailAdapter:Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;

    invoke-virtual {v1}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->getSelectItme()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/arcsoft/avatar/AvatarConfig$c;

    :try_start_0
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    iget-object v2, v0, Lcom/arcsoft/avatar/AvatarConfig$c;->an:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getByteCount()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    iget-object v0, v0, Lcom/arcsoft/avatar/AvatarConfig$c;->an:Landroid/graphics/Bitmap;

    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v3, 0x64

    invoke-virtual {v0, v2, v3, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->close()V

    const-string v0, ""

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    invoke-virtual {v1, v0}, Lcom/arcsoft/avatar/AvatarEngine;->g(Ljava/lang/String;)I

    move-result v1

    sget-object v2, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "res = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "  save path : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/arcsoft/avatar/d/g;->d(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "save failed!!"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :cond_0
    goto :goto_0

    :catch_0
    move-exception v0

    :goto_0
    return-void
.end method

.method private setupAvatar()V
    .locals 2

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatarEngineManager:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatarEngineManager:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->queryAvatar()Lcom/arcsoft/avatar/AvatarEngine;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    new-instance v0, Lcom/arcsoft/avatar/AvatarConfig$e;

    invoke-direct {v0}, Lcom/arcsoft/avatar/AvatarConfig$e;-><init>()V

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    invoke-virtual {v1, v0}, Lcom/arcsoft/avatar/AvatarEngine;->a(Lcom/arcsoft/avatar/AvatarConfig$e;)V

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatarEngineManager:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    invoke-virtual {v1, v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->setASAvatarConfigValue(Lcom/arcsoft/avatar/AvatarConfig$e;)V

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatarEngineManager:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    invoke-virtual {v1, v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->setASAvatarConfigValueTemp(Lcom/arcsoft/avatar/AvatarConfig$e;)V

    return-void
.end method

.method private showRecaptureDialog()V
    .locals 2

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    new-instance v1, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$4;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$4;-><init>(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)V

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public getFragmentInto()I
    .locals 1

    const v0, 0xfff1

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    const v0, 0x7f04001d

    return v0
.end method

.method protected initView(Landroid/view/View;)V
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mContext:Landroid/content/Context;

    const v0, 0x7f0d0068

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewStub;

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditViewStub:Landroid/view/ViewStub;

    return-void
.end method

.method public onBackEvent(I)Z
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eq p1, v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v1, 0xd9

    invoke-virtual {p1, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;

    if-eqz p1, :cond_1

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;->onBack(Z)V

    :cond_1
    :goto_0
    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    sparse-switch p1, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    invoke-direct {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->showRecaptureDialog()V

    goto :goto_0

    :sswitch_1
    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditGLSurfaceView:Lcom/android/camera/ui/MimojiEditGLSurfaceView;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->setmSaveConfigThum(Z)V

    goto :goto_0

    :sswitch_2
    invoke-direct {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->backToMimojiCreate()V

    goto :goto_0

    :sswitch_3
    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mOperateSelectLayout:Landroid/view/View;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiConfigAdjustLayout:Landroid/view/View;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    invoke-direct {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->initConfigList()V

    nop

    :goto_0
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        0x7f0d0016 -> :sswitch_3
        0x7f0d00a2 -> :sswitch_2
        0x7f0d00a3 -> :sswitch_1
        0x7f0d00a7 -> :sswitch_0
        0x7f0d00a8 -> :sswitch_1
    .end sparse-switch
.end method

.method public onDestroyView()V
    .locals 0

    invoke-super {p0}, Lcom/android/camera/fragment/BaseFragment;->onDestroyView()V

    return-void
.end method

.method public onDeviceRotationChange(I)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditGLSurfaceView:Lcom/android/camera/ui/MimojiEditGLSurfaceView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditGLSurfaceView:Lcom/android/camera/ui/MimojiEditGLSurfaceView;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->onDeviceRotationChange(I)V

    :cond_0
    return-void
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    const-string p1, "onItemClick"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "position = "

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p4, " Select index = "

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p4, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiThumbnailAdapter:Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;

    invoke-virtual {p4}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->getSelectItme()I

    move-result p4

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/arcsoft/avatar/d/g;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiThumbnailAdapter:Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;

    invoke-virtual {p1}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->getSelectItme()I

    move-result p1

    if-ne p3, p1, :cond_0

    return-void

    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiThumbnailAdapter:Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;

    invoke-virtual {p1, p3}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/arcsoft/avatar/AvatarConfig$c;

    iget-object p2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    invoke-virtual {p2, p1}, Lcom/arcsoft/avatar/AvatarEngine;->a(Lcom/arcsoft/avatar/AvatarConfig$c;)I

    return-void
.end method

.method public onResume()V
    .locals 0

    invoke-super {p0}, Lcom/android/camera/fragment/BaseFragment;->onResume()V

    return-void
.end method

.method public onTypeConfigSelect(I)V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatarEngineManager:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->setSelectTypeIndex(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatarEngineManager:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getConfigTypeForIndex(I)Lcom/arcsoft/avatar/AvatarConfig$d;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatarEngineManager:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->queryAvatar()Lcom/arcsoft/avatar/AvatarEngine;

    move-result-object v0

    iget v1, p1, Lcom/arcsoft/avatar/AvatarConfig$d;->ah:I

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatarEngineManager:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    invoke-virtual {v2}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getASAvatarConfigValue()Lcom/arcsoft/avatar/AvatarConfig$e;

    move-result-object v2

    iget v2, v2, Lcom/arcsoft/avatar/AvatarConfig$e;->gender:I

    invoke-virtual {v0, v1, v2}, Lcom/arcsoft/avatar/AvatarEngine;->a(II)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatarEngineManager:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    iget v2, p1, Lcom/arcsoft/avatar/AvatarConfig$d;->ah:I

    invoke-virtual {v1, v2}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->setSelectType(I)V

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mAvatarEngineManager:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    iget p1, p1, Lcom/arcsoft/avatar/AvatarConfig$d;->ah:I

    invoke-virtual {v1, p1, v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->putConfigList(ILjava/util/ArrayList;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditGLSurfaceView:Lcom/android/camera/ui/MimojiEditGLSurfaceView;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->setNeedGetThumbnail(Z)V

    return-void
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->registerBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xe0

    invoke-virtual {p1, v0, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    return-void
.end method

.method public requestRender()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditGLSurfaceView:Lcom/android/camera/ui/MimojiEditGLSurfaceView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditGLSurfaceView:Lcom/android/camera/ui/MimojiEditGLSurfaceView;

    invoke-virtual {v0}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->requestRender()V

    :cond_0
    return-void
.end method

.method public showTips()V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mTipsTextView:Landroid/widget/TextView;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mTipsTextView:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mTipsTextView:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    new-instance v1, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$2;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$2;-><init>(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)V

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method public startMimojiEdit()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditViewLayout:Landroid/view/View;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditViewStub:Landroid/view/ViewStub;

    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditViewLayout:Landroid/view/View;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditViewLayout:Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->initMimojiEdit(Landroid/view/View;)V

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditViewLayout:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->mMimojiEditGLSurfaceView:Lcom/android/camera/ui/MimojiEditGLSurfaceView;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/MimojiEditGLSurfaceView;->setVisibility(I)V

    return-void
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->unRegisterBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xe0

    invoke-virtual {p1, v0, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    return-void
.end method

.method public updateThumbnail()V
    .locals 3

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getSelectConfigList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    new-instance v2, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$3;

    invoke-direct {v2, p0, v0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$3;-><init>(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;Ljava/util/ArrayList;)V

    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method
