.class public Lcom/bef/effectsdk/message/MessageCenter;
.super Ljava/lang/Object;
.source "MessageCenter.java"


# annotations
.annotation build Landroid/support/annotation/Keep;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bef/effectsdk/message/MessageCenter$MessageHandler;,
        Lcom/bef/effectsdk/message/MessageCenter$Listener;
    }
.end annotation


# static fields
.field public static final MSG_CLIENT_TO_SDK_CHALLENGE_GAME:I = 0x1007

.field public static final MSG_CLIENT_TO_SDK_PUASE_GAME:I = 0x1004

.field public static final MSG_CLIENT_TO_SDK_RESTART_GAME:I = 0x1006

.field public static final MSG_CLIENT_TO_SDK_RESUME_GAME:I = 0x1005

.field public static final MSG_CLIENT_TO_SDK_START_GAME:I = 0x1001

.field public static final MSG_CLINET_TO_SDK_FINISH_GAME:I = 0x1002

.field public static final MSG_ERROR_TYPE_CONFIG:I = 0x1001

.field public static final MSG_EVENT_2D_ANIMATION_CYCLE_FINISH:I = 0x5

.field public static final MSG_EVENT_ALGORITHM_CHANGE_FACE_COUNT:I = 0x1

.field public static final MSG_EVENT_BODY_DANCE_CATEGORY_ADJUST:I = 0x1

.field public static final MSG_EVENT_BODY_DANCE_CATEGORY_SCORE:I = 0x2

.field public static final MSG_EVENT_ENIGMA_COMPLETE:I = 0x1

.field public static final MSG_EVENT_LOAD_FAIL:I = 0x4

.field public static final MSG_EVENT_LOAD_INIT:I = 0x1

.field public static final MSG_EVENT_LOAD_LOADING:I = 0x2

.field public static final MSG_EVENT_LOAD_SUCCESS:I = 0x3

.field public static final MSG_ID_BEGIN:I = 0x10

.field public static final MSG_SDK_TO_CLIENT_END_GAME_REQ:I = 0x1003

.field public static final MSG_SDK_TO_CLIENT_GAME_RESOURCE_LOADED:I = 0x1008

.field public static final MSG_TYPE_2D_ANIMATION_CYCLE:I = 0x12

.field public static final MSG_TYPE_ALGORITHM_CHANGE:I = 0x17

.field public static final MSG_TYPE_APP_STATUS:I = 0x16

.field public static final MSG_TYPE_AUDIO_PLAYER:I = 0x15

.field public static final MSG_TYPE_BODY_DANCE:I = 0x13

.field public static final MSG_TYPE_EFFECT:I = 0x14

.field public static final MSG_TYPE_RESOURCE:I = 0x11

.field public static final MSG_TYPE_TYPE_ENIGMA:I = 0x18

.field private static final TAG:Ljava/lang/String; = "MessageCenter"

.field private static sInterceptors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/bef/effectsdk/message/MessageInterceptor;",
            ">;"
        }
    .end annotation
.end field

.field private static sListener:Lcom/bef/effectsdk/message/MessageCenter$Listener;

.field private static sMessageCenterThread:Landroid/os/HandlerThread;

.field private static sMessageHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 62
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/bef/effectsdk/message/MessageCenter;->sInterceptors:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/os/Message;)V
    .locals 0

    .line 13
    invoke-static {p0}, Lcom/bef/effectsdk/message/MessageCenter;->handleMessage(Landroid/os/Message;)V

    return-void
.end method

