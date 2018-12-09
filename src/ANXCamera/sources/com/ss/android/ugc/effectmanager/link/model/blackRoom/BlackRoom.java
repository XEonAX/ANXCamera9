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
    public synchronized void lock(com.ss.android.ugc.effectmanager.link.model.blackRoom.BlackRoomItem r7) {
        /*
        r6 = this;
        monitor-enter(r6);
        if (r7 != 0) goto L_0x0005;
    L_0x0003:
        monitor-exit(r6);
        return;
    L_0x0005:
        r0 = r7.lockToBlackRoom();	 Catch:{ all -> 0x004c }
        if (r0 == 0) goto L_0x004a;
    L_0x000b:
        r0 = "BlackRoom";
        r1 = new java.lang.StringBuilder;	 Catch:{ all -> 0x004c }
        r1.<init>();	 Catch:{ all -> 0x004c }
        r2 = "lock ";
        r1.append(r2);	 Catch:{ all -> 0x004c }
        r2 = r7.getItemName();	 Catch:{ all -> 0x004c }
        r1.append(r2);	 Catch:{ all -> 0x004c }
        r2 = " ";
        r1.append(r2);	 Catch:{ all -> 0x004c }
        r2 = r7.getLockedCount();	 Catch:{ all -> 0x004c }
        r1.append(r2);	 Catch:{ all -> 0x004c }
        r2 = " time for ";
        r1.append(r2);	 Catch:{ all -> 0x004c }
        r7 = r7.getLockedCount();	 Catch:{ all -> 0x004c }
        r2 = r6.getLockedTime(r7);	 Catch:{ all -> 0x004c }
        r4 = 60000; // 0xea60 float:8.4078E-41 double:2.9644E-319;
        r2 = r2 / r4;
        r1.append(r2);	 Catch:{ all -> 0x004c }
        r7 = " min";
        r1.append(r7);	 Catch:{ all -> 0x004c }
        r7 = r1.toString();	 Catch:{ all -> 0x004c }
        com.ss.android.ugc.effectmanager.common.utils.LogUtils.e(r0, r7);	 Catch:{ all -> 0x004c }
    L_0x004a:
        monitor-exit(r6);
        return;
    L_0x004c:
        r7 = move-exception;
        monitor-exit(r6);
        throw r7;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.ss.android.ugc.effectmanager.link.model.blackRoom.BlackRoom.lock(com.ss.android.ugc.effectmanager.link.model.blackRoom.BlackRoomItem):void");
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
