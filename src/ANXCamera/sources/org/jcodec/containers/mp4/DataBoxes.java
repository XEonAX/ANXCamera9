package org.jcodec.containers.mp4;

import org.jcodec.containers.mp4.boxes.AliasBox;
import org.jcodec.containers.mp4.boxes.UrlBox;

public class DataBoxes extends Boxes {
    public DataBoxes() {
        this.mappings.put(UrlBox.fourcc(), UrlBox.class);
        this.mappings.put(AliasBox.fourcc(), AliasBox.class);
        this.mappings.put("cios", AliasBox.class);
    }
}
