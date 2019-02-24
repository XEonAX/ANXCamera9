package org.jcodec.containers.mp4.boxes;

import org.jcodec.containers.mp4.Boxes;
import org.jcodec.containers.mp4.IBoxFactory;
import org.jcodec.containers.mp4.boxes.Box.LeafBox;
import org.jcodec.platform.Platform;

public class SimpleBoxFactory implements IBoxFactory {
    private Boxes boxes;

    public SimpleBoxFactory(Boxes boxes) {
        this.boxes = boxes;
    }

    public Box newBox(Header header) {
        Class toClass = this.boxes.toClass(header.getFourcc());
        if (toClass == null) {
            return new LeafBox(header);
        }
        return (Box) Platform.newInstance(toClass, new Object[]{header});
    }
}
