package org.greenrobot.greendao;

import java.util.Collection;
import org.greenrobot.greendao.internal.SqlUtils;
import org.greenrobot.greendao.query.WhereCondition;
import org.greenrobot.greendao.query.WhereCondition.PropertyCondition;

public class Property {
    public final String columnName;
    public final String name;
    public final int ordinal;
    public final boolean primaryKey;
    public final Class<?> type;

    public Property(int i, Class<?> cls, String str, boolean z, String str2) {
        this.ordinal = i;
        this.type = cls;
        this.name = str;
        this.primaryKey = z;
        this.columnName = str2;
    }

    public WhereCondition eq(Object obj) {
        return new PropertyCondition(this, "=?", obj);
    }

    public WhereCondition notEq(Object obj) {
        return new PropertyCondition(this, "<>?", obj);
    }

    public WhereCondition like(String str) {
        return new PropertyCondition(this, " LIKE ?", (Object) str);
    }

    public WhereCondition between(Object obj, Object obj2) {
        return new PropertyCondition(this, " BETWEEN ? AND ?", new Object[]{obj, obj2});
    }

    public WhereCondition in(Object... objArr) {
        StringBuilder stringBuilder = new StringBuilder(" IN (");
        SqlUtils.appendPlaceholders(stringBuilder, objArr.length).append(')');
        return new PropertyCondition(this, stringBuilder.toString(), objArr);
    }

    public WhereCondition in(Collection<?> collection) {
        return in(collection.toArray());
    }

    public WhereCondition notIn(Object... objArr) {
        StringBuilder stringBuilder = new StringBuilder(" NOT IN (");
        SqlUtils.appendPlaceholders(stringBuilder, objArr.length).append(')');
        return new PropertyCondition(this, stringBuilder.toString(), objArr);
    }

    public WhereCondition notIn(Collection<?> collection) {
        return notIn(collection.toArray());
    }

    public WhereCondition gt(Object obj) {
        return new PropertyCondition(this, ">?", obj);
    }

    public WhereCondition lt(Object obj) {
        return new PropertyCondition(this, "<?", obj);
    }

    public WhereCondition ge(Object obj) {
        return new PropertyCondition(this, ">=?", obj);
    }

    public WhereCondition le(Object obj) {
        return new PropertyCondition(this, "<=?", obj);
    }

    public WhereCondition isNull() {
        return new PropertyCondition(this, " IS NULL");
    }

    public WhereCondition isNotNull() {
        return new PropertyCondition(this, " IS NOT NULL");
    }
}
