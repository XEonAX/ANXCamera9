package com.google.zxing.aztec.encoder;

import com.google.zxing.common.BitArray;
import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public final class HighLevelEncoder {
    private static final int[][] CHAR_MAP = ((int[][]) Array.newInstance(int.class, new int[]{5, 256}));
    static final int[][] LATCH_TABLE;
    static final int MODE_DIGIT = 2;
    static final int MODE_LOWER = 1;
    static final int MODE_MIXED = 3;
    static final String[] MODE_NAMES = new String[]{"UPPER", "LOWER", "DIGIT", "MIXED", "PUNCT"};
    static final int MODE_PUNCT = 4;
    static final int MODE_UPPER = 0;
    static final int[][] SHIFT_TABLE = ((int[][]) Array.newInstance(int.class, new int[]{6, 6}));
    private final byte[] text;

    static {
        int c;
        int i;
        r1 = new int[5][];
        int[] iArr = new int[]{327708, 327710, 327709, 656318, iArr};
        iArr = new int[]{590318, 327710, 327709, 656318, iArr};
        iArr = new int[]{262158, 590300, 590301, 932798, iArr};
        iArr = new int[]{327709, 327708, 656318, 327710, iArr};
        iArr = new int[]{327711, 656380, 656382, 656381, iArr};
        LATCH_TABLE = r1;
        CHAR_MAP[0][32] = 1;
        for (c = 65; c <= 90; c++) {
            CHAR_MAP[0][c] = (c - 65) + 2;
        }
        CHAR_MAP[1][32] = 1;
        for (c = 97; c <= 122; c++) {
            CHAR_MAP[1][c] = (c - 97) + 2;
        }
        CHAR_MAP[2][32] = 1;
        for (c = 48; c <= 57; c++) {
            CHAR_MAP[2][c] = (c - 48) + 2;
        }
        CHAR_MAP[2][44] = 12;
        CHAR_MAP[2][46] = 13;
        int[] iArr2 = new int[28];
        iArr2[1] = 32;
        iArr2[2] = 1;
        iArr2[3] = 2;
        iArr2[4] = 3;
        iArr2[5] = 4;
        iArr2[6] = 5;
        iArr2[7] = 6;
        iArr2[8] = 7;
        iArr2[9] = 8;
        iArr2[10] = 9;
        iArr2[11] = 10;
        iArr2[12] = 11;
        iArr2[13] = 12;
        iArr2[14] = 13;
        iArr2[15] = 27;
        iArr2[16] = 28;
        iArr2[17] = 29;
        iArr2[18] = 30;
        iArr2[19] = 31;
        iArr2[20] = 64;
        iArr2[21] = 92;
        iArr2[22] = 94;
        iArr2[23] = 95;
        iArr2[24] = 96;
        iArr2[25] = 124;
        iArr2[26] = 126;
        iArr2[27] = 127;
        int[] mixedTable = iArr2;
        for (i = 0; i < mixedTable.length; i++) {
            CHAR_MAP[3][mixedTable[i]] = i;
        }
        int[] iArr3 = new int[31];
        iArr3[1] = 13;
        iArr3[6] = 33;
        iArr3[7] = 39;
        iArr3[8] = 35;
        iArr3[9] = 36;
        iArr3[10] = 37;
        iArr3[11] = 38;
        iArr3[12] = 39;
        iArr3[13] = 40;
        iArr3[14] = 41;
        iArr3[15] = 42;
        iArr3[16] = 43;
        iArr3[17] = 44;
        iArr3[18] = 45;
        iArr3[19] = 46;
        iArr3[20] = 47;
        iArr3[21] = 58;
        iArr3[22] = 59;
        iArr3[23] = 60;
        iArr3[24] = 61;
        iArr3[25] = 62;
        iArr3[26] = 63;
        iArr3[27] = 91;
        iArr3[28] = 93;
        iArr3[29] = 123;
        iArr3[30] = 125;
        iArr2 = iArr3;
        for (i = 0; i < iArr2.length; i++) {
            if (iArr2[i] > 0) {
                CHAR_MAP[4][iArr2[i]] = i;
            }
        }
        for (int[] iArr22 : SHIFT_TABLE) {
            Arrays.fill(iArr22, -1);
        }
        SHIFT_TABLE[0][4] = 0;
        SHIFT_TABLE[1][4] = 0;
        SHIFT_TABLE[1][0] = 28;
        SHIFT_TABLE[3][4] = 0;
        SHIFT_TABLE[2][4] = 0;
        SHIFT_TABLE[2][0] = 15;
    }

    public HighLevelEncoder(byte[] text) {
        this.text = text;
    }

    public BitArray encode() {
        Collection<State> states = Collections.singletonList(State.INITIAL_STATE);
        int index = 0;
        while (index < this.text.length) {
            int pairCode = 0;
            int nextChar = index + 1 < this.text.length ? this.text[index + 1] : 0;
            byte b = this.text[index];
            if (b != (byte) 13) {
                if (b != (byte) 44) {
                    if (b != (byte) 46) {
                        if (b == (byte) 58 && nextChar == 32) {
                            pairCode = 5;
                        }
                    } else if (nextChar == 32) {
                        pairCode = 3;
                    }
                } else if (nextChar == 32) {
                    pairCode = 4;
                }
            } else if (nextChar == 10) {
                pairCode = 2;
            }
            int pairCode2 = pairCode;
            if (pairCode2 > 0) {
                states = updateStateListForPair(states, index, pairCode2);
                index++;
            } else {
                states = updateStateListForChar(states, index);
            }
            index++;
        }
        return ((State) Collections.min(states, new Comparator<State>() {
            public int compare(State a, State b) {
                return a.getBitCount() - b.getBitCount();
            }
        })).toBitArray(this.text);
    }

    private Collection<State> updateStateListForChar(Iterable<State> states, int index) {
        Collection<State> result = new LinkedList();
        for (State state : states) {
            updateStateForChar(state, index, result);
        }
        return simplifyStates(result);
    }

    private void updateStateForChar(State state, int index, Collection<State> result) {
        char ch = (char) (this.text[index] & 255);
        boolean charInCurrentTable = CHAR_MAP[state.getMode()][ch] > 0;
        State stateNoBinary = null;
        int mode = 0;
        while (mode <= 4) {
            int charInMode = CHAR_MAP[mode][ch];
            if (charInMode > 0) {
                if (stateNoBinary == null) {
                    stateNoBinary = state.endBinaryShift(index);
                }
                if (!charInCurrentTable || mode == state.getMode() || mode == 2) {
                    result.add(stateNoBinary.latchAndAppend(mode, charInMode));
                }
                if (!charInCurrentTable && SHIFT_TABLE[state.getMode()][mode] >= 0) {
                    result.add(stateNoBinary.shiftAndAppend(mode, charInMode));
                }
            }
            mode++;
        }
        if (state.getBinaryShiftByteCount() > 0 || CHAR_MAP[state.getMode()][ch] == 0) {
            result.add(state.addBinaryShiftChar(index));
        }
    }

    private static Collection<State> updateStateListForPair(Iterable<State> states, int index, int pairCode) {
        Collection<State> result = new LinkedList();
        for (State state : states) {
            updateStateForPair(state, index, pairCode, result);
        }
        return simplifyStates(result);
    }

    private static void updateStateForPair(State state, int index, int pairCode, Collection<State> result) {
        State stateNoBinary = state.endBinaryShift(index);
        result.add(stateNoBinary.latchAndAppend(4, pairCode));
        if (state.getMode() != 4) {
            result.add(stateNoBinary.shiftAndAppend(4, pairCode));
        }
        if (pairCode == 3 || pairCode == 4) {
            result.add(stateNoBinary.latchAndAppend(2, 16 - pairCode).latchAndAppend(2, 1));
        }
        if (state.getBinaryShiftByteCount() > 0) {
            result.add(state.addBinaryShiftChar(index).addBinaryShiftChar(index + 1));
        }
    }

    private static Collection<State> simplifyStates(Iterable<State> states) {
        List<State> result = new LinkedList();
        for (State newState : states) {
            boolean add = true;
            Iterator<State> iterator = result.iterator();
            while (iterator.hasNext()) {
                State oldState = (State) iterator.next();
                if (oldState.isBetterThanOrEqualTo(newState)) {
                    add = false;
                    break;
                } else if (newState.isBetterThanOrEqualTo(oldState)) {
                    iterator.remove();
                }
            }
            if (add) {
                result.add(newState);
            }
        }
        return result;
    }
}
