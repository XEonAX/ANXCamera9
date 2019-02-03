.class public Lcom/android/camera/ui/PreviewListPreference;
.super Landroid/preference/ListPreference;
.source "PreviewListPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/ui/PreviewListPreference$PreviewListAdapter;
    }
.end annotation


# instance fields
.field private mDefaultValues:[Ljava/lang/CharSequence;

.field private mExtraPaddingEnd:I

.field private mLabels:[Ljava/lang/CharSequence;

.field private mShowArrow:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 50
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/camera/ui/PreviewListPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 51
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 36
    invoke-direct {p0, p1, p2}, Landroid/preference/ListPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 37
    iget-object v0, p0, Lcom/android/camera/ui/PreviewListPreference;->mDefaultValues:[Ljava/lang/CharSequence;

    if-eqz v0, :cond_0

    .line 38
    iget-object v0, p0, Lcom/android/camera/ui/PreviewListPreference;->mDefaultValues:[Ljava/lang/CharSequence;

    invoke-direct {p0, v0}, Lcom/android/camera/ui/PreviewListPreference;->findSupportedDefaultValue([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/PreviewListPreference;->setDefaultValue(Ljava/lang/Object;)V

    .line 40
    :cond_0
    sget-object v0, Lcom/android/camera/R$styleable;->PreviewListPreference:[I

    const/4 v1, 0x0

    invoke-virtual {p1, p2, v0, v1, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p2

    .line 42
    invoke-virtual {p2, v1}, Landroid/content/res/TypedArray;->getTextArray(I)[Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/ui/PreviewListPreference;->mLabels:[Ljava/lang/CharSequence;

    .line 43
    const/4 v0, 0x1

    invoke-virtual {p2, v0, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/ui/PreviewListPreference;->mShowArrow:Z

    .line 44
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0a0090

    .line 45
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/ui/PreviewListPreference;->mExtraPaddingEnd:I

    .line 46
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 47
    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/ui/PreviewListPreference;)I
    .locals 0

    .line 29
    iget p0, p0, Lcom/android/camera/ui/PreviewListPreference;->mExtraPaddingEnd:I

    return p0
.end method

.method private findSupportedDefaultValue([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 10

    .line 76
    invoke-virtual {p0}, Lcom/android/camera/ui/PreviewListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v0

    .line 77
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 78
    return-object v1

    .line 81
    :cond_0
    array-length v2, v0

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v2, :cond_3

    aget-object v5, v0, v4

    .line 82
    array-length v6, p1

    move v7, v3

    :goto_1
    if-ge v7, v6, :cond_2

    aget-object v8, p1, v7

    .line 83
    if-eqz v5, :cond_1

    invoke-virtual {v5, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 84
    return-object v8

    .line 82
    :cond_1
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 81
    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 89
    :cond_3
    return-object v1
.end method


# virtual methods
.method public filterUnsupported(Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 93
    invoke-virtual {p0}, Lcom/android/camera/ui/PreviewListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v0

    .line 94
    invoke-virtual {p0}, Lcom/android/camera/ui/PreviewListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v1

    .line 95
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 96
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 97
    array-length v4, v0

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v4, :cond_1

    .line 98
    aget-object v6, v1, v5

    invoke-interface {v6}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1, v6}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v6

    if-ltz v6, :cond_0

    .line 99
    aget-object v6, v0, v5

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 100
    aget-object v6, v1, v5

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 97
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 103
    :cond_1
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result p1

    .line 104
    new-array v0, p1, [Ljava/lang/CharSequence;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/PreviewListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 105
    new-array p1, p1, [Ljava/lang/CharSequence;

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/CharSequence;

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/PreviewListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 106
    return-void
.end method

.method public getLabel()Ljava/lang/CharSequence;
    .locals 2

    .line 145
    invoke-virtual {p0}, Lcom/android/camera/ui/PreviewListPreference;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/PreviewListPreference;->findIndexOfValue(Ljava/lang/String;)I

    move-result v0

    .line 146
    if-ltz v0, :cond_0

    iget-object v1, p0, Lcom/android/camera/ui/PreviewListPreference;->mLabels:[Ljava/lang/CharSequence;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/ui/PreviewListPreference;->mLabels:[Ljava/lang/CharSequence;

    aget-object v0, v1, v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method protected onBindView(Landroid/view/View;)V
    .locals 4

    .line 110
    invoke-super {p0, p1}, Landroid/preference/ListPreference;->onBindView(Landroid/view/View;)V

    .line 112
    const v0, 0x7f0d00d2

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 113
    const v1, 0x7f0d00d3

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    .line 114
    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 115
    iget-object v2, p0, Lcom/android/camera/ui/PreviewListPreference;->mLabels:[Ljava/lang/CharSequence;

    if-nez v2, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/ui/PreviewListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v2

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/ui/PreviewListPreference;->getLabel()Ljava/lang/CharSequence;

    move-result-object v2

    .line 116
    :goto_0
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 117
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 118
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1

    .line 120
    :cond_1
    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 124
    :cond_2
    :goto_1
    if-eqz p1, :cond_4

    .line 125
    iget-boolean v0, p0, Lcom/android/camera/ui/PreviewListPreference;->mShowArrow:Z

    if-eqz v0, :cond_3

    .line 126
    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_2

    .line 128
    :cond_3
    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 131
    :cond_4
    :goto_2
    return-void
.end method

# .method protected onCreateView(Landroid/view/ViewGroup;)Landroid/view/View;
#     .locals 3

#     .line 135
#     invoke-virtual {p0}, Lcom/android/camera/ui/PreviewListPreference;->getContext()Landroid/content/Context;

#     move-result-object v0

#     invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

#     move-result-object v0

#     .line 136
#     const v1, 0x7f04003f

#     const/4 v2, 0x0

#     invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

#     move-result-object p1

#     .line 135
#     return-object p1
# .end method

.method protected onGetDefaultValue(Landroid/content/res/TypedArray;I)Ljava/lang/Object;
    .locals 2

    .line 59
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object v0

    .line 60
    if-eqz v0, :cond_0

    iget v0, v0, Landroid/util/TypedValue;->type:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 61
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getTextArray(I)[Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/ui/PreviewListPreference;->mDefaultValues:[Ljava/lang/CharSequence;

    .line 64
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/PreviewListPreference;->mDefaultValues:[Ljava/lang/CharSequence;

    if-eqz v0, :cond_1

    iget-object p1, p0, Lcom/android/camera/ui/PreviewListPreference;->mDefaultValues:[Ljava/lang/CharSequence;

    const/4 p2, 0x0

    aget-object p1, p1, p2

    goto :goto_0

    :cond_1
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method public setEntryValues([Ljava/lang/CharSequence;)V
    .locals 0

    .line 69
    invoke-super {p0, p1}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 70
    iget-object p1, p0, Lcom/android/camera/ui/PreviewListPreference;->mDefaultValues:[Ljava/lang/CharSequence;

    if-eqz p1, :cond_0

    .line 71
    iget-object p1, p0, Lcom/android/camera/ui/PreviewListPreference;->mDefaultValues:[Ljava/lang/CharSequence;

    invoke-direct {p0, p1}, Lcom/android/camera/ui/PreviewListPreference;->findSupportedDefaultValue([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/PreviewListPreference;->setDefaultValue(Ljava/lang/Object;)V

    .line 73
    :cond_0
    return-void
.end method

.method public setShowArrow(Z)V
    .locals 0

    .line 54
    iput-boolean p1, p0, Lcom/android/camera/ui/PreviewListPreference;->mShowArrow:Z

    .line 55
    return-void
.end method

.method protected showDialog(Landroid/os/Bundle;)V
    .locals 3

    .line 151
    invoke-super {p0, p1}, Landroid/preference/ListPreference;->showDialog(Landroid/os/Bundle;)V

    .line 152
    invoke-virtual {p0}, Lcom/android/camera/ui/PreviewListPreference;->getDialog()Landroid/app/Dialog;

    move-result-object p1

    check-cast p1, Landroid/app/AlertDialog;

    invoke-virtual {p1}, Landroid/app/AlertDialog;->getListView()Landroid/widget/ListView;

    move-result-object p1

    .line 153
    invoke-virtual {p1}, Landroid/widget/ListView;->getCheckedItemPosition()I

    move-result v0

    .line 154
    new-instance v1, Lcom/android/camera/ui/PreviewListPreference$PreviewListAdapter;

    invoke-virtual {p1}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/android/camera/ui/PreviewListPreference$PreviewListAdapter;-><init>(Lcom/android/camera/ui/PreviewListPreference;Landroid/widget/ListAdapter;)V

    .line 155
    invoke-virtual {p1, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 156
    const/4 v1, -0x1

    if-le v0, v1, :cond_0

    .line 157
    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/widget/ListView;->setItemChecked(IZ)V

    .line 158
    invoke-virtual {p1, v0}, Landroid/widget/ListView;->setSelection(I)V

    .line 160
    :cond_0
    return-void
.end method
