.class Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask$1;
.super Ljava/lang/Object;
.source "HostListStatusUpdateTask.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;->sortHost()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/ss/android/ugc/effectmanager/link/model/host/Host;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;


# direct methods
.method constructor <init>(Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;)V
    .locals 0

    .line 110
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask$1;->this$0:Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/ss/android/ugc/effectmanager/link/model/host/Host;Lcom/ss/android/ugc/effectmanager/link/model/host/Host;)I
    .locals 2

    .line 113
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->getSortTime()J

    move-result-wide v0

    invoke-virtual {p2}, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;->getSortTime()J

    move-result-wide p1

    sub-long/2addr v0, p1

    long-to-int p1, v0

    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 110
    check-cast p1, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;

    check-cast p2, Lcom/ss/android/ugc/effectmanager/link/model/host/Host;

    invoke-virtual {p0, p1, p2}, Lcom/ss/android/ugc/effectmanager/link/task/task/HostListStatusUpdateTask$1;->compare(Lcom/ss/android/ugc/effectmanager/link/model/host/Host;Lcom/ss/android/ugc/effectmanager/link/model/host/Host;)I

    move-result p1

    return p1
.end method
