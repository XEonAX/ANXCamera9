package com.ss.android.medialib.player;

public interface Message {

    public interface Info {
        public static final int COMMPLETED = 7;
        public static final int EXIT = 8;
        public static final int LOOP_END = 6;
        public static final int READY = 5;
    }

    public interface Listener {
        void onInfo(int i, int i2);
    }

    public interface What {
        public static final int ERROR = 1;
        public static final int STATUS = 0;
    }
}
