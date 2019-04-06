package com.android.camera.fragment.mimoji;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnLongClickListener;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ImageView;
import android.widget.TextView;
import com.android.camera.R;
import com.android.camera.ToastUtils;
import com.android.camera.fragment.CommonRecyclerViewHolder;
import com.android.camera.fragment.live.FragmentLiveBase;
import com.android.camera.fragment.music.RoundedCornersTransformation;
import com.android.camera.module.impl.component.FileUtils;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.MimojiAvatarEngine;
import com.bumptech.glide.c;
import com.bumptech.glide.request.f;
import java.io.File;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;

public class FragmentMimoji extends FragmentLiveBase {
    private static final int FRAGMENT_INFO = 4095;
    private static final String TAG = FragmentMimoji.class.getSimpleName();
    private View mAddItemView;
    private LinearLayoutManager mLayoutManager;
    private int mLongSelectIndex = -1;
    private List<MimojiInfo> mMimojiInfoList;
    private MimojiItemAdapter mMimojiItemAdapter;
    private RecyclerView mMimojiRecylerView;
    private View mNoneItemView;
    private int mSelectIndex = -1;

    public class MimojiItemAdapter extends Adapter<MimojiItemHolder> {
        private int adapterLongSelectIndex;
        private int adapterSelectIndex;
        private List<MimojiInfo> datas = new ArrayList();
        private Context mContext;
        LayoutInflater mLayoutInflater;
        OnItemClickListener mListener;

        class MimojiItemHolder extends CommonRecyclerViewHolder implements OnClickListener, OnLongClickListener {
            public MimojiItemHolder(View view) {
                super(view);
                view.setOnClickListener(this);
                view.setOnLongClickListener(this);
            }

            public void onClick(View view) {
                int adapterPosition = getAdapterPosition();
                if (adapterPosition != FragmentMimoji.this.mSelectIndex) {
                    int access$100 = FragmentMimoji.this.mSelectIndex;
                    FragmentMimoji.this.mSelectIndex = adapterPosition;
                    MimojiItemAdapter.this.mListener.onItemClick(null, view, adapterPosition, getItemId());
                    MimojiItemAdapter.this.setLongSelectIndex(-1);
                    MimojiItemAdapter.this.notifyItemChanged(access$100);
                    MimojiItemAdapter.this.notifyItemChanged(adapterPosition);
                }
            }

            public boolean onLongClick(View view) {
                int adapterPosition = getAdapterPosition();
                FragmentMimoji.this.mLongSelectIndex = adapterPosition;
                FragmentMimoji.this.mSelectIndex = adapterPosition;
                MimojiItemAdapter.this.setLongSelectIndex(adapterPosition);
                MimojiItemAdapter.this.setSelectIndex(adapterPosition);
                FragmentMimoji.this.mMimojiItemAdapter.notifyDataSetChanged();
                FragmentMimoji.this.showEditDialog(adapterPosition);
                return false;
            }
        }

        public MimojiItemAdapter(Context context, int i, int i2, OnItemClickListener onItemClickListener) {
            this.mContext = context;
            this.adapterSelectIndex = i;
            this.adapterLongSelectIndex = i2;
            this.mLayoutInflater = LayoutInflater.from(context);
            this.mListener = onItemClickListener;
        }

        public int addItem(MimojiInfo mimojiInfo) {
            FragmentMimoji.this.mMimojiInfoList.add(mimojiInfo);
            return FragmentMimoji.this.mMimojiInfoList.size();
        }

        public int getItemCount() {
            return FragmentMimoji.this.mMimojiInfoList.size();
        }

        public MimojiInfo getItemObject(int i) {
            return FragmentMimoji.this.mMimojiInfoList != null ? (MimojiInfo) FragmentMimoji.this.mMimojiInfoList.get(i) : null;
        }

        public void onBindViewHolder(MimojiItemHolder mimojiItemHolder, int i) {
            ImageView imageView = (ImageView) mimojiItemHolder.getView(R.id.top_config_03);
            View view = mimojiItemHolder.getView(R.id.top_config_04);
            View view2 = mimojiItemHolder.getView(R.id.top_config_05);
            MimojiInfo mimojiInfo = (MimojiInfo) this.datas.get(i);
            mimojiItemHolder.itemView.setTag(mimojiInfo);
            c.h(this.mContext).y(mimojiInfo.mThumbnailUrl).b(f.a(new RoundedCornersTransformation(10, 1))).a(imageView);
            if (i == this.adapterSelectIndex) {
                view.setVisibility(0);
            } else {
                view.setVisibility(8);
            }
            if (i == this.adapterLongSelectIndex) {
                view2.setVisibility(0);
            } else {
                view2.setVisibility(8);
            }
        }

