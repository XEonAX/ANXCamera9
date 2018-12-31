package com.android.camera.db.item;

import android.content.Context;
import com.android.camera.CameraAppImpl;
import com.android.camera.db.element.SaveTask;
import com.android.camera.db.greendao.SaveTaskDao;
import com.android.camera.db.greendao.SaveTaskDao.Properties;
import com.android.camera.log.Log;
import com.xiaomi.camera.parallelservice.util.ParallelUtil;
import java.util.List;
import org.greenrobot.greendao.AbstractDao;
import org.greenrobot.greendao.Property;
import org.greenrobot.greendao.query.Query;
import org.greenrobot.greendao.query.WhereCondition;

public class DbItemSaveTask extends DbItemBase<SaveTask, Long> {
    private static final int PROCESS_MAX_TIME_OUT = 10000;

    protected SaveTask createItem(long j) {
        SaveTask saveTask;
        synchronized (this.mLock) {
            saveTask = new SaveTask();
            saveTask.setStartTime(Long.valueOf(j));
        }
        return saveTask;
    }

    protected SaveTask endItem(SaveTask saveTask, long j) {
        return saveTask;
    }

    protected String provideTableName() {
        return SaveTaskDao.TABLENAME;
    }

    protected AbstractDao<SaveTask, Long> getDao() {
        return getDaoSession().getSaveTaskDao();
    }

    protected Property getOrderProperty() {
        return Properties.Id;
    }

    public SaveTask getItemByPath(String str) {
        synchronized (this.mLock) {
            List list = getDao().queryBuilder().where(Properties.Path.eq(str), new WhereCondition[0]).limit(1).build().list();
            if (list == null || list.isEmpty()) {
                return null;
            }
            SaveTask saveTask = (SaveTask) list.get(0);
            return saveTask;
        }
    }

    public SaveTask getItemByMediaId(Long l) {
        synchronized (this.mLock) {
            List list = getDao().queryBuilder().where(Properties.MediaStoreId.eq(l), new WhereCondition[0]).limit(1).build().list();
            if (list == null || list.isEmpty()) {
                return null;
            }
            SaveTask saveTask = (SaveTask) list.get(0);
            return saveTask;
        }
    }

    public SaveTask getItemWithExistedQuery(Query query, String str) {
        synchronized (this.mLock) {
            query.setParameter(0, (Object) str);
            List list = getDao().queryBuilder().where(Properties.Path.eq(str), new WhereCondition[0]).limit(1).build().list();
            if (list == null || list.isEmpty()) {
                return null;
            }
            SaveTask saveTask = (SaveTask) list.get(0);
            return saveTask;
        }
    }

    /* JADX WARNING: Missing block: B:20:0x0074, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void markAllDepartedTask() {
        synchronized (this.mLock) {
            List<SaveTask> allItems = getAllItems();
            if (allItems == null || allItems.size() == 0) {
            } else {
                Context androidContext = CameraAppImpl.getAndroidContext();
                long currentTimeMillis = System.currentTimeMillis();
                for (SaveTask saveTask : allItems) {
                    if (saveTask.isDeparted(currentTimeMillis)) {
                        StringBuilder stringBuilder;
                        if (saveTask.isValid()) {
                            stringBuilder = new StringBuilder();
                            stringBuilder.append("mark departed:");
                            stringBuilder.append(saveTask.getPath());
                            Log.e("algo ", stringBuilder.toString());
                            ParallelUtil.markTaskFinish(androidContext, saveTask, false);
                        } else {
                            stringBuilder = new StringBuilder();
                            stringBuilder.append("not valid, remove:");
                            stringBuilder.append(saveTask.getPath());
                            Log.e("algo ", stringBuilder.toString());
                            removeItem(saveTask);
                        }
                    }
                }
            }
        }
    }
}
