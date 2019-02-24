package com.android.camera.data;

import android.content.Context;
import com.android.camera.data.backup.DataBackUp;
import com.android.camera.data.restore.DataRestore;

public interface DataProtocol {
    DataBackUp backUp();

    void backUpAll(int i);

    DataRestore restore();

    void restoreAll(Context context, int i);
}
