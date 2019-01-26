package com.android.camera.fragment.live;

import android.content.Context;
import android.graphics.Rect;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.ItemDecoration;
import android.support.v7.widget.RecyclerView.State;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.TextView;
import com.aeonax.camera.R;
import com.android.camera.CameraSettings;
import com.android.camera.Util;
import com.android.camera.fragment.CommonRecyclerViewHolder;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.LiveConfigChanges;
import java.util.ArrayList;
import java.util.List;

public class FragmentLiveSpeed extends FragmentLiveBase {
    private static final int FRAGMENT_INFO = 4093;
    private static final String TAG = "FragmentLiveSpeed";
    private static final List<LiveSpeedItem> sSpeedItemList = new ArrayList();
    private SpeedItemAdapter mAdapter;
    private LinearLayoutManager mLayoutManager;
    private View mRootView;
    private int mSelectIndex;
    private RecyclerView mSpeedListView;

    private static class LiveSpeedItem {
        int mTextId;

        public LiveSpeedItem(int i) {
            this.mTextId = i;
        }

        public int getTextId() {
            return this.mTextId;
        }
    }

    private static class SpeedItemAdapter extends Adapter<SpeedItemHolder> {
        int mColorNormal;
        int mColorSelected;
        LayoutInflater mLayoutInflater;
        OnItemClickListener mListener;
        int mSelectIndex;
        List<LiveSpeedItem> mSpeedItemList;

        class SpeedItemHolder extends CommonRecyclerViewHolder implements OnClickListener {
            public SpeedItemHolder(View view) {
                super(view);
                view.setOnClickListener(this);
            }

            public void onClick(View view) {
                int adapterPosition = getAdapterPosition();
                if (adapterPosition != SpeedItemAdapter.this.mSelectIndex) {
                    int i = SpeedItemAdapter.this.mSelectIndex;
                    SpeedItemAdapter.this.mSelectIndex = adapterPosition;
                    SpeedItemAdapter.this.mListener.onItemClick(null, view, adapterPosition, getItemId());
                    SpeedItemAdapter.this.notifyItemChanged(i);
                    SpeedItemAdapter.this.notifyItemChanged(adapterPosition);
                }
            }
        }

        public SpeedItemAdapter(Context context, List<LiveSpeedItem> list, int i, OnItemClickListener onItemClickListener) {
            this.mSpeedItemList = list;
            this.mSelectIndex = i;
            this.mLayoutInflater = LayoutInflater.from(context);
            this.mListener = onItemClickListener;
            this.mColorNormal = context.getResources().getColor(R.color.white);
            this.mColorSelected = context.getResources().getColor(R.color.common_color_00a8ff);
        }

        public SpeedItemHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
            return new SpeedItemHolder(this.mLayoutInflater.inflate(R.layout.fragment_live_speed_item, viewGroup, false));
        }

        public void onBindViewHolder(SpeedItemHolder speedItemHolder, int i) {
            LiveSpeedItem liveSpeedItem = (LiveSpeedItem) this.mSpeedItemList.get(i);
            speedItemHolder.itemView.setTag(liveSpeedItem);
            TextView textView = (TextView) speedItemHolder.getView(R.id.item_text);
            if (i == this.mSelectIndex) {
                textView.setTextColor(this.mColorSelected);
            } else {
                textView.setTextColor(this.mColorNormal);
            }
            textView.setText(liveSpeedItem.getTextId());
        }

        public int getItemCount() {
            return this.mSpeedItemList.size();
        }

        public LiveSpeedItem getSticker(int i) {
            return (LiveSpeedItem) this.mSpeedItemList.get(i);
        }
    }

    static {
        for (int liveSpeedItem : CameraSettings.sLiveSpeedTextList) {
            sSpeedItemList.add(new LiveSpeedItem(liveSpeedItem));
        }
    }

    protected void initView(View view) {
        this.mRootView = view;
        final boolean isLayoutRTL = Util.isLayoutRTL(getContext());
        this.mSpeedListView = (RecyclerView) this.mRootView.findViewById(R.id.live_speed_list);
        this.mSelectIndex = Integer.valueOf(CameraSettings.getCurrentLiveSpeed()).intValue();
        this.mAdapter = new SpeedItemAdapter(getContext(), getSpeedItemList(), this.mSelectIndex, new OnItemClickListener() {
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
                FragmentLiveSpeed.this.onItemSelected(i);
            }
        });
        this.mLayoutManager = new LinearLayoutManager(getContext());
        this.mLayoutManager.setOrientation(0);
        this.mSpeedListView.setLayoutManager(this.mLayoutManager);
        this.mSpeedListView.addItemDecoration(new ItemDecoration() {
            final int mListMargin = FragmentLiveSpeed.this.getResources().getDimensionPixelSize(R.dimen.live_speed_list_margin);

            public void getItemOffsets(Rect rect, View view, RecyclerView recyclerView, State state) {
                int itemCount = ((FragmentLiveSpeed.this.getResources().getDisplayMetrics().widthPixels - (2 * this.mListMargin)) - (recyclerView.getAdapter().getItemCount() * FragmentLiveSpeed.this.getResources().getDimensionPixelSize(R.dimen.live_speed_item_width))) / (recyclerView.getAdapter().getItemCount() - 1);
                int childAdapterPosition = recyclerView.getChildAdapterPosition(view);
                if (isLayoutRTL) {
                    if (childAdapterPosition == 0) {
                        rect.set(0, 0, this.mListMargin, 0);
                    } else if (childAdapterPosition + 1 == recyclerView.getAdapter().getItemCount()) {
                        rect.set(this.mListMargin, 0, itemCount, 0);
                    } else {
                        rect.set(0, 0, itemCount, 0);
                    }
                } else if (childAdapterPosition == 0) {
                    rect.set(this.mListMargin, 0, 0, 0);
                } else if (childAdapterPosition + 1 == recyclerView.getAdapter().getItemCount()) {
                    rect.set(itemCount, 0, this.mListMargin, 0);
                } else {
                    rect.set(itemCount, 0, 0, 0);
                }
            }
        });
        this.mSpeedListView.setAdapter(this.mAdapter);
    }

    public int getFragmentInto() {
        return 4093;
    }

    protected int getLayoutResourceId() {
        return R.layout.fragment_live_speed;
    }

    protected List<LiveSpeedItem> getSpeedItemList() {
        return sSpeedItemList;
    }

    protected void onItemSelected(int i) {
        CameraSettings.setCurrentLiveSpeed(String.valueOf(i));
        LiveConfigChanges liveConfigChanges = (LiveConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(201);
        if (liveConfigChanges != null) {
            liveConfigChanges.setRecordSpeed(i);
        }
    }
}
