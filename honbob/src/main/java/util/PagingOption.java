package util;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
public class PagingOption {
    private int itemsPerPage;
    private int currentPage; // [0, n-1]

    public int getCurrentItemStartNumber() {
        return itemsPerPage * (currentPage - 1);
    }

    public int getItemsPerPage() {
        return itemsPerPage;
    }

    public int getCurrentPage() {
        return currentPage;
    }


}
