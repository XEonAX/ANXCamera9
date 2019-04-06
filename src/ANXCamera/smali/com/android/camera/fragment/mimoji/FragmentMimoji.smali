.class public Lcom/android/camera/fragment/mimoji/FragmentMimoji;
.super Lcom/android/camera/fragment/live/FragmentLiveBase;
.source "FragmentMimoji.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;
    }
.end annotation


# static fields
.field private static final FRAGMENT_INFO:I = 0xfff

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mAddItemView:Landroid/view/View;

.field private mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

.field private mLongSelectIndex:I

.field private mMimojiInfoList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/mimoji/MimojiInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

.field private mMimojiRecylerView:Landroid/support/v7/widget/RecyclerView;

.field private mNoneItemView:Landroid/view/View;

.field private mSelectIndex:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/fragment/live/FragmentLiveBase;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mSelectIndex:I

    iput v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLongSelectIndex:I

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiInfoList:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mSelectIndex:I

    return p0
.end method

.method static synthetic access$102(Lcom/android/camera/fragment/mimoji/FragmentMimoji;I)I
    .locals 0

    iput p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mSelectIndex:I

    return p1
.end method

.method static synthetic access$202(Lcom/android/camera/fragment/mimoji/FragmentMimoji;I)I
    .locals 0

    iput p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLongSelectIndex:I

    return p1
.end method

