.class public Lcom/ss/android/ttve/common/TESpdLogManager;
.super Ljava/lang/Object;
.source "TESpdLogManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/ttve/common/TESpdLogManager$InfoLevel;
    }
.end annotation


# static fields
.field private static volatile mTESpdManager:Lcom/ss/android/ttve/common/TESpdLogManager;


# instance fields
.field private mEditor1SpdLogInvoker:Lcom/ss/android/medialib/SpdLogInvoker;

.field private mTESpdLogInvoker:Lcom/ss/android/ttve/common/TESpdLogInvoker;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 21
    const/4 v0, 0x0

    sput-object v0, Lcom/ss/android/ttve/common/TESpdLogManager;->mTESpdManager:Lcom/ss/android/ttve/common/TESpdLogManager;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    new-instance v0, Lcom/ss/android/ttve/common/TESpdLogInvoker;

    invoke-direct {v0}, Lcom/ss/android/ttve/common/TESpdLogInvoker;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ttve/common/TESpdLogManager;->mTESpdLogInvoker:Lcom/ss/android/ttve/common/TESpdLogInvoker;

    .line 67
    new-instance v0, Lcom/ss/android/medialib/SpdLogInvoker;

    invoke-direct {v0}, Lcom/ss/android/medialib/SpdLogInvoker;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ttve/common/TESpdLogManager;->mEditor1SpdLogInvoker:Lcom/ss/android/medialib/SpdLogInvoker;

    .line 68
    return-void
.end method

.method public static getInstance()Lcom/ss/android/ttve/common/TESpdLogManager;
    .locals 2

    .line 24
    sget-object v0, Lcom/ss/android/ttve/common/TESpdLogManager;->mTESpdManager:Lcom/ss/android/ttve/common/TESpdLogManager;

    if-nez v0, :cond_1

    .line 25
    const-class v0, Lcom/ss/android/ttve/common/TESpdLogManager;

    monitor-enter v0

    .line 26
    :try_start_0
    sget-object v1, Lcom/ss/android/ttve/common/TESpdLogManager;->mTESpdManager:Lcom/ss/android/ttve/common/TESpdLogManager;

    if-nez v1, :cond_0

    .line 27
    new-instance v1, Lcom/ss/android/ttve/common/TESpdLogManager;

    invoke-direct {v1}, Lcom/ss/android/ttve/common/TESpdLogManager;-><init>()V

    sput-object v1, Lcom/ss/android/ttve/common/TESpdLogManager;->mTESpdManager:Lcom/ss/android/ttve/common/TESpdLogManager;

    .line 28
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 31
    :cond_1
    :goto_0
    sget-object v0, Lcom/ss/android/ttve/common/TESpdLogManager;->mTESpdManager:Lcom/ss/android/ttve/common/TESpdLogManager;

    return-object v0
.end method

