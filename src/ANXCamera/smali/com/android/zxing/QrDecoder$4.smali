.class Lcom/android/zxing/QrDecoder$4;
.super Ljava/lang/Object;
.source "QrDecoder.java"

# interfaces
.implements Lio/reactivex/FlowableOnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/zxing/QrDecoder;->startDecode()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/FlowableOnSubscribe<",
        "Lcom/android/zxing/PreviewImage;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/zxing/QrDecoder;


# direct methods
.method constructor <init>(Lcom/android/zxing/QrDecoder;)V
    .locals 0

    .line 127
    iput-object p1, p0, Lcom/android/zxing/QrDecoder$4;->this$0:Lcom/android/zxing/QrDecoder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public subscribe(Lio/reactivex/FlowableEmitter;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/FlowableEmitter<",
            "Lcom/android/zxing/PreviewImage;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 130
    iget-object v0, p0, Lcom/android/zxing/QrDecoder$4;->this$0:Lcom/android/zxing/QrDecoder;

    iput-object p1, v0, Lcom/android/zxing/QrDecoder;->mDecodeFlowableEmitter:Lio/reactivex/FlowableEmitter;

    .line 131
    return-void
.end method
