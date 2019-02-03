package com.ss.android.medialib.listener;

import java.io.IOException;

public interface CameraListener {
    void onOpenFail();

    void onOpenSuccess() throws IOException;
}
