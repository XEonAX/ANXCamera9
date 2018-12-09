.class Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$QueryGsaTask;
.super Landroid/os/AsyncTask;
.source "LensSdkParamsReader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "QueryGsaTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;


# direct methods
.method private constructor <init>(Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;)V
    .locals 0

    .line 106
    iput-object p1, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$QueryGsaTask;->this$0:Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 107
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$1;)V
    .locals 0

    .line 105
    invoke-direct {p0, p1}, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$QueryGsaTask;-><init>(Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;)V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Integer;
    .locals 8

    .line 110
    nop

    .line 114
    const/4 p1, 0x4

    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$QueryGsaTask;->this$0:Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;

    invoke-static {v1}, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->access$100(Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v1, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->LENS_AVAILABILITY_PROVIDER_URI:Ljava/lang/String;

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    move-object v4, v0

    check-cast v4, [Ljava/lang/String;

    move-object v5, v0

    check-cast v5, Ljava/lang/String;

    move-object v6, v0

    check-cast v6, [Ljava/lang/String;

    move-object v7, v0

    check-cast v7, Ljava/lang/String;

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 115
    if-eqz v1, :cond_2

    :try_start_1
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-eqz v0, :cond_2

    .line 116
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    .line 117
    const/4 v0, 0x0

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 118
    const/4 v2, 0x6

    if-le v0, v2, :cond_0

    .line 119
    nop

    .line 122
    move v0, v2

    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 123
    nop

    .line 131
    if-eqz v1, :cond_1

    .line 132
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 123
    :cond_1
    return-object v0

    .line 131
    :catchall_0
    move-exception p1

    move-object v0, v1

    goto :goto_2

    .line 127
    :catch_0
    move-exception v0

    move-object v0, v1

    goto :goto_0

    .line 126
    :cond_2
    :try_start_2
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 131
    if-eqz v1, :cond_3

    .line 132
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 136
    :cond_3
    move-object p1, v0

    goto :goto_1

    .line 131
    :catchall_1
    move-exception p1

    goto :goto_2

    .line 127
    :catch_1
    move-exception v1

    .line 129
    :goto_0
    :try_start_3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 131
    if-eqz v0, :cond_4

    .line 132
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 136
    :cond_4
    :goto_1
    return-object p1

    .line 131
    :goto_2
    if-eqz v0, :cond_5

    .line 132
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_5
    throw p1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 105
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$QueryGsaTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Ljava/lang/Integer;)V
    .locals 5

    .line 140
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 141
    const-string v1, "LensSdkParamsReader"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x19

    add-int/2addr v4, v3

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v3, "Lens availability result:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 142
    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$QueryGsaTask;->this$0:Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;

    invoke-static {v0}, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->access$200(Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;)Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, v0, Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;->lensAvailabilityStatus:I

    .line 143
    iget-object p1, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$QueryGsaTask;->this$0:Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->access$302(Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;Z)Z

    .line 144
    iget-object p1, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$QueryGsaTask;->this$0:Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;

    invoke-static {p1}, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->access$400(Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    .line 146
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 147
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$LensSdkParamsCallback;

    .line 148
    iget-object v1, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$QueryGsaTask;->this$0:Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;

    invoke-static {v1}, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->access$200(Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;)Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$LensSdkParamsCallback;->onLensSdkParamsAvailable(Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;)V

    .line 149
    goto :goto_0

    .line 151
    :cond_0
    iget-object p1, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$QueryGsaTask;->this$0:Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;

    invoke-static {p1}, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->access$400(Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 152
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 105
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$QueryGsaTask;->onPostExecute(Ljava/lang/Integer;)V

    return-void
.end method
