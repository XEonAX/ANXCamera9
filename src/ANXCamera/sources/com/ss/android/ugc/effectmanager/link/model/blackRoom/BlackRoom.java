package com.ss.android.ugc.effectmanager.link.model.blackRoom;

import com.ss.android.ugc.effectmanager.common.utils.LogUtils;

public class BlackRoom {
    private static final String TAG = "BlackRoom";

    public boolean checkHostAvailable(BlackRoomItem blackRoomItem) {
        if (blackRoomItem == null) {
            return false;
        }
        String str;
        StringBuilder stringBuilder;
        if (blackRoomItem.isInBlackRoom()) {
            long currentTimeMillis = System.currentTimeMillis() - blackRoomItem.startLockTime();
            if (currentTimeMillis >= getLockedTime(blackRoomItem.getLockedCount())) {
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("unlock ");
                stringBuilder.append(blackRoomItem.getItemName());
                stringBuilder.append(", locked count = ");
                stringBuilder.append(blackRoomItem.getLockedCount());
                stringBuilder.append(", should lock ");
                stringBuilder.append(getLockedTime(blackRoomItem.getLockedCount()) / 60000);
                stringBuilder.append(" min, already locked ");
                stringBuilder.append(currentTimeMillis / 60000);
                stringBuilder.append(" min");
                LogUtils.d(str, stringBuilder.toString());
                blackRoomItem.unlockFromBlackRoom();
                return true;
            }
            String str2 = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append(blackRoomItem.getItemName());
            stringBuilder2.append(" is locked, locked count = ");
            stringBuilder2.append(blackRoomItem.getLockedCount());
            stringBuilder2.append(", should lock ");
            stringBuilder2.append(getLockedTime(blackRoomItem.getLockedCount()) / 60000);
            stringBuilder2.append(" min, already locked ");
            stringBuilder2.append(currentTimeMillis / 60000);
            stringBuilder2.append(" min");
            LogUtils.e(str2, stringBuilder2.toString());
            return false;
        }
        str = TAG;
        stringBuilder = new StringBuilder();
        stringBuilder.append(blackRoomItem.getItemName());
        stringBuilder.append(" is available");
        LogUtils.d(str, stringBuilder.toString());
        return true;
    }

    /* JADX WARNING: Missing block: B:9:0x004b, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized void lock(BlackRoomItem blackRoomItem) {
        if (blackRoomItem != null) {
            if (blackRoomItem.lockToBlackRoom()) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("lock ");
                stringBuilder.append(blackRoomItem.getItemName());
                stringBuilder.append(" ");
                stringBuilder.append(blackRoomItem.getLockedCount());
                stringBuilder.append(" time for ");
                stringBuilder.append(getLockedTime(blackRoomItem.getLockedCount()) / 60000);
                stringBuilder.append(" min");
                LogUtils.e(str, stringBuilder.toString());
            }
        }
    }

    private long getLockedTime(int i) {
        if (i > 5) {
            i = 5;
        }
        if (i == 1) {
            return 60000;
        }
        return ((long) Math.pow(2.0d, (double) (i - 1))) * 60000;
    }
}