.method public static declared-synchronized destroy()V
    .locals 4

    const-class v0, Lcom/bef/effectsdk/message/MessageCenter;

    monitor-enter v0

    .line 88
    :try_start_0
    sget-object v1, Lcom/bef/effectsdk/message/MessageCenter;->sMessageCenterThread:Landroid/os/HandlerThread;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 89
    sget-object v1, Lcom/bef/effectsdk/message/MessageCenter;->sMessageCenterThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->quit()Z

    .line 90
    sput-object v2, Lcom/bef/effectsdk/message/MessageCenter;->sMessageCenterThread:Landroid/os/HandlerThread;

    .line 93
    :cond_0
    sget-object v1, Lcom/bef/effectsdk/message/MessageCenter;->sMessageHandler:Landroid/os/Handler;

    if-eqz v1, :cond_1

    .line 94
    sget-object v1, Lcom/bef/effectsdk/message/MessageCenter;->sMessageHandler:Landroid/os/Handler;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 95
    sput-object v2, Lcom/bef/effectsdk/message/MessageCenter;->sMessageHandler:Landroid/os/Handler;

    .line 98
    :cond_1
    sget-object v1, Lcom/bef/effectsdk/message/MessageCenter;->sInterceptors:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/bef/effectsdk/message/MessageInterceptor;

    .line 99
    invoke-interface {v3}, Lcom/bef/effectsdk/message/MessageInterceptor;->destroy()V

    .line 100
    goto :goto_0

    .line 101
    :cond_2
    sget-object v1, Lcom/bef/effectsdk/message/MessageCenter;->sInterceptors:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 103
    sput-object v2, Lcom/bef/effectsdk/message/MessageCenter;->sListener:Lcom/bef/effectsdk/message/MessageCenter$Listener;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 104
    monitor-exit v0

    return-void

    .line 87
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private static declared-synchronized handleMessage(Landroid/os/Message;)V
    .locals 5

    const-class v0, Lcom/bef/effectsdk/message/MessageCenter;

    monitor-enter v0

    .line 115
    :try_start_0
    sget-object v1, Lcom/bef/effectsdk/message/MessageCenter;->sInterceptors:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bef/effectsdk/message/MessageInterceptor;

    .line 116
    invoke-interface {v2, p0}, Lcom/bef/effectsdk/message/MessageInterceptor;->intercept(Landroid/os/Message;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 117
    goto :goto_1

    .line 119
    :cond_0
    goto :goto_0

    .line 120
    :cond_1
    :goto_1
    sget-object v1, Lcom/bef/effectsdk/message/MessageCenter;->sListener:Lcom/bef/effectsdk/message/MessageCenter$Listener;

    if-eqz v1, :cond_2

    .line 121
    sget-object v1, Lcom/bef/effectsdk/message/MessageCenter;->sListener:Lcom/bef/effectsdk/message/MessageCenter$Listener;

    iget v2, p0, Landroid/os/Message;->what:I

    iget v3, p0, Landroid/os/Message;->arg1:I

    iget v4, p0, Landroid/os/Message;->arg2:I

    iget-object p0, p0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-interface {v1, v2, v3, v4, p0}, Lcom/bef/effectsdk/message/MessageCenter$Listener;->onMessageReceived(IIILjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 123
    :cond_2
    monitor-exit v0

    return-void

    .line 114
    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized init()V
    .locals 3

    const-class v0, Lcom/bef/effectsdk/message/MessageCenter;

    monitor-enter v0

    .line 75
    :try_start_0
    sget-object v1, Lcom/bef/effectsdk/message/MessageCenter;->sMessageCenterThread:Landroid/os/HandlerThread;

    if-eqz v1, :cond_0

    sget-object v1, Lcom/bef/effectsdk/message/MessageCenter;->sMessageCenterThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->isAlive()Z

    move-result v1

    if-nez v1, :cond_1

    .line 76
    :cond_0
    new-instance v1, Landroid/os/HandlerThread;

    const-string v2, "MessageCenter"

    invoke-direct {v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    sput-object v1, Lcom/bef/effectsdk/message/MessageCenter;->sMessageCenterThread:Landroid/os/HandlerThread;

    .line 77
    sget-object v1, Lcom/bef/effectsdk/message/MessageCenter;->sMessageCenterThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->start()V

    .line 79
    :cond_1
    new-instance v1, Lcom/bef/effectsdk/message/MessageCenter$MessageHandler;

    sget-object v2, Lcom/bef/effectsdk/message/MessageCenter;->sMessageCenterThread:Landroid/os/HandlerThread;

    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/bef/effectsdk/message/MessageCenter$MessageHandler;-><init>(Landroid/os/Looper;)V

    sput-object v1, Lcom/bef/effectsdk/message/MessageCenter;->sMessageHandler:Landroid/os/Handler;

    .line 81
    invoke-static {}, Lcom/bef/effectsdk/message/MessageCenter;->installBuiltinInterceptor()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 82
    monitor-exit v0

    return-void

    .line 74
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private static installBuiltinInterceptor()V
    .locals 0

    .line 85
    return-void
.end method

.method private static declared-synchronized postMessage(IIILjava/lang/String;)V
    .locals 2
    .annotation build Landroid/support/annotation/Keep;
    .end annotation

    const-class v0, Lcom/bef/effectsdk/message/MessageCenter;

    monitor-enter v0

    .line 108
    :try_start_0
    sget-object v1, Lcom/bef/effectsdk/message/MessageCenter;->sMessageHandler:Landroid/os/Handler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 109
    monitor-exit v0

    return-void

    .line 110
    :cond_0
    :try_start_1
    sget-object v1, Lcom/bef/effectsdk/message/MessageCenter;->sMessageHandler:Landroid/os/Handler;

    invoke-static {v1, p0, p1, p2, p3}, Landroid/os/Message;->obtain(Landroid/os/Handler;IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object p0

    .line 111
    invoke-virtual {p0}, Landroid/os/Message;->sendToTarget()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 112
    monitor-exit v0

    return-void

    .line 107
    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized setListener(Lcom/bef/effectsdk/message/MessageCenter$Listener;)V
    .locals 1

    const-class v0, Lcom/bef/effectsdk/message/MessageCenter;

    monitor-enter v0

    .line 69
    :try_start_0
    sput-object p0, Lcom/bef/effectsdk/message/MessageCenter;->sListener:Lcom/bef/effectsdk/message/MessageCenter$Listener;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 70
    monitor-exit v0

    return-void

    .line 68
    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method
