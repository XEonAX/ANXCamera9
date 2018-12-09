package com.android.gallery3d.exif;

import java.util.HashMap;
import java.util.Map;

class IfdData {
    private static final int[] sIfds = new int[]{0, 1, 2, 3, 4};
    private final Map<Short, ExifTag> mExifTags = new HashMap();
    private final int mIfdId;
    private int mOffsetToNextIfd = 0;

    IfdData(int i) {
        this.mIfdId = i;
    }

    protected static int[] getIfds() {
        return sIfds;
    }

    protected ExifTag[] getAllTags() {
        return (ExifTag[]) this.mExifTags.values().toArray(new ExifTag[this.mExifTags.size()]);
    }

    protected int getId() {
        return this.mIfdId;
    }

    protected ExifTag getTag(short s) {
        return (ExifTag) this.mExifTags.get(Short.valueOf(s));
    }

    protected ExifTag setTag(ExifTag exifTag) {
        exifTag.setIfd(this.mIfdId);
        return (ExifTag) this.mExifTags.put(Short.valueOf(exifTag.getTagId()), exifTag);
    }

    protected boolean checkCollision(short s) {
        return this.mExifTags.get(Short.valueOf(s)) != null;
    }

    protected void removeTag(short s) {
        this.mExifTags.remove(Short.valueOf(s));
    }

    protected int getTagCount() {
        return this.mExifTags.size();
    }

    protected void setOffsetToNextIfd(int i) {
        this.mOffsetToNextIfd = i;
    }

    protected int getOffsetToNextIfd() {
        return this.mOffsetToNextIfd;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && (obj instanceof IfdData)) {
            IfdData ifdData = (IfdData) obj;
            if (ifdData.getId() == this.mIfdId && ifdData.getTagCount() == getTagCount()) {
                for (ExifTag exifTag : ifdData.getAllTags()) {
                    if (!ExifInterface.isOffsetTag(exifTag.getTagId()) && !exifTag.equals((ExifTag) this.mExifTags.get(Short.valueOf(exifTag.getTagId())))) {
                        return false;
                    }
                }
                return true;
            }
        }
        return false;
    }
}
