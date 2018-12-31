.class public final Lcom/android/camera/data/data/DataItemBase$ConcurrentEditor;
.super Ljava/lang/Object;
.source "DataItemBase.java"

# interfaces
.implements Lcom/android/camera/data/provider/DataProvider$ProviderEditor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/data/data/DataItemBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "ConcurrentEditor"
.end annotation


# instance fields
.field private mIsClear:Z

.field private mModified:Landroid/support/v4/util/SimpleArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/SimpleArrayMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private mPreferenceEditor:Landroid/content/SharedPreferences$Editor;

.field final synthetic this$0:Lcom/android/camera/data/data/DataItemBase;


# direct methods
.method public constructor <init>(Lcom/android/camera/data/data/DataItemBase;Landroid/content/SharedPreferences$Editor;)V
    .locals 0

    .line 137
    iput-object p1, p0, Lcom/android/camera/data/data/DataItemBase$ConcurrentEditor;->this$0:Lcom/android/camera/data/data/DataItemBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 133
    new-instance p1, Landroid/support/v4/util/SimpleArrayMap;

    invoke-direct {p1}, Landroid/support/v4/util/SimpleArrayMap;-><init>()V

    iput-object p1, p0, Lcom/android/camera/data/data/DataItemBase$ConcurrentEditor;->mModified:Landroid/support/v4/util/SimpleArrayMap;

    .line 138
    iput-object p2, p0, Lcom/android/camera/data/data/DataItemBase$ConcurrentEditor;->mPreferenceEditor:Landroid/content/SharedPreferences$Editor;

    .line 139
    return-void
.end method


# virtual methods
.method public apply()V
    .locals 3

    .line 212
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase$ConcurrentEditor;->this$0:Lcom/android/camera/data/data/DataItemBase;

    invoke-static {v0}, Lcom/android/camera/data/data/DataItemBase;->access$000(Lcom/android/camera/data/data/DataItemBase;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 213
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/data/data/DataItemBase$ConcurrentEditor;->mPreferenceEditor:Landroid/content/SharedPreferences$Editor;

    if-eqz v1, :cond_0

    .line 214
    iget-object v1, p0, Lcom/android/camera/data/data/DataItemBase$ConcurrentEditor;->mPreferenceEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 217
    :cond_0
    iget-boolean v1, p0, Lcom/android/camera/data/data/DataItemBase$ConcurrentEditor;->mIsClear:Z

    if-eqz v1, :cond_1

    .line 218
    iget-object v1, p0, Lcom/android/camera/data/data/DataItemBase$ConcurrentEditor;->this$0:Lcom/android/camera/data/data/DataItemBase;

    invoke-static {v1}, Lcom/android/camera/data/data/DataItemBase;->access$100(Lcom/android/camera/data/data/DataItemBase;)Landroid/support/v4/util/SimpleArrayMap;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/util/SimpleArrayMap;->clear()V

    .line 219
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/camera/data/data/DataItemBase$ConcurrentEditor;->mIsClear:Z

    .line 222
    :cond_1
    iget-object v1, p0, Lcom/android/camera/data/data/DataItemBase$ConcurrentEditor;->this$0:Lcom/android/camera/data/data/DataItemBase;

    invoke-static {v1}, Lcom/android/camera/data/data/DataItemBase;->access$100(Lcom/android/camera/data/data/DataItemBase;)Landroid/support/v4/util/SimpleArrayMap;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/data/data/DataItemBase$ConcurrentEditor;->mModified:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v1, v2}, Landroid/support/v4/util/SimpleArrayMap;->putAll(Landroid/support/v4/util/SimpleArrayMap;)V

    .line 223
    iget-object v1, p0, Lcom/android/camera/data/data/DataItemBase$ConcurrentEditor;->mModified:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v1}, Landroid/support/v4/util/SimpleArrayMap;->clear()V

    .line 224
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/camera/data/data/DataItemBase$ConcurrentEditor;->mModified:Landroid/support/v4/util/SimpleArrayMap;

    .line 225
    iput-object v1, p0, Lcom/android/camera/data/data/DataItemBase$ConcurrentEditor;->mPreferenceEditor:Landroid/content/SharedPreferences$Editor;

    .line 226
    monitor-exit v0

    .line 227
    return-void

    .line 226
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public clear()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
    .locals 1

    .line 198
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/data/data/DataItemBase$ConcurrentEditor;->mIsClear:Z

    .line 199
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase$ConcurrentEditor;->mPreferenceEditor:Landroid/content/SharedPreferences$Editor;

    if-eqz v0, :cond_0

    .line 200
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase$ConcurrentEditor;->mPreferenceEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    .line 202
    :cond_0
    return-object p0
.end method

.method public commit()Z
    .locals 1

    .line 207
    const/4 v0, 0x0

    return v0
.end method

.method public putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
    .locals 2

    .line 152
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase$ConcurrentEditor;->mModified:Landroid/support/v4/util/SimpleArrayMap;

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Landroid/support/v4/util/SimpleArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase$ConcurrentEditor;->mPreferenceEditor:Landroid/content/SharedPreferences$Editor;

    if-eqz v0, :cond_0

    .line 154
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase$ConcurrentEditor;->mPreferenceEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 156
    :cond_0
    return-object p0
.end method

.method public putFloat(Ljava/lang/String;F)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
    .locals 2

    .line 179
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase$ConcurrentEditor;->mModified:Landroid/support/v4/util/SimpleArrayMap;

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Landroid/support/v4/util/SimpleArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase$ConcurrentEditor;->mPreferenceEditor:Landroid/content/SharedPreferences$Editor;

    if-eqz v0, :cond_0

    .line 181
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase$ConcurrentEditor;->mPreferenceEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    .line 183
    :cond_0
    return-object p0
.end method

.method public putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
    .locals 2

    .line 161
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase$ConcurrentEditor;->mModified:Landroid/support/v4/util/SimpleArrayMap;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Landroid/support/v4/util/SimpleArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase$ConcurrentEditor;->mPreferenceEditor:Landroid/content/SharedPreferences$Editor;

    if-eqz v0, :cond_0

    .line 163
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase$ConcurrentEditor;->mPreferenceEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 165
    :cond_0
    return-object p0
.end method

.method public putLong(Ljava/lang/String;J)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
    .locals 2

    .line 170
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase$ConcurrentEditor;->mModified:Landroid/support/v4/util/SimpleArrayMap;

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Landroid/support/v4/util/SimpleArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase$ConcurrentEditor;->mPreferenceEditor:Landroid/content/SharedPreferences$Editor;

    if-eqz v0, :cond_0

    .line 172
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase$ConcurrentEditor;->mPreferenceEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0, p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 174
    :cond_0
    return-object p0
.end method

.method public putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
    .locals 1

    .line 143
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase$ConcurrentEditor;->mModified:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/util/SimpleArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase$ConcurrentEditor;->mPreferenceEditor:Landroid/content/SharedPreferences$Editor;

    if-eqz v0, :cond_0

    .line 145
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase$ConcurrentEditor;->mPreferenceEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 147
    :cond_0
    return-object p0
.end method

.method public remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
    .locals 2

    .line 189
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase$ConcurrentEditor;->mModified:Landroid/support/v4/util/SimpleArrayMap;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/support/v4/util/SimpleArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase$ConcurrentEditor;->mPreferenceEditor:Landroid/content/SharedPreferences$Editor;

    if-eqz v0, :cond_0

    .line 191
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase$ConcurrentEditor;->mPreferenceEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 193
    :cond_0
    return-object p0
.end method
