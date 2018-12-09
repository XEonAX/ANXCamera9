package org.greenrobot.greendao.test;

import android.app.Application;
import android.app.Instrumentation;
import android.database.sqlite.SQLiteDatabase;
import android.test.AndroidTestCase;
import java.util.Random;
import org.greenrobot.greendao.DaoLog;
import org.greenrobot.greendao.DbUtils;
import org.greenrobot.greendao.database.Database;
import org.greenrobot.greendao.database.StandardDatabase;

public abstract class DbTest extends AndroidTestCase {
    public static final String DB_NAME = "greendao-unittest-db.temp";
    private Application application;
    protected Database db;
    protected final boolean inMemory;
    protected final Random random;

    public DbTest() {
        this(true);
    }

    public DbTest(boolean z) {
        this.inMemory = z;
        this.random = new Random();
    }

    protected void setUp() throws Exception {
        super.setUp();
        this.db = createDatabase();
    }

    public <T extends Application> T createApplication(Class<T> cls) {
        assertNull("Application already created", this.application);
        try {
            T newApplication = Instrumentation.newApplication(cls, getContext());
            newApplication.onCreate();
            this.application = newApplication;
            return newApplication;
        } catch (Throwable e) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Could not create application ");
            stringBuilder.append(cls);
            throw new RuntimeException(stringBuilder.toString(), e);
        }
    }

    public void terminateApplication() {
        assertNotNull("Application not yet created", this.application);
        this.application.onTerminate();
        this.application = null;
    }

    public <T extends Application> T getApplication() {
        assertNotNull("Application not yet created", this.application);
        return this.application;
    }

    protected Database createDatabase() {
        SQLiteDatabase create;
        if (this.inMemory) {
            create = SQLiteDatabase.create(null);
        } else {
            getContext().deleteDatabase(DB_NAME);
            create = getContext().openOrCreateDatabase(DB_NAME, 0, null);
        }
        return new StandardDatabase(create);
    }

    protected void tearDown() throws Exception {
        if (this.application != null) {
            terminateApplication();
        }
        this.db.close();
        if (!this.inMemory) {
            getContext().deleteDatabase(DB_NAME);
        }
        super.tearDown();
    }

    protected void logTableDump(String str) {
        if (this.db instanceof StandardDatabase) {
            DbUtils.logTableDump(((StandardDatabase) this.db).getSQLiteDatabase(), str);
            return;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Table dump unsupported for ");
        stringBuilder.append(this.db);
        DaoLog.w(stringBuilder.toString());
    }
}
