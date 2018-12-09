.class Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$9;
.super Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$CloseOperation;
.source "HttpRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->copy(Ljava/io/Reader;Ljava/io/Writer;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$CloseOperation<",
        "Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

.field final synthetic val$input:Ljava/io/Reader;

.field final synthetic val$output:Ljava/io/Writer;


# direct methods
.method constructor <init>(Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;Ljava/io/Closeable;ZLjava/io/Reader;Ljava/io/Writer;)V
    .locals 0

    .line 2617
    iput-object p1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$9;->this$0:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    iput-object p4, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$9;->val$input:Ljava/io/Reader;

    iput-object p5, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$9;->val$output:Ljava/io/Writer;

    invoke-direct {p0, p2, p3}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$CloseOperation;-><init>(Ljava/io/Closeable;Z)V

    return-void
.end method


# virtual methods
.method public run()Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2621
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$9;->this$0:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    invoke-static {v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->access$100(Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;)I

    move-result v0

    new-array v0, v0, [C

    .line 2623
    :goto_0
    iget-object v1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$9;->val$input:Ljava/io/Reader;

    invoke-virtual {v1, v0}, Ljava/io/Reader;->read([C)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 2624
    iget-object v2, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$9;->val$output:Ljava/io/Writer;

    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3, v1}, Ljava/io/Writer;->write([CII)V

    .line 2625
    iget-object v2, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$9;->this$0:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    iget-object v3, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$9;->this$0:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    invoke-static {v3}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->access$200(Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;)J

    move-result-wide v3

    int-to-long v5, v1

    add-long/2addr v3, v5

    invoke-static {v2, v3, v4}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->access$202(Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;J)J

    .line 2626
    iget-object v1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$9;->this$0:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    invoke-static {v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->access$400(Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$UploadProgress;

    move-result-object v1

    iget-object v2, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$9;->this$0:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    invoke-static {v2}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->access$200(Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;)J

    move-result-wide v2

    const-wide/16 v4, -0x1

    invoke-interface {v1, v2, v3, v4, v5}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$UploadProgress;->onUpload(JJ)V

    goto :goto_0

    .line 2628
    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$9;->this$0:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    return-object v0
.end method

.method public bridge synthetic run()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 2617
    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$9;->run()Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object v0

    return-object v0
.end method
