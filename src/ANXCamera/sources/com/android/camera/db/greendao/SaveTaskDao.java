package com.android.camera.db.greendao;

import android.database.Cursor;
import android.database.sqlite.SQLiteStatement;
import com.android.camera.db.element.SaveTask;
import com.google.android.apps.photos.api.ProcessingMetadataQuery;
import org.greenrobot.greendao.AbstractDao;
import org.greenrobot.greendao.Property;
import org.greenrobot.greendao.database.Database;
import org.greenrobot.greendao.database.DatabaseStatement;
import org.greenrobot.greendao.internal.DaoConfig;

public class SaveTaskDao extends AbstractDao<SaveTask, Long> {
    public static final String TABLENAME = "tasks";

    public static class Properties {
        public static final Property Id = new Property(0, Long.class, "id", true, "_id");
        public static final Property JpegRotation = new Property(6, Integer.TYPE, "jpegRotation", false, "jpeg_rotation");
        public static final Property MediaStoreId = new Property(2, Long.class, "mediaStoreId", false, ProcessingMetadataQuery.MEDIA_STORE_ID);
        public static final Property Path = new Property(3, String.class, "path", false, ProcessingMetadataQuery.MEDIA_PATH);
        public static final Property Percentage = new Property(5, Integer.TYPE, "percentage", false, ProcessingMetadataQuery.PROGRESS_PERCENTAGE);
        public static final Property StartTime = new Property(1, Long.class, "startTime", false, ProcessingMetadataQuery.START_TIME);
        public static final Property Status = new Property(4, Integer.TYPE, "status", false, ProcessingMetadataQuery.PROGRESS_STATUS);
    }

    public SaveTaskDao(DaoConfig daoConfig) {
        super(daoConfig);
    }

    public SaveTaskDao(DaoConfig daoConfig, DaoSession daoSession) {
        super(daoConfig, daoSession);
    }

    public static void createTable(Database database, boolean z) {
        String str = z ? "IF NOT EXISTS " : "";
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("CREATE TABLE ");
        stringBuilder.append(str);
        stringBuilder.append("\"tasks\" (\"_id\" INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE ,\"start_time\" INTEGER,\"media_store_id\" INTEGER,\"media_path\" TEXT,\"progress_status\" INTEGER NOT NULL ,\"progress_percentage\" INTEGER NOT NULL ,\"jpeg_rotation\" INTEGER NOT NULL );");
        database.execSQL(stringBuilder.toString());
    }

    public static void dropTable(Database database, boolean z) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("DROP TABLE ");
        stringBuilder.append(z ? "IF EXISTS " : "");
        stringBuilder.append("\"tasks\"");
        database.execSQL(stringBuilder.toString());
    }

    protected final void bindValues(DatabaseStatement databaseStatement, SaveTask saveTask) {
        databaseStatement.clearBindings();
        Long id = saveTask.getId();
        if (id != null) {
            databaseStatement.bindLong(1, id.longValue());
        }
        id = saveTask.getStartTime();
        if (id != null) {
            databaseStatement.bindLong(2, id.longValue());
        }
        id = saveTask.getMediaStoreId();
        if (id != null) {
            databaseStatement.bindLong(3, id.longValue());
        }
        String path = saveTask.getPath();
        if (path != null) {
            databaseStatement.bindString(4, path);
        }
        databaseStatement.bindLong(5, (long) saveTask.getStatus());
        databaseStatement.bindLong(6, (long) saveTask.getPercentage());
        databaseStatement.bindLong(7, (long) saveTask.getJpegRotation());
    }

    protected final void bindValues(SQLiteStatement sQLiteStatement, SaveTask saveTask) {
        sQLiteStatement.clearBindings();
        Long id = saveTask.getId();
        if (id != null) {
            sQLiteStatement.bindLong(1, id.longValue());
        }
        id = saveTask.getStartTime();
        if (id != null) {
            sQLiteStatement.bindLong(2, id.longValue());
        }
        id = saveTask.getMediaStoreId();
        if (id != null) {
            sQLiteStatement.bindLong(3, id.longValue());
        }
        String path = saveTask.getPath();
        if (path != null) {
            sQLiteStatement.bindString(4, path);
        }
        sQLiteStatement.bindLong(5, (long) saveTask.getStatus());
        sQLiteStatement.bindLong(6, (long) saveTask.getPercentage());
        sQLiteStatement.bindLong(7, (long) saveTask.getJpegRotation());
    }

    public Long readKey(Cursor cursor, int i) {
        i += 0;
        return cursor.isNull(i) ? null : Long.valueOf(cursor.getLong(i));
    }

    public SaveTask readEntity(Cursor cursor, int i) {
        Long l;
        Long l2;
        Long l3;
        int i2 = i + 0;
        if (cursor.isNull(i2)) {
            l = null;
        } else {
            l = Long.valueOf(cursor.getLong(i2));
        }
        i2 = i + 1;
        if (cursor.isNull(i2)) {
            l2 = null;
        } else {
            l2 = Long.valueOf(cursor.getLong(i2));
        }
        i2 = i + 2;
        if (cursor.isNull(i2)) {
            l3 = null;
        } else {
            l3 = Long.valueOf(cursor.getLong(i2));
        }
        i2 = i + 3;
        return new SaveTask(l, l2, l3, cursor.isNull(i2) ? null : cursor.getString(i2), cursor.getInt(i + 4), cursor.getInt(i + 5), cursor.getInt(i + 6));
    }

    public void readEntity(Cursor cursor, SaveTask saveTask, int i) {
        int i2 = i + 0;
        String str = null;
        saveTask.setId(cursor.isNull(i2) ? null : Long.valueOf(cursor.getLong(i2)));
        i2 = i + 1;
        saveTask.setStartTime(cursor.isNull(i2) ? null : Long.valueOf(cursor.getLong(i2)));
        i2 = i + 2;
        saveTask.setMediaStoreId(cursor.isNull(i2) ? null : Long.valueOf(cursor.getLong(i2)));
        i2 = i + 3;
        if (!cursor.isNull(i2)) {
            str = cursor.getString(i2);
        }
        saveTask.setPath(str);
        saveTask.setStatus(cursor.getInt(i + 4));
        saveTask.setPercentage(cursor.getInt(i + 5));
        saveTask.setJpegRotation(cursor.getInt(i + 6));
    }

    protected final Long updateKeyAfterInsert(SaveTask saveTask, long j) {
        saveTask.setId(Long.valueOf(j));
        return Long.valueOf(j);
    }

    public Long getKey(SaveTask saveTask) {
        if (saveTask != null) {
            return saveTask.getId();
        }
        return null;
    }

    public boolean hasKey(SaveTask saveTask) {
        return saveTask.getId() != null;
    }

    protected final boolean isEntityUpdateable() {
        return true;
    }
}
