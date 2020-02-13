package util;

import java.lang.Math;

public class PagingHelper {
    public static final int ITEM_PER_PAGE = 3;

    public static int calculateTotalPages(int totalItems) {
        return (int)Math.ceil((double)totalItems / ITEM_PER_PAGE);
    }
}
