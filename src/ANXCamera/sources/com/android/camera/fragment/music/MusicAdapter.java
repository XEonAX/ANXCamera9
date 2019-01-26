package com.android.camera.fragment.music;

import android.content.Context;
import android.support.v7.widget.RecyclerView.Adapter;
import android.view.LayoutInflater;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.aeonax.camera.R;
import com.android.camera.fragment.CommonRecyclerViewHolder;
import com.android.camera.log.Log;
import com.bumptech.glide.c;
import com.bumptech.glide.request.f;
import java.util.List;

public class MusicAdapter extends Adapter<CommonRecyclerViewHolder> {
    private Context mContext;
    private List<LiveMusicInfo> mMusicList;
    private OnClickListener mOnClickListener;

    public MusicAdapter(Context context, OnClickListener onClickListener, List<LiveMusicInfo> list) {
        this.mContext = context;
        this.mOnClickListener = onClickListener;
        this.mMusicList = list;
    }

    public CommonRecyclerViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        Log.d("FragmentLiveMusic", "onCreateViewHolder called");
        return new CommonRecyclerViewHolder(LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.fragment_music_adapter, viewGroup, false));
    }

    public void onBindViewHolder(CommonRecyclerViewHolder commonRecyclerViewHolder, int i) {
        LiveMusicInfo liveMusicInfo = (LiveMusicInfo) this.mMusicList.get(i);
        commonRecyclerViewHolder.itemView.setOnClickListener(this.mOnClickListener);
        commonRecyclerViewHolder.itemView.setTag(liveMusicInfo);
        ((TextView) commonRecyclerViewHolder.getView(R.id.music_author)).setText(liveMusicInfo.mAuthor);
        ((TextView) commonRecyclerViewHolder.getView(R.id.music_title)).setText(liveMusicInfo.mTitle);
        c.f(this.mContext).a(liveMusicInfo.mThumbnailUrl).b(f.a(new RoundedCornersTransformation(10, 1))).a((ImageView) commonRecyclerViewHolder.getView(R.id.music_thumbnail));
        ImageView imageView = (ImageView) commonRecyclerViewHolder.getView(R.id.music_play);
        imageView.setOnClickListener(this.mOnClickListener);
        imageView.setTag(liveMusicInfo);
        TextView textView = (TextView) commonRecyclerViewHolder.getView(R.id.music_duration);
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("00 : ");
        stringBuilder.append(liveMusicInfo.mDuration);
        textView.setText(stringBuilder.toString());
    }

    public void setData(List<LiveMusicInfo> list) {
        this.mMusicList = list;
        notifyDataSetChanged();
    }

    public int getItemCount() {
        return this.mMusicList.size();
    }
}
