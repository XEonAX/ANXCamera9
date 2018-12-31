package com.ss.android.ugc.effectmanager.link.model.blackRoom;

public abstract class BlackRoomItem {
    protected boolean inBlackRoom;
    protected int lockedCount = 0;
    protected long startLockTime;

    public abstract String getItemName();

    public boolean isInBlackRoom() {
        return this.inBlackRoom;
    }

    public boolean lockToBlackRoom() {
        if (isInBlackRoom()) {
            return false;
        }
        this.inBlackRoom = true;
        this.lockedCount++;
        this.startLockTime = System.currentTimeMillis();
        return true;
    }

    public void unlockFromBlackRoom() {
        this.inBlackRoom = false;
    }

    public long startLockTime() {
        return this.startLockTime;
    }

    public int getLockedCount() {
        return this.lockedCount;
    }

    public void resetStatus() {
        this.inBlackRoom = false;
        this.lockedCount = 0;
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("BlackRoomItem{name=");
        stringBuilder.append(getItemName());
        stringBuilder.append("lockedCount=");
        stringBuilder.append(this.lockedCount);
        stringBuilder.append(", inBlackRoom=");
        stringBuilder.append(this.inBlackRoom);
        stringBuilder.append('}');
        return stringBuilder.toString();
    }
}
