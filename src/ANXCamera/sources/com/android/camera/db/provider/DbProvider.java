package com.android.camera.db.provider;

import java.util.List;
import org.greenrobot.greendao.query.Query;

public interface DbProvider {

    public interface providerDb<T, K> {
        long endItemAndInsert(T t, long j);

        T generateItem(long j);

        List<T> getAllItems();

        long getCount();

        T getItemByMediaId(Long l);

        T getItemByPath(String str);

        T getItemWithExistedQuery(Query query, String str);

        T getLastItem();

        void removeItem(T t);

        void updateItem(T t);
    }

    <P extends providerDb> P dbItemSaveTask();
}
