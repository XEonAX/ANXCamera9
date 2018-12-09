package com.android.camera.db.item;

import com.android.camera.db.element.SaveTask;
import com.android.camera.db.greendao.SaveTaskDao;
import com.android.camera.db.greendao.SaveTaskDao.Properties;
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
    public void markAllDepartedTask() {
        /*
        r9 = this;
        r0 = r9.mLock;
        monitor-enter(r0);
        r1 = r9.getAllItems();	 Catch:{ all -> 0x0075 }
        if (r1 == 0) goto L_0x0073;
    L_0x0009:
        r2 = r1.size();	 Catch:{ all -> 0x0075 }
        if (r2 != 0) goto L_0x0010;
    L_0x000f:
        goto L_0x0073;
    L_0x0010:
        r2 = com.android.camera.CameraAppImpl.getAndroidContext();	 Catch:{ all -> 0x0075 }
        r3 = java.lang.System.currentTimeMillis();	 Catch:{ all -> 0x0075 }
        r1 = r1.iterator();	 Catch:{ all -> 0x0075 }
    L_0x001c:
        r5 = r1.hasNext();	 Catch:{ all -> 0x0075 }
        if (r5 == 0) goto L_0x0071;
    L_0x0022:
        r5 = r1.next();	 Catch:{ all -> 0x0075 }
        r5 = (com.android.camera.db.element.SaveTask) r5;	 Catch:{ all -> 0x0075 }
        r6 = r5.isDeparted(r3);	 Catch:{ all -> 0x0075 }
        if (r6 == 0) goto L_0x0070;
    L_0x002e:
        r6 = r5.isValid();	 Catch:{ all -> 0x0075 }
        if (r6 != 0) goto L_0x0052;
    L_0x0034:
        r6 = "algo ";
        r7 = new java.lang.StringBuilder;	 Catch:{ all -> 0x0075 }
        r7.<init>();	 Catch:{ all -> 0x0075 }
        r8 = "not valid, remove:";
        r7.append(r8);	 Catch:{ all -> 0x0075 }
        r8 = r5.getPath();	 Catch:{ all -> 0x0075 }
        r7.append(r8);	 Catch:{ all -> 0x0075 }
        r7 = r7.toString();	 Catch:{ all -> 0x0075 }
        com.android.camera.log.Log.e(r6, r7);	 Catch:{ all -> 0x0075 }
        r9.removeItem(r5);	 Catch:{ all -> 0x0075 }
        goto L_0x0070;
    L_0x0052:
        r6 = "algo ";
        r7 = new java.lang.StringBuilder;	 Catch:{ all -> 0x0075 }
        r7.<init>();	 Catch:{ all -> 0x0075 }
        r8 = "mark departed:";
        r7.append(r8);	 Catch:{ all -> 0x0075 }
        r8 = r5.getPath();	 Catch:{ all -> 0x0075 }
        r7.append(r8);	 Catch:{ all -> 0x0075 }
        r7 = r7.toString();	 Catch:{ all -> 0x0075 }
        com.android.camera.log.Log.e(r6, r7);	 Catch:{ all -> 0x0075 }
        r6 = 0;
        com.xiaomi.camera.parallelservice.util.ParallelUtil.markTaskFinish(r2, r5, r6);	 Catch:{ all -> 0x0075 }
    L_0x0070:
        goto L_0x001c;
    L_0x0071:
        monitor-exit(r0);	 Catch:{ all -> 0x0075 }
        return;
    L_0x0073:
        monitor-exit(r0);	 Catch:{ all -> 0x0075 }
        return;
    L_0x0075:
        r1 = move-exception;
        monitor-exit(r0);	 Catch:{ all -> 0x0075 }
        throw r1;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.db.item.DbItemSaveTask.markAllDepartedTask():void");
    }
}
