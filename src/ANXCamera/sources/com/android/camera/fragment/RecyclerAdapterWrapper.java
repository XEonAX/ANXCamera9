package com.android.camera.fragment;

import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.AdapterDataObserver;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.View;
import android.view.ViewGroup;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

public class RecyclerAdapterWrapper<T extends Adapter> extends Adapter<ViewHolder> {
    private static final int FOOTER_VIEW_TYPE = -2000;
    private static final int HEADER_VIEW_TYPE = -1000;
    private final T mBase;
    private final Class<? extends ViewHolder> mBaseHolderClass;
    private final List<View> mFooters = new ArrayList();
    private final List<View> mHeaders = new ArrayList();
    private AdapterDataObserver o;

    public RecyclerAdapterWrapper(T t) {
        this.mBase = t;
        Type genericSuperclass = this.mBase.getClass().getGenericSuperclass();
        if (genericSuperclass instanceof ParameterizedType) {
            genericSuperclass = ((ParameterizedType) genericSuperclass).getActualTypeArguments()[0];
            if (genericSuperclass instanceof Class) {
                this.mBaseHolderClass = (Class) genericSuperclass;
            } else {
                this.mBaseHolderClass = ViewHolder.class;
            }
        } else {
            this.mBaseHolderClass = ViewHolder.class;
        }
        Adapter adapter = this.mBase;
        AnonymousClass1 anonymousClass1 = new AdapterDataObserver() {
            public void onChanged() {
                super.onChanged();
                RecyclerAdapterWrapper.this.notifyDataSetChanged();
            }

            public void onItemRangeInserted(int i, int i2) {
                super.onItemRangeInserted(i, i2);
                RecyclerAdapterWrapper.this.notifyItemRangeInserted(RecyclerAdapterWrapper.this.getHeaderCount() + i, i2);
            }

            public void onItemRangeRemoved(int i, int i2) {
                super.onItemRangeRemoved(i, i2);
                RecyclerAdapterWrapper.this.notifyItemRangeRemoved(RecyclerAdapterWrapper.this.getHeaderCount() + i, i2);
            }

            public void onItemRangeChanged(int i, int i2) {
                super.onItemRangeChanged(i, i2);
                RecyclerAdapterWrapper.this.notifyItemRangeChanged(RecyclerAdapterWrapper.this.getHeaderCount() + i, i2);
            }
        };
        this.o = anonymousClass1;
        adapter.registerAdapterDataObserver(anonymousClass1);
    }

    public T getWrappedAdapter() {
        return this.mBase;
    }

    public boolean isContainsHeader(@NonNull View view) {
        if (view != null) {
            return this.mHeaders.contains(view);
        }
        throw new IllegalArgumentException("You can't have a null footer!");
    }

    public void addHeader(@NonNull View view) {
        if (view != null) {
            this.mHeaders.add(view);
            return;
        }
        throw new IllegalArgumentException("You can't have a null header!");
    }

    public void removeHeader(@NonNull View view) {
        if (view != null) {
            this.mHeaders.remove(view);
            return;
        }
        throw new IllegalArgumentException("You can't have a null header!");
    }

    public void removeAllHeader() {
        this.mHeaders.clear();
    }

    public boolean isContainsFooter(@NonNull View view) {
        if (view != null) {
            return this.mFooters.contains(view);
        }
        throw new IllegalArgumentException("You can't have a null footer!");
    }

    public void addFooter(@NonNull View view) {
        if (view != null) {
            this.mFooters.add(view);
            return;
        }
        throw new IllegalArgumentException("You can't have a null footer!");
    }

    public void removeFooter(@NonNull View view) {
        if (view != null) {
            this.mFooters.remove(view);
            return;
        }
        throw new IllegalArgumentException("You can't have a null header!");
    }

    public void detach() {
        if (this.o != null && this.mBase != null) {
            this.mBase.unregisterAdapterDataObserver(this.o);
        }
    }

    public void removeAllFooter() {
        this.mFooters.clear();
    }

    public int getHeaderCount() {
        return this.mHeaders.size();
    }

    public int getFooterCount() {
        return this.mFooters.size();
    }

    public View getHeader(int i) {
        return i < this.mHeaders.size() ? (View) this.mHeaders.get(i) : null;
    }

    public View getFooter(int i) {
        return i < this.mFooters.size() ? (View) this.mFooters.get(i) : null;
    }

    private boolean isHeader(int i) {
        return i >= -1000 && i < -1000 + this.mHeaders.size();
    }

    private boolean isFooter(int i) {
        return i >= -2000 && i < -2000 + this.mFooters.size();
    }

    public ViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        if (isHeader(i)) {
            return new ViewHolder((View) this.mHeaders.get(Math.abs(i + 1000))) {
            };
        } else if (!isFooter(i)) {
            return this.mBase.onCreateViewHolder(viewGroup, i);
        } else {
            return new ViewHolder((View) this.mFooters.get(Math.abs(i + 2000))) {
            };
        }
    }

    public void onBindViewHolder(ViewHolder viewHolder, int i) {
        if (i >= this.mHeaders.size() && i < this.mHeaders.size() + this.mBase.getItemCount()) {
            this.mBase.onBindViewHolder(viewHolder, i - this.mHeaders.size());
        }
    }

    public int getItemCount() {
        return (this.mHeaders.size() + this.mBase.getItemCount()) + this.mFooters.size();
    }

    public int getItemViewType(int i) {
        if (i < this.mHeaders.size()) {
            return -1000 + i;
        }
        if (i < this.mHeaders.size() + this.mBase.getItemCount()) {
            return this.mBase.getItemViewType(i - this.mHeaders.size());
        }
        return ((-2000 + i) - this.mHeaders.size()) - this.mBase.getItemCount();
    }

    public void onViewRecycled(ViewHolder viewHolder) {
        if (this.mBaseHolderClass.isInstance(viewHolder)) {
            this.mBase.onViewRecycled((ViewHolder) this.mBaseHolderClass.cast(viewHolder));
        }
    }

    public boolean onFailedToRecycleView(ViewHolder viewHolder) {
        if (this.mBaseHolderClass.isInstance(viewHolder)) {
            return this.mBase.onFailedToRecycleView((ViewHolder) this.mBaseHolderClass.cast(viewHolder));
        }
        return super.onFailedToRecycleView(viewHolder);
    }

    public void onViewAttachedToWindow(ViewHolder viewHolder) {
        if (this.mBaseHolderClass.isInstance(viewHolder)) {
            this.mBase.onViewAttachedToWindow((ViewHolder) this.mBaseHolderClass.cast(viewHolder));
        }
    }

    public void onViewDetachedFromWindow(ViewHolder viewHolder) {
        if (this.mBaseHolderClass.isInstance(viewHolder)) {
            this.mBase.onViewDetachedFromWindow((ViewHolder) this.mBaseHolderClass.cast(viewHolder));
        }
    }

    public void onAttachedToRecyclerView(RecyclerView recyclerView) {
        this.mBase.onAttachedToRecyclerView(recyclerView);
    }

    public void onDetachedFromRecyclerView(RecyclerView recyclerView) {
        this.mBase.onDetachedFromRecyclerView(recyclerView);
    }
}
