package org.jcodec.movtool;

import org.jcodec.containers.mp4.boxes.MovieBox;
import org.jcodec.containers.mp4.boxes.MovieFragmentBox;

public interface MP4Edit {
    void apply(MovieBox movieBox);

    void applyToFragment(MovieBox movieBox, MovieFragmentBox[] movieFragmentBoxArr);
}
