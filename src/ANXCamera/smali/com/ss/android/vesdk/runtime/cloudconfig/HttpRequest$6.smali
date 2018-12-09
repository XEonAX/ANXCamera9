.class Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$6;
.super Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$CloseOperation;
.source "HttpRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->receive(Ljava/lang/Appendable;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
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

.field final synthetic val$appendable:Ljava/lang/Appendable;

.field final synthetic val$reader:Ljava/io/BufferedReader;


# direct methods
.method constructor <init>(Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;Ljava/io/Closeable;ZLjava/io/BufferedReader;Ljava/lang/Appendable;)V
    .locals 0

    .line 1980
    iput-object p1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$6;->this$0:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    iput-object p4, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$6;->val$reader:Ljava/io/BufferedReader;

    iput-object p5, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$6;->val$appendable:Ljava/lang/Appendable;

    invoke-direct {p0, p2, p3}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$CloseOperation;-><init>(Ljava/io/Closeable;Z)V

    return-void
.end method


# virtual methods
.method public run()Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1984
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$6;->this$0:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    invoke-static {v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->access$100(Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;)I

    move-result v0

    invoke-static {v0}, Ljava/nio/CharBuffer;->allocate(I)Ljava/nio/CharBuffer;

    move-result-object v0

    .line 1986
    :goto_0
    iget-object v1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$6;->val$reader:Ljava/io/BufferedReader;

    invoke-virtual {v1, v0}, Ljava/io/BufferedReader;->read(Ljava/nio/CharBuffer;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 1987
    invoke-virtual {v0}, Ljava/nio/CharBuffer;->rewind()Ljava/nio/Buffer;

    .line 1988
    iget-object v2, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$6;->val$appendable:Ljava/lang/Appendable;

    const/4 v3, 0x0

    invoke-interface {v2, v0, v3, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;II)Ljava/lang/Appendable;

    .line 1989
    invoke-virtual {v0}, Ljava/nio/CharBuffer;->rewind()Ljava/nio/Buffer;

    goto :goto_0

    .line 1991
    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$6;->this$0:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

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

    .line 1980
    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$6;->run()Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object v0

    return-object v0
.end method
