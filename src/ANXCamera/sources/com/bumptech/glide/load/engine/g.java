package com.bumptech.glide.load.engine;

import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.EncodeStrategy;

/* compiled from: DiskCacheStrategy */
public abstract class g {
    public static final g fk = new g() {
        public boolean b(DataSource dataSource) {
            return dataSource == DataSource.REMOTE;
        }

        public boolean a(boolean z, DataSource dataSource, EncodeStrategy encodeStrategy) {
            return (dataSource == DataSource.RESOURCE_DISK_CACHE || dataSource == DataSource.MEMORY_CACHE) ? false : true;
        }

        public boolean aO() {
            return true;
        }

        public boolean aP() {
            return true;
        }
    };
    public static final g fl = new g() {
        public boolean b(DataSource dataSource) {
            return false;
        }

        public boolean a(boolean z, DataSource dataSource, EncodeStrategy encodeStrategy) {
            return false;
        }

        public boolean aO() {
            return false;
        }

        public boolean aP() {
            return false;
        }
    };
    public static final g fm = new g() {
        public boolean b(DataSource dataSource) {
            return (dataSource == DataSource.DATA_DISK_CACHE || dataSource == DataSource.MEMORY_CACHE) ? false : true;
        }

        public boolean a(boolean z, DataSource dataSource, EncodeStrategy encodeStrategy) {
            return false;
        }

        public boolean aO() {
            return false;
        }

        public boolean aP() {
            return true;
        }
    };
    public static final g fn = new g() {
        public boolean b(DataSource dataSource) {
            return false;
        }

        public boolean a(boolean z, DataSource dataSource, EncodeStrategy encodeStrategy) {
            return (dataSource == DataSource.RESOURCE_DISK_CACHE || dataSource == DataSource.MEMORY_CACHE) ? false : true;
        }

        public boolean aO() {
            return true;
        }

        public boolean aP() {
            return false;
        }
    };
    public static final g fo = new g() {
        public boolean b(DataSource dataSource) {
            return dataSource == DataSource.REMOTE;
        }

        public boolean a(boolean z, DataSource dataSource, EncodeStrategy encodeStrategy) {
            return ((z && dataSource == DataSource.DATA_DISK_CACHE) || dataSource == DataSource.LOCAL) && encodeStrategy == EncodeStrategy.TRANSFORMED;
        }

        public boolean aO() {
            return true;
        }

        public boolean aP() {
            return true;
        }
    };

    public abstract boolean a(boolean z, DataSource dataSource, EncodeStrategy encodeStrategy);

    public abstract boolean aO();

    public abstract boolean aP();

    public abstract boolean b(DataSource dataSource);
}
