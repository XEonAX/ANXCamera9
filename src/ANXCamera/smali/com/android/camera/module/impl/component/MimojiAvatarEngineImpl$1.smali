.class Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;
.super Ljava/lang/Object;
.source "MimojiAvatarEngineImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->onRecordStart(Landroid/content/ContentValues;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

.field final synthetic val$contentValues:Landroid/content/ContentValues;


# direct methods
.method constructor <init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Landroid/content/ContentValues;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    iput-object p2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->val$contentValues:Landroid/content/ContentValues;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$000(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/a;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$102(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Z)Z

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->val$contentValues:Landroid/content/ContentValues;

    invoke-static {v0, v1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$202(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Landroid/content/ContentValues;)Landroid/content/ContentValues;

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->val$contentValues:Landroid/content/ContentValues;

    const-string v2, "_data"

    invoke-virtual {v1, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$302(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Ljava/lang/String;)Ljava/lang/String;

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$000(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/a;

    move-result-object v1

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$300(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Ljava/lang/String;

    move-result-object v2

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$400(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/c/g;

    move-result-object v3

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$500(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)I

    move-result v4

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$600(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)I

    move-result v5

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$700(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)I

    move-result v6

    const v7, 0x989680

    invoke-virtual/range {v1 .. v7}, Lcom/arcsoft/avatar/a;->a(Ljava/lang/String;Lcom/arcsoft/avatar/c/g;IIII)V

    :cond_0
    return-void
.end method
