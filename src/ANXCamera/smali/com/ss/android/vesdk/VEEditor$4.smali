.class Lcom/ss/android/vesdk/VEEditor$4;
.super Ljava/lang/Object;
.source "VEEditor.java"

# interfaces
.implements Lcom/ss/android/ttve/common/TECommonCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/vesdk/VEEditor;->setOnErrorListener(Lcom/ss/android/vesdk/VECommonCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/android/vesdk/VEEditor;

.field final synthetic val$callback:Lcom/ss/android/vesdk/VECommonCallback;


# direct methods
.method constructor <init>(Lcom/ss/android/vesdk/VEEditor;Lcom/ss/android/vesdk/VECommonCallback;)V
    .locals 0

    .line 506
    iput-object p1, p0, Lcom/ss/android/vesdk/VEEditor$4;->this$0:Lcom/ss/android/vesdk/VEEditor;

    iput-object p2, p0, Lcom/ss/android/vesdk/VEEditor$4;->val$callback:Lcom/ss/android/vesdk/VECommonCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCallback(IIFLjava/lang/String;)V
    .locals 1

    .line 510
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor$4;->val$callback:Lcom/ss/android/vesdk/VECommonCallback;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/ss/android/vesdk/VECommonCallback;->onCallback(IIFLjava/lang/String;)V

    .line 511
    return-void
.end method