        public MimojiItemHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
            return new MimojiItemHolder(this.mLayoutInflater.inflate(R.layout.fragment_sticker_pager, viewGroup, false));
        }

        public void setLongSelectIndex(int i) {
            this.adapterLongSelectIndex = i;
        }

        public void setMimojiInfoList(List<MimojiInfo> list) {
            this.datas.clear();
            this.datas.addAll(list);
            notifyDataSetChanged();
        }

        public void setSelectIndex(int i) {
            this.adapterSelectIndex = i;
        }
    }

    public static Bitmap getThumbnailBitmapFromData(byte[] bArr, int i, int i2) {
        Bitmap createBitmap = Bitmap.createBitmap(i, i2, Config.ARGB_8888);
        createBitmap.copyPixelsFromBuffer(ByteBuffer.wrap(bArr));
        return createBitmap;
    }

    public static Bitmap getThumbnailBitmapFromFile(String str, int i, int i2) {
        byte[] fileBytes = FileUtils.getFileBytes(str);
        Bitmap createBitmap = Bitmap.createBitmap(i, i2, Config.ARGB_8888);
        if (fileBytes != null) {
            createBitmap.copyPixelsFromBuffer(ByteBuffer.wrap(fileBytes));
        }
        return createBitmap;
    }

    private void showEditDialog(int i) {
        final MimojiInfo itemObject = this.mMimojiItemAdapter.getItemObject(i);
        final AlertDialog create = new Builder(getContext()).create();
        create.show();
        View inflate = LayoutInflater.from(getActivity()).inflate(R.layout.eye_light_item, null, false);
        create.setContentView(inflate);
        ((TextView) inflate.findViewById(R.id.header_recyclerView)).setOnClickListener(new OnClickListener() {
            public void onClick(View view) {
            }
        });
        ((TextView) inflate.findViewById(R.id.makeup_item_list)).setOnClickListener(new OnClickListener() {
            public void onClick(View view) {
                if (itemObject != null && !TextUtils.isEmpty(itemObject.mPackPath)) {
                    FileUtils.deleteFile(itemObject.mPackPath);
                    create.dismiss();
                    FragmentMimoji.this.mLongSelectIndex = -1;
                    FragmentMimoji.this.mSelectIndex = -1;
                    FragmentMimoji.this.mMimojiItemAdapter.setLongSelectIndex(-1);
                    FragmentMimoji.this.mMimojiItemAdapter.setSelectIndex(-1);
                    FragmentMimoji.this.mMimojiItemAdapter.notifyDataSetChanged();
                    ToastUtils.showToast(FragmentMimoji.this.getActivity(), FragmentMimoji.this.getResources().getString(R.string.pref_camera_coloreffect_entry_instagram_hudson));
                    FragmentMimoji.this.filelistToMinojiInfo();
                }
            }
        });
        ((TextView) inflate.findViewById(R.id.bottom_beauty)).setOnClickListener(new OnClickListener() {
            public void onClick(View view) {
                create.dismiss();
                FragmentMimoji.this.mLongSelectIndex = -1;
            }
        });
    }

    public void addItem(MimojiInfo mimojiInfo) {
        this.mMimojiItemAdapter.notifyItemChanged(this.mMimojiItemAdapter.addItem(mimojiInfo));
    }

    public void filelistToMinojiInfo() {
        this.mMimojiInfoList = new ArrayList();
        ArrayList arrayList = new ArrayList();
        int i = 0;
        try {
            File file = new File(FileUtils.CUSTOM_DIR);
            if (file.isDirectory()) {
                for (File file2 : file.listFiles()) {
                    MimojiInfo mimojiInfo = new MimojiInfo();
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append(FileUtils.MIMOJI_DIR);
                    stringBuilder.append("model/cartoon_xiaomi_v_0_0_0_9");
                    mimojiInfo.mAvatarTemplatePath = stringBuilder.toString();
                    String name = file2.getName();
                    String absolutePath = file2.getAbsolutePath();
                    StringBuilder stringBuilder2 = new StringBuilder();
                    stringBuilder2.append(name);
                    stringBuilder2.append("config.dat");
                    String stringBuilder3 = stringBuilder2.toString();
                    StringBuilder stringBuilder4 = new StringBuilder();
                    stringBuilder4.append(name);
                    stringBuilder4.append("pic.jpg");
                    String stringBuilder5 = stringBuilder4.toString();
                    if (file2.isDirectory()) {
                        StringBuilder stringBuilder6 = new StringBuilder();
                        stringBuilder6.append(FileUtils.CUSTOM_DIR);
                        stringBuilder6.append(name);
                        stringBuilder6.append("/");
                        stringBuilder6.append(stringBuilder3);
                        String stringBuilder7 = stringBuilder6.toString();
                        stringBuilder2 = new StringBuilder();
                        stringBuilder2.append(FileUtils.CUSTOM_DIR);
                        stringBuilder2.append(name);
                        stringBuilder2.append("/");
                        stringBuilder2.append(stringBuilder5);
                        name = stringBuilder2.toString();
                        if (FileUtils.checkFileConsist(stringBuilder7) && FileUtils.checkFileConsist(name)) {
                            mimojiInfo.mConfigPath = stringBuilder7;
                            mimojiInfo.mThumbnailUrl = name;
                            mimojiInfo.mPackPath = absolutePath;
                            this.mMimojiInfoList.add(mimojiInfo);
                        } else {
                            arrayList.add(absolutePath);
                        }
                    } else {
                        arrayList.add(absolutePath);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        this.mMimojiItemAdapter.setMimojiInfoList(this.mMimojiInfoList);
        this.mMimojiItemAdapter.notifyDataSetChanged();
        while (i < arrayList.size()) {
            FileUtils.deleteFile((String) arrayList.get(i));
            i++;
        }
    }

    public int getFragmentInto() {
        return FRAGMENT_INFO;
    }

    protected int getLayoutResourceId() {
        return R.layout.fragment_popup_beautylevel;
    }

    protected void initView(View view) {
        this.mNoneItemView = view.findViewById(R.id.sticker_item_list);
        this.mMimojiRecylerView = (RecyclerView) view.findViewById(R.id.alert_image);
        this.mNoneItemView.setOnClickListener(new OnClickListener() {
            public void onClick(View view) {
                FragmentMimoji.this.onItemSelected(-1, null);
            }
        });
        this.mAddItemView = view.findViewById(R.id.top_alert_container);
        this.mAddItemView.setOnClickListener(new OnClickListener() {
            public void onClick(View view) {
                FragmentMimoji.this.onAddItemSelected(view);
            }
        });
        this.mMimojiItemAdapter = new MimojiItemAdapter(getContext(), this.mSelectIndex, this.mLongSelectIndex, new OnItemClickListener() {
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
                FragmentMimoji.this.onItemSelected(i, view);
            }
        });
        filelistToMinojiInfo();
        this.mLayoutManager = new LinearLayoutManager(getContext());
        this.mLayoutManager.setOrientation(0);
        this.mMimojiRecylerView.setLayoutManager(this.mLayoutManager);
        this.mMimojiRecylerView.setAdapter(this.mMimojiItemAdapter);
    }

    protected void onAddItemSelected(View view) {
        this.mIsNeedShowWhenExit = false;
        MimojiAvatarEngine mimojiAvatarEngine = (MimojiAvatarEngine) ModeCoordinatorImpl.getInstance().getAttachProtocol(217);
        if (mimojiAvatarEngine != null) {
            mimojiAvatarEngine.onMimojiCreate();
        }
    }

    protected void onItemSelected(int i, View view) {
        MimojiInfo mimojiInfo = i >= 0 ? (MimojiInfo) this.mMimojiInfoList.get(i) : null;
        if (mimojiInfo != null) {
            MimojiAvatarEngine mimojiAvatarEngine = (MimojiAvatarEngine) ModeCoordinatorImpl.getInstance().getAttachProtocol(217);
            if (mimojiAvatarEngine != null) {
                mimojiAvatarEngine.onMimojiSelect(mimojiInfo.mAvatarTemplatePath, "");
            }
            int i2 = this.mSelectIndex;
            this.mSelectIndex = i;
            this.mMimojiItemAdapter.setSelectIndex(this.mSelectIndex);
            this.mMimojiItemAdapter.notifyItemChanged(i2);
            this.mMimojiItemAdapter.notifyItemChanged(this.mSelectIndex);
        }
    }

    protected void onLongItemSelected(int i, View view) {
        MimojiInfo mimojiInfo = i >= 0 ? (MimojiInfo) this.mMimojiInfoList.get(i) : null;
        if (mimojiInfo != null) {
            MimojiAvatarEngine mimojiAvatarEngine = (MimojiAvatarEngine) ModeCoordinatorImpl.getInstance().getAttachProtocol(217);
            if (mimojiAvatarEngine != null) {
                mimojiAvatarEngine.onMimojiSelect(mimojiInfo.mAvatarTemplatePath, "");
            }
            int i2 = this.mLongSelectIndex;
            this.mLongSelectIndex = i;
            this.mMimojiItemAdapter.setSelectIndex(this.mLongSelectIndex);
            this.mMimojiItemAdapter.notifyItemChanged(i2);
            this.mMimojiItemAdapter.notifyItemChanged(this.mLongSelectIndex);
        }
    }
}
