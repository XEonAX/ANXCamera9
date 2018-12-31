package org.greenrobot.greendao.query;

import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;
import org.greenrobot.greendao.AbstractDao;
import org.greenrobot.greendao.DaoException;
import org.greenrobot.greendao.Property;
import org.greenrobot.greendao.query.WhereCondition.PropertyCondition;
import org.greenrobot.greendao.query.WhereCondition.StringCondition;

class WhereCollector<T> {
    private final AbstractDao<T, ?> dao;
    private final String tablePrefix;
    private final List<WhereCondition> whereConditions = new ArrayList();

    WhereCollector(AbstractDao<T, ?> abstractDao, String str) {
        this.dao = abstractDao;
        this.tablePrefix = str;
    }

    void add(WhereCondition whereCondition, WhereCondition... whereConditionArr) {
        checkCondition(whereCondition);
        this.whereConditions.add(whereCondition);
        for (WhereCondition whereCondition2 : whereConditionArr) {
            checkCondition(whereCondition2);
            this.whereConditions.add(whereCondition2);
        }
    }

    WhereCondition combineWhereConditions(String str, WhereCondition whereCondition, WhereCondition whereCondition2, WhereCondition... whereConditionArr) {
        StringBuilder stringBuilder = new StringBuilder("(");
        List arrayList = new ArrayList();
        addCondition(stringBuilder, arrayList, whereCondition);
        stringBuilder.append(str);
        addCondition(stringBuilder, arrayList, whereCondition2);
        for (WhereCondition whereCondition3 : whereConditionArr) {
            stringBuilder.append(str);
            addCondition(stringBuilder, arrayList, whereCondition3);
        }
        stringBuilder.append(')');
        return new StringCondition(stringBuilder.toString(), arrayList.toArray());
    }

    void addCondition(StringBuilder stringBuilder, List<Object> list, WhereCondition whereCondition) {
        checkCondition(whereCondition);
        whereCondition.appendTo(stringBuilder, this.tablePrefix);
        whereCondition.appendValuesTo(list);
    }

    void checkCondition(WhereCondition whereCondition) {
        if (whereCondition instanceof PropertyCondition) {
            checkProperty(((PropertyCondition) whereCondition).property);
        }
    }

    void checkProperty(Property property) {
        if (this.dao != null) {
            Object obj = null;
            for (Property property2 : this.dao.getProperties()) {
                if (property == property2) {
                    obj = 1;
                    break;
                }
            }
            if (obj == null) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Property '");
                stringBuilder.append(property.name);
                stringBuilder.append("' is not part of ");
                stringBuilder.append(this.dao);
                throw new DaoException(stringBuilder.toString());
            }
        }
    }

    void appendWhereClause(StringBuilder stringBuilder, String str, List<Object> list) {
        ListIterator listIterator = this.whereConditions.listIterator();
        while (listIterator.hasNext()) {
            if (listIterator.hasPrevious()) {
                stringBuilder.append(" AND ");
            }
            WhereCondition whereCondition = (WhereCondition) listIterator.next();
            whereCondition.appendTo(stringBuilder, str);
            whereCondition.appendValuesTo(list);
        }
    }

    boolean isEmpty() {
        return this.whereConditions.isEmpty();
    }
}