.method static synthetic access$300(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    return-object p0
.end method

.method static synthetic access$400(Lcom/android/camera/fragment/mimoji/FragmentMimoji;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->showEditDialog(I)V

    return-void
.end method

.method public static getThumbnailBitmapFromData([BII)Landroid/graphics/Bitmap;
    .locals 1

    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, p2, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    return-object p1
.end method

.method public static getThumbnailBitmapFromFile(Ljava/lang/String;II)Landroid/graphics/Bitmap;
    .locals 1

    invoke-static {p0}, Lcom/android/camera/module/impl/component/FileUtils;->getFileBytes(Ljava/lang/String;)[B

    move-result-object p0

    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, p2, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    if-eqz p0, :cond_0

    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    :cond_0
    return-object p1
.end method

.method private showEditDialog(I)V
    .locals 5

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->getItemObject(I)Lcom/android/camera/fragment/mimoji/MimojiInfo;

    move-result-object p1

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f040005

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setContentView(Landroid/view/View;)V

    const v2, 0x7f0d0016

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    new-instance v3, Lcom/android/camera/fragment/mimoji/FragmentMimoji$4;

    invoke-direct {v3, p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$4;-><init>(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)V

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v2, 0x7f0d0017

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    new-instance v3, Lcom/android/camera/fragment/mimoji/FragmentMimoji$5;

    invoke-direct {v3, p0, p1, v0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$5;-><init>(Lcom/android/camera/fragment/mimoji/FragmentMimoji;Lcom/android/camera/fragment/mimoji/MimojiInfo;Landroid/app/AlertDialog;)V

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f0d0018

    invoke-virtual {v1, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    new-instance v1, Lcom/android/camera/fragment/mimoji/FragmentMimoji$6;

    invoke-direct {v1, p0, v0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$6;-><init>(Lcom/android/camera/fragment/mimoji/FragmentMimoji;Landroid/app/AlertDialog;)V

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public addItem(Lcom/android/camera/fragment/mimoji/MimojiInfo;)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->addItem(Lcom/android/camera/fragment/mimoji/MimojiInfo;)I

    move-result p1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->notifyItemChanged(I)V

    return-void
.end method

.method public filelistToMinojiInfo()V
    .locals 12

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiInfoList:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    :try_start_0
    new-instance v2, Ljava/io/File;

    sget-object v3, Lcom/android/camera/module/impl/component/FileUtils;->CUSTOM_DIR:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {v2}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    array-length v3, v2

    move v4, v1

    :goto_0
    if-ge v4, v3, :cond_2

    aget-object v5, v2, v4

    new-instance v6, Lcom/android/camera/fragment/mimoji/MimojiInfo;

    invoke-direct {v6}, Lcom/android/camera/fragment/mimoji/MimojiInfo;-><init>()V

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v8, Lcom/android/camera/module/impl/component/FileUtils;->MIMOJI_DIR:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "model/cartoon_xiaomi_v_0_0_0_9"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, v6, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mAvatarTemplatePath:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v10, "config.dat"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, "pic.jpg"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v5}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_1

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v11, Lcom/android/camera/module/impl/component/FileUtils;->CUSTOM_DIR:Ljava/lang/String;

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, "/"

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v11, Lcom/android/camera/module/impl/component/FileUtils;->CUSTOM_DIR:Ljava/lang/String;

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "/"

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5}, Lcom/android/camera/module/impl/component/FileUtils;->checkFileConsist(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-static {v7}, Lcom/android/camera/module/impl/component/FileUtils;->checkFileConsist(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_0

    iput-object v5, v6, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mConfigPath:Ljava/lang/String;

    iput-object v7, v6, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mThumbnailUrl:Ljava/lang/String;

    iput-object v8, v6, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mPackPath:Ljava/lang/String;

    iget-object v5, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiInfoList:Ljava/util/List;

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_0
    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_1
    goto :goto_2

    :cond_1
    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    :cond_2
    goto :goto_3

    :catch_0
    move-exception v2

    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    :goto_3
    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    iget-object v3, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiInfoList:Ljava/util/List;

    invoke-virtual {v2, v3}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->setMimojiInfoList(Ljava/util/List;)V

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    invoke-virtual {v2}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->notifyDataSetChanged()V

    :goto_4
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_3

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Lcom/android/camera/module/impl/component/FileUtils;->deleteFile(Ljava/lang/String;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_3
    return-void
.end method

.method public getFragmentInto()I
    .locals 1

    const/16 v0, 0xfff

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    const v0, 0x7f04002c

    return v0
.end method

.method protected initView(Landroid/view/View;)V
    .locals 7

    const v0, 0x7f0d009e

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mNoneItemView:Landroid/view/View;

    const v0, 0x7f0d00a1

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiRecylerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mNoneItemView:Landroid/view/View;

    new-instance v1, Lcom/android/camera/fragment/mimoji/FragmentMimoji$1;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$1;-><init>(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0d00a0

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mAddItemView:Landroid/view/View;

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mAddItemView:Landroid/view/View;

    new-instance v0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$2;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$2;-><init>(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p1, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->getContext()Landroid/content/Context;

    move-result-object v3

    iget v4, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mSelectIndex:I

    iget v5, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLongSelectIndex:I

    new-instance v6, Lcom/android/camera/fragment/mimoji/FragmentMimoji$3;

    invoke-direct {v6, p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$3;-><init>(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)V

    move-object v1, p1

    move-object v2, p0

    invoke-direct/range {v1 .. v6}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;-><init>(Lcom/android/camera/fragment/mimoji/FragmentMimoji;Landroid/content/Context;IILandroid/widget/AdapterView$OnItemClickListener;)V

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->filelistToMinojiInfo()V

    new-instance p1, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/LinearLayoutManager;->setOrientation(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiRecylerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiRecylerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    return-void
.end method

.method protected onAddItemSelected(Landroid/view/View;)V
    .locals 1

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mIsNeedShowWhenExit:Z

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xd9

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;

    if-eqz p1, :cond_0

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;->onMimojiCreate()V

    :cond_0
    return-void
.end method

.method protected onItemSelected(ILandroid/view/View;)V
    .locals 2

    if-ltz p1, :cond_0

    iget-object p2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiInfoList:Ljava/util/List;

    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/android/camera/fragment/mimoji/MimojiInfo;

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    if-eqz p2, :cond_2

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd9

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;

    if-eqz v0, :cond_1

    iget-object p2, p2, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mAvatarTemplatePath:Ljava/lang/String;

    const-string v1, ""

    invoke-interface {v0, p2, v1}, Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;->onMimojiSelect(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    iget p2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mSelectIndex:I

    iput p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mSelectIndex:I

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    iget v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mSelectIndex:I

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->setSelectIndex(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    invoke-virtual {p1, p2}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->notifyItemChanged(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    iget p2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mSelectIndex:I

    invoke-virtual {p1, p2}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->notifyItemChanged(I)V

    :cond_2
    return-void
.end method

.method protected onLongItemSelected(ILandroid/view/View;)V
    .locals 2

    if-ltz p1, :cond_0

    iget-object p2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiInfoList:Ljava/util/List;

    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/android/camera/fragment/mimoji/MimojiInfo;

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    if-eqz p2, :cond_2

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd9

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;

    if-eqz v0, :cond_1

    iget-object p2, p2, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mAvatarTemplatePath:Ljava/lang/String;

    const-string v1, ""

    invoke-interface {v0, p2, v1}, Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;->onMimojiSelect(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    iget p2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLongSelectIndex:I

    iput p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLongSelectIndex:I

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    iget v0, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLongSelectIndex:I

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->setSelectIndex(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    invoke-virtual {p1, p2}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->notifyItemChanged(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mMimojiItemAdapter:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    iget p2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->mLongSelectIndex:I

    invoke-virtual {p1, p2}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->notifyItemChanged(I)V

    :cond_2
    return-void
.end method
