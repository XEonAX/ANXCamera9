package org.jcodec.containers.mp4.boxes;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class MetaBox extends NodeBox {
    private static final String FOURCC = "meta";

    public MetaBox(Header header) {
        super(header);
    }

    public static MetaBox createMetaBox() {
        return new MetaBox(Header.createHeader(fourcc(), 0));
    }

    public Map<String, MetaValue> getKeyedMeta() {
        Map<String, MetaValue> linkedHashMap = new LinkedHashMap();
        IListBox iListBox = (IListBox) NodeBox.findFirst(this, IListBox.class, IListBox.fourcc());
        MdtaBox[] mdtaBoxArr = (MdtaBox[]) NodeBox.findAllPath(this, MdtaBox.class, new String[]{KeysBox.fourcc(), MdtaBox.fourcc()});
        if (iListBox == null || mdtaBoxArr.length == 0) {
            return linkedHashMap;
        }
        for (Entry entry : iListBox.getValues().entrySet()) {
            Integer num = (Integer) entry.getKey();
            if (num != null) {
                DataBox dataBox = getDataBox((List) entry.getValue());
                if (dataBox != null) {
                    MetaValue createOtherWithLocale = MetaValue.createOtherWithLocale(dataBox.getType(), dataBox.getLocale(), dataBox.getData());
                    if (num.intValue() > 0 && num.intValue() <= mdtaBoxArr.length) {
                        linkedHashMap.put(mdtaBoxArr[num.intValue() - 1].getKey(), createOtherWithLocale);
                    }
                }
            }
        }
        return linkedHashMap;
    }

    private DataBox getDataBox(List<Box> list) {
        for (Box box : list) {
            if (box instanceof DataBox) {
                return (DataBox) box;
            }
        }
        return null;
    }

    public Map<Integer, MetaValue> getItunesMeta() {
        Map<Integer, MetaValue> linkedHashMap = new LinkedHashMap();
        IListBox iListBox = (IListBox) NodeBox.findFirst(this, IListBox.class, IListBox.fourcc());
        if (iListBox == null) {
            return linkedHashMap;
        }
        for (Entry entry : iListBox.getValues().entrySet()) {
            Integer num = (Integer) entry.getKey();
            if (num != null) {
                DataBox dataBox = getDataBox((List) entry.getValue());
                if (dataBox != null) {
                    linkedHashMap.put(num, MetaValue.createOtherWithLocale(dataBox.getType(), dataBox.getLocale(), dataBox.getData()));
                }
            }
        }
        return linkedHashMap;
    }

    public void setKeyedMeta(Map<String, MetaValue> map) {
        if (!map.isEmpty()) {
            Box createKeysBox = KeysBox.createKeysBox();
            Map linkedHashMap = new LinkedHashMap();
            int i = 1;
            for (Entry entry : map.entrySet()) {
                createKeysBox.add(MdtaBox.createMdtaBox((String) entry.getKey()));
                MetaValue metaValue = (MetaValue) entry.getValue();
                List arrayList = new ArrayList();
                arrayList.add(DataBox.createDataBox(metaValue.getType(), metaValue.getLocale(), metaValue.getData()));
                linkedHashMap.put(Integer.valueOf(i), arrayList);
                i++;
            }
            Box createIListBox = IListBox.createIListBox(linkedHashMap);
            replaceBox(createKeysBox);
            replaceBox(createIListBox);
        }
    }

    public void setItunesMeta(Map<Integer, MetaValue> map) {
        if (!map.isEmpty()) {
            Map linkedHashMap;
            Map linkedHashMap2 = new LinkedHashMap();
            linkedHashMap2.putAll(map);
            IListBox iListBox = (IListBox) NodeBox.findFirst(this, IListBox.class, IListBox.fourcc());
            if (iListBox == null) {
                linkedHashMap = new LinkedHashMap();
            } else {
                linkedHashMap = iListBox.getValues();
                for (Entry entry : linkedHashMap.entrySet()) {
                    int intValue = ((Integer) entry.getKey()).intValue();
                    MetaValue metaValue = (MetaValue) linkedHashMap2.get(Integer.valueOf(intValue));
                    if (metaValue != null) {
                        DataBox createDataBox = DataBox.createDataBox(metaValue.getType(), metaValue.getLocale(), metaValue.getData());
                        dropChildBox((List) entry.getValue(), DataBox.fourcc());
                        ((List) entry.getValue()).add(createDataBox);
                        linkedHashMap2.remove(Integer.valueOf(intValue));
                    }
                }
            }
            for (Entry entry2 : linkedHashMap2.entrySet()) {
                int intValue2 = ((Integer) entry2.getKey()).intValue();
                MetaValue metaValue2 = (MetaValue) entry2.getValue();
                DataBox createDataBox2 = DataBox.createDataBox(metaValue2.getType(), metaValue2.getLocale(), metaValue2.getData());
                List arrayList = new ArrayList();
                linkedHashMap.put(Integer.valueOf(intValue2), arrayList);
                arrayList.add(createDataBox2);
            }
            Set<Integer> hashSet = new HashSet(linkedHashMap.keySet());
            hashSet.removeAll(map.keySet());
            for (Integer remove : hashSet) {
                linkedHashMap.remove(remove);
            }
            replaceBox(IListBox.createIListBox(linkedHashMap));
        }
    }

    private void dropChildBox(List<Box> list, String str) {
        ListIterator listIterator = list.listIterator();
        while (listIterator.hasNext()) {
            if (str.equals(((Box) listIterator.next()).getFourcc())) {
                listIterator.remove();
            }
        }
    }

    public static String fourcc() {
        return FOURCC;
    }
}
