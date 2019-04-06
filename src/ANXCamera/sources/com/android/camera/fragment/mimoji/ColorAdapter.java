package com.android.camera.fragment.mimoji;

import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView.Adapter;
import android.view.ViewGroup;
import com.android.camera.fragment.CommonRecyclerViewHolder;

public class ColorAdapter extends Adapter<CommonRecyclerViewHolder> {
    public int getItemCount() {
        return 0;
    }

    public long getItemId(int i) {
        return super.getItemId(i);
    }

    public void onBindViewHolder(@NonNull CommonRecyclerViewHolder commonRecyclerViewHolder, int i) {
    }

    @NonNull
    public CommonRecyclerViewHolder onCreateViewHolder(@NonNull ViewGroup viewGroup, int i) {
        return null;
    }
}
