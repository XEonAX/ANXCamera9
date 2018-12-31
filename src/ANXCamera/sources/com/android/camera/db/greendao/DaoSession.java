package com.android.camera.db.greendao;

import com.android.camera.db.element.SaveTask;
import java.util.Map;
import org.greenrobot.greendao.AbstractDao;
import org.greenrobot.greendao.AbstractDaoSession;
import org.greenrobot.greendao.database.Database;
import org.greenrobot.greendao.identityscope.IdentityScopeType;
import org.greenrobot.greendao.internal.DaoConfig;

public class DaoSession extends AbstractDaoSession {
    private final SaveTaskDao saveTaskDao = new SaveTaskDao(this.saveTaskDaoConfig, this);
    private final DaoConfig saveTaskDaoConfig;

    public DaoSession(Database database, IdentityScopeType identityScopeType, Map<Class<? extends AbstractDao<?, ?>>, DaoConfig> map) {
        super(database);
        this.saveTaskDaoConfig = ((DaoConfig) map.get(SaveTaskDao.class)).clone();
        this.saveTaskDaoConfig.initIdentityScope(identityScopeType);
        registerDao(SaveTask.class, this.saveTaskDao);
    }

    public void clear() {
        this.saveTaskDaoConfig.clearIdentityScope();
    }

    public SaveTaskDao getSaveTaskDao() {
        return this.saveTaskDao;
    }
}
