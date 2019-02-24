package com.android.camera.ui;

import android.app.AlertDialog;
import android.content.Context;
import android.content.res.TypedArray;
import android.database.DataSetObserver;
import android.os.Bundle;
import android.preference.ListPreference;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;
import com.android.camera.R;
import java.util.ArrayList;
import java.util.List;

public class PreviewListPreference extends ListPreference {
    private CharSequence[] mDefaultValues;
    private int mExtraPaddingEnd;
    private CharSequence[] mLabels;
    private boolean mShowArrow;

    class PreviewListAdapter implements ListAdapter {
        private ListAdapter mAdapter;
        private int mPaddingEnd;

        public PreviewListAdapter(ListAdapter listAdapter) {
            this.mAdapter = listAdapter;
        }

        public void registerDataSetObserver(DataSetObserver dataSetObserver) {
            this.mAdapter.registerDataSetObserver(dataSetObserver);
        }

        public void unregisterDataSetObserver(DataSetObserver dataSetObserver) {
            this.mAdapter.unregisterDataSetObserver(dataSetObserver);
        }

        public int getCount() {
            return this.mAdapter.getCount();
        }

        public Object getItem(int i) {
            return this.mAdapter.getItem(i);
        }

        public long getItemId(int i) {
            return this.mAdapter.getItemId(i);
        }

        public boolean hasStableIds() {
            return this.mAdapter.hasStableIds();
        }

        public View getView(int i, View view, ViewGroup viewGroup) {
            TextView textView = (TextView) this.mAdapter.getView(i, view, viewGroup);
            if (this.mPaddingEnd == 0) {
                this.mPaddingEnd = textView.getPaddingEnd() + PreviewListPreference.this.mExtraPaddingEnd;
            }
            textView.setSingleLine(false);
            textView.setPadding(textView.getPaddingStart(), textView.getPaddingTop(), this.mPaddingEnd, textView.getPaddingBottom());
            return textView;
        }

        public int getItemViewType(int i) {
            return this.mAdapter.getItemViewType(i);
        }

        public int getViewTypeCount() {
            return this.mAdapter.getViewTypeCount();
        }

        public boolean isEmpty() {
            return this.mAdapter.isEmpty();
        }

        public boolean areAllItemsEnabled() {
            return this.mAdapter.areAllItemsEnabled();
        }

        public boolean isEnabled(int i) {
            return this.mAdapter.isEnabled(i);
        }
    }

    public PreviewListPreference(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        if (this.mDefaultValues != null) {
            setDefaultValue(findSupportedDefaultValue(this.mDefaultValues));
        }
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.PreviewListPreference, 0, 0);
        this.mLabels = obtainStyledAttributes.getTextArray(0);
        this.mShowArrow = obtainStyledAttributes.getBoolean(1, true);
        this.mExtraPaddingEnd = context.getResources().getDimensionPixelSize(R.dimen.preference_entry_padding_end);
        obtainStyledAttributes.recycle();
    }

    public PreviewListPreference(Context context) {
        this(context, null);
    }

    public void setShowArrow(boolean z) {
        this.mShowArrow = z;
    }

    protected Object onGetDefaultValue(TypedArray typedArray, int i) {
        TypedValue peekValue = typedArray.peekValue(i);
        if (peekValue != null && peekValue.type == 1) {
            this.mDefaultValues = typedArray.getTextArray(i);
        }
        return this.mDefaultValues != null ? this.mDefaultValues[0] : typedArray.getString(i);
    }

    public void setEntryValues(CharSequence[] charSequenceArr) {
        super.setEntryValues(charSequenceArr);
        if (this.mDefaultValues != null) {
            setDefaultValue(findSupportedDefaultValue(this.mDefaultValues));
        }
    }

    private CharSequence findSupportedDefaultValue(CharSequence[] charSequenceArr) {
        CharSequence[] entryValues = getEntryValues();
        if (entryValues == null) {
            return null;
        }
        for (Object obj : entryValues) {
            for (CharSequence charSequence : charSequenceArr) {
                if (obj != null && obj.equals(charSequence)) {
                    return charSequence;
                }
            }
        }
        return null;
    }

    public void filterUnsupported(List<String> list) {
        CharSequence[] entries = getEntries();
        CharSequence[] entryValues = getEntryValues();
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        int length = entries.length;
        for (int i = 0; i < length; i++) {
            if (list.indexOf(entryValues[i].toString()) >= 0) {
                arrayList.add(entries[i]);
                arrayList2.add(entryValues[i]);
            }
        }
        int size = arrayList.size();
        setEntries((CharSequence[]) arrayList.toArray(new CharSequence[size]));
        setEntryValues((CharSequence[]) arrayList2.toArray(new CharSequence[size]));
    }

    protected void onBindView(View view) {
        super.onBindView(view);
        TextView textView = (TextView) view.findViewById(R.id.value_right);
        ImageView imageView = (ImageView) view.findViewById(R.id.arrow_right);
        if (textView != null) {
            CharSequence entry = this.mLabels == null ? getEntry() : getLabel();
            if (TextUtils.isEmpty(entry)) {
                textView.setVisibility(8);
            } else {
                textView.setText(String.valueOf(entry));
                textView.setVisibility(0);
            }
        }
        if (imageView == null) {
            return;
        }
        if (this.mShowArrow) {
            imageView.setVisibility(0);
        } else {
            imageView.setVisibility(4);
        }
    }

    public CharSequence getLabel() {
        int findIndexOfValue = findIndexOfValue(getValue());
        return (findIndexOfValue < 0 || this.mLabels == null) ? null : this.mLabels[findIndexOfValue];
    }

    protected void showDialog(Bundle bundle) {
        super.showDialog(bundle);
        ListView listView = ((AlertDialog) getDialog()).getListView();
        int checkedItemPosition = listView.getCheckedItemPosition();
        listView.setAdapter(new PreviewListAdapter(listView.getAdapter()));
        if (checkedItemPosition > -1) {
            listView.setItemChecked(checkedItemPosition, true);
            listView.setSelection(checkedItemPosition);
        }
    }
}
