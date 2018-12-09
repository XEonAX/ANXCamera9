package org.jcodec.containers.mp4;

import java.util.HashMap;
import java.util.Map;
import org.jcodec.containers.mp4.boxes.Box;

public abstract class Boxes {
    protected final Map<String, Class<? extends Box>> mappings = new HashMap();

    public Class<? extends Box> toClass(String str) {
        return (Class) this.mappings.get(str);
    }

    public void override(String str, Class<? extends Box> cls) {
        this.mappings.put(str, cls);
    }

    public void clear() {
        this.mappings.clear();
    }
}
