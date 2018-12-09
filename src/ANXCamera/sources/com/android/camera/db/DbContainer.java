package com.android.camera.db;

import android.content.Context;
import com.android.camera.CameraAppImpl;
import com.android.camera.db.greendao.DaoMaster;
import com.android.camera.db.greendao.DaoMaster.DevOpenHelper;
import com.android.camera.db.greendao.DaoSession;

public class DbContainer {
    private static DbContainer dbContainer;
    private Context context;
    private DaoMaster daoMaster;
    private DaoSession daoSession;

    private DbContainer(Context context) {
        this.context = context;
    }

    public static final void init(Context context) {
        if (dbContainer == null) {
            dbContainer = new DbContainer(context);
        }
    }

    public static DbContainer getInstance() {
        return dbContainer;
    }

    public static void release() {
        if (dbContainer != null) {
            dbContainer.clear();
            dbContainer = null;
        }
    }

    private void clear() {
        if (this.daoSession != null) {
            this.daoSession.clear();
            this.daoSession = null;
        }
        if (this.daoMaster != null) {
            this.daoMaster = null;
        }
    }

    public DaoMaster getDaoMaster() {
        if (this.daoMaster == null) {
            if (this.context == null) {
                this.context = CameraAppImpl.getAndroidContext();
            }
            this.daoMaster = new DaoMaster(new DevOpenHelper(this.context, "camera.db", null).getWritableDb());
        }
        return this.daoMaster;
    }

    public DaoSession getDaoSession() {
        if (this.daoSession == null) {
            this.daoMaster = getDaoMaster();
            this.daoSession = this.daoMaster.newSession();
        }
        return this.daoSession;
    }
}