.method public static getLogFiles(Ljava/lang/String;)[Ljava/lang/String;
    .locals 7

    .line 40
    const-string v0, ".txt"

    .line 41
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 42
    new-array p0, v2, [Ljava/lang/String;

    return-object p0

    .line 44
    :cond_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 46
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 47
    invoke-virtual {v1}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v1

    .line 48
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 50
    move v4, v2

    :goto_0
    array-length v5, v1

    if-ge v4, v5, :cond_2

    .line 51
    aget-object v5, v1, v4

    invoke-virtual {v5, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 52
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v6, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v6, v1, v4

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 50
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 54
    :cond_2
    new-array p0, v2, [Ljava/lang/String;

    invoke-interface {v3, p0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/String;

    return-object p0

    .line 56
    :cond_3
    new-array p0, v2, [Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public close()V
    .locals 1

    .line 103
    iget-object v0, p0, Lcom/ss/android/ttve/common/TESpdLogManager;->mTESpdLogInvoker:Lcom/ss/android/ttve/common/TESpdLogInvoker;

    invoke-virtual {v0}, Lcom/ss/android/ttve/common/TESpdLogInvoker;->close()V

    .line 104
    iget-object v0, p0, Lcom/ss/android/ttve/common/TESpdLogManager;->mEditor1SpdLogInvoker:Lcom/ss/android/medialib/SpdLogInvoker;

    invoke-virtual {v0}, Lcom/ss/android/medialib/SpdLogInvoker;->close()V

    .line 105
    return-void
.end method

.method public error(Ljava/lang/String;)V
    .locals 1

    .line 147
    iget-object v0, p0, Lcom/ss/android/ttve/common/TESpdLogManager;->mTESpdLogInvoker:Lcom/ss/android/ttve/common/TESpdLogInvoker;

    invoke-virtual {v0, p1}, Lcom/ss/android/ttve/common/TESpdLogInvoker;->error(Ljava/lang/String;)I

    .line 148
    return-void
.end method

.method public info(Lcom/ss/android/ttve/common/TESpdLogManager$InfoLevel;Ljava/lang/String;)V
    .locals 1

    .line 110
    sget-object v0, Lcom/ss/android/ttve/common/TESpdLogManager$1;->$SwitchMap$com$ss$android$ttve$common$TESpdLogManager$InfoLevel:[I

    invoke-virtual {p1}, Lcom/ss/android/ttve/common/TESpdLogManager$InfoLevel;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    .line 121
    const-string p1, "TESpdLogManager"

    const-string p2, "\u9519\u8bef\u7684\u7b49\u7ea7"

    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 118
    :pswitch_0
    iget-object p1, p0, Lcom/ss/android/ttve/common/TESpdLogManager;->mTESpdLogInvoker:Lcom/ss/android/ttve/common/TESpdLogInvoker;

    const/4 v0, 0x3

    invoke-virtual {p1, v0, p2}, Lcom/ss/android/ttve/common/TESpdLogInvoker;->info(ILjava/lang/String;)I

    .line 119
    goto :goto_0

    .line 115
    :pswitch_1
    iget-object p1, p0, Lcom/ss/android/ttve/common/TESpdLogManager;->mTESpdLogInvoker:Lcom/ss/android/ttve/common/TESpdLogInvoker;

    const/4 v0, 0x2

    invoke-virtual {p1, v0, p2}, Lcom/ss/android/ttve/common/TESpdLogInvoker;->info(ILjava/lang/String;)I

    .line 116
    goto :goto_0

    .line 112
    :pswitch_2
    iget-object p1, p0, Lcom/ss/android/ttve/common/TESpdLogManager;->mTESpdLogInvoker:Lcom/ss/android/ttve/common/TESpdLogInvoker;

    const/4 v0, 0x1

    invoke-virtual {p1, v0, p2}, Lcom/ss/android/ttve/common/TESpdLogInvoker;->info(ILjava/lang/String;)I

    .line 113
    nop

    .line 124
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public initSpdLog(Ljava/lang/String;II)I
    .locals 3

    .line 83
    const-string v0, "TESpdLogManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "logDir: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    iget-object v0, p0, Lcom/ss/android/ttve/common/TESpdLogManager;->mTESpdLogInvoker:Lcom/ss/android/ttve/common/TESpdLogInvoker;

    invoke-virtual {v0, p1, p2, p3}, Lcom/ss/android/ttve/common/TESpdLogInvoker;->initSpdLog(Ljava/lang/String;II)I

    move-result v0

    .line 87
    iget-object v1, p0, Lcom/ss/android/ttve/common/TESpdLogManager;->mEditor1SpdLogInvoker:Lcom/ss/android/medialib/SpdLogInvoker;

    invoke-virtual {v1, p1, p2, p3}, Lcom/ss/android/medialib/SpdLogInvoker;->initSpdLog(Ljava/lang/String;II)I

    move-result p1

    .line 89
    if-gez v0, :cond_0

    .line 91
    return v0

    .line 94
    :cond_0
    if-gez p1, :cond_1

    .line 96
    return p1

    .line 99
    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public setLevel(Lcom/ss/android/ttve/common/TESpdLogManager$InfoLevel;)V
    .locals 1

    .line 127
    sget-object v0, Lcom/ss/android/ttve/common/TESpdLogManager$1;->$SwitchMap$com$ss$android$ttve$common$TESpdLogManager$InfoLevel:[I

    invoke-virtual {p1}, Lcom/ss/android/ttve/common/TESpdLogManager$InfoLevel;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    .line 141
    const-string p1, "TESpdLogManager"

    const-string v0, "\u9519\u8bef\u7684\u7b49\u7ea7"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 137
    :pswitch_0
    iget-object p1, p0, Lcom/ss/android/ttve/common/TESpdLogManager;->mTESpdLogInvoker:Lcom/ss/android/ttve/common/TESpdLogInvoker;

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Lcom/ss/android/ttve/common/TESpdLogInvoker;->setLevel(I)V

    .line 138
    iget-object p1, p0, Lcom/ss/android/ttve/common/TESpdLogManager;->mEditor1SpdLogInvoker:Lcom/ss/android/medialib/SpdLogInvoker;

    invoke-virtual {p1, v0}, Lcom/ss/android/medialib/SpdLogInvoker;->setLevel(I)V

    .line 139
    goto :goto_0

    .line 133
    :pswitch_1
    iget-object p1, p0, Lcom/ss/android/ttve/common/TESpdLogManager;->mTESpdLogInvoker:Lcom/ss/android/ttve/common/TESpdLogInvoker;

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Lcom/ss/android/ttve/common/TESpdLogInvoker;->setLevel(I)V

    .line 134
    iget-object p1, p0, Lcom/ss/android/ttve/common/TESpdLogManager;->mEditor1SpdLogInvoker:Lcom/ss/android/medialib/SpdLogInvoker;

    invoke-virtual {p1, v0}, Lcom/ss/android/medialib/SpdLogInvoker;->setLevel(I)V

    .line 135
    goto :goto_0

    .line 129
    :pswitch_2
    iget-object p1, p0, Lcom/ss/android/ttve/common/TESpdLogManager;->mTESpdLogInvoker:Lcom/ss/android/ttve/common/TESpdLogInvoker;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/ss/android/ttve/common/TESpdLogInvoker;->setLevel(I)V

    .line 130
    iget-object p1, p0, Lcom/ss/android/ttve/common/TESpdLogManager;->mEditor1SpdLogInvoker:Lcom/ss/android/medialib/SpdLogInvoker;

    invoke-virtual {p1, v0}, Lcom/ss/android/medialib/SpdLogInvoker;->setLevel(I)V

    .line 131
    nop

    .line 144
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public warn(Ljava/lang/String;)V
    .locals 1

    .line 151
    iget-object v0, p0, Lcom/ss/android/ttve/common/TESpdLogManager;->mTESpdLogInvoker:Lcom/ss/android/ttve/common/TESpdLogInvoker;

    invoke-virtual {v0, p1}, Lcom/ss/android/ttve/common/TESpdLogInvoker;->warn(Ljava/lang/String;)I

    .line 152
    return-void
.end method
