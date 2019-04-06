package com.android.camera.fragment.mimoji;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import com.android.camera.R;
import com.arcsoft.avatar.AvatarConfig.c;
import java.util.ArrayList;
import java.util.List;

public class MimojiThumbnailAdapter extends BaseAdapter {
    private Context mContext;
    private List<c> mData = new ArrayList();
    private int mSelectItem = -1;

    class ViewHolder {
        ImageView imageView;
        ImageView selectView;

        ViewHolder() {
        }
    }

    MimojiThumbnailAdapter(Context context) {
        this.mContext = context;
    }

    public int getCount() {
        return this.mData.size();
    }

    public Object getItem(int i) {
        if (i >= this.mData.size()) {
            i = this.mData.size() - 1;
        }
        return this.mData.get(i);
    }

    public long getItemId(int i) {
        return 0;
    }

    public int getSelectItme() {
        return this.mSelectItem;
    }

    public View getView(int i, View view, ViewGroup viewGroup) {
        ViewHolder viewHolder;
        c cVar = (c) this.mData.get(i);
        if (view == null) {
            view = LayoutInflater.from(this.mContext).inflate(R.layout.v9_main, null);
            viewHolder = new ViewHolder();
            viewHolder.imageView = (ImageView) view.findViewById(R.id.autozoom_overlay);
            viewHolder.selectView = (ImageView) view.findViewById(R.id.lighting_view);
            view.setTag(viewHolder);
        } else {
            viewHolder = (ViewHolder) view.getTag();
        }
        viewHolder.imageView.setImageBitmap(cVar.an);
        viewHolder.selectView.setVisibility(this.mSelectItem == i ? 0 : 4);
        return view;
    }

    public void refreshData(List<c> list) {
        this.mData = list;
        notifyDataSetChanged();
    }
}
