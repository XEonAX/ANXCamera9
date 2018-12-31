package com.android.camera.db.provider;

import com.android.camera.db.item.DbItemSaveTask;

public class DbProviderMgr {
    private DbProvider dataProvider = new DbProviderImpl();

    private final class DbProviderImpl implements DbProvider {
        private DbItemSaveTask dbItemSaveTask = new DbItemSaveTask();

        public DbItemSaveTask dbItemSaveTask() {
            return this.dbItemSaveTask;
        }
    }

    public DbProvider provider() {
        return this.dataProvider;
    }
}
