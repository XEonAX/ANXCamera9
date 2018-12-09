.class public abstract Lmiui/external/ApplicationDelegate;
.super Landroid/content/ContextWrapper;
.source "ApplicationDelegate.java"

# interfaces
.implements Landroid/content/ComponentCallbacks2;


# instance fields
.field private mApplication:Lmiui/external/Application;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 45
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroid/content/ContextWrapper;-><init>(Landroid/content/Context;)V

    .line 46
    return-void
.end method


# virtual methods
.method attach(Lmiui/external/Application;)V
    .locals 0

    .line 49
    iput-object p1, p0, Lmiui/external/ApplicationDelegate;->mApplication:Lmiui/external/Application;

    .line 50
    invoke-virtual {p0, p1}, Lmiui/external/ApplicationDelegate;->attachBaseContext(Landroid/content/Context;)V

    .line 51
    return-void
.end method

.method public getApplication()Lmiui/external/Application;
    .locals 1

    .line 55
    iget-object v0, p0, Lmiui/external/ApplicationDelegate;->mApplication:Lmiui/external/Application;

    return-object v0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    .line 91
    iget-object v0, p0, Lmiui/external/ApplicationDelegate;->mApplication:Lmiui/external/Application;

    invoke-virtual {v0, p1}, Lmiui/external/Application;->superOnConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 92
    return-void
.end method

.method public onCreate()V
    .locals 1

    .line 67
    iget-object v0, p0, Lmiui/external/ApplicationDelegate;->mApplication:Lmiui/external/Application;

    invoke-virtual {v0}, Lmiui/external/Application;->superOnCreate()V

    .line 68
    return-void
.end method

.method public onLowMemory()V
    .locals 1

    .line 106
    iget-object v0, p0, Lmiui/external/ApplicationDelegate;->mApplication:Lmiui/external/Application;

    invoke-virtual {v0}, Lmiui/external/Application;->superOnLowMemory()V

    .line 107
    return-void
.end method

.method public onTerminate()V
    .locals 1

    .line 77
    iget-object v0, p0, Lmiui/external/ApplicationDelegate;->mApplication:Lmiui/external/Application;

    invoke-virtual {v0}, Lmiui/external/Application;->superOnTerminate()V

    .line 78
    return-void
.end method

.method public onTrimMemory(I)V
    .locals 1

    .line 126
    iget-object v0, p0, Lmiui/external/ApplicationDelegate;->mApplication:Lmiui/external/Application;

    invoke-virtual {v0, p1}, Lmiui/external/Application;->superOnTrimMemory(I)V

    .line 127
    return-void
.end method

.method public registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V
    .locals 1

    .line 152
    iget-object v0, p0, Lmiui/external/ApplicationDelegate;->mApplication:Lmiui/external/Application;

    invoke-virtual {v0, p1}, Lmiui/external/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 153
    return-void
.end method

.method public registerComponentCallbacks(Landroid/content/ComponentCallbacks;)V
    .locals 1

    .line 138
    iget-object v0, p0, Lmiui/external/ApplicationDelegate;->mApplication:Lmiui/external/Application;

    invoke-virtual {v0, p1}, Lmiui/external/Application;->registerComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    .line 139
    return-void
.end method

.method public unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V
    .locals 1

    .line 156
    iget-object v0, p0, Lmiui/external/ApplicationDelegate;->mApplication:Lmiui/external/Application;

    invoke-virtual {v0, p1}, Lmiui/external/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 157
    return-void
.end method

.method public unregisterComponentCallbacks(Landroid/content/ComponentCallbacks;)V
    .locals 1

    .line 148
    iget-object v0, p0, Lmiui/external/ApplicationDelegate;->mApplication:Lmiui/external/Application;

    invoke-virtual {v0, p1}, Lmiui/external/Application;->unregisterComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    .line 149
    return-void
.end method
