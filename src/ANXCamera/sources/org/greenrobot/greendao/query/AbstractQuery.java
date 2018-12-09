package org.greenrobot.greendao.query;

import java.util.Date;
import org.greenrobot.greendao.AbstractDao;
import org.greenrobot.greendao.DaoException;
import org.greenrobot.greendao.InternalQueryDaoAccess;

abstract class AbstractQuery<T> {
    protected final AbstractDao<T, ?> dao;
    protected final InternalQueryDaoAccess<T> daoAccess;
    protected final Thread ownerThread = Thread.currentThread();
    protected final String[] parameters;
    protected final String sql;

    protected static String[] toStringArray(Object[] objArr) {
        int length = objArr.length;
        String[] strArr = new String[length];
        for (int i = 0; i < length; i++) {
            Object obj = objArr[i];
            if (obj != null) {
                strArr[i] = obj.toString();
            } else {
                strArr[i] = null;
            }
        }
        return strArr;
    }

    protected AbstractQuery(AbstractDao<T, ?> abstractDao, String str, String[] strArr) {
        this.dao = abstractDao;
        this.daoAccess = new InternalQueryDaoAccess(abstractDao);
        this.sql = str;
        this.parameters = strArr;
    }

    public AbstractQuery<T> setParameter(int i, Object obj) {
        checkThread();
        if (obj != null) {
            this.parameters[i] = obj.toString();
        } else {
            this.parameters[i] = null;
        }
        return this;
    }

    public AbstractQuery<T> setParameter(int i, Date date) {
        return setParameter(i, date != null ? Long.valueOf(date.getTime()) : null);
    }

    public AbstractQuery<T> setParameter(int i, Boolean bool) {
        return setParameter(i, bool != null ? Integer.valueOf(bool.booleanValue()) : null);
    }

    protected void checkThread() {
        if (Thread.currentThread() != this.ownerThread) {
            throw new DaoException("Method may be called only in owner thread, use forCurrentThread to get an instance for this thread");
        }
    }
}
